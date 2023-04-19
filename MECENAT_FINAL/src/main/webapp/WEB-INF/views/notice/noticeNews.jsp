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
<!-- 인터넷 -->
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/aos.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/bbs_new.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/fonts.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/layout_new.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/main_new.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/pop_all.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/responsive_new.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/sitemap.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/slider.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/style.css">
	<link rel="stylesheet" type="text/css" href="./resources/sejongpac/static/portal/css/sub.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="./resources/sejongpac/static/commons/js/jquery-3.6.0.min.js"></script>
	<script src="./resources/sejongpac/static/commons/js/jquery-ui.1.12.1.min.js"></script>
	<script src="./resources/sejongpac/static/portal/js/slider.js"></script>
	<script src="./resources/sejongpac/static/ticket/ticket.js"></script>
	<link rel="stylesheet" href="./resources/sejongpac/static/portal/css/aos.css">
	<script src="./resources/sejongpac/static/portal/inc/netfunnel.js" charset="UTF-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.bbs-list > tbody >tr{
 font-weight: 300;
 font-size: 1.13em;
 cursor: pointer;
}
</style>

</head>
<body>
<section id="wrap">
<dl class="accessibilityWrap">
	<dt class="hide"><strong>바로가기 메뉴</strong></dt>
	<dd><a href="#cont">본문 바로가기</a></dd>
	<dd><a href="#top_nav">주메뉴 바로가기</a></dd>
</dl>


<script src="/static/portal/js/ksearch/top_apc.js"></script>
<script src="/static/portal/js/jquery.rwdImageMaps.js"></script>


<div id="seoul-common-gnb"></div>

		<!-- Header Section Begin -->
		<jsp:include page="../common/header.jsp" />
		<!-- Header End -->


<div id="depth_w" class="">
		<div class="inner">
			<ul class="clearfix dot dep1 li3">
				<li class="home">
					<span><span>HOME</span></span>
				</li>
				<li>
					<div class="rel">
					<a href="#"><span>뉴스·소식</span></a>
					<ul class="depth">
						
						<li><a href="/portal/subMain/perform.do?menuNo=200001">공연·전시·강좌</a>
						
						</li><li><a href="/portal/bbs/B0000002/list.do?menuNo=200012">대관안내</a>
						
						</li><li><a href="/portal/qestnar/qustnr/list.do?status=T&amp;menuNo=200027">참여공간</a>
						
						</li><li><a href="/portal/bbs/B0000001/list.do?menuNo=200042">뉴스·소식</a>
						
						</li><li><a href="/portal/main/contents.do?menuNo=200082">고객센터</a>
						
						</li><li><a href="https://www.sjartgroups.or.kr/sjartgroups/main/main.do" target="_blank" title="새창 열림">서울시예술단</a>
						
					</li></ul>
					</div>
				</li>
				
				<li>
					<div class="rel">
					<a href="#"><span>새소식</span></a>
					<ul class="depth" style="display: none;">
					<li><a href="/portal/bbs/B0000001/list.do?menuNo=200042"><span>새소식</span></a></li><li><a href="/portal/bbs/B0000017/list.do?menuNo=200040"><span>뉴스레터</span></a></li><li><a href="/portal/bbs/B0000040/list.do?menuNo=200199"><span>세종문화N</span></a></li>
					</ul>
					</div>
				</li>
				
				<li>
					<div class="rel">
					<a href="#"><span>세종소식</span></a>
					<ul class="depth" style="display: none;">
					
						<li><a href="/portal/bbs/B0000001/list.do?menuNo=200042"><span>세종소식</span></a></li>
						</ul>
					</div>
				</li>
				

			</ul>
		</div>
	</div>
	<script>
	
	$(document).ready(function() {
		var msg = "${alertMsg}";
		if(msg != ""){
		alert(msg);    
		}
		});
	
	$(window).resize(function(){
		if ( $(window).width() > 1024 ){
			$("#depth_w .rel").hover(function(){
				$(this).closest("#depth_w").addClass("on")
				$(this).find(".depth").show();
			},function(){
				$(this).closest("#depth_w").removeClass("on")
				$(this).find(".depth").hide();
			})
			$("#depth_w .rel > a").focus(function(){
				$(this).closest("#depth_w").addClass("on")
				$(this).next(".depth").show();
			})
			$("#depth_w .depth > li:last-child a").focusout(function(){
				$(this).closest("#depth_w").removeClass("on")
				$("#depth_w .depth").stop(true,true).slideUp(150);
			})
		}else {
			$("#depth_w .rel").click(function(){
				$(this).closest("#depth_w").toggleClass("on")
				$(this).find(".depth").toggle();
			})
		}
	}).resize();
	
	//String boardCode = requset.getAttribute("list.boardCode");
	
	</script>

	<div id="cont">
		<c:if test="${not empty loginUser and loginUser.userId eq 'admin'}">
		<a id="newsbt" style="float:right;" class="btn btn-secondary" href="noticeNews.no">뉴스레터 작성</a>
		</c:if>
			
	<div id="sub_page">
		<div class="inner">
		</div>

		<script>
		var loc = $("#depth_w > div > ul > li").length - 1;
		$("#depth_w .dep1").addClass("li"+loc);

		var len = $(".tabs-st1 li").length;
		$(".tabs-st1").addClass("li"+len);
		</script>

		<div class="sub_page">
		



