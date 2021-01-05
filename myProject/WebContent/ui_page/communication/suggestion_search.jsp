<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("#btnWrite").click(function() {
		location.href="${path}/ui_page/communication/suggestion_write.jsp";
	});
});
//클릭한 페이지로 이동
function list(page){
	location.href ="${path}/suggestion_servlet/list.do?curPage="+page;
}
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

#cont_wrap h2 {
	margin: 30px;
	text-align: center;
}

/* 건의/피드백 테이블 양식 */
table {
	clear: both;
	width: 90%;
	height: auto;
	margin: 30px auto;
	border-collapse: collapse;
	text-align: center;
}
table tr {
	border-bottom: 1px solid black;
}
table td {
	padding: 15px 0;
}
table a {
	color: black;
	text-decoration: none;
}
table a:hover {
	background-color: #ac7339;
	color: white;
}
/* 검색 폼 태그 양식 */
#s_form {
	margin: 30px 55px 50px;
	float: right;
}
#s_form select {
	width: 135px;
	height: 25px;
	padding: 1px;
	border: 1px solid black;
	border-radius: 3px;
}
#s_form input {
	width: 200px;
	height: 21.5px;
	margin-left: 3px;
	border: 1px solid black;
	border-radius: 3px;
}
#s_form button {
	width: 45px;
	height: 25px;
	margin-left: 3px;
	padding-bottom: 3px;
	border: 1px solid black;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}
#s_form button:hover {
	background-color: #ac7339;
	color: white;
}
/* 글쓰기 버튼 */
#btnWrite{
	position: relative;
	float: right;
	margin: 10px 55px 50px;
	width: 65px;
	height: 30px;
	padding-bottom: 3px;
	border: 1px ridge gray;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}
#btnWrite:hover {
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
			<h2>건의/피드백</h2>
			<div>
				<div id="s_form">
					<form name="form1" method="post" action="${path}/suggestion_servlet/search.do">
						<select name="search_option">
						<c:choose>
							<c:when test="${search_option == 'writer'}">
								<option value="writer" selected>아이디</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="all">아이디+제목+내용</option>	
							</c:when>
							<c:when test="${search_option == 'subject'}">
								<option value="writer">아이디</option>
								<option value="subject" selected>제목</option>
								<option value="content">내용</option>
								<option value="all">아이디+제목+내용</option>	
							</c:when>
							<c:when test="${search_option == 'content'}">
								<option value="writer">아이디</option>
								<option value="subject">제목</option>
								<option value="content" selected>내용</option>
								<option value="all">아이디+제목+내용</option>	
							</c:when>
							<c:when test="${search_option == 'all'}">
								<option value="writer">아이디</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="all" selected>아이디+제목+내용</option>	
							</c:when>
						</c:choose>
						</select>
						<input name="keyword" value="${keyword}">
						<button id="btnSearch">검색</button>
					</form>
				</div>
				
				<!-- 공지사항 출력 -->
				<table width="900px">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>첨부파일</th>
						<th>다운로드</th>
					</tr>
					
					<!-- 공지사항 내용 -->
					 <c:forEach var="dto" items="${list}">
						<c:choose>
							<c:when test="${dto.show == 'y'}">
								<tr>
									<td>${dto.num}</td>
									<td>
										<!-- 답글 들여쓰기 -->
										<%-- <c:forEach var="i" begin="1" end="${dto.re_level}">
											&nbsp;&nbsp;
										</c:forEach>	 --%>			
										<a href="${path}/suggestion_servlet/view.do?num=${dto.num}">${dto.subject}</a>
										<!-- 댓글개수 표시 -->
										<c:if test="${dto.comment_count > 0}">
											<span style="color:red;">(${dto.comment_count})</span>
										</c:if>
									</td>
									<td>${dto.writer}</td>
									<td>${dto.reg_date}</td>
									<td>${dto.readcount}</td>
									<td align="center">
										<c:if test="${dto.filesize > 0}">
											<a href="${path}/suggestion_servlet/download.do?num=${dto.num}">
												<img src="../images/file.gif">
											</a>
											<script>
												setTimeout('location.reload()',60*1000);//다운횟수 1분마다 새로고침
											</script>
										</c:if>
									</td>
									<%-- <td>${dto.filename}</td> --%>
									<td>${dto.down}</td>
								</tr>
							</c:when>
							<%-- <c:otherwise>
								<tr>
									<td>${dto.num}</td>
									<td colspan="6" align="center">삭제된 게시물 입니다.</td>
								</tr>
							</c:otherwise> --%>
						</c:choose>
					</c:forEach>
					<!-- 페이지 네비게이션 출력 -->	
					<%-- <tr>
						<td colspan="7" align="center">
							<c:if test="${page.curBlock > 1}">
								<a href="#" onclick="list('1')">[처음]</a>
							</c:if>
							<c:if test="${page.curBlock > 1}">
								<a href="#" 
									onclick="list('${page.prevPage}')">[이전]</a>
							</c:if>
							<c:forEach var="num" begin="${page.blockStart}"
								end="${page.blockEnd}">
								<c:choose>
									<c:when test="${num == page.curPage }">
										<span style="color:red;">${num}</span>
									</c:when>
									<c:otherwise>
										<a href="#" onclick="list('${num}')">${num}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${page.curBlock < page.totBlock}">
								<a href="#" 
									onclick="list('${page.nextPage}')">[다음]</a>
							</c:if>
							<c:if test="${page.curPage < page.totPage}">
								<a href="#" 
									onclick="list('${page.totPage}')">[끝]</a> 
							</c:if>
						</td>
					</tr> --%>		
				</table>
				
				<button id="btnWrite">글쓰기</button>
				
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