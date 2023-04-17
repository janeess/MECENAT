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
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
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
        
        table * {margin:5px;}
        table {width:100%;}
        
        
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>${m.userName } 정보</h2>
			<br>
			
			<div class="form-group">
				<label for="userId">*ID : </label>
				<input type="text" class="form-control" id="userId" value="${m.userId }" name="userId" readonly> <br>
				
				<label for="userName">*이름 : </label>
				<input type="text" class="form-control" id="userName" value="${m.userName }" name="userName" readonly> <br>
				
				<label for="regNoDate">*생일 : </label>
				<input type="text" class="form-control" id="userId" value="${m.regNoDate }" name="userId" readonly> <br>
				
				<label for="userPhone">*폰번호 : </label>
				<input type="text" class="form-control" id="userPhone" value="${m.userPhone }" name="userPhone" readonly> <br>
				
				<label for="email">*이메일 : </label>
				<input type="text" class="form-control" id="email" value="${m.email }" name="email" readonly> <br>
				
				<label for="enrollDate">*가입날짜 : </label>
				<input type="text" class="form-control" id="enrollDate" value="${m.enrollDate }" name="enrollDate" readonly> <br>
				
			</div>
			
			<br><br><br>
			
			<h2>${m.userName } 댓글 내역</h2>
<!-- 			<div class="list-area"> -->
<%-- 				<c:forEach var="r" items="${list}"> --%>
<%-- 					<p>${r.reviewWriter }</p> --%>
<%-- 					<p>${r.content }</p> --%>
<%-- 					<p>${r.writeDate }</p> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
			<div class="list-area">
				<table>
					<thead style="border: 1px solid black">
						<tr >
							<th style="border: 1px solid black">회원아이디</th>
							<th style="border: 1px solid black">댓글내용</th>
							<th style="border: 1px solid black">작성일자</th>
						</tr>
					</thead>
					<tbody style="border: 1px solid black;">
						<c:forEach var="r" items="${list}">
							<tr>
								<td style="border: 1px solid black">${r.reviewWriter }</td>
								<td style="border: 1px solid black">${r.content }</td>
								<td style="border: 1px solid black">${r.writeDate }</td>
							</tr>
						</c:forEach>
					</tbody>			
				</table>
				
			
			</div>
		
			
			
			
		</div>
		<br>
	</div>


	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>