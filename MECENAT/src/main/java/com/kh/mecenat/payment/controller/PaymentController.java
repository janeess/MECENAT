package com.kh.mecenat.payment.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mecenat.member.model.vo.Member;
import com.kh.mecenat.payment.model.service.PaymentService;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Performance;
import com.kh.mecenat.reservation.model.vo.Purchase;
import com.kh.mecenat.reservation.model.vo.RentApplication;

@Controller
public class PaymentController {
    private final RestTemplate restTemplate = new RestTemplate();

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
	private PaymentService paymentService;
    
    //무슨 빈 초기화 라던데 잘 모르겠음;;
    @PostConstruct
    private void init() {
        restTemplate.setErrorHandler(new ResponseErrorHandler() {
            @Override
            public boolean hasError(ClientHttpResponse response) {
                return false;
            }

            @Override
            public void handleError(ClientHttpResponse response) {
            }
        });
    }

    private final String SECRET_KEY = "test_sk_qLlDJaYngrop4RRBOMx8ezGdRpXx"; //테스트 시크릿 키

    //결제 성공 페이지로 이동
    @RequestMapping("success")
    public String confirmPayment(
            @RequestParam String paymentKey, @RequestParam String orderId
          , @RequestParam Long amount
          , HttpSession session, Model model) throws Exception {
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	Performance performance = (Performance)session.getAttribute("performance");
    	RentApplication ra = (RentApplication)session.getAttribute("ra");
    	String thisSeats = (String)session.getAttribute("thisSeats");
    	Payment pay = new Payment();
    	Purchase purchase = new Purchase();
        HttpHeaders headers = new HttpHeaders();
        // headers.setBasicAuth(SECRET_KEY, ""); // spring framework 5.2 이상 버전에서 지원
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> payloadMap = new HashMap<>();
        payloadMap.put("orderId", orderId);
        payloadMap.put("amount", String.valueOf(amount));

        HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);

        ResponseEntity<JsonNode> responseEntity = restTemplate.postForEntity(
                "https://api.tosspayments.com/v1/payments/" + paymentKey, request, JsonNode.class);
        if (responseEntity.getStatusCode() == HttpStatus.OK) { // 결제 성공
        	JsonNode successNode = responseEntity.getBody();
        	System.out.println("successNode: "+successNode);
        	pay.setUserId(loginUser.getUserId());
        	pay.setPaymentMethod(successNode.get("method").asText());
        	pay.setPaymentDetailTime(successNode.get("approvedAt").asText());
        	pay.setPaymentStatus(successNode.get("status").asText());
        	pay.setPaymentAmount(successNode.get("totalAmount").asInt());
        	if (!successNode.get("card").isEmpty()) { // 카드결제
        		pay.setCardNo(successNode.get("card").get("number").asText());
        		System.out.println("카드번호: " + successNode.get("card").get("number").asText());
        		pay.setCardCompanyCode(successNode.get("card").get("issuerCode").asText());
        		System.out.println("카드회사코드: " + successNode.get("card").get("issuerCode").asText());
        	}
        	if (!successNode.get("easyPay").isEmpty()) { // 간편결제
        		pay.setCardCompanyCode(successNode.get("easyPay").get("provider").asText());
        		System.out.println("간편결제회사: " + successNode.get("easyPay").get("provider").asText());
        	}
        	paymentService.insertPaymentInfo(pay);
        	
        	String[] seats = thisSeats.split(",");
    		for (int i = 0; i < seats.length; i++) {
	        	purchase.setUserId(loginUser.getUserId());
	        	purchase.setPerfoTitle(performance.getPerfoTitle());
	        	purchase.setHallName(ra.getHallName());
	        	purchase.setSeatList(seats[i]);
	        	purchase.setPaymentNo(paymentService.getPaymentNo(pay));
	        	purchase.setPerfoNo(performance.getPerfoNo());
	        	purchase.setReservationDate(performance.getPerfoEventDate());
	        	purchase.setPerfoStartTime(performance.getStartTime());
	        	if (seats[i].substring(0,1).equals("R")) {
	        		purchase.setSeatPrice((int)(performance.getPrice()*1.5));
	        	}
	        	if (seats[i].substring(0,1).equals("S")) {
	        		purchase.setSeatPrice((int)(performance.getPrice()*1.2));
	        	}
	        	if (seats[i].substring(0,1).equals("A")) {
	        		purchase.setSeatPrice(performance.getPrice());
	        	}
	        	paymentService.insertPurchaseInfo(purchase);
	        	paymentService.deleteTemporaryPurchaseInfo(purchase);
    		}
        	
        	session.removeAttribute("performance");
        	session.removeAttribute("ra");
        	session.removeAttribute("thisSeats");
            model.addAttribute("orderId", successNode.get("orderId").asText())
            	 .addAttribute("orderName", successNode.get("orderName").asText())
            	 .addAttribute("approvedAt", successNode.get("approvedAt").asText())
            	 .addAttribute("amount", amount);
//            String secret = successNode.get("secret").asText(); // 가상계좌의 경우 입금 callback 검증을 위해서 secret을 저장하기를 권장함
            return "payment/success";
        } 
        // 결제 실패
        session.removeAttribute("performance");
    	session.removeAttribute("ra");
    	session.removeAttribute("thisSeats");
        JsonNode failNode = responseEntity.getBody();
        System.out.println("failNode: "+failNode);
        model.addAttribute("message", failNode.get("message").asText())
           	 .addAttribute("code", failNode.get("code").asText());
        return "payment/fail";
    }

    //결제 실패  페이지로 이동
    @RequestMapping("fail")
    public String failPayment(@RequestParam String message, @RequestParam String code, Model model) {
        model.addAttribute("message", message)
        	 .addAttribute("code", code);
        return "payment/fail";
    }

//    //가상계좌 기능 일단 주석해둠
//    @RequestMapping("/virtual-account/callback")
//    @ResponseStatus(HttpStatus.OK)
//    public void handleVirtualAccountCallback(@RequestBody CallbackPayload payload) {
//        if (payload.getStatus().equals("DONE")) {
//            // handle deposit result
//        }
//    }
//
//    private static class CallbackPayload {
//        public CallbackPayload() {}
//
//        private String secret;
//        private String status;
//        private String orderId;
//
//        public String getSecret() {
//            return secret;
//        }
//
//        public void setSecret(String secret) {
//            this.secret = secret;
//        }
//
//        public String getStatus() {
//            return status;
//        }
//
//        public void setStatus(String status) {
//            this.status = status;
//        }
//
//        public String getOrderId() {
//            return orderId;
//        }
//
//        public void setOrderId(String orderId) {
//            this.orderId = orderId;
//        }
//    }
}