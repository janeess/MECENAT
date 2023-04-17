<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	document.oncontextmenu = function(){return false;}
</script>
    <title>결제성공 | 결제성공 페이지 |</title>
    <meta http equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/resources/stylesheets/style2.css" />
<style type="text/css">
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
    .innerOuter {
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        background-color:white;
    }
    #oderRbl{
    	width:100%;
        height:250px;
    }

    
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydown="return false">
<section>
    <div id="reserveOuter" style="width:100%;">
	<div class="content">
		<br><br>
		<div class="innerOuter" align="center">
			<br>
			<p id="title" style="font-size:30px">MY 결제내역</p>
		</div>
		<div class="innerOuter" align="center">
		<table  class="table table-hover" id="oderRbl" border="1">			
			<tbody align="center">
				<tr>
					<th style="width:35%;"><b>예매번호</b></th>
					<td>${orderId}</td>
				</tr>
				<tr>
					<th><b>주문자 아이디</b></th>
					<td>${loginUser.userId}</td>
				</tr>
				<tr>
					<th><b>예매정보</b></th>
					<td>${orderName}</td>
				</tr>
				<tr>
					<th><b>결제일시</b></th>
					<td>${approvedAt}</td>
				</tr>
				<tr>
					<th><b>총 주문금액</b></th>	
					<td>${amount}&nbsp;원</td>
				</tr>
				<tr>
					<td colspan="2">
						<small>* 자세한 내용은 마이페이지에서 확인해주세요.</small>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="innerOuterr" align="center">
			<img alt="" src="resources/img/member/bottom.jpg" style="width:100%; height:auto; padding:0px;">			
		</div>
	</div>
</div>
	<p class="count-down"></p>
</section>
</body>
<script>
// 	document.addEventListener("DOMContentLoaded", function(){
// 		setTimeout(function (){
// 			close();
// 		}, 5000);
//  },{once : true});
</script>

<script type="text/javascript">
    var count = 5;
    var countdown = setInterval(function(){
    	$("p.count-down").html("<b><font color='blue' size='40pt'>" + count + "</font><b>초 뒤 창이 닫힙니다.");
        if (count == 0) {
            clearInterval(countdown);
            close();
        }
        count--;
    }, 1000);
</script>

</html>








