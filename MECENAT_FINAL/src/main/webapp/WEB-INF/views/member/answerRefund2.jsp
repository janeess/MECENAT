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
		<div class="innerOuter" style="padding:5% 10%;" align="center">
			<br>
			<p id="title" style="font-size:30px">환불요청 조회</p>
			<div style="padding:30px; padding-top:5px;">
				<table width="100%">
					<tr>
						<td align="left">
							<button type="button" class="btn btn-secondary" style="background-color:skyblue; border:skyblue;"><a href="myPage.me">MYPAGE</a></button>
						</td>
						<td align="right">
							<button type="button" class="btn btn-secondary" style="background-color:lightpnk; border:lightpnk;"><a href="answerRefund.adm">미확인건 조회</a></button>
						</td>
					</tr>
				</table>
			</div>
			<table  class="table table-hover" id="applicationList" >
				<thead>
					<tr align="center">
						<td><b>공연명</b></td>
						<td><b>예약날짜</b></td>
						<td><b>좌석번호</b></td>
						<td><b>좌석금액</b></td>
						<td colspan="2"><b>요청사항 승인/거절</b></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${list}">
					<c:choose>
					<c:when test="${p.customerserviceStatus == '환불완료'}">
						<tr align="center">
							<td>${p.perfoTitle}</td>
							<td>${p.reservationDate}</th>
							<td>${p.seatList}</td>
							<td>${p.seatPrice}&nbsp;원</td>
							<td><b>환불완료</b><td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td>${p.perfoTitle}</td>
							<td>${p.reservationDate}</th>
							<td>${p.seatList}</td>
							<td>${p.seatPrice}&nbsp;원</td>
							<td><b>환불거절</b><td>
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
			
		</div>
		<br><br>
	</div>
	
	<script>
	
	</script>
	

	<br><br><br>
	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->


</body>
</html>