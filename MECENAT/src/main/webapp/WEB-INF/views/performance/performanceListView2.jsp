<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Core -->
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!-- XML -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- I18N -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- Database -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Functions -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MECENAT(목록) | 공연·전시·강좌 |</title>

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
   <style>
 
   </style>
</head>
<body class="vsc-initialized">
<section id="wrap">

      <jsp:include page="../common/header.jsp" />

 
 
 	<!-- sssssssssssssssssssssssssssssssssssssss -->

<div id="depth_w">
		<div class="inner">
			<ul class="clearfix dot dep1">
				<li class="home">
					<span><span>HOME</span></span>
				</li>
				<li>
					<div class="rel">
					<a href="#"><span>공연·전시·강좌</span></a>
					<ul class="depth">
						
						<li><a href="/portal/subMain/perform.do?menuNo=200001" >공연·전시·강좌</a>
						
						<li><a href="/portal/bbs/B0000002/list.do?menuNo=200012" >대관안내</a>
						
						<li><a href="/portal/qestnar/qustnr/list.do?status=T&amp;menuNo=200027" >참여공간</a>
						
						<li><a href="/portal/bbs/B0000001/list.do?menuNo=200042" >뉴스·소식</a>
						
						<li><a href="/portal/main/contents.do?menuNo=200082" >고객센터</a>
						
						<li><a href="https://www.sjartgroups.or.kr/sjartgroups/main/main.do" target="_blank" title="새창 열림">서울시예술단</a>
						
					</ul>
					</div>
				</li>
				
				<li>
					<div class="rel">
					<a href="#"><span>공연일정</span></a>
					<ul class="depth">
					<li><a href="/portal/bbs/B0000033/list.do?menuNo=200003" ><span>세종시즌</span></a></li>
					<li><a href="http://www.sejongpac.or.kr/portal/performance/scheduleMng/performanceSchedule.do?menuNo=200272" ><span>전체일정</span></a></li>
					<li><a href="/portal/performance/performance/performList.do?menuNo=200004" ><span>공연일정</span></a></li>
					<li><a href="/portal/performance/exhibit/performList.do?menuNo=200005" ><span>전시일정</span></a></li>
					<li><a href="http://academy.sejongpac.or.kr/academy/singl/academyProgram/list.do?menuNo=800003" target="_blank" title="새창 열림"><span>강좌일정</span></a></li>
					<li><a href="/portal/main/contents.do?menuNo=200094" ><span>좌석배치도</span></a></li>
					</ul>
					</div>
				</li>
				

			</ul>
		</div>
	</div>
	<script>
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
		







<!-- <script defer> -->
<script>

function press(event) {
	if (event.keyCode==13) {
		fn_search(1);
	}
}
function donationApply(){
	$.ajax({
		type: 'post',
		url: "donationApply.json",
		dataType: "json",
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				if(data.errortype == "M") {
					;
				}
				alert(data.errormsg);
				return false;
			} else if(data.erroryn == 'N') {
				location.href="/portal/myPage/donationApply/list.do?menuNo=200251";			
			}
			
        }
   });
}
function moveToLogin() {
	location.href="/portal/member/user/forLogin.do?menuNo=200100&returnUrl="+encodeURIComponent(window.location.href);
}


// datepicker range
$(function(){
	$('.datepickerRange').daterangepicker({
		locale : {
			format : 'YYYY-MM-DD',
			daysOfWeek : ["일","월","화","수","목","금","토"],
            monthNames : [".01",".02",".03",".04",".05",".06",".07",".08",".09",".10",".11",".12"],
		},
		autoApply : true
	},
	function(start, end, label) {
		$('[name="schRange"]').prop('checked', false);
		$("#period1").val(start.format('YYYY-MM-DD'));
		$("#period2").val(end.format('YYYY-MM-DD'));
		
		fn_search('1');
  	}
	);
});
</script>


<article class="bbs-today_w">
		
	<div class="inner">
		<form name="frm" id="frm" method="get" action="/portal/performance/performance/list.do">
			<input type="hidden" name="pageIndex" value="">
			<input type="hidden" name="menuNo" value="200004">
			<input type="hidden" name="searchPackage" value="">
			<input type="hidden" name="searchSort" id="searchSort" value="1">
			<input type="hidden" name="nowCheck" value="2023-01-06">
			
			<div class="schedule__date">
				<div class="item">
					<input type="radio" name="schRange" id="range1" value="1" checked/>
					<label for="range1">오늘</label>
					<input type="radio" name="schRange" id="range2" value="2" />
					<label for="range2">1주</label>
					<input type="radio" name="schRange" id="range3" value="3"/>
					<label for="range3">1개월</label>
					<input type="radio" name="schRange" id="range4" value="4" />
					<label for="range4">3개월</label>
					<input type="radio" name="schRange" id="range5" value="5" />
					<label for="range5">전체</label>
				</div>
