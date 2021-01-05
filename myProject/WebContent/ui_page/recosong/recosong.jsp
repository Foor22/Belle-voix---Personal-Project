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
//하단 메뉴 클릭상태 변경
function switch_t(n) {
	switch(n) {
	case 1:
		document.getElementById('s_tab1').style.color = "#ac7339";
		document.getElementById('s_tab2').style.color = "black";
		document.getElementById('s_tab3').style.color = "black";
		document.getElementById('s_tab4').style.color = "black";
		document.getElementById('cont_1_wrap').style.display = "block";
		document.getElementById('cont_2_wrap').style.display = "none";
		document.getElementById('cont_3_wrap').style.display = "none";
		document.getElementById('cont_4_wrap').style.display = "none";
		break;
	case 2:
		document.getElementById('s_tab1').style.color = "black";
		document.getElementById('s_tab2').style.color = "#ac7339";
		document.getElementById('s_tab3').style.color = "black";
		document.getElementById('s_tab4').style.color = "black";
		document.getElementById('cont_1_wrap').style.display = "none";
		document.getElementById('cont_2_wrap').style.display = "block";
		document.getElementById('cont_3_wrap').style.display = "none";
		document.getElementById('cont_4_wrap').style.display = "none";
		break;
	case 3:
		document.getElementById('s_tab1').style.color = "black";
		document.getElementById('s_tab2').style.color = "black";
		document.getElementById('s_tab3').style.color = "#ac7339";
		document.getElementById('s_tab4').style.color = "black";
		document.getElementById('cont_1_wrap').style.display = "none";
		document.getElementById('cont_2_wrap').style.display = "none";
		document.getElementById('cont_3_wrap').style.display = "block";
		document.getElementById('cont_4_wrap').style.display = "none";
		break;
	case 4:
		document.getElementById('s_tab1').style.color = "black";
		document.getElementById('s_tab2').style.color = "black";
		document.getElementById('s_tab3').style.color = "black";
		document.getElementById('s_tab4').style.color = "#ac7339";
		document.getElementById('cont_1_wrap').style.display = "none";
		document.getElementById('cont_2_wrap').style.display = "none";
		document.getElementById('cont_3_wrap').style.display = "none";
		document.getElementById('cont_4_wrap').style.display = "block";
		break;
	}	
}

</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 전체 컨텐츠 랩 */

.cont_All {
	width: auto;
	height: auto;
	padding: 20px 40px 0px 40px;
}
.cont_All section {
	width: 100%;
}
.cont_All section h2 {
	margin: 15px 51px 15px;
}

/* 컨텐츠 테이블 양식 */
table {
	width: 90%;
	margin: 30px auto 60px;
	border-collapse: collapse;
	text-align: center;
}
table img {
	width: 100px;
	height: 100px;
}
table tr {
	border-bottom: 1px solid black;
}

