<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Core -->
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!-- XML -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- I18N -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- Database -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!--[if lt IE 9]>
<script src="/static/portal/js/html5.js"></script>
<![endif]-->
<style>
		.topContent {
	        background-color:rgb(247, 245, 245);
	        width:80%;
	        margin:auto;
	    }
		.content {
	        background-color:rgb(247, 245, 245);
	        width:80%;
	        margin:auto;
	    }
	    .innerOuter {
	        border:1px solid lightgray;
	        width:80%;
	        margin:auto;
	        padding:5% 10%;
	        background-color:white;
	    }
	    .topInnerOuter{
	    	width:80%;
	        margin:auto;
	        padding:5% 10%;
	    }
	   #refundSeats>td{
	   		text-decoration : line-through;
	   		color : red;
	   }
	   @media print {
		  .noprint { display:none; }
	   }
</style>
</head>
<body class="hide-focus-ring">
		<!-- Header Section Begin -->
		<jsp:include page="../common/header.jsp" />
		<!-- Header End -->
	
	<c:if test="${not empty errorMsg}">
		<script type="text/javascript">
			alert("${errorMsg}");
			<%session.removeAttribute("errorMsg"); %>
		</script>
	</c:if>
	<c:if test="${not empty alertMsg}">
		<script type="text/javascript">
			alert("${alertMsg}");
			<%session.removeAttribute("alertMsg"); %>
		</script>
	</c:if>
	
	<br><br><br>
	<div class="content">
		<br><br>
		<div class="innerOuter" id="print" style="padding:5% 10%;" align="center">
			<br>
			<p id="title" style="font-size:30px">MY TICKET 조회</p>
			<br>
			<input type="hidden" id="userId" value="${loginUser.userId}">
			
			<table  class="table table-hover" id="applicationList" >
				<thead>
					<tr align="center">
						<td rowspan="3" width="150px;">
							<img src="${pf.changeName}" alt="${pf.perfoTitle}">
						</td>
						<td><b>공연명</b></td>
						<td colspan="4">${pf.perfoTitle}</td>
					</tr>
					<tr align="center">
						<td><b>관람일</b></td>
						<td colspan="4">${pf.perfoEventDate}</td>
					</tr>
					<tr align="center">
						<td><b>공연홀</b></td>
							<td colspan="4">${pf.hallName} &nbsp;&nbsp;&nbsp; 
								<button type="button" class="btn btn-secondary noprint" style="background-color:lightpink; border:0px;">
									<a href="/mecenat/setInfom.perf">${performance.hallName} 시야확인하기</a>
								</button>
							</td>
					</tr>
					<tr align="center">
						<td><b>상태</b></td>
						<td><b>좌석등급</b></td>
						<td><b>열</b></td>
						<td><b>좌석번호</b></td>
						<td><b>좌석금액</b></td>
						<td><b>구매취소</b></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${prceList}">
						<c:choose>
						<c:when test='${p.customerserviceStatus == "환불요청"}'>
							<tr align="center" id="refundSeats">
								<td style="text-decoration : none;">${p.customerserviceStatus}</td>
								<td>${p.seatList.substring(0,1)}</td>
								<td>${p.seatList.substring(1,2)}&nbsp;열</th>
								<td>${p.seatList.substring(2)}&nbsp;석</td>
								<td>${p.seatPrice}&nbsp;원</td>
								<td style="text-decoration : none;">환불대기중<td>
							</tr>
						</c:when>
						<c:when test='${p.customerserviceStatus == "환불완료"}'>
							<tr align="center" id="refundSeats">
								<td style="text-decoration : none;">${p.customerserviceStatus}</td>
								<td>${p.seatList.substring(0,1)}</td>
								<td>${p.seatList.substring(1,2)}&nbsp;열</th>
								<td>${p.seatList.substring(2)}&nbsp;석</td>
								<td>${p.seatPrice}&nbsp;원</td>
								<td style="text-decoration : none;">환불완료<td>
							</tr>
						</c:when>
						<c:when test='${p.customerserviceStatus == "환불 승인거절"}'>
							<tr align="center" id="refundSeats">
								<td>${p.customerserviceStatus}</td>
								<td>${p.seatList.substring(0,1)}</td>
								<td>${p.seatList.substring(1,2)}&nbsp;열</th>
								<td>${p.seatList.substring(2)}&nbsp;석</td>
								<td>${p.seatPrice}&nbsp;원</td>
								<td><td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr align="center">
								<td>${p.customerserviceStatus}</td>
								<td>${p.seatList.substring(0,1)}</td>
								<td>${p.seatList.substring(1,2)}&nbsp;열</th>
								<td>${p.seatList.substring(2)}&nbsp;석</td>
								<td>${p.seatPrice}&nbsp;원</td>
								<td><b><a href='payback.prce?userId=${loginUser.userId}&purchaseNo=${p.purchaseNo}' class='noprint'>X</a></b><td>
							</tr>
						</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
				<tfoot>
					<td colspan="5">
						<small>* 구매취소 후 환불은 영업일 기준 3~5일 소요됩니다.</small>
					</td>
				</tfoot>
			</table>
			<div style="padding:30px; padding-top:5px;" class="noprint">
				<table style="width:100%;">
					<tr>
						<td align="left">
							<button type="button" class="btn btn-secondary" style="background-color:skyblue; border:skyblue;"><a href="myPage.me">MYPAGE</a></button>
						</td>
						<td align="right">
							<button type="button" class="btn btn-secondary" onclick="printPage();">TICKET PRINT</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br><br>
	</div>
	
	<script type="text/javascript">
		//<![CDATA[
		function printPage(){
		 var initBody;
		 window.onbeforeprint = function(){
		  initBody = document.body.innerHTML;
		  document.body.innerHTML =  document.getElementById('print').innerHTML;
		 };
		 window.onafterprint = function(){
		  document.body.innerHTML = initBody;
		 };
		 window.print();
		 return false;
		}
		//]]>
	</script>
	

	<br><br><br>
	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->


</body>
</html>