<article class="bbs_w inner">
	<div class="bbs-category clearfix">
		<!-- <div class="txt">유료회원 (골드회원 ,프리미엄회원)이 되시면 뉴스레터 발송서비스를 이용하실 수 있습니다.</div> -->

		<div class="select_w">
			<form name="frm" id="frm" method="post" action="/portal/bbs/B0000017/list.do?menuNo=200040">
				<input type="hidden" name="bbsId">
				<input type="hidden" name="pageIndex" value="1">
				<label for="searchYear" class="hide">년도 선택</label>
				<select name="searchYear" id="searchYear" class="fr">
				 	
						<option value="2023">2023</option>
				 	
						<option value="2022">2022</option>
				 	
						<option value="2021">2021</option>
				 	
						<option value="2020">2020</option>
				 	
						<option value="2019">2019</option>
				 	
				</select>
				<button type="submit" class="btn-black btn">이동</button>
			 </form>
		 </div>
	</div>

	<ul class="bbs-newsletter clearfix">
		
		<li>
			<a href="/portal/bbs/B0000017/view.do?menuNo=200040&amp;nttId=45940">
			<div class="img">
			<input type="hidden" value="${n.noticeNo}">
				<img src="${pageContext.request.contextPath}${b.titleImg}" alt="">
			</div>
			<div class="cont">
				<strong class="t">2022년 12월 정기뉴스레터</strong>
				<span class="date">2022-11-29</span>
			</div>
			</a>
		</li>
		
	</ul>
	
		<div class="paginationSet"><ul class="pagination pagination-centered"><li class="i first disabled"><a title="처음 목록" href="/portal/bbs/B0000017/list.do?menuNo=200040&amp;pageIndex=1" onclick="return false;"><span class="s"><span>처음 <span class="t">목록</span></span></span></a></li><li class="i prev disabled"><a title="이전 목록" href="/portal/bbs/B0000017/list.do?menuNo=200040&amp;pageIndex=0" onclick="return false;"><span class="s"><span>이전 <span class="t">목록</span></span></span></a></li><li class="active"><span><em title="현재목록"><span>1</span></em></span></li><li class="i next disabled"><a title="다음 목록" href="/portal/bbs/B0000017/list.do?menuNo=200040&amp;pageIndex=11" onclick="return false;"><span class="s"><span>다음 <span class="t">목록</span></span></span></a></li><li class="i end disabled"><a title="마지막 목록" href="/portal/bbs/B0000017/list.do?menuNo=200040&amp;pageIndex=1" onclick="return false;" data-endpage="1"><span class="s"><span>끝 <span class="t">목록</span></span></span></a></li></ul></div>
	
</article>


		</div>
	</div>

</div>



	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->
	

</section>


</body>
</html>