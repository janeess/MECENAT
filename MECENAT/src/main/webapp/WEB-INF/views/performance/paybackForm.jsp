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
	   #bankNameIp{
	   		width:100%;
	   		height:100%;
	   		padding:3px;
	   		font-size:11px;
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
	<form action="paybackDone.rv" method="post">
	<div class="content">
		<br><br>
		<div class="innerOuter" style="padding:5% 10%;" align="center">
			<br>
			<p id="title" style="font-size:30px">TICKET 환불요청서</p>
			<br>
			<input type="hidden" id="userId" value="${loginUser.userId}">
			<input type="hidden" name="purchaseNo" value="${purchaseNo}">
			<table  class="table table-hover" id="applicationList" >
				<tbody>
					<tr align="center">
						<td colspan="2"><b>공연명</b></td>
						<td colspan="3">${pf.perfoTitle}</td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>관람일</b></td>
						<td colspan="3">${pf.perfoEventDate}</td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>공연홀</b></td>
						<td colspan="3">${pf.hallName}</td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>좌석확인</b></td>
						<td colspan="3">${pc.seatList.substring(0,1)}&nbsp;&nbsp;&nbsp;${pc.seatList.substring(1,2)}&nbsp;열&nbsp;&nbsp;${pc.seatList.substring(2)}&nbsp;석</td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>결제방법</b></td>
						<td colspan="3"><b>${pm.paymentMethod}</b></td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>환불예정금액</b></td>
						<td colspan="3">${pc.seatPrice}&nbsp;원</td>
					</tr>
					<c:choose>
					<c:when test='${pm.paymentMethod == "무통장"}'>
					<tr align="center">
						<td><b>환불 정보</b></td>
						<td>은행</td>
						<td colspan="2">계좌번호</td>
						<td>입금자명</td>
					</tr>
					<tr align="center">
						<td colspan="2"><b>환불 정보</b></td>
						<td>
							<select id="bankName">
								<option vlaue="국민은행">국민은행</option>
								<option vlaue="기업은행">기업은행</option>
								<option vlaue="농협">농협</option>
								<option vlaue="수협">수협</option>
								<option vlaue="신한은행">신한은행</option>
								<option vlaue="우리은행">우리은행</option>
								<option vlaue="하나은행">하나은행</option>
							</select>
							<input type="hidden" maxlength="20" id="bankNameIp" name="bankName">
						</td>
						<td colspan="2"><input type="text" maxlength="20" name="bankAccount"></td>
						<td>${loginUser.userName}</td>
					</tr>
					<tr>
						<td colspan="5">
							<small>* 본인명의 계좌만 입력 가능하며, 그 외 계좌번호 입력시 환불이 어렵습니다.</small>
						</td>
					</tr>
					</c:when>
					<c:otherwise>
						<input type="hidden" maxlength="20" id="bankNameIp" name="bankName" vlaue="no">
						<input type="hidden" maxlength="20" name="bankAccount" vlaue="no">
					</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<td colspan="5">
						<small>* 구매취소 후 환불은 영업일 기준 3~5일 소요됩니다.</small>
					</td>
				</tfoot>
			</table>
			<div style="padding:30px; padding-top:5px;">
				<table style="width:100%;">
					<tr>
						<td align="left">
							<button type="button" class="btn btn-secondary" style="background-color:skyblue; border:skyblue;">MYPAGE</button>
						</td>
						<td align="right">
							<button type="submit" class="btn btn-secondary" style="background-color:red; border:red;">TICKET 환불요청</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br><br>
	</div>
	<script>
		$(function(){
			$("#bankNameIp").val() = $("#bankName").val();
			console.log($("#bankNameIp").val()+" "+$("#bankName").val());
		})
	</script>
	
	</form>

	<br><br><br>
	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->


</body>
</html>