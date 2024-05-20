<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>IF ENTERTAINMENT-community</title>
	<meta id="_csrf" name="_csrf" content=${_csrf.token }>
	<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
	
	<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">
	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/toast-notification.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/page-tour.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/stories-zuck.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_goods.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/locationpicker.jquery.js"></script><!-- for loaction picker map -->
	<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/sweet.js"></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.userId" var="idInfo"/>
</sec:authorize>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/alam/jsAlam.js" defer="defer"></script> --%>
<script type="text/javascript">
	var userId = "${idInfo}";
	
	let ws = connection("ws://localhost/notiserver/" + userId);

	$(document).ready(function() {

		ws.onopen = function() {
			// 서버에 접속을 하였을 경우 별도의 이벤트 처리가 필요할경우 작성한다.
		};
		
		ws.onmessage = function(message) {
			// 수신된 메시지를 받아서 처리 하는 영역
			console.log("message", message);
			
			$(".noti").css("display", "block");
			$(".noti").addClass("animation-blink").css("display", "block");
		};
		
		ws.onerror = function(message) {
			// 서버에서 에러 메시지가 반환이 되었을경우 처리..
		};
		
	});
	
	/**
	 * 웹 소캣 connection 연결부
	 */
	function connection(url) {
		if ('WebSocket' in window) {
			return new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			return new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
			return null;
		}
	}
	 
	/**
	 * 페이지를 벗어 났을때 웹소켓 닫기..
	 */
	window.onbeforeunload = function() {
		ws.close();
	};
	</script>
	
<style type="text/css">

@font-face {
    font-family: 'LOTTERIACHAB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
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
	font-family: 'GmarketSansMedium', sans-serif;
}

/* 수정 */
.artistFeed {
	padding: 0;
}

.background-gradient {
        width: 100%;
        height: 300px;
        position: absolute;
        top: 0;
        left: 0;
        background-image: linear-gradient(0deg, rgb(255, 255, 255) 0%, rgb(193, 154, 255) 100%);
        z-index: 0; /* 배경이 다른 요소들 뒤에 나타나도록 설정합니다. */
    }

* {
	cursor: url(https://cur.cursors-4u.net/symbols/sym-7/sym646.ani),
		url(https://cur.cursors-4u.net/symbols/sym-7/sym646.gif), auto
		!important;
}

</style>

</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
	$(function(){
		Swal.fire({
			  icon: "success",
			  title: "${message}",
			  showConfirmButton: false,
			  timer: 1500
		});
	});
	<c:remove var="message" scope="request"/>
	<c:remove var="message" scope="session"/>
	</script>
</c:if>

<body style="padding:0px;">
	<div class="theme-layout">
		<div class="postoverlay"></div>
		
		<!-- 헤더영역 -->
		<tiles:insertAttribute name="header"/>
		
		<!--컨텐츠-->
		<section>

			<div class="gap2 gray-bg artistFeed" style="background-color: #fff;">
				<div class="background-gradient"></div>
					<div class="container" style="max-width: 65%;">
						<div class="row">
							<div class="col-lg-12">
								<!-- <div class="row merged20" id="page-contents"> -->

							
								<!-- 컨텐츠영역 -->
								<tiles:insertAttribute name="content"/>

								
								<!-- </div> -->
							</div>
						</div>
					</div>
			</div>
		</section>


		<!-- 푸터 영역 -->
		<tiles:insertAttribute name="footer"/>
		
	</div>



<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-stories.js"></script>
	<!--<script src="js/toast-notificatons.js"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js"></script>
	<!-- For timeline slide show -->
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3vI4IQqzxRU1449lbIHThUb2gCeDW47w&callback=initMap"></script> -->
	<!-- for location picker map -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/locationpicker.jquery.js"></script><!-- for loaction picker map --> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/map-init.js"></script><!-- map initilasition --> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/page-tourintro.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/page-tour-init.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck-necessery.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck-init.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
<script>
var header = "";
var token = "";
$(function(){
	// 시큐리티 적용 시, header 키 값과 토큰을 설정 ㅇ
	// (동적 페이지마다 전역변수로 설정된 header, token을 가져다 쓸 수 있다)
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
});

(function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

ChannelIO('boot', {
  "pluginKey": "0288638e-943b-4527-bfb3-ef369997897e"
});

</script>

</body>

</html>