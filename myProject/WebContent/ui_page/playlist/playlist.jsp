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
					<li><a href="playlist.jsp" class="on">투데이</a></li>
					<li><a href="playlist_1.jsp">호스트 추천</a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<div id="cont_1_wrap">
			<section>
				<h3>투데이</h3>
				<ul>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=BBsOatw_qgo" title="[Playlist] 당신이 찾던 여름여름한 드라이브 팝송! 세련되고 트렌디한 팝송 모음 - 페이지 이동">
								<img alt="drive_p" src="https://i.ibb.co/qM1g3qw/drive-p.jpg" width="240px" height="240px">
							</a>
							<p>[Playlist] 당신이 찾던 여름여름한 드라이브 팝송! 세련되고 트렌디한 팝송 모음</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=nxKfi-6EtmY" title="코딩할 때 듣기 좋은 로파이 재즈 힙합 (playlist) - 페이지 이동">
								<img alt="coding_p" src="https://i.ibb.co/1q49htM/coding-p.jpg" width="240px" height="240px">
							</a>
							<p>코딩할 때 듣기 좋은 로파이 재즈 힙합 (playlist)</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=q1HT3piV9eo" title="밤의 재즈 힙합을 부드럽게 - 교통 도시 재즈 비트를 - 배경 리믹스 재즈 음악을 - 페이지 이동">
								<img alt="tea_p" src="https://i.ibb.co/cXt4SWW/tea-p.jpg" width="240px" height="240px">
							</a>
							<p>밤의 재즈 힙합을 부드럽게 - 교통 도시 재즈 비트를 - 배경 리믹스 재즈 음악을</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=o_UUYwymh30" title="알앤비: 감성 터지는 늦은 밤, 혼자만의 생각에 잠기기 좋은 20곡 (R&B Mix) - 페이지 이동">
								<img alt="evening_p" src="https://i.ibb.co/TbkC4YW/evening-p.jpg" width="240px" height="240px">
							</a>
							<p>알앤비: 감성 터지는 늦은 밤, 혼자만의 생각에 잠기기 좋은 20곡 (R&B Mix)</p>
						</div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=g7c0W-8rNmw" title="[Playlist] 아니, 이런 노래는 어떻게 아는거야?? 너무 좋자나... | 노래 좀 듣는 애 플레이리스트ㅣShe has good taste in music - 페이지 이동">
								<img alt="play_1" src="https://i.ibb.co/yRSn7k3/pl1.jpg" width="240px" height="240px">
							</a>
							<p>[Playlist] 아니, 이런 노래는 어떻게 아는거야?? 너무 좋자나... | 노래 좀 듣는 애 플레이리스트ㅣShe has good taste in music</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=MvBGq7q0mjw" title="크리스마스 분위기 나는 유명한 팝송 캐롤 모음  ᴍᴇʀʀʏ ᴄʜʀɪsᴛᴍᴀs - 페이지 이동">
								<img alt="play_2" src="https://i.ibb.co/k8rz8Vx/pl2.jpg" width="240px" height="240px">
							</a>
							<p>크리스마스 분위기 나는 유명한 팝송 캐롤 모음  ᴍᴇʀʀʏ ᴄʜʀɪsᴛᴍᴀs</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=RIA8wR4Fd3c" title="[PLAYLIST] ENTP 입꼬리 씰룩거리는 플레이리스트 - 페이지 이동">
								<img alt="play_3" src="https://i.ibb.co/bXJg4kj/pl3.jpg" width="240px" height="240px">
							</a>
							<p>[PLAYLIST] ENTP 입꼬리 씰룩거리는 플레이리스트</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<a href="https://www.youtube.com/watch?v=GHLNNAFBc-k" title="가을 감성 자극하는 어쿠스틱 팝 & 발라드 모음 - 카페에서 듣기좋은 잔잔한 팝송 / Indie/ Folk/ Acoustic Pop Playlist [라센트뮤직] - 페이지 이동">
								<img alt="play_4" src="https://i.ibb.co/DrLD4RN/pl4.jpg" width="240px" height="240px">
							</a>
							<p>가을 감성 자극하는 어쿠스틱 팝 & 발라드 모음 - 카페에서 듣기좋은 잔잔한 팝송 / Indie/ Folk/ Acoustic Pop Playlist</p>
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