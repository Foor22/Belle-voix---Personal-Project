<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/session_check.jsp" %>
<link rel="stylesheet" href="${path}/include/common.css" />
<script src="../include/jquery-3.5.1.min.js"></script>
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
	$("#btnUpdate").click(function() {
		var subject=$("#subject").val();
		var content=$("#content").val();
		var passwd=$("#passwd").val();
		if(subject=="") {
			alert("제목을 입력해주세요");
			$("#subject").focus();
			return;
		} else if(content=="") {
			alert("내용을 입력해주세요");
			$("#content").focus();
			return;
		} else if(passwd=="") {
			alert("비밀번호를 입력해주세요");
			$("#passwd").focus();
			return;
		}
		document.form1.action="${path}/suggestion_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		if(confirm("게시물을 삭제하시겠습니까?")){
			document.form1.action="${path}/suggestion_servlet/delete.do";
			document.form1.submit();			
		}
	});
	$("#btnCancel").click(function() {
		window.location.href="${path}/suggestion_servlet/list.do";
	});
});
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

#cont_wrap h2 {
	margin: 40px;
	text-align: center;
}

/* 공지사항 테이블 양식 */
table {
	clear: both;
	width: 80%;
	height: auto;
	margin: 40px auto 80px;
	border-collapse: collapse;
	text-align: justify;
}
table td {
	padding: 15px;
	border: 1px solid black;
}
table a {
	color: black;
	text-decoration: none;
}
table a:hover {
	background-color: #ac7339;
	color: white;
}
/* 버튼 양식 */
button {
	width: auto;
	height: 25px;
	margin-left: 3px;
	padding-bottom: 5px;
	border: 1px solid black;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}
button:hover {
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
					<li><a href="${path}/ui_page/communication/notice.jsp">공지사항</a></li>
					<li><a href="${path}/ui_page/communication/suggestion.jsp" class="on">건의/피드백</a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<section>
			<h2>게시글 수정/삭제</h2>
			<div>
				<form name="form1" method="post" enctype="multipart/form-data">
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
							<td><input name="subject" id="subject" size="102" value="${dto.subject}"> </td>
						</tr>
						<tr>
							<td>본문</td>
							<td><textarea rows="5" cols="104" name="content" id="content">
								${dto.content}
							</textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
								<c:if test="${dto.filesize > 0}">
									${dto.filename}(${dto.filesize / 1024} KB)
										<input type="checkbox" name="fileDel">첨부파일 삭제<br>
								</c:if>
								<input type="file" name="file1" id="file1">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd" id="passwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<!-- 수정, 삭제를 위한 글 번호 -->
								<input type="hidden" name="num" value="${dto.num}">
								<button type="button" id="btnUpdate">수정</button>
								<button type="button" id="btnDelete">삭제</button>
								<button type="button" id="btnCancel">취소</button>
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