<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script language="javascript">
  location.replace('/mecenat')
 </script>
<%
  return;
 }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	document.oncontextmenu = function(){return false;}
</script>
<meta charset="UTF-8">
<title>❣ ${performance.perfoTitle} 예매하기</title>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style type="text/css">
 		#modal {
       		margin : 100px;
            width: 78%;
            height: auto;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            -webkit-backdrop-filter: blur(1.5px);
            padding-top:10%;
        }
        #modal-window {
        	width: 95%;
            height: auto;
            background: rgba(251,248,232,0.9);
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            position: relative;
            top: -100px;
            padding: 5%;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            color: black;
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area, #modal .closeArea {
            display: inline;
            float: right;
            padding-right: 10px;
            color: black;
            font-size: 25px;
            font-weight : bold;
        }
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            color: black;
            font-size : 14px;
        }
        #agree-btn{
        	width:200px;
        	height:50px;
        }
        .site-btn {
			font-size: 20px;
			color: white;
			background: lightgray;
			font-weight: 700;
			border: none;
			border-radius: 2px;
			letter-spacing: 2px;
			text-transform: uppercase;
			display: inline-block;
			padding: 10px 20px;
		}
        .site-btn-a {
			font-size: 20px;
			color: white;
			background: #2ea4ff;
			font-weight: 700;
			border: none;
			border-radius: 2px;
			letter-spacing: 2px;
			text-transform: uppercase;
			display: inline-block;
			padding: 10px 20px;
		}
		.site-btn-a:hover {
			cursor : pointer; 
		}
		.checkbox_group>div{
			width:50%;
			float:left;
		}
		.checkbox_group textarea{
			width:90%;
			height:100px;
			float:left;
			resize: none;
		}
		#agree-area{
			width:100%;
		}
		#payCashTbl{
			width:100%;

		}
		#payCashTbl tr{
			width:100%;
			height:50px;
		}
		#payCashTbl th{
			width:30%;
			border-bottom: 1px solid #ddd;
		}
		#payCashTbl td{
			padding-left:20px;
			border-bottom: 1px solid #ddd;
		}
		#card{
			height:100%;
			width: 200px;
			font-size:15px;
		}
    </style>    
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydown="return false">
<div id="modal" class="modal-overlay">
        <div id="modal-window" class="modal-window">
            <div class="title">
                <h2>약관동의</h2>
            </div>

	            <div align="center">
		            <div class="checkbox_group" align="left">
		            <div>
		            	<h3>고유식별정보 수집 및 이용안내</h3>
		            	<textarea>본 약관은 NHN한국사이버결제(이하 “회사”라 함)가 제공하는 전자지급결제대행서비스 이용자가 이용함에 있어 주민등록번호 수집 및 이용에 대한 기본적인 사항을 정함에 그 목적이 있습니다.

1. 회사는 이용자의 주민등록번호를 수집, 이용하는 목적은 다음과 같습니다.
ⓐ 이용자가 전자상거래를 이용하여 구매한 재화 및 용역의 대금 결제 시
ⓑ 이용자가 결제한 거래의 취소 및 환불 시
ⓒ 이용자가 결제한 거래의 청구, 수납 및 거래내역의 요청 확인 시
ⓓ 이용자가 수납한 거래 대금의 정산 시
ⓔ 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지
ⓕ 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인

2. 회사는 이용자로부터 수집한 주민등록번호는 아래 해당하는 경우에 제3자에게 제공하며 해당 사유 이외의 경우는 일체 외부에 제공하지 않습니다.
ⓐ 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
ⓑ 이용자가 사전에 동의한 경우
1) 계좌이체 :
은행(기업/국민/외환/수협/농협중앙회/단위농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/하나/신한/산림조합/산업)
증권(동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/대신/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화), 금융결제원
2) 휴대폰 : 이동통신사(SKT, KT, LGU+), 다날, 모빌리언스

3. 이용자로부터 제공받는 주민등록번호의 이용목적 및 보유,이용기간은 다음과 같습니다.
ⓐ 주민등록번호를 제공받는 자의 이용 목적 : 본인 인증, 거래승인
ⓑ 주민등록번호를 제공받는 자의 보유 및 이용 기간 :
-. 건당 거래금액이 1만원 이하의 경우 1년
-. 건당 거래금액이 1만원 초과의 경우 5년

