<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 객체를 사용하기 위함 -->
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Belle voix</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/main.css" />
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//실시간 차트 변경
$(function() {
	$("#m_site").click(function() {
		document.getElementById('t_form').src = "https://www.melon.com/chart/index.htm";
	});
	$("#g_site").click(function() {
		document.getElementById('t_form').src = "https://www.genie.co.kr/chart/top200";
	});
	$("#b_site").click(function() {
		document.getElementById('t_form').src = "https://www.billboard.com/charts/hot-100";
	});
});
//로그인
function seviceLogin() {
	location.href="client/login.jsp";
}
//로그아웃
function serviceLogout() {
	location.href="${path}/client_servlet/logout.do";
}
//회원가입
function serviceJoin() {
	location.href="client/join.jsp";
}
//정보수정
function serviceEdit() {
	location.href="client/info_check.jsp";
}

//overlay (이미지 위에 곡 정보 띄우기)
function on(n) {
	for(var i=1; i<9; i++) {
		if(n==i) { 
			document.getElementById("overlay"+i).style.display="block";
			break;
		}
	}
}
function off(n) {
	for(var i=1; i<9; i++) {
		if(n==i) { 
			document.getElementById("overlay"+i).style.display="none";
			break;
		}
	}
}
</script>
<c:if test="${param.message == 'logout'}">
	<script>
		alert("로그아웃 되었습니다.");
	</script>
</c:if>
<c:if test="${param.message == 'changed'}">
	<script>
		alert("개인정보가 변경되었습니다.");
	</script>
</c:if>
<c:if test="${param.message == 'deleted'}">
	<script>
		alert("회원탈퇴 되었습니다.");
		alert("그동안 이용해주셔서 진심으로 감사드립니다.")
	</script>
