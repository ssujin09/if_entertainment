<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@font-face {
	font-family: 'LOTTERIACHAB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansTTFMedium', sans-serif;
}

.support_check input, button {
    margin-top: 0; 
}

button {
    margin: 5px; 
}

.custom-btn {
    width: 200px;
    height: 45px;
    color: #fff;
    border-radius: 5px;
    padding: 0;
    font-family: 'GmarketSansMedium', sans-serif; 
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px 0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
    outline: none;
    margin-bottom: 30px;
    margin-top: 10px;
}

.owl-item {
	transition: transform 0.5s;
}

/* 활성화된 아이템 스타일 */
.owl-item.active.center {
	transform: scale(1.5); /* 크기를 20% 키웁니다 */
}

.gray-bg {
	float: left;
	width: 100%;
	background: none;
}

.central-meta {
	background: none; /* 백그라운드 컬러 없애기 */
	border: none; /* 보더 없애기 */
	padding: 50px;
}

*, *::before, *::after {
	box-sizing: border-box;
}

.btn-2 {
  background: rgb(96,9,240);
  background: linear-gradient(0deg, rgba(96,9,240,1) 0%, rgba(129,5,240,1) 100%);
  border: none;
  
}
.btn-2:before {
  height: 0%;
  width: 2px;
}
.btn-2:hover {
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .5), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .4);
}

.artname {
    max-width: 748px;
    margin: 0 auto;
}

.artname .big_ttl {
    text-align: center;
}

.big_ttl, .artname h1 {
    position: relative;
    font-weight: 700;
    
}

.btn_auz {
    display: inline-flex;
    align-items: center;
    font-weight: 600;
    text-align: center;
    margin-left: 306px;
}

.artname .btn_prev {
    font-size: 0.83rem;
    opacity: 0.3;
    text-align: center;
}

.scroll-container {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}

.art_intro {
    text-align: center; /* 텍스트를 수평 가운데 정렬합니다. */
    overflow-wrap: break-word; /* 단어 단위로 줄바꿈 */
	white-space: normal; /* 내용을 필요에 따라 줄바꿈 */
}

.art_intro img {
    display: block; /* 이미지를 블록 요소로 설정하여 중앙 정렬을 쉽게 합니다. */
    margin: 0 auto; /* 가로로 가운데 정렬합니다. */
}

.art_intro h5 {
    margin-top: 50px;
    margin-bottom: 50px;
}

.owl-prev::before, .owl-next::before {
    background: #fff;
    border-radius: 50%;
    color: #9551fc;
    display: inline-block;
    font-family: fontawesome;
    font-size: 18px;
    line-height: 30px;
    position: absolute;
    text-align: center;
    top: -125%;
    transform: translateY(-50%);
    width: 30px;
    box-shadow: 0 3px 7px rgba(0, 0, 0, .5);
    transition: all 0.2s linear 0s;
}
.custom-btn .tablinks {
    font-size: 20px; /* 원하는 글씨 크기로 조정 */
}

</style>
</head>
<body>

<!-- 상단 아티스트 이름 -->
<div class="artname">
<!-- a에 뒤로가기 스크립트 작성하기 -->
		<a class="btn_auz">💎 ALL ARTISTS 💎</a>
			<h2 class="big_ttl" style="line-height: 2.2;">🎤 ${profile.agName }</h2>
			<hr>
</div>
		
<div class="scroll-container">
    <div class="scroll">
        <button class="custom-btn btn-2">
		    <a href="#1" class="tablinks active" onclick="openTab(event, 'Profile')">Profile</a>
		</button>
        <button class="custom-btn btn-2">
            <a href="/entertain/artist/album/list.do?agId=${profile.agId}" class="tablinks" onclick="openTab(event, 'Album')">Artist Album</a>        </button>
    </div>
</div>


<div id="Profile" class="tabcontent">

<div class="artname">
<div class="art_intro">
    <img src="${pageContext.request.contextPath }/resources/artImg/${profile.agProfile}" alt="" style="width: 760px; height: 520px; object-fit: cover; border-radius: 7px;">
    <h5 style="text-align: left;">${profile.agIntro }</h5>
</div>
</div>

	<div class="artname">
		<!-- <span class="create-post">🌈 Member</span>d -->
		<h3 class="big_ttl" style="line-height: 2.2; margin-bottom: 50px; margin-bottom: 50px;">🌈 Member</h3>
		<ul class="suggested-frnd-caro invite">
			<c:forEach var="artist" items="${artistList }">
				<li><img src="${artist.userProfile }" alt="">
					<div class="sugtd-frnd-meta">
						<h6 style="font-weight: bold;">${artist.artistFakename}</h6>
						<fmt:parseDate value="${artist.artistBirth}" var="artistBirth" pattern="yyyy-MM-dd" />
						<span style="color: #9551fc;"><fmt:formatDate value="${artistBirth }" pattern="yyyy년 MM월 dd일"/></span>
					</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
				
	</div>
</body>

<script>
function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>

</html>