4. 이용자의 주민등록번호는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기 합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.
ⓐ 관련법령 :
상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다.
ⓑ 상기 법령에 의한 보존기간은 아래와 같습니다.
1) 계약 또는 청약철회 등에 관한 기록
-. 보존기간 : 5년
-. 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
2) 대금결제 및 재화 등의 공급에 관한 기록
-. 보존기간 : 5년
-. 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
단, 건당 거래 금액이 1만원 이하의 경우에는 1년
3) 소비자의 불만 또는 분쟁처리에 관한 기록
-. 보존기간:
-. 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률
4) 신용정보의 수집/처리 및 이용 등에 관한 기록
-. 보존기간: 3년
-. 보존근거: 신용정보의 이용 및 보호에 관한 법률
5) 본인확인에 관한 기록
-. 보존기간: 6개월
-. 보존근거: 정보통신 이용촉진 및 정보보호 등에 관한 법률
6) 방문에 관한 기록
-. 보존기간: 3개월
-. 보존근거: 통신비밀보호법

5. 이용자는 회사의 주민등록번호 수집 및 이용 동의를 거부할 수 있습니다.
단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</textarea>
		            </div>
		            <div>
		            	<h3>개인정보 수집 및 이용안내</h3>
		            	<textarea>본 약관은 NHN한국사이버결제 (이하 회사라 함)가 제공하는 전자지급결제대행서비스 이용자가 이용함에 있어 개인정보 수집 및 이용에 대한 기본적인 사항을 정함에 그 목적이 있습니다.

1. 회사는 이용자의 개인정보를 수집, 이용하는 목적은 다음과 같습니다.
ⓐ 이용자가 전자상거래를 이용하여 구매한 재화 및 용역의 대금 결제 시
ⓑ 이용자가 결제한 거래의 취소 및 환불 시
ⓒ 이용자가 결제한 거래의 청구, 수납 및 거래내역의 요청 확인 시
ⓓ 이용자가 수납한 거래 대금의 정산 시
ⓔ 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지
ⓕ 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인

2. 회사가 수집하는 이용자의 개인정보의 항목은 다음과 같습니다
ⓐ 신용카드 : 카드번호(3rd-마스킹), 승인시간, 승인번호, 승인금액 등
ⓑ 계좌이체 : 계좌번호,비밀번호,주민등록번호(외국인등록번호), 행명, 보안카드 또는 OTP 등
ⓒ 가상계좌 : 입금자명, 입금은행 등
ⓓ 휴대폰 : 휴대폰번호, 이동통신사정보, 주민등록번호(외국인등록번호) 등

3. 회사가 수집한 이용자 개인정보의 보유, 이용 기간은 다음과 같습니다.
ⓐ 보존항목: 서비스 상담 수집 항목(회사명, 고객명, 전화번호, E-mail, 상담내용 등)
ⓑ 보존이유: 분쟁이 발생 할 경우 소명자료 활용
ⓒ 보존기간: 상담 완료 후 6개월

4. 이용자의 개인정보는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기 합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.
ⓐ 관련법령 :
상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다.
ⓑ 상기 법령에 의한 보존기간은 다음과 같습니다.
1) 계약 또는 청약철회 등에 관한 기록
-. 보존기간 : 5년
-. 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
2) 대금결제 및 재화 등의 공급에 관한 기록
-. 보존기간 : 5년
-. 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
단, 건당 거래 금액이 1만원 이하의 경우에는 1년
3) 소비자의 불만 또는 분쟁처리에 관한 기록
-. 보존기간: 3년
-. 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률
4) 신용정보의 수집/처리 및 이용 등에 관한 기록
-. 보존기간: 3년
-. 보존근거: 신용정보의 이용 및 보호에 관한 법률
5) 본인확인에 관한 기록
-. 보존기간: 6개월
-. 보존근거: 정보통신 이용촉진 및 정보보호 등에 관한 법률
6) 방문에 관한 기록
-. 보존기간: 3개월
-. 보존근거: 통신비밀보호법

5. 이용자는 회사의 주민등록번호 수집 및 이용 동의를 거부할 수 있습니다.
단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</textarea>
		            </div>
		            <div>
		            	<h3>개인정보 제공 및 위탁안내</h3>
		            	<textarea>본 약관은 NHN한국사이버결제(이하 회사라 함)가 제공하는 전자지급결제대행서비스 이용자가 이용함에 있어 이용자의 개인정보 제 3자 제공 및 위탁에 대한 기본적인 사항을 정함에 그 목적이 있습니다.

