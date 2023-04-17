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
th:nth-of-type(5) { display: none; }
td:nth-of-type(5) { display: none; }
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

		<ul class="clearfix tabs-st3" id="etc_gubun">
			<li class="" id="active1"><a href=""><span>전체</span></a></li>
			<li class="" id="active2"><a href=""><span>채용공고</span></a></li>
			<li class="" id="active3"><a href=""><span>대관공고</span></a></li>
			<li class="" id="active4"><a href=""><span>안내</span></a></li>
			<li class="" id="active5"><a href=""><span>합격자발표</span></a></li>
			<li class="" id="active6"><a href=""><span>티켓오픈안내</span></a></li>
		</ul>

		<div class="txt">MECENAT의 공지사항 및 최신 소식을 알려드립니다.</div>

		<form name="frm" id="frm" action="search.no" method="get">
			<div class="bbs-sch">
				<label for="searchWord" class="hide">검색어</label>
				<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." value="${n.searchWord}">
				<button type="button" class="findBtn" id="findBtn">검색</button>
			</div>
		</form>
		
		<form name="frm2" id="frm2" action="search.no" method="get">
			<input type="hidden" name="boardCode" value="${boardCode}">
			<input type="hidden" name="boardName" value="${n.boardName}">
			<input type="hidden" name="currentPage" value="${pi.currentPage}">
			<input type="hidden" name="searchWord" value="${n.searchWord}">
		</form>

	</div>
	
	<script>
		var frm = $("#frm");
		
		$("#frm button").on("click",function(e){
			if(!frm.find("input[name='searchWord']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			frm.find("input[name='currentPage'").val("1");
			e.preventDefault();
			
			frm.submit();
		})
	
	</script>

	
	<c:if test="${not empty loginUser and loginUser.userId eq 'admin'}">
	<a class="btn btn-secondary" style="float:right;" href="insert.no">공지사항 작성</a>
	</c:if>
	<table class="bbs-list" id="noticeList">
		<caption>번호, 제목, 작성일, 조회수로 구성된 공지사항 게시판</caption>
		<thead>
			<tr>
				<th scope="col" class="no">번호</th>
				<th scope="col" class="tit">제목</th>
				<th scope="col" class="date">작성일</th>
				<th scope="col" class="hit">조회수</th>
				<th scope="col" class="boardCode">boardCode</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>
						<span>공지</span>
					</td>
					<td class="tit"><a href="/portal/bbs/B0000001/view.do?nttId=45433&amp;menuNo=200042&amp;pageIndex=1">[안내] &nbsp;코로나19 확산방지를 위한 	MECENAT 관람안내</a></td>
					<td>2022.05.04</td>
					<td class="hit">2779</td>
				</tr>
				<c:forEach var="n" items="${nList}">
					<tr onclick="location.href='detail.no?nno=${n.noticeNo}'">
						<td>${n.noticeNo}</td> 
						<td style="text-align:left">[${n.boardName}] ${n.noticeTitle}</td>
						<td>${n.noticeDate}</td>
						<td>${n.noticeCount}</td>
						<td id="bc">${n.boardCode}</td>
                    </tr>
                </c:forEach>
		</tbody>
	</table>
	
	
		<div class="paginationSet">
			<ul class="pagination pagination-centered">
			<c:choose>
				<c:when test="${pi.currentPage ne 1}">
					<li class="i prev">
						<a title="이전 목록" href="search.no?boardCode=${boardCode}&currentPage=${pi.currentPage-1}&searchWord=${searchWord}"> 
							<span>이전 </span> 
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="i prev disabled">
								<a title="이전 목록" href="#">
									<span>이전 </span>
								</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
				<c:choose>
					<c:when test="${pi.currentPage eq p}">
						<li class="active disabled"><a href="#"><span>${p}</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="search.no?boardCode=${boardCode}&currentPage=${p}&searchWord=${searchWord}"><span>${p}</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage }">
					<li class="i next disabled">
						<a title="다음 목록" href="#">
							<span>다음 </span> 
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="i next">
						<a title="다음 목록" href="search.no?boardCode=${boardCode}&currentPage=${pi.currentPage+1}&searchWord=${searchWord}">
							<span>다음 </span>
						</a> 
					</li>
				</c:otherwise>
			</c:choose>

			</ul>
		</div>
	

</article>



<script>

$(document).ready(function(){
	let categoryNo = ${etcGubun};
	if(categoryNo == "0") {
	       $("#active1").addClass("active");
		}else if(categoryNo == "10"){
		    $("#active2").addClass("active");
		}else if(categoryNo == "20"){
		    $("#active3").addClass("active");
		}else if(categoryNo == "30"){
		    $("#active4").addClass("active");
		}else if(categoryNo == "40"){
		    $("#active5").addClass("active");
		}else if(categoryNo == "50"){
		    $("#active6").addClass("active");
		}
	
		$('#etc_gubun').find('li').each(function(){
			$(this).find('a').click(function(){
				var etcGubun = $(this).find('span').html();
				
				if(etcGubun == "전체") {
				   etcGubun = '0';
				}else if(etcGubun == "채용공고"){
					etcGubun = '10';
				}
				else if(etcGubun == "대관공고"){
					etcGubun = '20';
				}else if(etcGubun == "안내"){
					etcGubun = '30';
				}else if(etcGubun == "합격자발표"){
					etcGubun = '40';
				}else if(etcGubun == "티켓오픈안내"){
					etcGubun = '50';
				}
				location.href="list.no?boardCode="+etcGubun;
				return false;
			});
	});
});


</script>


		</div>
	</div>

</div><!-- #cont -->


	<!-- footer Section Begin -->
	<jsp:include page="../common/footer.jsp" />
	<!-- footer End -->
	

</section>


</body>
</html>