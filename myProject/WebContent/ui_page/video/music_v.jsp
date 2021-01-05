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
		document.getElementById('cont_1_wrap').style.display = "block";
		document.getElementById('cont_2_wrap').style.display = "none";
		document.getElementById('cont_3_wrap').style.display = "none";
		break;
	case 2:
		document.getElementById('s_tab1').style.color = "black";
		document.getElementById('s_tab2').style.color = "#ac7339";
		document.getElementById('s_tab3').style.color = "black";
		document.getElementById('cont_1_wrap').style.display = "none";
		document.getElementById('cont_2_wrap').style.display = "block";
		document.getElementById('cont_3_wrap').style.display = "none";
		break;
	case 3:
		document.getElementById('s_tab1').style.color = "black";
		document.getElementById('s_tab2').style.color = "black";
		document.getElementById('s_tab3').style.color = "#ac7339";
		document.getElementById('cont_1_wrap').style.display = "none";
		document.getElementById('cont_2_wrap').style.display = "none";
		document.getElementById('cont_3_wrap').style.display = "block";
		break;
	}
}

//뮤직비디오 변경
$(function() {
	//1번째
	$("#pretty_please").click(function() {
		document.getElementById('m_form1').src = "https://www.youtube.com/embed/2EjxIQXBhlc";
		document.getElementById("m_info1").innerHTML="Galantis & Jackson Wang - Pretty Please";
	});
	$("#joke").click(function() {
		document.getElementById('m_form1').src = "https://www.youtube.com/embed/6rDo1MKPal8";
		document.getElementById("m_info1").innerHTML="Code Kunst - Joke! (feat.C Jamm, Simon D)";
	});
	$("#armadillo").click(function() {
		document.getElementById('m_form1').src = "https://www.youtube.com/embed/ACCEDuwjVp8";
		document.getElementById("m_info1").innerHTML="Balming Tiger - 'Armadillo' (Feat. Omega Sapien, Byung Un)";
	});
	$("#text_me").click(function() {
		document.getElementById('m_form1').src = "https://www.youtube.com/embed/xfJPCenjZzY";
		document.getElementById("m_info1").innerHTML="DPR LIVE - Text Me";
	});
	//2번째
	$("#Ylang_Ylang").click(function() {
		document.getElementById('m_form2').src = "https://www.youtube.com/embed/EfgAd6iHApE";
		document.getElementById("m_info2").innerHTML="Fkj - Ylang Ylang";
	});
	$("#whodoyoulove").click(function() {
		document.getElementById('m_form2').src = "https://www.youtube.com/embed/0dRo5Kbgx6c";
		document.getElementById("m_info2").innerHTML="검정치마 - 나랑 아니면";
	});
	$("#medicine").click(function() {
		document.getElementById('m_form2').src = "https://www.youtube.com/embed/Lg35jIwoWcQ";
		document.getElementById("m_info2").innerHTML="Joji - Medicine";
	});
	$("#photograph").click(function() {
		document.getElementById('m_form2').src = "https://www.youtube.com/embed/2b1E-zu-QEM";
		document.getElementById("m_info2").innerHTML="offonoff - 'Photograph'";
	});
	//3번째
	$("#needyourlove").click(function() {
		document.getElementById('m_form3').src = "https://www.youtube.com/embed/A9dX-C5SBD4";
		document.getElementById("m_info3").innerHTML="Gryffin & Seven Lions - Need your love (with Noah Kahan)";
	});
	$("#easylove").click(function() {
		document.getElementById('m_form3').src = "https://www.youtube.com/embed/ozx898ADTxM";
		document.getElementById("m_info3").innerHTML="Sigala - Easy Love";
	});
	$("#boat").click(function() {
		document.getElementById('m_form3').src = "https://www.youtube.com/embed/lAx7C_uUhFo";
		document.getElementById("m_info3").innerHTML="죠지 (george) - Boat";
	});
	$("#zombiepop").click(function() {
		document.getElementById('m_form3').src = "https://www.youtube.com/embed/gvLZhbq8SlY";
		document.getElementById("m_info3").innerHTML="DPR Ian - zombie pop";
	});
});
</script>
<style type="text/css">

/*-------------------- 컨텐츠 파트 --------------------*/

/* 전체 컨텐츠 랩 */

.cont_All {
	width: auto;
	height: auto;
	padding: 20px 40px 0px 40px;
}
.cont_All section h2 {
	margin: 15px 51px 15px;
}
.cont_All section .u_cont {
	width: 680px;
	height: auto;
	margin: 50px auto 5px;
}
.cont_All section div ul {
	margin: 10px auto;
	padding: 0;
}
.cont_All section div ul li {
	list-style-type: none;
	display: inline-block;
}
.cont_All section div ul li:hover {
	cursor: pointer;
}
.cont_All p {
	margin: 15px;
}
/* 뮤직비디오 파트 */
.m_cont {
	border: 5px ridge lightgray;
	margin: 50px auto;
	width: 95%;
}

/* 뮤직비디오 iframe 크기 조정 */
.video-container {
	position: relative;
	padding-bottom: 56.25%;	/* 560:315 = 100:x 계산하면 x의 값은 56.25 */
	padding-top: 30px;
	height: 0;
	overflow: visible;
}