1. 회사는 이용자로부터 수집한 개인정보를 아래 해당하는 경우에 제3자에게 제공하며 해당 사유 이외의 경우는 일체 외부에 제공하지 않습다.
ⓐ 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
ⓑ 이용자가 사전에 동의한 경우

2. 회사는 아래와 같이 이용자로부터 수집한 개인정보를 제3자에게 제공합니다.
ⓐ 신용카드사 : 국민, 비씨, 롯데, 삼성, NH농협, 현대, 외환, 신한 등
ⓑ 계좌이체
-. 은행(기업/국민/외환/수협/농협중앙회/단위농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/하나/신한/산림조합/산업)
-. 증권(동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/대신/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화)
-. 금융결제원
ⓒ 가상계좌 : 기업/국민/외환/농협/우리/SC제일/신한/부산/광주/케이아이비넷 등
ⓓ 휴대폰 : 이동통신사(SKT, KT, LGU+), 다날, 모빌리언스

3. 이용자로부터 제공받은 개인정보의 이용 목적 및 이용기간은 다음과 같습니다.
ⓐ 개인정보를 제공받는 자의 이용 목적 : 본인 인증, 거래승인, 요금정산을 위한 거래정보전송, 수납 등 요금 정산 관련 업무 및 거래 확인 요청에 대한 응대
ⓑ 제공하는 개인정보의 항목 :
이용자의 서비스 거래 정보(각 결제 수단의 거래 승인 여부, 거래 승인 실패 원인, 결제 일시, 결제금액 등)
ⓒ 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 :
-. 건당 거래금액이 1만원 이하의 경우 1년
-. 건당 거래금액이 1만원 초과의 경우 5년

4. 결제수단별 제공하는 개인정보의 항목은 다음과 같습니다.
ⓐ 신용카드 : 이용자의 서비스 거래정보(이용 상점 정보, 상품명, 주문금액 등)
ⓑ 계좌이체 : 이용자의 서비스 거래정보(이용 상점 정보, 상품명, 주문금액, 계좌번호, 비밀번호, 주민등록번호(외국인등록번호), 은행명, 보안카드 또는 OTP 등)
ⓒ 가상계좌 : 이용자의 서비스 거래정보(이용 상점 정보, 상품명, 주문금액,입금자명, 입금은행 등)
ⓓ 휴대폰 : 이용자의 서비스 거래정보(이용 상점 정보, 상품명, 주문금액, 휴대폰번호, 이동통신사정보, 주민등록번호(외국인등록번호) 등)

5. 이용자는 회사의 개인정보 제공 및 위탁 동의를 거부할 수 있습니다. 단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</textarea>
		            </div>
		            <div>
		            	<h3>전자금융거래 이용약관</h3>
		            	<textarea>제1조 (목적)