<!-- 				<a href="javascript:void(0);" class="arrow prev">이전</a> -->
				
				<p class="txt" id="yearData">공연일정</p>
<!-- 				<a href="javascript:void(0);" class="arrow next">다음</a> -->
			</div>
			<div class="schedule_check">
				<p class="title">장르</p>
				<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd0" value="전체" class="check-searchPlaceCd-all" />
				<label for="searchPlaceCd0">전체</label>
				
		   			<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd_1" value="멜로"  class="check-searchPlaceCd"/>
                  <label for="searchPlaceCd_1">멜로</label>
				
		   			<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd_2" value="스릴러"  class="check-searchPlaceCd"/>
                  <label for="searchPlaceCd_2">스릴러</label>
				
		   			<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd_3" value="공포"  class="check-searchPlaceCd"/>
                  <label for="searchPlaceCd_3">공포</label>
				
		   			<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd_4" value="미스터리"  class="check-searchPlaceCd"/>
                  <label for="searchPlaceCd_4">미스터리</label>
				
		   			<input type="checkbox" name="searchPlaceCdData" id="searchPlaceCd_5" value="로맨스"  class="check-searchPlaceCd"/>
                  <label for="searchPlaceCd_5">로맨스</label>                  
			
				
			</div>
		</form>
		
		<div id="performList">
			<ul class="bbs-today_thumb clearfix">
					<!-- ajax 공연 리스트 뿌려지는 곳 -->
					
       		</ul>
		</div>
</article>
<script src="/static/ticket/js/ticket.js?dt=20200210"></script>
<script>

function fn_SearchSort(searchSort){
	$("#searchSort").val(searchSort);
	fn_search('1');
}

/*
function fn_search(pageNo) {
	console.log(pageNo);
	
	document.frm.pageIndex.value = pageNo;
	var data = $("#frm").serialize();
	var url = "/portal/performance/performance/performListData.do?viewType=CONTBODY";
	//var url = "/portal/performance/performance/performListDataHtml.do?viewType=CONTBODY"; //웃는남자용 html 페이지
	
	$.post(url,data,function(data) {
		$("#performList").html(data);

	},"html");
}
*/



function fn_search(pageNo) {	
	
	if (pageNo != null || pageNo != undefined ) {	
		document.frm.pageIndex.value = pageNo;	
	}	
		
	//ajax 뒤로가기를 위해 값을 임시 저장(sessionStorage) - 상세 를 클릭 한 후 뒤로가기로 돌아왔을때 목록유지	
	//console.log("menuNo : " + $("#frm input[name=menuNo]").val());	
	sessionStorage.clear()	
	sessionStorage.setItem('pageIndex', $("#frm input[name=pageIndex]").val());	
	sessionStorage.setItem('menuNo', $("#frm input[name=menuNo]").val());	
	sessionStorage.setItem('searchPackage', $("#frm input[name=searchPackage]").val());	
	sessionStorage.setItem('searchSort', $("#frm input[name=searchSort]").val());	
	sessionStorage.setItem('nowCheck', $("#frm input[name=nowCheck]").val());	
	sessionStorage.setItem('sdate', $("#frm input[name=sdate]").val());	
	sessionStorage.setItem('edate', $("#frm input[name=edate]").val());	
		
	var data = $("#frm").serialize();	
	//var withoutEmpties = data.replace(/[^&]+=\.?(?:&|$)/g, '');	
	var url = "/portal/performance/performance/performListData.do?viewType=CONTBODY";	
	//var url = "/portal/performance/performance/performListDataHtml.do?viewType=CONTBODY"; //웃는남자용 html 페이지	
	$.ajax({	
		type: 'post',	
		url: url,	
		data: data ,	
		dataType: "html",	
		cache: false,	
		success: function(data) {	
			$("#performList").html(data);	
			$(".category .active a").attr("title","선택됨");
        }	
   });	
}

$(function() {
	selectTday();
})

