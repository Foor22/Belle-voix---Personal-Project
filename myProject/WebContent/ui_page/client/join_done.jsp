<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/client.css" />
<script src="../../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnIndex").click(function() {
		location.href="../index.jsp";
	});
});
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 회원가입 환영 파트 */
#done_form {
	width: 700px;
	margin: 0 auto;
	padding: 0;
}

/* 로그인 input 파트 */
#wrap_join_done {
	text-align: center;
	width: 700px;
	margin: 45px auto 20px;
	font-size: 20px;
}

/* 홈페이지 바로가기 버튼파트 */
#wrap_index_btn {
	width: 390px;
	height: 60px;
	margin: 20px auto;
	padding: 15px;
}
#btnIndex {
	width: 100%;
	height: 100%;
	text-align: center;
	background: #996633;
	color: white;
	font-size: 18px;
	border-style: outset;
	border-color: lightgray;
}
#btnIndex:hover, #btnIndex:active {
	background: #b37700;
	color: #e6e6e6;
	border-style: inset;
	cursor: pointer;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="head_wrap">
		<header>
			<script>
				function setClock() {
					var now = new Date();
					var s = now.getFullYear() + "." + (now.getMonth()+1) + "." + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
					document.getElementById("clock").innerHTML = s;
				}
				setInterval("setClock()", 1000);
			</script>
			<span id="clock"></span>
			<div id="head_front">
				<h1><a href="../index.jsp">Belle voix</a></h1>
			</div>
		</header>
	</div>
	<div id="cont_wrap">
		<section>
			<div id="done_form">
				<div id="wrap_join_done">
					<h1>Belle voix의 회원이 되신 것을 환영합니다</h1>
				</div>
				<div id="wrap_index_btn">
					<button type="button" id="btnIndex">
						<span>메인 페이지로 가기</span>
					</button>
				</div>
			</div>
		</section>
	</div>
	<div id="foot_wrap">
		<footer>
			<p>Copyright &copy; Yong Min</p>
		</footer>
	</div>
</div>
</body>
</html>