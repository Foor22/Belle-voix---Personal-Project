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
<link rel="stylesheet" href="${path}/include/common.css" />
<script src="../../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//로그인
function seviceLogin() {
	location.href="${path}/ui_page/client/login.jsp";
}
//로그아웃
function serviceLogout() {
	location.href="${path}/client_servlet/logout.do";
}
//회원가입
function serviceJoin() {
	location.href="${path}/ui_page/client/join.jsp";
}
//정보수정
function serviceEdit() {
	location.href="${path}/ui_page/client/info_check.jsp";
}
$(function() {
	$("#btnSave").click(function() {
		var subject=$("#subject").val();
		var content=$("#content").val();
		if(subject=="") {
			alert("제목을 입력해주세요");
			$("#subject").focus();
			return;
		} else if(content=="") {
			alert("내용을 입력해주세요");
			$("#content").focus();
			return;
		}
		document.form1.submit();
	});
	$("#btnCancel").click(function() {
		window.location.href="${path}/notice_servlet/list.do";
	});
});
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

#cont_wrap h2 {
	margin: 20px auto 40px;
	text-align: center;
}

/* 공지사항 테이블 양식 */
table {
	clear: both;
	width: 80%;
	height: auto;
	margin: 30px auto;
	border-collapse: collapse;
	text-align: justify;
}
table td {
	border: 1px solid black;
	padding: 15px;
}

/* 버튼 양식 */
.btn {
	width: 45px;
	height: 25px;
	margin-left: 3px;
	padding-bottom: 3px;
	border: 1px solid black;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}
.btn:hover {
	background-color: #ac7339;
	color: white;
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
				<h1><a href="${path}/ui_page/index.jsp">Belle voix</a></h1>
			</div>
			<div id="h_log">
				<ul>
				<!-- 1. 세션이 끊겨있을때(로그인 전) -->
				<c:if test="${sessionScope.userid == null}">
					<li onclick="seviceLogin()">로그인</li>
					<li onclick="serviceJoin()">| 회원가입</li>
				</c:if>
				<!-- 2. 세션이 유지되어 있을때(로그인 후) -->
				<c:if test="${sessionScope.userid != null}">
					<li onclick="serviceLogout()">로그아웃</li>
					<li onclick="serviceEdit()">| 내 정보 수정</li>
				</c:if>
				</ul>
			</div>
			<div class="menu">
				<ul>
					<li><a href="${path}/ui_page/playlist/playlist.jsp">플레이리스트</a></li>
					<li><a href="${path}/ui_page/recosong/recosong.jsp">추천노래</a></li>
					<li><a href="${path}/ui_page/video/music_v.jsp">뮤직비디오</a></li>
					<li style="border-bottom: 2px solid #ac7339;">
						<a href="${path}/ui_page/communication/notice.jsp" class="on">소통</a>
					</li>
				</ul>
			</div>
			<div class="lay_menu">
				<ul>
					<li><a href="${path}/ui_page/communication/notice.jsp" class="on">공지사항</a></li>
					<li><a href="${path}/ui_page/communication/suggestion.jsp">건의/피드백</a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<section>
			<h2>글쓰기</h2>
			<div>
				<!-- multipart/form-data : 모든 문자를 인코딩하지 않음을 명시함. 이 방식은 <form> 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용함. -->
				<form name="form1" method="post" action="${path}/notice_servlet/insert.do" enctype="multipart/form-data">
					<table>
						<tr>
							<td>아이디</td>
							<td>
								${sessionScope.userid} 
								<input type="hidden" name="writer" id="writer" value="${sessionScope.userid}">
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input name="subject" id="subject" size="102"> </td>
						</tr>
						<tr>
							<td>본문</td>
							<td><textarea rows="7" cols="104" name="content" id="content">
							</textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="file1" id="file1"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input class="btn" type="button" value="확인" id="btnSave">
								<input class="btn" type="button" value="취소" id="btnCancel">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
		
	<div id="foot_wrap">
		<footer>
			<h4>방문해주셔서 감사합니다</h4>
			<p>About us : 안녕하세요 <strong>Belle voix</strong>는 음악과 관련된 다양한 콘텐츠들을 다루는 사이트 입니다<br>
				제가 좋아하는 음악을 여러분들과 공유하고 여러분들과 소통하고싶어 <strong>Belle voix</strong> 를 만들게 되었습니다<br>
				<strong>Bello voix</strong>에서는 유튜브에 있는 영상 및 음악 컨텐츠들을 공유하여 사용하고 있고<br>
				제가 직접 보고들은 컨텐츠들 중 추천하고싶은 플레이 리스트와 노래 및 앨범들을 소개해드립니다.<br>
				그 외에 직접 다녀본 콘서트에 대해서 설명함과 동시에 감상평도 남기며 다양한 컨텐츠들을 제작해 보았습니다.<br>
				부족하지만 즐겨주시길 바라며 피드백이나 건의사항은 회원가입 후 고객게시판을 이용하여 올려주시면 감사하겠습니다</p>
			<h5>Copyright &copy; Yong Min</h5>
		</footer>
	</div>
</div>
</body>
</html>