function selectTday() {
	var td = new Date();
	var year = td.getFullYear();
    var month = ('0'+(td.getMonth() + 1)).slice(-2);
    var day = ('0'+td.getDate()).slice(-2);
    var sdate = year + '-' + month + '-' + day;
    
    var today = new Date(sdate);
    today = dateFormat(today);
    
    $.ajax({
		url: 'dayList.perf',
		data: {
			"sdate": today
		},
		success: function(list){
			$(".bbs-today_thumb").html(list);
		},
		error: function() {
		
		}
	})
}

$(function() {
	window.onpageshow = function (event) {	
		
		var navi_type = window.performance.navigation.type; // 그냥 호출 : 0, 새로고침: 1, 뒤로가기:2	
		//alert("navi_type : "+ navi_type);	
		if (navi_type == 0 ) {	
			fn_search('1');	
		} else {	
				
			$("#frm input[name=pageIndex]").val(sessionStorage.getItem('pageIndex'));	
			$("#frm input[name=menuNo]").val(sessionStorage.getItem('menuNo'));	
			$("#frm input[name=searchPackage]").val(sessionStorage.getItem('searchPackage'));	
			$("#frm input[name=searchSort]").val(sessionStorage.getItem('searchSort'));	
			$("#frm input[name=nowCheck]").val(sessionStorage.getItem('nowCheck'));	
			$("#frm input[name=sdate]").val(sessionStorage.getItem('sdate'));	
			$("#frm input[name=edate]").val(sessionStorage.getItem('edate'));	
				
			fn_search();	
		}	
	}	
		
	//fn_search('1');
	var txt1=[];
	var txt2=[];
	var txt5=[];
	
	$("#searchGenreCdData").change(function() {
	    fn_search('1');
	});
	
	$("#searchMtCateCdData").change(function() {
	    fn_search('1');
	});


	$( ".datepick input" ).datepicker({
		dateFormat			: 'yy-mm-dd',
	      prevText: '이전 달',
	      nextText: '다음 달',
	      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	      showMonthAfterYear: true,
	      yearSuffix: '년'
	});
	
	
	// 장르검색
	$(document).ready(function() {
		
		$('[name="searchPlaceCdData"]').on('click', function(){
			
			$('input[type=radio][name="schRange"]').prop('checked', false);

			if($(this).prop('checked')) {
				$('input[type=checkbox][name="searchPlaceCdData"]').prop('checked', false);
// 				$(this).prop('checked', true);
				var genre = $(this).prop('checked', true).val();
// 				console.log($(this).prop('checked', true).val());
				
				if(genre == '멜로') {
					$.ajax({
						url: 'genreList.perf',
						data: {
							"genre": genre
						},
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				} else if(genre == '스릴러') {
					$.ajax({
						url: 'genreList.perf',
						data: {
							"genre": genre
						},
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				} else if(genre == '로맨스') {
					$.ajax({
						url: 'genreList.perf',
						data: {
							"genre": genre
						},
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				} else if(genre == '공포') {
					$.ajax({
						url: 'genreList.perf',
						data: {
							"genre": genre
						},
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				} else if(genre == '미스터리') {
					$.ajax({
						url: 'genreList.perf',
						data: {
							"genre": genre
						},
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				} else if(genre == '전체') {
					$.ajax({
						url: 'genreAllList.perf',
						success: function(list){
							$(".bbs-today_thumb").html(list);
						},
						error: function() {
						
						}
					})
				}
			}
		});	
	});
	
	
	// 날짜검색 
	$('[name="schRange"]').on('click', function(){
		
		$('input[type=checkbox][name="searchPlaceCdData"]').prop('checked', false);

		var td = new Date();
		var year = td.getFullYear();
	    var month = ('0'+(td.getMonth() + 1)).slice(-2);
	    var day = ('0'+td.getDate()).slice(-2);
	    var sdate = year + '-' + month + '-' + day;
	    var schRange = $(this).val();
	    
	    var today = new Date(sdate);
	    today = dateFormat(today);
	    		
        var sday = new Date(sdate);
        sday.setDate(sday.getDate()+7)
        sday = dateFormat(sday);
        
        var mday = new Date(sdate);
        mday.setMonth(mday.getMonth()+1)
        mday = dateFormat(mday);
	    
        var tmday = new Date(sdate);
        tmday.setMonth(tmday.getMonth() + 3)
        tmday = dateFormat(tmday);
        
        var yday = new Date(sdate);
        yday.setFullYear(yday.getFullYear()+1)
        yday = dateFormat(yday);
	    
		if(schRange == 1){ // 오늘
// 			console.log(today);
			$.ajax({
				url: 'dayList.perf',
				data: {
					"sdate": today
				},
				success: function(list){
					$(".bbs-today_thumb").html(list);
				},
				error: function() {
				
				}
			})
		}else if(schRange == 2){ // 7일
			console.log(sday);
			$.ajax({
				url: 'dayList.perf',
				data: {
					"sdate": sday
				},
				success: function(list){
					$(".bbs-today_thumb").html(list);
				},
				error: function() {
				
				}
			})
		}else if(schRange == 3){ // 1개월
			console.log(mday);
			$.ajax({
				url: 'dayList.perf',
				data: {
					"sdate": mday
				},
				success: function(list){
					$(".bbs-today_thumb").html(list);
				},
				error: function() {
				
				}
			})
		}else if(schRange == 4){ // 3개월
			console.log(tmday);
			$.ajax({
				url: 'dayList.perf',
				data: {
					"sdate": tmday
				},
				success: function(list){
					$(".bbs-today_thumb").html(list);
				},
				error: function() {
				
				}
			})
		}else if(schRange == 5){ // 전체
			console.log(yday);
			$.ajax({
				url: 'dayList.perf',
				data: {
					"sdate": yday
				},
				success: function(list){
					$(".bbs-today_thumb").html(list);
				},
				error: function() {
				
				}
			})
		}
		$("#period1").val(sdate);
		$("#period2").val(dateFormat(date));
		$(".datepickerRange").val(sdate + " - " + dateFormat(date));
		
		fn_search(1);
	});
	
	$('.prev').on('click', function(){
		var yearData = parseInt($("#yearData").text());
		var sdate = new Date($("#period1").val());
		var edate = new Date($("#period2").val());
		sdate.setFullYear(yearData - 1,0,1);
		edate.setFullYear(yearData - 1,11,31);
		
		sdate = dateFormat(sdate);
		edate = dateFormat(edate);
		
		$("#yearData").html(yearData - 1);
		$("#period1").val(sdate);
		$("#period2").val(edate);
		$(".datepickerRange").val(sdate + " - " + edate);
		$('#range5').prop('checked', true);
		fn_search(1);
	});
	
	$('.next').on('click', function(){
		var yearData = parseInt($("#yearData").text());
		var sdate = new Date($("#period1").val());
		var edate = new Date($("#period2").val());
		sdate.setFullYear(yearData + 1,0,1);
		edate.setFullYear(yearData + 1,11,31);
		
		sdate = dateFormat(sdate);
		edate = dateFormat(edate);

		$("#yearData").html(yearData + 1);
		$("#period1").val(sdate);
		$("#period2").val(edate);
		$(".datepickerRange").val(sdate + " - " + edate);
		$('#range5').prop('checked', true);
		fn_search(1);
	});

});


function dateFormat(date) {
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}

var inputfileds = $(".schedule_w .s2 input[type='text'],.schedule_w .s3 input[type='text'],.schedule_w .s_add input[type='text']")
inputfileds.focus(function(){
	inputfileds.not($(this)).closest(".item").find(".pop").hide()
	$(this).closest(".item").find(".pop").fadeIn(150);
})
$(".pop button").click(function(){
	$(".pop").fadeOut(150)
})
$(".s2 .pop button").click(function(){
	$(this).closest("li").next().focus()
})
$(".s3 .pop button").click(function(){
	$(".s4").focus()
})

// 검색키워드 전체 컨트롤
$('.ck-st1').each(function(index, el) {
	$(this).find(':checkbox').click(function(event) {
		var parentItem = $(this).closest('.ck')
		totalcheckbox = parentItem.find('[value=ALL]')
		if ($(this).prop('checked')) {

			if (parentItem.find(':checkbox').not(totalcheckbox).not(':checked').length==0) {
				totalcheckbox.prop('checked', true)
			}
		}else{
			totalcheckbox.prop('checked', false)
		}
	});
});



</script>
		</div>
	</div>

</div><!-- #cont -->
 	
 	
 	<!-- sssssssssssssssssssssssssssssssssssssss -->
 
 
 
 
 
 
 
 
 
 
 
 
   
   
   
      
      <!-- footer Section Begin -->
      <jsp:include page="../common/footer.jsp" />
      <!-- footer End -->
      <script src="./resources/sejongpac/static/portal/js/common.js"></script>
   </section>
</body>
</html>