이 약관은 전자지급결제대행 서비스를 제공하는 NHN한국사이버결제 (이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.

제2조 (용어의 정의)
이 약관에서 정하는 용어의 정의는 다음과 같습니다.
1. '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
2. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
3. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
4. '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
5. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.

제3조 (약관의 명시 및 변경)
1. 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
3. 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
제4조 (전자지급결제대행서비스의 종류)
회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.

제5조 (접근매체의 관리 등)
1. 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
3. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
4. 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.

제6조 (거래내용의 확인)
1. 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.
2. 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 합니다.
3. 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
- 결제대행사: NHN한국사이버결제 주식회사
- 주소: 08393 서울특별시 구로구 디지털로26길 72 (구로동, NHN한국사이버결제)
- 이메일 주소: help@kcp.co.kr
- 전화번호: 1544-8667

제7조 (오류의 정정 등)
1. 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
2. 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.

제8조 (회사의 책임)
1. 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 제5조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그러하지 아니합니다.
2. 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본 조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
3. 회사는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 전자지급결제대행 서비스의 제공을 일시적으로 중단할 수 있습니다.
4. 회사는 전항의 사유로 전자지급결제대행 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자가 입은 손해에 대하여 배상합니다.

제9조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
1. 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
2. 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제5조 제2항에서 정한 바에 따릅니다.

제10조 (거래지시의 철회 및 철회의 제한)
1. 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.
2. 전항의 지급효력이라 함은 거래지시 된 금액 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝날 때 또는 금융기관의 전자적 장치에 입력이 끝날 때를 말합니다.
3. 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의 철회 등을 한 경우에만 전자지급거래지시의 철회가 가능합니다.

제11조 (전자금융거래정보의 제공금지)
회사는 전자지급결제대행 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다.

제12조 (분쟁처리 및 분쟁조정)
1. 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
- 결제대행사: NHN한국사이버결제 주식회사
- 주소: 08393 서울특별시 구로구 디지털로26길 72 (구로동, NHN한국사이버결제)
- 이메일 주소: help@kcp.co.kr
- 전화번호: 1544-8667

2. 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
3. 이용자는 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자지급결제대행 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.

제13조 (회사의 안정성 확보 의무)
회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을 준수합니다.

제14조 (약관외 준칙 및 관할)
1. 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
2. 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</textarea>
		            </div>
					
		            <div style="padding-top:20px;">
					  <input type="checkbox" id="check_1" class="normal" >
					  <label for="check_1">고유식별정보 수집 및 이용안내</label>
					</div>
					<div style="padding-top:20px;">
					  <input type="checkbox" id="check_2" class="normal" >
					  <label for="check_2">개인정보 수집 및 이용안내</label>
					</div>
					<div>  
					  <input type="checkbox" id="check_3" class="normal" >
					  <label for="check_3">개인정보 제공 및 위탁안내</label>
					</div>
					<div>  
					  <input type="checkbox" id="check_4" class="normal" >
					  <label for="check_4">전자금융거래 이용약관</label>
					</div>
					<div>
					  <input type="checkbox" id="check_all" >
					  <label for="check_all">전체 동의</label>
					</div>
					</div>
	            </div>
          	<div class="closeArea" id="agree-area" align="center"><button type="button" class="site-btn" id="agree-btn">동의하기</button></div>  
        </div>
    </div>
    
<!--     여기까지가 끝인가보오 - 모달 -->
       
<div id="reserveOuter" style="width:100%;" align='center'>
	<form action="doneThanks.rv">
        <div id="head-img" style="width:100%;">
        	<img src="resources/img/reserve/center-top.jpg" style="width:100%; height:auto;"/>
        </div>
        <div id="reserve-step" align='center'>
        <table style="width:100%;" border="1">
        	<tr>
        		<th style="width:130px;"><p>1. 프로그램<br>${performance.perfoTitle}</p></th>
        		<th><p>2. 장소<br>${ra.hallName}</p></th>
        		<th><p>3. 날짜<br>${performance.perfoEventDate}</p></th>
        		<th><p>4. 관람시간<br>${performance.startTime}</p></th>
        		<th><p id="count-seat">5. 인원<br>${selectAllSeats.size()}</p></th>
        		<th><p>6. 결제<br>${tPrice}</p></th>
        	</tr>
        </table>
        </div>
        <div id="concert-info" style="width:100%;">
        	<input type='hidden' id='perfoNo' name='perfoNo' value='${performance.perfoNo}'>
        	<input type='hidden' id='rentalCode' name='rentalCode' value='${ra.rentalCode}'>
        </div>
    </form>
    
    <table style="width:100%;" border="1">
       	<tr>
     		<td>
     			<input type="radio" id="payCard" value="카드" name="method" onclick="getPayWay(event)" checked>신용카드 &nbsp;&nbsp;&nbsp;
<!--      			<input type="radio" id="payVirtualCash" value="가상계좌" name="method" onclick="getPayWay(event)">가상계좌 &nbsp;&nbsp;&nbsp; -->
     			<input type="radio" id="payCash" value="무통장" name="method" onclick="getPayWay(event)">무통장입금
     		</td>
       	</tr>
    </table>
    
    <div id="payTbl" style="border:1px solid gray; display:none;">
        <table id="payCashTbl" style="width:100%; display:none;">
        	<tr>
        		<td colspan="2" style="padding:0px; padding-left:20px;">
        			<p><small>*입금하시는 분의 정보는 회원정보와 동일하게 적용됩니다.<br>*선택하신 가상계좌는 현금영수증을 발행받으실 수 있습니다.</small></p>
       			</td>
        	</tr>
        	<tr>
        		<th><label for="card">은행</label></th>
        		<td>
        			<select id="card">
        				<option value="KB">KB국민은행</option>
        				<option value="IBK기업">IBK기기업은행</option>
        				<option value="신한">신한은행</option>
        				<option value="우리">우리은행</option>
        				<option value="하나">하나은행</option>
        			</select>
        		</td>
        	</tr>
        	<tr>
        		<th>수취인</th>
        		<td>세종문화회관</td>
        	</tr>
        	<c:if test="${loginUser != null}">
        	<tr>
        		<th>이름</th>
        		<td>${loginUser.userName}</td>
        	</tr>
        	<tr>
        		<th>연락처</th>
        		<td>${loginUser.userPhone}</td>
        	</tr>
        	<tr>
        		<th>이메일</th>
        		<td>${loginUser.email}</td>
        	</tr>
        	<tr>
        		<td colspan="2"><small>*현금영수증 발행시 입력하신 발급번호는 추후 수정이 어렵습니다. 확인후 결제 바랍니다.</small></td>
        	</tr>
        	<tr>
        		<th>현금영수증 발행</th>
        		<td>
        			<input type="radio" id="receiptO" value="receiptO" name="cashReceipt" onclick="getReceipt(event)">발행 &nbsp;&nbsp;&nbsp;
        			<input type="radio" id="receiptX" value="receiptX" name="cashReceipt" onclick="getReceipt(event)" checked>미발행
        		</td>
        	</tr>
        	<tr id="receiptPart" style="display:none;">
        		<th>현금영수증 용도</th>
        		<td>
        			<input type="radio" id="receiptCo" value="receiptCo" name="receiptCp" onclick="getReceiptCp(event)">개인 &nbsp;&nbsp;&nbsp;
        			<input type="radio" id="receiptPer" value="receiptPer" name="receiptCp" onclick="getReceiptCp(event)">사업자
        		</td>
        	</tr>
        	<tr id="getPhoneNum" style="display:none;">
        		<th>휴대폰 번호</th>
        		<td>
        			<input type="text" value="" id="phoneNum" name="receiptNum">
        		</td>
        	</tr>
        	<tr id="getCoNum" style="display:none;">
        		<th>사업자 번호</th>
        		<td>
        			<input type="text" value="" id="coNum" name="receiptNum">
        		</td>
        	</tr>
        	</c:if>
        </table>
     </div>
     
	<div align='center'>
		<h1>총 주문금액 : ${tPrice} 원</h1>
		<p/>
<!-- 		<div> -->
<!-- 			<label><input type="radio" name="method" value="카드" checked/>신용카드</label> -->
<!-- 			<label><input type="radio" name="method" value="가상계좌"/>가상계좌</label>	 -->
<!-- 			<label><input type="radio" name="method" value="무통장"/>무통장입금</label>	 -->
<!-- 		</div> -->
		<p/>
		<button id="payment-button" class="site-btn-a">결제하기</button>
	</div>
</div>
</body>

<!-- script -->
<script>
	var clientKey = 'test_ck_N5OWRapdA8deke9pWvP3o1zEqZKL' //테스트용 키
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
    var button = document.getElementById("payment-button"); // 결제하기 버튼
	var orderId = new Date().getTime(); // 주문 고유번호
	var selectSeatsList = [];
	var selectSeatsStr = "${performance.perfoTitle} ${performance.perfoEventDate} ${performance.startTime} ";
	
	<c:forEach items="${selectAllSeats}" var="selectAllSeats">
		selectSeatsList.push("${selectAllSeats}");
	</c:forEach>
	
	for (var i = 0; i < selectSeatsList.length; i++) {
		selectSeatsStr += selectSeatsList[i].substring(1,2)
			if(i != selectSeatsList.length - 1){				
				selectSeatsStr += selectSeatsList[i].substring(2) + ","
			} else {
				selectSeatsStr += selectSeatsList[i].substring(2)
			}
	}
	
	button.addEventListener('click', function () {
		var method = document.querySelector('input[name=method]:checked').value; // 결제 수단 파라미터 변수
		var paymentData = { // 결제 정보 파라미터 변수
			amount: ${totalPrice},
   	   	    orderId: orderId,
   	   	    orderName: selectSeatsStr,
   	   	    customerName: '${loginUser.userId}',
            successUrl: window.location.origin + "/mecenat/success",
            failUrl: window.location.origin + "/mecenat/fail",
		}
		if (method === '카드') {
	        tossPayments.requestPayment(method, paymentData);
        } else if (method === '가상계좌') { // 아직 가상계좌는 안됨
            paymentData.virtualAccountCallbackUrl = window.location.origin + '/virtual-account/callback';
            tossPayments.requestPayment(method, paymentData);
        } else if (method === '무통장'){
        	
        }
    })
    
//         .catch(function (error) {
//        	  if (error.code === 'USER_CANCEL') { // 결제 고객이 결제창을 닫았을 때 에러 처리
         		  
//        	  } else if (error.code === 'INVALID_CARD_COMPANY') { // 유효하지 않은 카드 코드에 대한 에러 처리
       		  
//        	  } else if (error.code === 'DUPLICATED_ORDER_ID'){ // 이미 주문중인 ORDER_ID에 대한 에러 처리
       		  
//        	  }
//         });
	
  	document.addEventListener("DOMContentLoaded", function(){
       const modal = document.getElementById("modal")
	    modal.style.display = "flex"
  	},{once : true});
  	
  	$(".checkbox_group").on("click", "#check_all", function () {
  	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
  	    
  	    if ($(this).is(":checked")){
  	   		$("#agree-btn").attr('class','site-btn-a');
  	    	$("#agree-area").attr('class','close-area');
  	    	
  	    	const closeBtn = modal.querySelector(".close-area")
  	    	closeBtn.addEventListener("click", e => {
  	    	    modal.style.display = "none"
  			})
  	    } else {
  	    	$("#agree-btn").attr('class','site-btn');
  	    	$("#agree-area").attr('class','closeArea'); 
  	    }
  	    
  	});

  	// 체크박스 개별 선택
  	$(".checkbox_group").on("click", ".normal", function() {
  	    var is_checked = true;

  	    $(".checkbox_group .normal").each(function(){
  	        is_checked = is_checked && $(this).is(":checked");
  	    });

  	    $("#check_all").prop("checked", is_checked);
  	    if($("#check_all").is(":checked")){
  	    	$("#agree-btn").attr('class','site-btn-a');
  	    	$("#agree-area").attr('class','close-area'); 
  	    	
  	    	const closeBtn = modal.querySelector(".close-area")
  	    	closeBtn.addEventListener("click", e => {
  	    	    modal.style.display = "none"
  			})
  	    } else {
  	    	$("#agree-btn").attr('class','site-btn');
  	    	$("#agree-area").attr('class','closeArea');    
  	    }
  	});
</script>
<script>
	function getPayWay(event) {
		 var payWay = event.target.value;
		 console.log(payWay);
		
		 if (payWay == "카드" || payWay == "가상계좌"){
			 document.getElementById('payTbl').style.display = "block";
			 document.getElementById('payCashTbl').style.display = "none";
			 document.getElementById("payment-button").className = 'site-btn-a';
		 } else if (payWay == "무통장"){
			 document.getElementById('payTbl').style.display = "block";
			 document.getElementById('payCashTbl').style.display = "table";
		 } else {
			 document.getElementById('payTbl').style.display = "none";
			 document.getElementById('payCashTbl').style.display = "none";
		 }
	}
	
	function getReceipt(event) {
		 var receipt = event.target.value;	
		 
 		 if (receipt == "receiptO"){
 			document.getElementById("receiptPart").style.display = "table-row";
 			document.getElementById('getPhoneNum').style.display = "table-row";
 			document.getElementById('getCoNum').style.display = "none";
 			$("input:radio[id='receiptCo']").prop("checked", true);
 			$("input:radio[id='receiptPer']").prop("checked", false);
 			document.getElementById("payment-button").className = 'site-btn';
 		 } else if (receipt == "receiptX"){
 			document.getElementById('receiptPart').style.display = "none";
 			document.getElementById('getPhoneNum').style.display = "none";
 			document.getElementById('getCoNum').style.display = "none";
 			document.getElementById("payment-button").className = 'site-btn-a';
 		 }
	}
	
	function getReceiptCp(event) {
		 var receiptCp = event.target.value;	
				 
		 if (receiptCp == "receiptCo"){
			document.getElementById('getPhoneNum').style.display = "table-row";
			document.getElementById('getCoNum').style.display = "none";
		 } else if (receiptCp == "receiptPer"){
			 document.getElementById('getPhoneNum').style.display = "none";
			 document.getElementById('getCoNum').style.display = "table-row";
		 }
	}	
	
	document.getElementById("phoneNum").addEventListener("keyup", myFunction);
	document.getElementById("coNum").addEventListener("keyup", myFunction);
	
	function myFunction() {
		var phoneNum = document.getElementById("phoneNum").value;
		var coNum = document.getElementById("coNum").value;
		
		if (phoneNum != null && phoneNum != ""){
			document.getElementById("payment-button").className = 'site-btn-a';
		} else if (coNum != null && coNum != ""){
			document.getElementById("payment-button").className = 'site-btn-a';
		} else {
			document.getElementById("payment-button").className = 'site-btn';
		}
	};
	
</script>

</html>









