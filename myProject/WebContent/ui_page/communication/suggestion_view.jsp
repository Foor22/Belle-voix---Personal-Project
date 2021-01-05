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
	comment_list();
	$("#btnSave").click(function() {
		comment_add();
	});
	$("#btnList").click(function() {
		location.href="${path}/suggestion_servlet/list.do";
	});
	$("#btnEdit").click(function() {
		document.form1.action="${path}/suggestion_servlet/pass_check.do";
		document.form1.submit();
	});
});
//댓글 기능
function comment_list() {
	//백그라운드로 서버 호출
	$.ajax({
		type : "post",
		url : "${path}/suggestion_servlet/commentList.do",
		data : "num=${dto.num}",
		success : function(result){
			$("#commentList").html(result);
		}
	});
}
//댓글 추가 기능
function comment_add() {
	var content=$('#content').val();
	if(content=="") {
		alert("댓글 내용을 입력해주세요");
		$("#content").focus();
		return;
	}
	var param="suggestion_num=${dto.num}&writer="+$("#writer").val()+"&content="+$("#content").val();
	$.ajax({
		type : "post",
		url : "${path}/suggestion_servlet/commentAdd.do",
		data : param,
		success : function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

#cont_wrap h2, #cont_wrap h4 {
	margin: 40px auto;
	text-align: center;
}
#cont_wrap h3 {
	margin: 55px;
	text-align: justify;
}
/* 건의/피드백 테이블 양식 */
table {
	clear: both;
	width: 90%;
	height: auto;
	margin: 50px auto;
	border-collapse: collapse;
	text-align: justify;
}
table td {
	border: 1px solid black;
	padding: 15px;
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
			<h3>건의/피드백</h3>
			<h2>${dto.subject}</h2>
			<div>
				<form name="form1" method="post">
					<table>
						<tr>
							<td width="20%">날짜</td>
							<td width="60%">${dto.reg_date}</td>
							<td width="10%">조회수</td>
							<td width="10%">${dto.readcount}</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td colspan="3">${dto.writer}</td>
						</tr>
						<tr>
							<td>본문</td>
							<td colspan="3">${dto.content}</td>
						</tr>
						<tr>
							<td>게시물 비밀번호</td>
							<td colspan="3">
								<input type="password" name="passwd" id="passwd">
								<c:if test="${param.message == 'error'}">
									<span style="color:red;">
										비밀번호가 일치하지 않습니다.
									</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3">
								<c:if test="${dto.filesize > 0}">
									${dto.filename}(${dto.filesize} bytes)
									<a href="${path}/suggestion_servlet/download.do?num=${dto.num}">[다운로드]</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<input type="hidden" name="num" value="${dto.num}">
								<button type="button" id="btnEdit">수정/삭제</button>
								<button type="button" id="btnList">목록</button>
							</td>
						</tr>
					</table>
				</form>
				<!-- 댓글 폼 -->
				<hr>
				<h4>[ 댓글 ]</h4>
				<!-- 댓글 목록을 출력할 영역 -->
				<div id="commentList">
				
				</div>
			<!-- 세션이 유지되어 있을때만 댓글달 수 있다. -->
			<c:if test="${sessionScope.userid != null}">
				<table>
					<tr>
						<td>
							-- user... ${sessionScope.userid} --
							<input type="hidden" id="writer" value="${sessionScope.userid}">
						</td>
					
						<td rowspan="2">
							<button id="btnSave" type="button">등록</button>
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="4" cols="122" placeholder="내용을 입력하세요" id="content"></textarea>
						</td>
					</tr>
				</table>
			</c:if>
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