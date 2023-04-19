package com.kh.mecenat.performance.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.common.Pagination;
import com.kh.mecenat.member.model.vo.Member;
import com.kh.mecenat.performance.model.service.PerformanceService;
import com.kh.mecenat.performance.model.vo.Performance;
import com.kh.mecenat.performance.model.vo.Review;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;
import com.kh.mecenat.reservation.model.vo.RentApplication;

@Controller
public class PerformanceController {

	@Autowired
	private PerformanceService perfoService;

//	전체 공연 목록 뽑기('status=>"상영중(나중에 변경해야징)")
	@RequestMapping("list.perf")
	public String performanceList(Model model) {
		ArrayList<Performance> pList = perfoService.selectListPerformance();

		model.addAttribute("pList", pList);

		return "performance/performanceListView2";

	}

//	유리)공연 등록폼 이동
	@RequestMapping("insertForm.perf")
	public String performanceInsertForm(Model model, int rno) {
		Performance pList = perfoService.selectListPerformance(rno);
		RentApplication rList = perfoService.selectRentalApplicationR(rno);

		model.addAttribute("rList", rList);

		return "performance/performanceInsert2";

	}

//	유리)관리자용 공연 등록
	@PostMapping("insert.perf")
	public ModelAndView insertPerformance(Performance p, int rcode, String eDate, String eTime, MultipartFile upfile, ModelAndView mv,
			HttpSession session) {

		String[] dateArr = eDate.split(",");
		String[] timeArr = eTime.split(",");

		int result = 0;
		String changeName = saveFile(upfile, session);

		for (int j = 0; j < dateArr.length; j++) {

			String dateInx = dateArr[j];
			String timeInx = timeArr[j];

			p.setOriginName(upfile.getOriginalFilename());
			p.setChangeName("resources/performanceFiles/" + changeName);

			p.setRentalCode(rcode);
			p.setPerfoEventDate(dateInx);
			p.setStartTime(timeInx);

			result = perfoService.insertPerformance(p);
			if (result > 0) {
				int updateStatus = perfoService.updateRentalAppStatus(rcode);
			}
		}
		if (result > 0) {
			perfoService.updateRentalAppStatus(rcode);
		}
		mv.setViewName("redirect:list.perf");

		return mv;

	}

//	유리)공연삭제(performance에서만 삭제함)
	@ResponseBody
	@RequestMapping(value = "deletePerf.perf")
	public String performanceDelete(int rcode) {

		perfoService.performanceDelete(rcode);

		return "performance/playPerformanceForm";
	}

//	유리)승인페이지에 뿌려줄 RENTALAPPLICATION 뽑아오기
	@RequestMapping("approveWaitForm.mana")
	public String approveListForm(Model model) {

		ArrayList<RentApplication> rList = perfoService.selectRentalApplication();

		model.addAttribute("rList", rList);

		return "performance/approveWaitForm";
	}

	@ResponseBody
	@RequestMapping(value = "approve.perf")
	public String approvePerformance(int rcode) {

		int result = perfoService.approvePerformance(rcode);

		return "redirect:/approveWaitForm.mana";
	}

//	유리)승인취소
	@ResponseBody
	@RequestMapping(value = "cancel.perf")
	public String cancelPerformance(int rcode) {

		int result = perfoService.cancelPerformance(rcode);

		return "redirect:/approveWaitForm.mana";
	}

//	유리) 승인 거부
	@ResponseBody
	@RequestMapping(value = "nope.perf")
	public String nopePerformance(int rcode) {
		int result = perfoService.nopePerformance(rcode);
		return "redirect:/approveWaitForm.mana";
	}

//유리)detailForm으로 이동
	@RequestMapping("detail.perf")
	public String performanceDateilForm(int rno, Model model) {

		Performance pList = perfoService.selectListPerformance(rno);

		model.addAttribute("pList", pList);

		return "performance/performanceDetailForm";

	}

