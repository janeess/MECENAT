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
<script src="/static/portal/js/ksearch/top_apc.js"></script>
<script src="/static/portal/js/jquery.rwdImageMaps.js"></script>
<style>
#title{
	width:800px;
}
#content{
	width:1000px;
	height:500px;
}
</style>
</head>
<body>

	<!-- Header Section Begin -->
	<jsp:include page="../common/header.jsp" />
	<!-- Header End -->

	<div id="cont">
		<div id="sub_page">
			<div class="inner">
				
			</div>
			<div class="sub_page">
						
				<article class="bbs-view inner">
					<div class="in">
						<header class="tit long">
							뉴스레터 작성	<br><br>
							<div class="t">
								<form id="insert.ne" method="post" action="newsEnroll.ne" enctype="multipart/form-data">
									<input type="hidden" name="userId" id="userId" value="${loginUser.userId}">
									<div align="center" id="newsEnroll">
										<input type="text" name="noticeTitle" id="title" width="1000"> <br><br>
										<table align="center">
											<tr>
												<th></th>
												<td colspan="3" align="center">
													<img id="titleImg" width="800" height="500">
												</td>
											</tr>
										</table><br><br><br>
										<input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required>
									</div>
									<div class="btn-list_w">
										<button class="btn-list" type="submit"><span>등록</span></button>
										<button class="btn-list" onclick="location.href='noticeNews.no?currentPage=1'"><span>목록</span></button>
									</div>
								</form>
							</div>
						</header>
					</div>
				</article>
			</div>
		</div>
	</div>
<script>
$(function(){
	$("#file-area").hide();
	
	$("#titleImg").click(function(){
		$("#file1").click();
	});
});

		function loadImg(inputFile,num){
				if(inputFile.files.length == 1){
					var reader = new FileReader();

					reader.readAsDataURL(inputFile.files[0]);

					reader.onload = function(e){
						switch(num){
							case 1 : $("#titleImg").attr("src",e.target.result); break; // 대표 이미지
						}
					}
				}else{
					switch(num){
						case 1 : $("#titleImg").attr("src",null); break; // 대표 이미지
				}
			}
		}

</script>	


	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->


</body>
</html>