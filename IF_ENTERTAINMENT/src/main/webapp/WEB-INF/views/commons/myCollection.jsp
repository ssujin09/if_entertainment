<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<style>
/* 전체 스타일 초기화 */
*,
*::after,
*::before {
	box-sizing: border-box;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 전체 페이지 스타일 */
body {
	font-family: 'GmarketSansMedium', sans-serif;
    margin: 0;
    color: black;
    background-color: white;
    font-weight: 600;
    width: 100%;
    overflow-x: hidden;
}

/* 컨테이너 스타일 */
.container {
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%); /* 그라데이션 배경화면 */
   	width: 100vw;
    height: 100vh;
    height: -webkit-fill-available;
    position: absolute;
    left: 0;
    top: 0;
    user-select: none;
    overflow: hidden;
}

/* 중앙 정렬 클래스 */
.center {
    height: 100vh;
    position: absolute;
    left: 50%;
    top: 28%;
    transform: translate(-50%);
    user-select: none;
}

/* 카드 아이템 그룹 */
.items {
    transform-origin: center 200vh;
    transform: rotate(0);
    user-select: none;
    display: flex;
}

/* 카드 아이템 */
.item {
    position: absolute;
    user-select: none;
    cursor: pointer;
    transform: translateX(-50%);
}

/* 카드 스타일 */
.card {
    display: flex;
    flex-direction: column;
	justify-content: space-between;
	align-items: stretch;
    width: 430px;
    height: 610px;
    color: #fff;
    user-select: none;
    border-radius: 17px;
    overflow: hidden;
    cursor: grab;
    position: relative;
    border: 10px solid transparent; /* 초기에는 투명한 보더 */
    animation: holographic 0.5s linear infinite alternate; /* 홀로그래픽 애니메이션 적용 */
  	background-image: linear-gradient(to top, #d5dee7 0%, #ffafbd 0%, #c9ffbf 100%); /* 카드 그라데이션 */
}
   
/* 홀로그래픽 애니메이션 */
@keyframes holographic {
    0% {
        border-color: hsla(262, 58%, 76%, 0.7); /* 보더의 시작 색상 (밝은 분홍색) */
    }
    100% {
        border-color: hsla(213, 79%, 76%, 0.7); /* 보더의 끝 색상 (더 어두운 분홍색) */
    }
}

/* 이미지 스타일 */
.image {
	padding: 5px;
   	width: 60%;
   	object-fit: cover;
   	position: absolute;
   	top: 22px;
   	left: 82px;
   	filter: grayscale(100);
   	pointer-events: none;
}

/* 미디어 쿼리: 카드 크기 조정 */
@media screen and (max-height: 1000px) {
    .card {
        width: 350px;
        height: 497px;
    }
}

@media screen and (max-height: 800px) {
    .card {
        width: 300px;
        height: 400px;
    }
}

/* 정보 스타일 */
.info {
	position: absolute;
    z-index: 20;
    top: 10px;
    left: 10px;
}

/* 콜렉션 설명 스타일 */
.col_description{
   	position: relative;
    height: 45%;
    top: 330px;
    background-color: white;
    opacity: 0.6;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
}
  
.des_title, .des_date, .des_content {
  	position: relative;
  	color: black;
	z-index: 1;
}
  
.des_title {
  	font-weight: bolder;
	margin-bottom: 2px;
}
  
.des_date{
	font-size: 20px;
}
  
.des_content{
	margin-top: 10%;
  	font-size: 19px;
}
/* 버튼 css */
.custom-btn {
	font-size: larger;
    left: 90px;
    top: 70px;
    width: 180px;
    height: 60px;
    color: blueviolet;
    border-radius: 5px;
    padding: 10px 25px;
    font-weight: 900;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px 0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
    outline: none;
}

.btn-16 {
	border: none;
}

.btn-16:after {
	position: absolute;
	content: "";
	width: 0;
	height: 100%;
	top: 0;
	left: 0;
	direction: rtl;
	z-index: -1;
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	transition: all 0.3s ease;
}

.btn-16:hover {
	color: #fff;
	background: #6f42c1;
}

.btn-16:hover:after {
	left: auto;
	right: 0;
	width: 100%;
	border-radius: 7px;
}

.btn-16:active {
	top: 2px;
}

</style>
<input type="hidden" id="ctId" value="${ctId }" />
<main>
	<button class="custom-btn btn-16" onclick="window.history.back();" style="z-index: 100;">뒤로가기</button>
	<div class="container">
		<div class="center">
			<div class="items">
				<c:forEach items="${collectionList }" var="collection" varStatus="vs">
					<div class="item">
						<div class="card">
							<img class="image" src="${pageContext.request.contextPath }/resources/collection/${vs.count }.png" <c:if test="${collection.collectionDone eq 'Y' }">style="filter:grayscale(0)"</c:if>/>
							<div class="col_description">
								<h1 class="des_title">${collection.ctName }</h1>
								<div class="des_date">
									<fmt:parseDate value="${collection.collectionDate }" var="collectionDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${collectionDate }" pattern="yyyy.MM.dd" />
								</div>
								<div class="des_content">
									<c:choose>
										<c:when test="${collection.collectionDone eq 'Y' }">
											${collection.ctGoal }
										</c:when>
										<c:otherwise>
											업적을 달성하여 컬렉션을 모아보세요!
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${collectionList }" var="collection"
					varStatus="vs">
					<div class="item">
						<div class="card">
							<img class="image" src="${pageContext.request.contextPath }/resources/collection/${vs.count }.png" <c:if test="${collection.collectionDone eq 'Y' }">style="filter:grayscale(0)"</c:if>/>
							<div class="col_description">
								<h1 class="des_title">${collection.ctName }</h1>
								<div class="des_date">
									<fmt:parseDate value="${collection.collectionDate }" var="collectionDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${collectionDate }" pattern="yyyy.MM.dd" />
								</div>
								<div class="des_content">
									<c:choose>
										<c:when test="${collection.collectionDone eq 'Y' }">
											${collection.ctGoal }
										</c:when>
										<c:otherwise>
											업적을 달성하여 컬렉션을 모아보세요!
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
    integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/Draggable.min.js"
    integrity="sha512-G7Wpe/pbg+zjyyM9HgQY6kacLAy+580lmA8DUXmZtioTI5FkaCRoLOaCLoeblrZABs7KZFD03cfSV9j7nmwxfw=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
// $(function(){
// 	setInterval(() => {
// 		$(".card img").eq(0).css("filter", "grayscale(0)");
// 	}, 2000);
// });

window.onload  = function() { 
	
	var selectedCardIndex = Number($("#ctId").val() - 1);
	
    // HTML 요소들을 배열로 가져옵니다.
    const images = gsap.utils.toArray(".item");

    // 이미지 총 개수를 imageSize 변수에 할당합니다.
    const imageSize = images.length;

    // 이미지 총 개수를 total 변수에 할당합니다.
    const total = images.length;

    // 이미지당 회전 각도를 계산합니다.
    const degree = 360 / total;

    const init = () => {
        const timeline = gsap.timeline();

        images.forEach((image, index) => {
            const sign = Math.floor((index / 2) % 2) ? 1 : -1;
            const value = Math.floor((index + 4) / 4) * 4;
            const rotation = index > imageSize - 3 ? 0 : sign * value;

            gsap.set(image, {
                rotation: rotation,
                scale: 0.5,
            });

            timeline.from(
                image,
                {
                    x: () => index % 2 ?
                        window.innerWidth + image.clientWidth * 4 :
                        -window.innerWidth - image.clientWidth * 4,
                    y: () => window.innerHeight - image.clientHeight,
                    rotation: index % 2 ? 200 : -200,
                    scale: 4,
                    opacity: 1,
                    ease: "power4.out",
                    duration: 1,
                    delay: 0.15 * Math.floor(index / 2),
                },
                0
            );

            let rotationAngle = index * degree;
            timeline.to(
                image,
                {
                    scale: 1,
                    duration: 0,
                },
                0.15 * (imageSize / 2 - 1) + 1
            );

            timeline.to(
                image,
                {
                    transformOrigin: "center 200vh",
                    rotation: index > imageSize / 2 ? -degree * (imageSize - index) : rotationAngle,
                    duration: 1,
                    ease: "power1.out",
                },
                0.15 * (imageSize / 2 - 1) + 1
            );

            // 만약 현재 인덱스가 중앙에 오도록 설정한 인덱스와 같다면 중앙으로 이동하는 애니메이션 추가
            if (index === selectedCardIndex) {
                timeline.to(
                    ".items",
                    {
                        rotation: -rotationAngle,
                        duration: 1,
                        ease: "power1.out",
                    },
                    0.15 * (imageSize / 2 - 1) + 1
                );
            }
        });

        // 드래그 가능한 기능 추가 함수를 호출합니다.
        draggable();
    };

    // 특정 카드가 중앙에 오도록 설정할 인덱스를 지정합니다.
    selectedCardIndex = Number($("#ctId").val() - 1);

    // 드래그 가능한 기능을 추가하는 함수를 선언합니다.
    const draggable = () => {
        // 드래그 시작 시점의 초기 값을 저장하는 변수를 선언합니다.
        let start = 0;
        Draggable.create(".items", {
            type: "rotation",

            // 드래그가 시작될 때의 동작을 정의합니다.
            onDragStart: function () {
                start = this.rotation;
            },

            // 드래그가 끝날 때의 동작을 정의합니다.
            onDragEnd: function () {
                // 드래그 종료 시점의 회전값을 저장합니다.
                const rotation = this.rotation;
                // 회전값의 변화량을 계산합니다.
                const offset = Math.abs(rotation - start);
                // 기존 각도의 절반을 계산합니다.
                const halfDegree = degree / 2;

                // 드래그 방향에 따라 애니메이션을 적용합니다.
                if (rotation > start) {
                    if (offset < halfDegree) {
                        gsap.to(".items", {
                            rotation: "-=" + offset,
                        });
                    } else {
                        gsap.to(".items", {
                            rotation: "-=" + halfDegree,
                        });
                    }
                } else {
                    if (offset < halfDegree) {
                        gsap.to(".items", {
                            rotation: "+=" + offset,
                        });
                    } else {
                        gsap.to(".items", {
                            rotation: "+=" + halfDegree,
                        });
                    }
                }

                // 드래그가 끝나면 회전 각도를 보정하여 중앙에 가까운 이미지를 중앙에 고정
                const currentRotation = gsap.getProperty(".items", "rotation");
                const correctedRotation = Math.round(currentRotation / degree) * degree;
                gsap.to(".items", {
                    rotation: correctedRotation,
                    duration: 0.5,
                });
            },
        });
    };

    // 초기화 함수를 호출합니다.
    init();
}
</script>