	public String saveFile(MultipartFile upfile, HttpSession session) {

		// 1. 원본파일명 뽑기
		String originName = upfile.getOriginalFilename();

		// 2. 시간형식 뽑기
		// 20221205153533
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 3. 확장자 추출
		String ext = originName.substring(originName.lastIndexOf("."));

		// 4. 랜덤 숫자 추출
		int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤값

		// 5. 모두 이어붙이기
		String changeName = currentTime + ranNum + ext;

		// 6. 파일을 업로드할 실질적인 위치(물리경로) 찾기
		String savePath = session.getServletContext().getRealPath("/resources/performanceFiles/");

		try {
			// 7. 물리경로 + 변경이름으로 파일 생성 및 업로드
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	// 예매 안내 페이지 이동
	@RequestMapping("infomTicket.re")
	public String infomTicket() {
		return "reservation/ticketImfomTest";
	}

	// 좌석 배치도 페이지 이동
	@RequestMapping("setInfom.perf")
	public String setInfom() {
		return "performance/setInfom";
	}

//	유리) 상영중인 공연 관리하기
	@RequestMapping("playPerformanceForm.mana")
	public String selectList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "currentPageEnd", defaultValue = "1") int currentPageEnd, Model model) {

		int listCount = perfoService.selectListCount();
		int listEndCount = perfoService.selectEndListCount();
		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		PageInfo piEnd = Pagination.getPageinfo(listEndCount, currentPageEnd, pageLimit, boardLimit);

		ArrayList<Performance> pList = perfoService.selectPlayPerformance(pi);

		ArrayList<Performance> eList = perfoService.selectEndPlayPerformance(piEnd);

		String[] dateArr = new String[pList.size()];
		String sp = "";

		for (int i = 0; i < pList.size(); i++) {

			dateArr[i] = pList.get(i).getEventDate();

			String[] dateSArr = dateArr[i].split(",");

			sp = "";

			if (dateSArr.length != 1) {
				sp += dateSArr[0] + " ~ " + dateSArr[dateSArr.length - 1];
			} else {
				sp += dateSArr[0];
			}
			dateArr[i] = sp;

			pList.get(i).setEventDate(sp);
		}

		dateArr = new String[eList.size()];
		sp = "";
		for (int i = 0; i < eList.size(); i++) {
			dateArr[i] = pList.get(i).getEventDate();

			String[] dateSArr = dateArr[i].split(",");

			sp = "";

			if (dateSArr.length != 1) {
				sp += dateSArr[0] + " ~ " + dateSArr[dateSArr.length - 1];
			} else {
				sp += dateSArr[0];
			}
			dateArr[i] = sp;

			eList.get(i).setEventDate(sp);
		}

		model.addAttribute("pi", pi);
		model.addAttribute("piEnd", piEnd);

		model.addAttribute("pList", pList);

		model.addAttribute("eList", eList);
		return "performance/playPerformanceForm";
	}

	// 서브 메인페이지 이동
	@RequestMapping("subMainPerformance.perf")
	public String subMainPerformance() {
		return "performance/subMainPerformance";
	}

	// 서브 메인페이지 내에서 현재 페이지 공연 리스트 보여주기
	@RequestMapping("subMainPerformanceList.perf")
	@ResponseBody
	public ModelAndView subMainPerformanceList(String sdate, ModelAndView mv) {

		ArrayList<Performance> pList = perfoService.subMainPerformanceList(sdate);

		mv.addObject("pList", pList).setViewName("performance/subMainPerformanceList");

		return mv;
	}

	// 서브 메인페이지 내에서 공연 리스트 개수
	@RequestMapping("subMainPerformanceListCount.perf")
	@ResponseBody
	public int subMainPerformanceListCount(String sdate) {

		int listCount = perfoService.subMainPerformanceListCount(sdate);

		return listCount;
	}

	// 서브 메인페이지 내에서 공연 리스트 최신순 정렬
	@RequestMapping("subMainPerformanceSearchSort1.perf")
	public ModelAndView subMainPerformanceSearchSort1(String sdate, ModelAndView mv) {

		ArrayList<Performance> pList = perfoService.subMainPerformanceSearchSort1(sdate);

		mv.addObject("pList", pList).setViewName("performance/subMainPerformanceList");

		return mv;
	}

	// 서브 메인페이지 내에서 공연 리스트 관심순 정렬
	@RequestMapping("subMainPerformanceSearchSort2.perf")
	public ModelAndView subMainPerformanceSearchSort2(String sdate, ModelAndView mv) {

		ArrayList<Performance> pList = perfoService.subMainPerformanceSearchSort2(sdate);

		mv.addObject("pList", pList).setViewName("performance/subMainPerformanceList");

		return mv;
	}

	// 서브 메인페이지 내에서 공연 검색어 리스트 검색 조회
	@RequestMapping("subMainPerformanceSearch.perf")
	public ModelAndView subMainPerformanceSearch(String searchWrd, ModelAndView mv) {

		ArrayList<Performance> pList = perfoService.subMainPerformanceSearch(searchWrd);

		mv.addObject("pList", pList).setViewName("performance/subMainPerformanceList");

		return mv;
	}

	// 서브 메인페이지 내에서 검색어 리스트 개수 조회
	@RequestMapping("subMainPerformanceSearchCount.perf")
	@ResponseBody
	public int subMainPerformanceSearchCount(String searchWrd) {

		int listCount = perfoService.subMainPerformanceSearchCount(searchWrd);

		return listCount;
	}

//	유리) PERFO_STATUS 변경

	@ResponseBody
	@RequestMapping(value = "statusChange.perf")
	public void updateStatus(int rcode, String statusVal) {

		Performance p = new Performance();
		p.setRentalCode(rcode);
		p.setPerfoStatus(statusVal);

		int updateStatus = perfoService.updateStatus(p);

	}
	