</c:if>
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
				<h1><a href="index.jsp">Belle voix</a></h1>
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
					<li><a href="playlist/playlist.jsp">플레이리스트</a></li>
					<li><a href="recosong/recosong.jsp">추천노래</a></li>
					<li><a href="video/music_v.jsp">뮤직비디오</a></li>
					<li><a href="communication/notice.jsp">소통</a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<div id="cont_1_wrap">
			<section>
				<h3>오늘의 추천 노래</h3>
				<ul>
					<li class="reco">
						<a href="https://youtu.be/6rDo1MKPal8" onmouseover="on(1)">
							<img src="https://i.ibb.co/41zwT0w/Joke.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/6rDo1MKPal8">Code Kunst</a>
						</div>
						<div id="overlay1" onmouseout="off(1)">
							<p><a href="https://youtu.be/6rDo1MKPal8">Joke!</a></p>
							<p><a href="https://youtu.be/6rDo1MKPal8">Code Kunst</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/kOCkne-Bku4" onmouseover="on(2)">
							<img src="https://i.ibb.co/GcWDBjR/i-met-you-when-i-was-18.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/kOCkne-Bku4">Lauv</a>
						</div>
						<div id="overlay2" onmouseout="off(2)">
							<p><a href="https://youtu.be/kOCkne-Bku4">Paris in the rain</a></p>
							<p><a href="https://youtu.be/kOCkne-Bku4">Lauv</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/kBQB3H64HYA" onmouseover="on(3)">
							<img src="https://i.ibb.co/HqTG5Kb/i-wish.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/kBQB3H64HYA">Hayley Kiyoko</a>
						</div>
						<div id="overlay3" onmouseout="off(3)">
							<p><a href="https://youtu.be/kBQB3H64HYA">I Wish</a></p>
							<p><a href="https://youtu.be/kBQB3H64HYA">Hayley Kiyoko</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/0hNde677fAE" onmouseover="on(4)">
							<img src="https://i.ibb.co/gSnDXP3/gravity.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/0hNde677fAE">태연</a>
						</div>
						<div id="overlay4" onmouseout="off(4)">
							<p><a href="https://youtu.be/0hNde677fAE">Gravity</a></p>
							<p><a href="https://youtu.be/0hNde677fAE">태연</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/s_vSGwtNDoc" onmouseover="on(5)">
							<img src="https://i.ibb.co/8cZbsHM/why.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/s_vSGwtNDoc">Shawn Mendes</a>
						</div>
						<div id="overlay5" onmouseout="off(5)">
							<p><a href="https://youtu.be/s_vSGwtNDoc">Why</a></p>
							<p><a href="https://youtu.be/s_vSGwtNDoc">Shawn Mendes</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/6B3YwcjQ_bU" onmouseover="on(6)">
							<img src="https://i.ibb.co/jMhn2Bg/swimming.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/6B3YwcjQ_bU">Mac Miller</a>
						</div>
						<div id="overlay6" onmouseout="off(6)">
							<p><a href="https://youtu.be/6B3YwcjQ_bU">2009</a></p>
							<p><a href="https://youtu.be/6B3YwcjQ_bU">Mac Miller</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/xg_Y7Or_hWM" onmouseover="on(7)">
							<img src="https://i.ibb.co/X3QmWgc/last-night-on-earth.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/xg_Y7Or_hWM">Green Day</a>
						</div>
						<div id="overlay7" onmouseout="off(7)">
							<p><a href="https://youtu.be/xg_Y7Or_hWM">Last Night On Earth</a></p>
							<p><a href="https://youtu.be/xg_Y7Or_hWM">Green Day</a></p>
						</div>
					</li>
					<li class="reco">
						<a href="https://youtu.be/EfgAd6iHApE" onmouseover="on(8)">
							<img src="https://i.ibb.co/sJhrBLn/Ylang-Ylang.jpg" width="166px" height="166px">
						</a>
						<div>
							<a href="https://youtu.be/EfgAd6iHApE">Fkj</a>
						</div>
						<div id="overlay8" onmouseout="off(8)">
							<p><a href="https://youtu.be/EfgAd6iHApE">Ylang Ylang</a></p>
							<p><a href="https://youtu.be/EfgAd6iHApE">Fkj</a></p>
						</div>
					</li>
				</ul>
			</section>
		
			<aside>
				
			<!-- 세션의 유무에 따라서 형식이 바뀜 -->
				
			<!-- 1. 세션이 끊겨있을때(로그인 전) -->
			<c:if test="${sessionScope.userid == null}">
				<div id="login_P">
					<div id="join">
						<p>로그인 후 서비스를 이용해보세요</p>
						<a onclick="serviceJoin()">회원가입</a>
					</div>
					<button type="button" id="btnLogin" onclick="seviceLogin()">
						<span>로그인</span>
					</button>
				</div>
			</c:if>
			
			<!-- 2. 세션이 유지되어 있을때(로그인 후) -->
			<c:if test="${sessionScope.userid != null}">
				<div id="login_P">
					<div id="leave">
						<p>${sessionScope.message}</p>
						<a onclick="serviceLogout()">로그아웃</a>
					</div>
					<div id="mine">
						<span><a href="#">내 컬렉션 바로가기</a></span>
						<span><a href="client/info_check.jsp">내 정보 수정</a></span>
					</div>
				</div>
			</c:if>
				<div>
					<a href="https://youtu.be/Dx5qFachd3A">
						<img style="margin-top: 20px;" src="https://i.ibb.co/zmgTbVN/turntable.jpg" width="282px" height="193px">
					</a>
				</div>
			</aside>
		</div>
		
		<div id="cont_2_wrap">
			<section>
				<h3>오늘의 추천 플레이리스트</h3>
				<ul>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/BBsOatw_qgo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>drive</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/u1kHo3nnWP4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>walking</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/nxKfi-6EtmY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>working</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/o_UUYwymh30" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>evening</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/jwPH69NoBP8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>playing</p>
						</div>
					</li>
					<li>
						<div class="pl_cont">
							<div class="video-container">
								<iframe src="https://www.youtube.com/embed/q1HT3piV9eo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							<p>tea time</p>
						</div>
					</li>
				</ul>
			</section>
		</div>
		<div id="cont_3_wrap">
			<section>
				<h3>실시간 음악 사이트 음악 차트</h3>
				<ul class="stream">
					<li id="m_site"><p>Melon</p></li>
					<li id="g_site"><p>Genie</p></li>
					<li id="b_site"><p>Billboard</p></li>
				</ul>
				<iframe id="t_form" src="https://www.melon.com/chart/index.htm">음악 스트리밍 사이트</iframe>
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