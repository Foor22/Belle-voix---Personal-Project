<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/client.css" />
<script src="${path}/include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	//회원정보 수정
	$("#btnUpdate").click(function() {
		//정규표현식(패스워드,이름,휴대전화,이메일) 주소는 프리패스...
		var regpw = /^[a-zA-Z0-9]{4,10}$/;//패스워드(알파벳 대소문자로 시작해서 끝냄, 숫자 4~10 자리수)
		var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z]{2,4}$/;//이름(한글, 알파벳으로 시작해서 끝냄, 숫자 2~4 자리수)
		var reghp = /^\d{3}-\d{3,4}-\d{4}$/;//휴대전화(숫자에 대응 [0-9]와 동일. 3자리 3~4자리 4자리로 반복)
		var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		//값의 입력을 확인하기 위한 변수 선언
		var passwd=$("#passwd").val();
		var passwd_1=$("#passwd_1").val();
		var passwd_2=$("#passwd_2").val();
		var name=$("#name").val();
		var hp=$("#hp").val();
		var email=$("#email").val();
		var address=$("#address").val();
		
		//값이 다 입력되었는지 확인
		if(passwd=="") {
			alert("현재 비밀번호를 입력하세요.");
			$("#userid").focus();
			return;
		}
		//현재 비밀번호가 일치하는지 확인
		else if(passwd !== "${dto.passwd}") {
			alert("현재 비밀번호가 일치하지 않습니다.");
			$("#passwd").focus();
			return;
		}
		//새 비밀번호 입력
		else if(passwd_1=="") {
			alert("사용하실 비밀번호를 입력하세요.");
			$("#passwd_1").focus();
			return;
		}
		//비밀번호 정규식 확인 (정규식대로 입력하지 않았을 경우)
		else if(!regpw.test(passwd_1)) {
			alert("비밀번호는 알파벳 대소문자 및 숫자를 포함한 4~10자를 입력해주세요.");
			$("#passwd_1").focus();
			return;
		}
		//비밀번호 재입력
		else if(passwd_2=="") {
			alert("비밀번호 확인을 위해 재입력하세요.");
			$("#passwd_2").focus();
			return;
		}
		//비밀번호 재입력 정규식 확인 (정규식대로 입력하지 않았을 경우)
		else if(!regpw.test(passwd_2)) {
			alert("비밀번호는 알파벳 대소문자 및 숫자를 포함한 4~10자를 입력해주세요.");
			$("#passwd_2").focus();
			return;
		}
		//비밀번호 올바르게 작성했는지 확인
		else if(passwd_1 != passwd_2) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		else if(name=="") {
			alert("이름을 입력하세요.");
			$("#name").focus();
			return;
		}
		//이름 정규식 확인 (정규식대로 입력하지 않았을 경우)
		else if(!regname.test(name)) {
			alert("이름은 한글 또는 영문으로 2~4자를 입력해주세요.");
			$("#name").focus();
			return;
		}
		
		else if(hp=="") {
			alert("휴대전화 번호를 입력하세요.");
			$("#hp").focus();
			return;
		}
		//휴대전화 정규식 확인 (정규식대로 입력하지 않았을 경우)
		else if(!reghp.test(hp)) {
			alert("하이픈을 입력한 [010-0000-0000] 의 형식을 맞춰주세요.");
			$("#hp").focus();
			return;
		}
		
		else if(email=="") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}
		//이메일 정규식 확인 (정규식대로 입력하지 않았을 경우)
		else if(!regemail.test(email)) {
			alert("영문을 사용한 [abc@abcd.com] 의 형식을 맞춰주세요.");
			$("#email").focus();
			return;
		}
		
		//주소는 프리패스...
		else if(address=="") {
			alert("주소를 입력하세요.");
			$("#address").focus();
			return;
		}
		
		//폼 데이터를 서버로 제출
		document.form_v.action="${path}/client_servlet/update.do";
		document.form_v.submit();
	});
	//회원탈퇴
	$("#btnDelete").click(function() {
		//탈퇴할지 확인
		if(confirm("회원탈퇴 하시겠습니까?")){
			//폼 데이터를 제출할 주소
			document.form_v.action="${path}/client_servlet/delete.do";
			//폼 데이터를 서버에 제출
			document.form_v.submit();	
		}
	});
	//메인페이지로 리다이렉트
	$("#index").click(function() {
		window.location.replace("${path}/ui_page/index.jsp");
	});
});
</script>
<c:if test="${param.message == 'found'}">
	<script>
		alert("${dto.name}님 확인되셨습니다");
		alert("개인정보를 수정해주세요");
	</script>
</c:if>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 컨텐츠 랩 개인정보수정 폼 파트 */
#info_form {
	width: 550px;
	margin: 0 auto;
	padding: 0;
}

/* 개인정보수정 input 태그들 */
#wrap_info_input {
	/* border: 1px solid black; */
	width: 390px;
	margin: 25px auto;
}
#wrap_info_input h4 {
	margin: 22px 0px 10px 0px;
	padding-left: 3px;
}
#wrap_info_input h2 {
	margin: 40px 0px 30px 0px;
	text-align: center;
}
#wrap_info_input input {
	margin-bottom: 5px;
}

.info_text {
	width: 366px;
	height: 45px;
	font-size: 15px;
	padding: 0 10px;
	vertical-align: middle;
}
/* 수정, 삭제 버튼 파트 */
#wrap_update_btn, #wrap_delete_btn {
	width: 390px;
	height: 60px;
	margin: 10px auto;
	padding: 15px;
}
#btnUpdate, #btnDelete {
	width: 100%;
	height: 100%;
	text-align: center;
	background: #996633;
	color: white;
	font-size: 18px;
	border-style: outset;
	border-color: lightgray;
}
#btnUpdate:hover, #btnUpdate:active, #btnDelete:hover, #btnDelete:active {
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
				<h1 id="index">Belle voix</h1>
			</div>
		</header>
	</div>
	<div id="cont_wrap">
		<section>
			<div id="info_form">
				<form name="form_v" method="post">
					<div id="wrap_info_input">
						<h2>${dto.userid} 님 개인정보 변경</h2>
						<!-- 아이디는 변경하지 않는다. 하지만 나머지 정보의 변경을 위해 필요하므로 hidden타입으로 값을 넘긴다. -->
						<input class="info_text" type="hidden" name="userid" id="userid" value="${dto.userid}">
						<h4>현재 비밀번호 입력</h4>
						<input class="info_text" type="password" name="passwd" id="passwd" placeholder="비밀번호">
						<h4>새 비밀번호 입력</h4>
						<input class="info_text" type="password" name="passwd_1" id="passwd_1" placeholder="비밀번호">
						<input class="info_text" type="password" name="passwd_2" id="passwd_2" placeholder="비밀번호 재입력">
						<h4>이름 변경</h4>
						<input class="info_text" type="text" name="name" id="name" value="${dto.name}">
						<h4>휴대전화 변경</h4>
						<input class="info_text" type="tel" name="hp" id="hp" pattern="(010)-\d(3,4)-\d(4)" value="${dto.hp}">
						<h4>이메일 변경</h4>
						<input class="info_text" type="email" name="email" id="email" value="${dto.email}">
						<h4>주소 변경</h4>
						<input class="info_text" type="text" name="address" id="address" value="${dto.address}">
					</div>
					<div id="wrap_update_btn">
						<button type="button" id="btnUpdate">
							<span>수정</span>
						</button>
					</div>
					<div id="wrap_delete_btn">
						<button type="button" id="btnDelete">
							<span>회원탈퇴</span>
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