	// yuri_혜원 myPage 결제내역(Payment) date값 가져오기....
	@ResponseBody
	@RequestMapping(value = "searchList.pmt", produces = "application/json; charset=UTF-8")
	public String searchPaymentList(String FirstDate, String LastDate, String userId, Model model) {
		
		Performance p = new Performance();
		p.setUserId(userId);
		p.setStartDate(FirstDate);
		p.setEndDate(LastDate);
		
		
		ArrayList<Payment> list = perfoService.selectPaymentList(p);
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getPaymentStatus().equals("DONE")) {
				list.get(i).setPaymentStatus("결제완료");
			} else if(list.get(i).getPaymentStatus().equals("WAIT")) {
				list.get(i).setPaymentStatus("결제대기");	
			} else if(list.get(i).getPaymentStatus().equals("REFUND")) {
				list.get(i).setPaymentStatus("결제완료(환불포함)");	
			}
		}

		return new Gson().toJson(list); 

	}

	// yuri_혜원 myPage 세부 공연 티켓(Purchase)date값 가져오기....
	@RequestMapping(value = "searchList.prce")
	public String searchList(int paymentNo, HttpSession session, Model model) {

		Member m = (Member)session.getAttribute("loginUser");
		
		Payment p = new Payment();
		p.setUserId(m.getUserId());
		p.setPaymentNo(paymentNo);

		Performance pf = perfoService.selectPerformanceOne(paymentNo);
		ArrayList<Purchase> prceList = perfoService.selectDateList(p);


		for(int i = 0; i<prceList.size(); i++) {
			if(!prceList.get(i).getUserId().equals(m.getUserId())) {
				prceList.remove(i);
			}	
		}

		if(prceList.size()>0) {
			model.addAttribute("prceList", prceList).addAttribute("pf", pf);
			return "member/myPage2";			
		}else {
			model.addAttribute("alertMsg", "세부내역을 조회할 수 없습니다. 고객센터로 문의바랍니다.");
			return "common/errorPage";			
		}
	
	}

//	유리_혜원-환불
	@RequestMapping(value = "payback.prce")
	public String payback(Purchase p, Model model) {
		Purchase pc = perfoService.selectPurchaseOne(p.getPurchaseNo());
		Performance pf = perfoService.selectPerformanceOne(pc.getPaymentNo());
		Payment pm = perfoService.selectPaymentone(pc);
		model.addAttribute("pc", pc);
		model.addAttribute("pm", pm);
		model.addAttribute("pf", pf);
		model.addAttribute("purchaseNo", p.getPurchaseNo());
		return "performance/paybackForm";
	}
	
//	혜원-환불 후처리
	@PostMapping(value = "paybackDone.rv")
	public String paybackAfter(Purchase p, String bankName, String bankAccount, Model model) {
		Purchase pc = perfoService.selectPurchaseOne(p.getPurchaseNo());
		Payment pm = perfoService.selectPaymentone(pc);	
//		
//		//총 결제금액 변경
//		int bfRefund = pm.getPaymentAmount();
//		int askRefund = bfRefund - pc.getSeatPrice();
//
//		pm.setPaymentAmount(askRefund);
//		pm.setPaymentStatus("REFUND");
//		System.out.println(pm);
//		int pmResult = perfoService.updatePaymentone(pm);
//		>>환불 승인 후로 변경 예정
		
		//cs상태 update - 환불요청
		pc.setCustomerserviceStatus("환불요청");
		int pcResult = perfoService.updatePurchaseone(pc);


		if(pcResult>0) {	
			model.addAttribute("alertMsg", "환불요청 완료, 마이페이지를 확인 하세요");
			return "member/myPage";
		}else {
			pc.setCustomerserviceStatus("");
			perfoService.updatePurchaseone(pc);
			
			model.addAttribute("alertMsg", "환불요청 실패, 관리자에게 문의하세요");
			return "common/errorPage";
		}
	}
	
//	allApproved.adm관리자 환불 요청 승인/거절건 조회
	@RequestMapping("allApproved.adm")
	public ModelAndView allApproved(HttpSession session, ModelAndView mv) {

		Member m = (Member)session.getAttribute("loginUser");	

			if(m.getUserId().equals("admin")) {			
				ArrayList<Purchase> list = perfoService.adminAnswerRefund("환불완료");

				mv.addObject("list", list).setViewName("member/answerRefund2");					
				
			}else {			
				mv.addObject("alertMsg","잘못된 접근입니다.").setViewName("common/errorPage");
			}
		return mv;
	}
	
	