.video-container iframe,
.video-container object,
.video-container embed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

/* 컨텐츠 2,3 보이지 않게 설정 */
#cont_2_wrap, #cont_3_wrap {
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
					<li><a href="../recosong/recosong.jsp">추천노래</a></li>
					<li style="border-bottom: 2px solid #ac7339;">
						<a href="../video/music_v.jsp" class="on">뮤직비디오</a>
					</li>
					<li><a href="${path}/notice_servlet/list.do">소통</a></li>
				</ul>
			</div>
			<div class="lay_menu">
				<ul>
					<li id="s_tab1" style="color: #ac7339;" onclick="switch_t(1)">힙해요</li>
					<li id="s_tab2" onclick="switch_t(2)">감성에 퐁당</li>
					<li id="s_tab3" onclick="switch_t(3)">신나는 기분</li>
				</ul>
			</div>
		</header>
	</div>
	
	<div id="cont_wrap">
		<div class="cont_All" id="cont_1_wrap">
			<section>
				<h2>힙해요</h2>
				<div class="u_cont">
					<ul>
						<li id="pretty_please"><img src="https://i.ibb.co/VmPY5QG/prettyplease.jpg" width="166px" height="166px" title="힙하디 힙한 잭슨의 춤사위! [클릭]"></li>
						<li id="joke"><img src="https://i.ibb.co/41zwT0w/Joke.jpg" width="166px" height="166px" title="코드쿤스트 비트와 씨잼&쌈디의 맛깔나는 랩! [클릭]"></li>
						<li id="armadillo"><img src="https://i.ibb.co/fMSRjLf/armadillo.jpg" width="166px" height="166px" title="말이 필요없다... 그냥 한번 보시죠 [클릭]"></li>
						<li id="text_me"><img src="https://i.ibb.co/vYr8GgV/text-me.jpg" width="166px" height="166px" title="패션,랩,제스쳐 모두 멋진 DPR LIVE의 Text Me! [클릭]"></li>
					</ul>
				</div>
				<div class="m_cont">
					<div class="video-container">
						<iframe id="m_form1" src="https://www.youtube.com/embed/2EjxIQXBhlc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
					<p id="m_info1">Galantis & Jackson Wang - Pretty Please</p>
				</div>
			</section>
		</div>
		<div class="cont_All" id="cont_2_wrap">
			<section>
				<h2>감성에 퐁당</h2>
				<div class="u_cont">
					<ul>
						<li id="Ylang_Ylang"><img src="https://i.ibb.co/sJhrBLn/Ylang-Ylang.jpg" width="166px" height="166px" title="머릿속이 정화되는 FKJ의 피아노 소리... [클릭]"></li>
						<li id="whodoyoulove"><img src="https://i.ibb.co/c1DtpLP/team-baby.jpg" width="166px" height="166px" title="호스트의 인생곡... 너무 깊고 아름다운 노래 [클릭]"></li>
						<li id="medicine"><img src="https://i.ibb.co/0X4DVxw/medicine.jpg" width="166px" height="166px" title="Joji가 리믹스한 medicine... 감상에 젖기 좋은 노래 [클릭]"></li>
						<li id="photograph"><img src="https://i.ibb.co/JvSk0N9/photograph.jpg" width="166px" height="166px" title="offonoff가 만들어낸 명곡... 한강공원에서 사진찍고 싶어지는 노래 [클릭]"></li>
					</ul>
				</div>
				<div class="m_cont">
					<div class="video-container">
						<iframe id="m_form2" src="https://www.youtube.com/embed/EfgAd6iHApE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
					<p id="m_info2">Fkj - Ylang Ylang</p>
				</div>
			</section>
		</div>
		<div class="cont_All" id="cont_3_wrap">
			<section>
				<h2>신나는 기분</h2>
				<div class="u_cont">
					<ul>
						<li id="needyourlove"><img src="https://i.ibb.co/NjmyYDQ/need-your-love.jpg" width="166px" height="166px" title="당장에라도 배낭여행 가고싶어지는 노래!! God Gryffin [클릭]"></li>
						<li id="easylove"><img src="https://i.ibb.co/52c0MCC/easy-love.jpg" width="166px" height="166px" title="너무너무 신나는 철부지 꼬맹이가 되는 것 같은 노래~ [클릭]"></li>
						<li id="boat"><img src="https://i.ibb.co/P4k6qvy/boat.jpg" width="166px" height="166px" title="죠지의 낭만... 감성적인 목소리와 그렇지 않은 뮤비 [클릭]"></li>
						<li id="zombiepop"><img src="https://i.ibb.co/z6P7X1f/zombie-pop.jpg" width="166px" height="166px" title="진짜 보고있으면 해외여행 떠나고 싶어지는 노래... [클릭]"></li>
					</ul>
				</div>
				<div class="m_cont">
					<div class="video-container">
						<iframe id="m_form3" src="https://www.youtube.com/embed/A9dX-C5SBD4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
					<p id="m_info3">Gryffin & Seven Lions - Need your love (with Noah Kahan)</p>
				</div>
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