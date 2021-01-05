<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/contents.css" />
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
</script>
<style type="text/css">

/*-------------------- 헤더 파트 --------------------*/

.lay_menu a {
	color: black;
}

.lay_menu a:hover {
	color: #ac7339;
}

/* 하단 메뉴 클릭 상태 */
a.on {
	color: #ac7339;
}

/*-------------------- 컨텐츠 파트 --------------------*/

/* 첫번째 컨텐츠 랩 */

#cont_1_wrap {
	width: auto;
	height: auto;
	padding: 20px 40px 40px 40px;
}	

/* 첫 번째 컨텐츠 랩 오늘의 추천 플레이리스트 파트 */
#cont_1_wrap section {
	width: 100%;
}
#cont_1_wrap section h3 {
	margin: 5px 10px 10px;
}
#cont_1_wrap section ul {
	margin: 10px auto;
	padding: 0;
}
#cont_1_wrap section ul li {
	list-style-type: none;
	display: inline-block;
	vertical-align: top;
}
#cont_1_wrap section ul li p {
	margin: 0 10px;
}

/* 오늘의 추천 플레이리스트 파트 정리 */
.pl_cont {
	border: 1px solid black;
	margin: 15px 5px 5px 5px;
	width: 240px;
	height: 340px;
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
					<li style="border-bottom: 2px solid #ac7339;">
						<a href="../playlist/playlist.jsp" class="on">플레이리스트</a>
					</li>
					<li><a href="../recosong/recosong.jsp">추천노래</a></li>
					<li><a href="../video/music_v.jsp">뮤직비디오</a></li>
					<li><a href="${path}/notice_servlet/list.do">소통</a></li>
				</ul>
			</div>
			<div class="lay_menu">
				<ul>
					<li><a href="playlist.jsp">투데이</a></li>
					<li><a href="playlist_1.jsp" class="on">호스트 추천</a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<div id="cont_1_wrap">
			<section>
				<h3>호스트 추천</h3>
				<ul>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=yni45ID2qCc" title="[Playlist] 힙하게 시작하는 하루! 상쾌하고 감각적인 팝송 모음ㅣ트렌디하고 신나는 팝송 모음ㅣBest Popular Songs Of 2019 - 페이지 이동">
								<img alt="drive_p" src="https://i.ibb.co/JpF62TL/1.jpg" width="240px" height="240px">
							</a>
							<p>[Playlist] 힙하게 시작하는 하루! 상쾌하고 감각적인 팝송 모음ㅣ트렌디하고 신나는 팝송 모음ㅣBest Popular Songs Of 2019</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=5U-Ic7JVNzQ" title="#Playlist ll 듣는 순간 귀르가즘 느껴지는 힙한 팝송 노래들 - 페이지 이동">
								<img alt="coding_p" src="https://i.ibb.co/bz5ht3g/2.jpg" width="240px" height="240px">
							</a>
							<p>#Playlist ll 듣는 순간 귀르가즘 느껴지는 힙한 팝송 노래들</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=_gB-TMGfa-o" title="들으면 내심장 쿵쾅쿵쾅쾅쾅 와그작 와장창 - 페이지 이동">
								<img alt="tea_p" src="https://i.ibb.co/ThJPS6t/3.jpg" width="240px" height="240px">
							</a>
							<p>들으면 내심장 쿵쾅쿵쾅쾅쾅 와그작 와장창</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=d-AMZnn-qj0" title="평범한 자취방을 파리 한복판으로 바꿔줄 재즈힙합 모음 - 페이지 이동">
								<img alt="evening_p" src="https://i.ibb.co/sHtXzHP/4.jpg" width="240px" height="240px">
							</a>
							<p>평범한 자취방을 파리 한복판으로 바꿔줄 재즈힙합 모음</p>
						</div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=ql8CDFOBpWY" title="#PLAYLIST II 내 귀를 자극하는 감각적인 노래 - 페이지 이동">
								<img alt="play_1" src="https://i.ibb.co/QnyqJL1/5.jpg" width="240px" height="240px">
							</a>
							<p>#PLAYLIST II 내 귀를 자극하는 감각적인 노래</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=OT9jLERUM9U" title="[playlist] 니 생각이 나기 딱 좋은 시간이다 | 새벽 인디 음악 모음 (ft. 검정치마, 잔나비, 카더가든, 혁오...) - 페이지 이동">
								<img alt="play_2" src="https://i.ibb.co/VLB2gfP/6.jpg" width="240px" height="240px">
							</a>
							<p>[playlist] 니 생각이 나기 딱 좋은 시간이다 | 새벽 인디 음악 모음 (ft. 검정치마, 잔나비, 카더가든, 혁오...)</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=rG3FJePqJJQ" title="새벽 산책 감성, 우효의 사랑노래 - 페이지 이동">
								<img alt="play_3" src="https://i.ibb.co/kQKqDVx/7.jpg" width="240px" height="240px">
							</a>
							<p>새벽 산책 감성, 우효의 사랑노래</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=gX4imVi8R6U" title="[Playlist] 새벽 인디 모음 | 잔나비, 혁오, 검정치마 - 페이지 이동">
								<img alt="play_4" src="https://i.ibb.co/XyXzHGD/8.jpg" width="240px" height="240px">
							</a>
							<p>[Playlist] 새벽 인디 모음 | 잔나비, 혁오, 검정치마</p>
						</div>
					</li>
				</ul>
			</section>
		</div>
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