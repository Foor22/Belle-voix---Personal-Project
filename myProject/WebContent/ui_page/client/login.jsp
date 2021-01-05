<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<%
//캐시 삭제(로그인 한뒤 뒤로가기 후 재로그인 방지 목적)
response.setHeader("pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","No-store");
response.setDateHeader("Expires",1L);
%>
<link rel="stylesheet" href="${path}/include/client.css" />
<script src="../../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//로그인 후 뒤로가기 방지
window.history.forward();
/* function noBack(){
	window.history.forward();
} */
$(function() {
	$("#btnLogin").click(function() {
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		//아이디가 입력되지 않았을 때
		if(userid=="") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;//함수 종료
		}
		//비밀번호가 입력되지 않았을 때
		else if(passwd=="") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		//폼 데이터를 서버로 제출
		document.form_l.action="${path}/client_servlet/login.do";
		document.form_l.submit();
	});
	$("#btnFind").click(function() {
		window.location.href="${path}/ui_page/client/find.jsp";
	});
});
</script>
<c:if test="${param.message == 'error'}">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");	
	</script>
</c:if>
<c:if test="${param.message == 'miss'}">
	<script>
		alert("입력하신 정보에 해당하는 계정을 찾을 수 없습니다.");	
	</script>
</c:if>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 컨텐츠 랩 로그인 폼 파트 */
#login_form {
	width: 550px;
	margin: 0 auto;
	padding: 0;
}
#login_form h1 {
	text-align: center;
}

/* 로그인 input 파트 */
#wrap_login_input {
	border: 1px solid black;
	width: 390px;
	margin: 25px auto;
}
.login_text {
	width: 366px;
	height: 45px;
	font-size: 15px;
	padding: 0 10px;
	vertical-align: middle;
}
/* 로그인 버튼 파트 */
#wrap_login_btn, #wrap_find_btn {
	width: 390px;
	height: 60px;
	margin: 10px auto;
	padding: 15px;
}
#btnLogin, #btnFind {
	width: 100%;
	height: 100%;
	text-align: center;
	background: #996633;
	color: white;
	font-size: 18px;
	border-style: outset;
	border-color: lightgray;
}
#btnLogin:hover, #btnLogin:active, #btnFind:hover, #btnFind:active {
	background: #b37700;
	color: #e6e6e6;
	border-style: inset;
	cursor: pointer;
}
</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
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
		
			<!-- 1. 세션이 끊겨있을때(로그인 전) -->
			<c:if test="${sessionScope.userid == null}">
				<div id="login_form">
					<form name="form_l" method="post">
						<div id="wrap_login_input">
							<input class="login_text" type="text" name="userid" id="userid" placeholder="아이디">
							<input class="login_text" type="password" name="passwd" id="passwd" placeholder="비밀번호">
						</div>
						<div id="wrap_login_btn">
							<button type="button" id="btnLogin">
								<span>로그인</span>
							</button>
						</div>
						<div id="wrap_find_btn">
							<button type="button" id="btnFind">
								<span>계정찾기</span>
							</button>
						</div>
					</form>
				</div>
			</c:if>
		
		<!-- 2. 세션이 유지되어 있을때(로그인 후) -->
			<c:if test="${sessionScope.userid != null}">
				<div id="login_form">
					<h1>현재 로그인 한 상태입니다.</h1>
				</div>
			</c:if>
			
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