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
	$("#btnCheck").click(function() {
		var name=$("#name").val();
		var hp=$("#hp").val();
		var email=$("#email").val();
		
		//입력 확인
		if(name=="") {
			alert("이름 입력하세요.");
			$("#name").focus();
			return;//함수 종료
		}
		else if(hp=="") {
			alert("전화번호를 입력하세요.");
			$("#hp").focus();
			return;
		}
		else if(email=="") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}
		
		document.form_c.action="${path}/client_servlet/checkInfo.do";	//정보가 일치하면 정보수정 페이지 출력
		document.form_c.submit();
	});
});
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 컨텐츠 랩 개인정보확인 폼 파트 */
#check_form {
	width: 550px;
	margin: 0 auto;
	padding: 0;
}
#check_form h1 {
	text-align: center;
}

/* 개인정보확인 파트 */
#wrap_check_input {
	border: 1px solid black;
	width: 390px;
	margin: 25px auto;
}
.check_text {
	width: 366px;
	height: 45px;
	font-size: 15px;
	padding: 0 10px;
	vertical-align: middle;
}
/* 개인정보확인버튼 파트 */
#wrap_check_btn {
	width: 390px;
	height: 60px;
	margin: 10px auto;
	padding: 15px;
}
#btnCheck {
	width: 100%;
	height: 100%;
	text-align: center;
	background: #996633;
	color: white;
	font-size: 18px;
	border-style: outset;
	border-color: lightgray;
}
#btnCheck:hover, #btnCheck:active {
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
			<div id="check_form">
				<h1>이름과 휴대전화<br>이메일을 입력해주세요</h1>
				<form name="form_c" method="post">
					<div id="wrap_check_input">
						<input class="check_text" type="text" name="name" id="name" placeholder="이름">
						<input class="check_text" type="tel" name="hp" id="hp" placeholder="전화번호 입력">
						<input class="check_text" type="email" name="email" id="email" placeholder="이메일 입력">
					</div>
					<div id="wrap_check_btn">
						<button type="button" id="btnCheck">
							<span>확인</span>
						</button>
					</div>
				</form>
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