<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	document.oncontextmenu = function(){return false;}
</script>
    <title>결제실패 | 결제실패 페이지 |</title>
    <meta http equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/resources/stylesheets/style2.css" />
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydown="return false">
<section>
	<div>
		<dl>
			<dt>결제 실패</dt>
			<dt>에러 메세지: ${message}</dt>
			<dd>에러 코드: ${code}</dd>
		</dl>
	</div>
	<p class="count-down"></p>
</section>
</body>

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