//	answerRefund.adm 관리자 환불요청 진행
	@RequestMapping("answerRefund.adm")
	public ModelAndView answerRefund(HttpSession session, ModelAndView mv) {

		Member m = (Member)session.getAttribute("loginUser");	

			if(m.getUserId().equals("admin")) {			
				ArrayList<Purchase> list = perfoService.adminAnswerRefund("환불요청");

				mv.addObject("list", list).setViewName("member/answerRefund");					
				
			}else {			
				mv.addObject("alertMsg","잘못된 접근입니다.").setViewName("common/errorPage");
			}
		return mv;
	}
//	doRefund.prce 관리자 환불요청 승인
	@RequestMapping("doRefund.prce")
	public ModelAndView doRefund(HttpSession session, ModelAndView mv, Purchase p) {

		Member m = (Member)session.getAttribute("loginUser");	
		
			if(m.getUserId().equals("admin")) {			
				if(p.getPurchaseNo()>0){
					Purchase pc = perfoService.selectPurchaseOne(p.getPurchaseNo());
					Payment pm = perfoService.selectPaymentone(pc);	
					
//					//총 결제금액 변경 
					int bfRefund = pm.getPaymentAmount();
					int askRefund = bfRefund - pc.getSeatPrice();			
					pm.setPaymentAmount(askRefund);
					pm.setPaymentStatus("REFUND");
					System.out.println(pm);
					int pmResult = perfoService.updatePaymentone(pm);
					//cs상태 update - 환불완료
					pc.setCustomerserviceStatus("환불완료");
					int pcResult = perfoService.updatePurchaseone(pc);
					
					if((pmResult*pcResult)==0) {
						pm.setPaymentAmount(bfRefund);
						perfoService.updatePaymentone(pm);
						
						pc.setCustomerserviceStatus("환불요청");
						perfoService.updatePurchaseone(pc);

						mv.addObject("alertMsg","승인실패").setViewName("common/errorPage");
					}
					mv.addObject("alertMsg","환불승인완료").setViewName("redirect:/allApproved.adm");
				}else {
					mv.addObject("alertMsg","승인실패").setViewName("common/errorPage");
				}
			}else {			
				mv.addObject("alertMsg","잘못된 접근입니다.").setViewName("common/errorPage");
			}
		return mv;
	}
//	noRefund.prce 관리자 환불요청 거절
	@RequestMapping("noRefund.prce")
	public ModelAndView noRefund(HttpSession session, ModelAndView mv, Purchase p) {

		Member m = (Member)session.getAttribute("loginUser");	
		
			if(m.getUserId().equals("admin")) {			
				if(p.getPurchaseNo()>0){
					Purchase pc = perfoService.selectPurchaseOne(p.getPurchaseNo());
					Payment pm = perfoService.selectPaymentone(pc);	
					
//					//총 결제금액 변경없음
			
					int pmResult = perfoService.updatePaymentone(pm);
					//cs상태 update - 환불완료
					pc.setCustomerserviceStatus("환불거절");
					int pcResult = perfoService.updatePurchaseone(pc);
					
					if((pmResult*pcResult)==0) {
						pc.setCustomerserviceStatus("환불요청");
						perfoService.updatePurchaseone(pc);

						mv.addObject("alertMsg","진행실패").setViewName("common/errorPage");
					}
					
					mv.addObject("alertMsg","환불거절완료").setViewName("redirect:/allApproved.adm");
				}else {
					mv.addObject("alertMsg","진행실패").setViewName("common/errorPage");
				}
			}else {			
				mv.addObject("alertMsg","잘못된 접근입니다.").setViewName("common/errorPage");
			}
		return mv;
	}
	
	// 댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String selectReviewList(int rno) {

		ArrayList<Review> list = perfoService.selectReviewList(rno);

		return new Gson().toJson(list);

	}

	@ResponseBody
	@RequestMapping(value = "rinsert.bo", produces = "text/html; charset=UTF-8")
	public String insertReview(Review r) {

		int result = perfoService.insertReview(r);

		return result > 0 ? "yes" : "no";
	}

	@RequestMapping("genreList.perf")
	public ModelAndView genreList(ModelAndView mv, String genre) {
		
		ArrayList<Performance> pList = perfoService.genreList(genre);
		
		mv.addObject("pList", pList).setViewName("performance/performanceList");
		
		return mv;
	}
	
	

	@RequestMapping("genreAllList.perf")
	public ModelAndView genreAllList(ModelAndView mv) {
		
		ArrayList<Performance> pList = perfoService.genreAllList();
		
		
		mv.addObject("pList", pList).setViewName("performance/performanceList");

		return mv;
	}
	
	@RequestMapping("dayList.perf")
	public ModelAndView dayList(ModelAndView mv, String sdate) {
		
		ArrayList<Performance> pList = perfoService.dayList(sdate);
		
		mv.addObject("pList", pList).setViewName("performance/performanceList");
		
		return mv;
	}
}