/* 컨텐츠 2,3,4 보이지 않게 설정 */
#cont_2_wrap, #cont_3_wrap, #cont_4_wrap {
	display: none;
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
					<li><a href="../playlist/playlist.jsp">플레이리스트</a></li>
					<li style="border-bottom: 2px solid #ac7339;">
						<a href="../recosong/recosong.jsp" class="on">추천노래</a>
					</li>
					<li><a href="../video/music_v.jsp">뮤직비디오</a></li>
					<li><a href="${path}/notice_servlet/list.do">소통</a></li>
				</ul>
			</div>
			<div class="lay_menu">
				<ul>
					<li id="s_tab1" style="color: #ac7339;" onclick="switch_t(1)">신나는 노래</li>
					<li id="s_tab2" onclick="switch_t(2)">감성적인 노래</li>
					<li id="s_tab3" onclick="switch_t(3)">락 앤 롤 ~ !</li>
					<li id="s_tab4" onclick="switch_t(4)">추억의 노래</li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<div class="cont_All" id="cont_1_wrap">
			<section>
				<h2>신나는 노래</h2>
				<table>
					<thead>
						<tr>
							<th>커버</th>
							<th>곡 이름</th>
							<th>아티스트</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<a href="https://youtu.be/kDo2SiW3JHU">
								<img src="https://i.ibb.co/pyWSQ5g/take-me-home.jpg"></a>
							</td>
							<td>Take me home</td>
							<td>CashCash</td>
							<td>Take Me Home [Single]</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/O33x3EyUbpc">
								<img src="https://i.ibb.co/KLrJGqg/matches.jpg"></a>
							</td>
							<td>Matches</td>
							<td>CashCash</td>
							<td>Matches [Single]</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/4wrW8J5jVqU">
								<img src="https://i.ibb.co/QDKvZsB/there-x2.jpg"></a>
							</td>
							<td>There x2</td>
							<td>Marshmello & Slushii</td>
							<td>There x2 [Single]</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/B-rLNmaSuZc">
								<img src="https://i.ibb.co/HNxCJSM/almost-back.jpg"></a>
							</td>
							<td>Almost back</td>
							<td>Kaskade, Phoebe Ryan, LöKii</td>
							<td>Almost Back</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/XYAghEq5Lfw">
								<img src="https://i.ibb.co/26Q43md/youth.jpg"></a>
							</td>
							<td>Youth</td>
							<td>Troye Sivan</td>
							<td>Blue Neighbourhood</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/ozx898ADTxM">
								<img src="https://i.ibb.co/52c0MCC/easy-love.jpg"></a>
							</td>
							<td>Easy love</td>
							<td>Sigala</td>
							<td>Brighter Days</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/ghSQz2BcDQU">
								<img src="https://i.ibb.co/QC7TQz1/lullaby.jpg"></a>
							</td>
							<td>Lullaby</td>
							<td>Sigala, Paloma Faith</td>
							<td>Brighter Days</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/FM7MFYoylVs">
								<img src="https://i.ibb.co/VqStsk5/something-just-like-this.jpg"></a>
							</td>
							<td>Something Just Like This</td>
							<td>The Chainsmokers & Coldplay</td>
							<td>Something Just Like This</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/VPRjCeoBqrI">
								<img src="https://i.ibb.co/WkQMWdF/a-sky-full-of-stars.jpg"></a>
							</td>
							<td>A Sky Full Of Stars</td>
							<td>Coldplay</td>
							<td>Ghost Stories</td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
		
		<div class="cont_All" id="cont_2_wrap">
			<section>
				<h2>감성적인 노래</h2>
				<table>
					<thead>
						<tr>
							<th>커버</th>
							<th>곡 이름</th>
							<th>아티스트</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<a href="https://youtu.be/9jFZdu0zTEA">
								<img src="https://i.ibb.co/GctYdgh/image.jpg"></a>
							</td>
							<td>비</td>
							<td>폴킴</td>
							<td>비 [Single]</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/f5wCZ0-3Eos">
								<img src="https://i.ibb.co/Y0KPG2X/image.jpg"></a>
							</td>
							<td>뜨거운 여름밤은 가고 남은 건 볼품없지만</td>
							<td>잔나비</td>
							<td>MONKEY HOTEL</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/Rh5ok0ljrzA">
								<img src="https://i.ibb.co/S5TPMXn/image.jpg"></a>
							</td>
							<td>이런 엔딩</td>
							<td>아이유</td>
							<td>Palette</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/GdoNGNe5CSg">
								<img src="https://i.ibb.co/5XQFJdY/image.jpg"></a>
							</td>
							<td>주저하는 연인들을 위해</td>
							<td>잔나비</td>
							<td>전설</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/Aq_gsctWHtQ">
								<img src="https://i.ibb.co/c1DtpLP/team-baby.jpg"></a>
							</td>
							<td>EVERYTHING</td>
							<td>검정치마</td>
							<td>TEAM BABY</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/uuGtrxDsrws">
								<img src="https://i.ibb.co/543fmnW/hollywood.jpg"></a>
							</td>
							<td>Hollywood</td>
							<td>검정치마</td>
							<td>Hollywood [Single]</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/Dw-kA8bjG8o">
								<img src="https://i.ibb.co/zSRGYKr/falling.jpg"></a>
							</td>
							<td>Falling</td>
							<td>존박</td>
							<td>Knock</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/7u_o28xwBHI">
								<img src="https://i.ibb.co/h1Q4CV6/4.jpg"></a>
							</td>
							<td>4월의 눈</td>
							<td>허각</td>
							<td>사월의 눈</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/WlVxEZy85m8">
								<img src="https://i.ibb.co/Hdjp0Rd/image.jpg"></a>
							</td>
							<td>명동콜링</td>
							<td>카더가든</td>
							<td>더 팬 2ROUND Part.1</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/nkyRnKXUflI">
								<img src="https://i.ibb.co/5XQFJdY/image.jpg"></a>
							</td>
							<td>나의 기쁨, 나의 노래</td>
							<td>잔나비</td>
							<td>전설</td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
		
		<div class="cont_All" id="cont_3_wrap">
			<section>
				<h2>락 앤 롤 ~ !</h2>
				<table>
					<thead>
						<tr>
							<th>커버</th>
							<th>곡 이름</th>
							<th>아티스트</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<a href="https://youtu.be/XFkzRNyygfk">
								<img src="https://i.ibb.co/6ghF9yb/creep.jpg"></a>
							</td>
							<td>Creep</td>
							<td>Radiohead</td>
							<td>Pablo Honey</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/7qFfFVSerQo">
								<img src="https://i.ibb.co/2NHMTDk/high-and-dry.jpg"></a>
							</td>
							<td>High and Dry</td>
							<td>Radiohead</td>
							<td>The Bends</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/YZG7z4FOn0g">
								<img src="https://i.ibb.co/StqKDjb/don-t-look-back-in-anger.jpg"></a>
							</td>
							<td>Don't Look Back In Anger</td>
							<td>Oasis</td>
							<td>(What`s The Story) Morning Glory?</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/X2BYmmTI04I">
								<img src="https://i.ibb.co/9gDHB1k/she-looks-so-perfect.jpg"></a>
							</td>
							<td>She Looks So Perfect</td>
							<td>5 Seconds of Summer</td>
							<td>5 Seconds Of Summer</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/eW27mei0l5I">
								<img src="https://i.ibb.co/FHQdqyz/image.jpg"></a>
							</td>
							<td>노는게 남는거야</td>
							<td>딕펑스</td>
							<td>슈퍼스타K4 Top 12 Part.7</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/xmXHQUAWLA8">
								<img src="https://i.ibb.co/tmjJmKq/image.jpg"></a>
							</td>
							<td>호랑이소굴</td>
							<td>기리보이</td>
							<td>호랑이소굴</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/medo8dj_-28">
								<img src="https://i.ibb.co/rfY23W3/image.jpg"></a>
							</td>
							<td>범퍼카</td>
							<td>한요한</td>
							<td>범퍼카</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/lC5G6ZLtj8o">
								<img src="https://i.ibb.co/GcKknvV/mood-maker.jpg"></a>
							</td>
							<td>Mood Maker</td>
							<td>한요한</td>
							<td>청룡쇼바</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/yrJSc3NKNfc">
								<img src="https://i.ibb.co/F7yhG65/image.jpg"></a>
							</td>
							<td>포커페이스</td>
							<td>C JAMM</td>
							<td>킁</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/nkyRnKXUflI">
								<img src="https://i.ibb.co/5XQFJdY/image.jpg"></a>
							</td>
							<td>Last Night on Earth</td>
							<td>Green Day</td>
							<td>21st Century Breakdown</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/n1PCW0C1aiM">
								<img src="https://i.ibb.co/pZ82wf7/shadow-of-the-day.jpg"></a>
							</td>
							<td>Shadow Of The Day</td>
							<td>Linkin Park</td>
							<td>Minutes To Midnight</td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
		
		<div class="cont_All" id="cont_4_wrap">
			<section>
				<h2>추억의 노래</h2>
				<table>
					<thead>
						<tr>
							<th>커버</th>
							<th>곡 이름</th>
							<th>아티스트</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<a href="https://www.youtube.com/watch?v=lR14buHEdMY">
								<img src="https://i.ibb.co/znRr3p7/image.jpg"></a>
							</td>
							<td>천국</td>
							<td>BigBang</td>
							<td>Stand Up (2008 빅뱅 3rd Mini Album)</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/MUsxrE6e1z8">
								<img src="https://i.ibb.co/2nYD3JY/abraca.jpg"></a>
							</td>
							<td>Abracadabra</td>
							<td>Brown Eyed Girls</td>
							<td>Sound G.</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/nPPKwg5eQ4o">
								<img src="https://i.ibb.co/CtLwScY/image.jpg"></a>
							</td>
							<td>Hot Issue</td>
							<td>4 Minute</td>
							<td>Hot Issue</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/8OAQ6RuYFGE">
								<img src="https://i.ibb.co/znRr3p7/image.jpg"></a>
							</td>
							<td>하루하루</td>
							<td>BigBang</td>
							<td>Stand Up (2008 빅뱅 3rd Mini Album)</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/U7mPqycQ0tQ">
								<img src="https://i.ibb.co/L5H1gBV/gee.jpg"></a>
							</td>
							<td>Gee</td>
							<td>소녀시대</td>
							<td>The First Mini Album `Gee`</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/HtJS32n6LNQ">
								<img src="https://i.ibb.co/pRRh7N5/image.jpg"></a>
							</td>
							<td>주문</td>
							<td>동방신기</td>
							<td>The Fourth Album `MIROTIC`</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/lmun5PO54VE">
								<img src="https://i.ibb.co/Q9xH8Ht/so-hot.jpg"></a>
							</td>
							<td>So Hot</td>
							<td>원더걸스</td>
							<td>So Hot</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/piyWxr0Em9Q">
								<img src="https://i.ibb.co/0r8pkLc/image.jpg"></a>
							</td>
							<td>땡땡땡</td>
							<td>Supreme Team</td>
							<td>Spin Off</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/m3ydJMw5loU">
								<img src="https://i.ibb.co/SrFZFpb/sign.png"></a>
							</td>
							<td>Sign</td>
							<td>Brown Eyed Girls</td>
							<td>Sound-G Sign</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/4MgAxMO1KD0">
								<img src="https://i.ibb.co/6bSGnSS/i-don-t-care.jpg"></a>
							</td>
							<td>I Don't Care</td>
							<td>2NE1</td>
							<td>2NE1 1st Mini Album</td>
						</tr>
						<tr>
							<td>
								<a href="https://youtu.be/6SwiSpudKWI">
								<img src="https://i.ibb.co/vzLZmb7/image.jpg"></a>
							</td>
							<td>소원을 말해봐</td>
							<td>소녀시대</td>
							<td>`소원을 말해봐 (Genie)` The Second Mini Album</td>
						</tr>
					</tbody>
				</table>
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