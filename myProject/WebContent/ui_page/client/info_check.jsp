<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 객체를 사용하기 위함 -->
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/session_check.jsp" %>
<link rel="stylesheet" href="${path}/include/client.css" />
<script src="../../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnCheck").click(function() {
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var checkid=null;
		var checkpasswd=null;
		
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
		
		//세션 객체에 있는 아이디, 비밀번호와 입력받은 아이디 비밀번호 비교
		checkid = ("${sessionScope.userid}" === userid) ? true : false;
		checkpasswd = ("${sessionScope.passwd}" === passwd) ? true : false;
		<%-- var checkid = (<%=(String)session.getAttribute("userid")%> == userid) ? true : false; --%>
		<%-- var checkpasswd = (<%=(String)session.getAttribute("passwd")%> == passwd) ? true : false; --%>
		/* jsp의 실행 순서 : Java => JSTL => HTML => Javascript */
		
		//아이디 비밀번호 모두 참이면 개인정보 수정 페이지 출력
		if(checkid && checkpasswd) {
			document.form_c.action="${path}/client_servlet/viewInfo.do";	//개인정보 출력
			document.form_c.submit();
		} else {
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			$("#userid").focus();
			return;
		}
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
				<h1>개인정보 확인을 위해<br>아이디와 비밀번호를 입력해주세요</h1>
				<form name="form_c" method="post">
					<div id="wrap_check_input">
						<input class="check_text" type="text" name="userid" id="userid" placeholder="아이디">
						<input class="check_text" type="password" name="passwd" id="passwd" placeholder="비밀번호">
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