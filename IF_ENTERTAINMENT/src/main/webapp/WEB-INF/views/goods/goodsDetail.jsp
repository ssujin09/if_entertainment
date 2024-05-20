<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   	<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css/color.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css/color-pink.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css/responsive.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
<style>
.digi-meta {
    display: flex;
    flex-direction: column;
    height: 120px;
    justify-content: space-between;
}

.digi-meta a {
    min-height: 100px; 
    display: block; 
    overflow: hidden;
    color: #535165 !important;
}

.central-meta {
border : none;
}


.price-cart-container {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}


.add-to-cart-buttons {
display: flex;
justify-content: space-between; /* 버튼들 사이에 공간을 균등하게 배분 */
margin-top: 20px; 


}
.qty1 {
	 width: 200px; 
    height: 80px;
}
/* 버튼에 대한 스타일 */
.shopnow {
    flex-grow: 1;
    margin: 0 5px;
    text-align: center;
    padding: 20px; /* 상하좌우 패딩을 조정 */
    font-size: 50px; /* 텍스트 크기를 늘림 */
    width: 200px; /* 너비 지정 */
    height: 80px; /* 높이 지정 */
     margin-top: 10px; /* 버튼과 가격 사이의 간격 조정 */
}

/* 첫 번째 버튼에만 왼쪽 여백을 제거 */
.shopnow-left {
    margin-left: 0;
}

/* 마지막 버튼에만 오른쪽 여백을 제거 */
.shopnow-right {
    margin-right: 0;
}
.no_dot {
  list-style-type: none;	
}
.incre {
  display: flex;
  align-items: center; 
  justify-content: center; 
  width: 80px;
  height: 50px;
  font-size: 35px;
  margin-left: 180px;
}

.incre button {
  padding: 5px 10px; 
  font-size: 20px; 
  margin: 0 5px;
}
.incre input {
  padding: 10px 20px;
  font-size: 20px;
  margin: 0 5px;
  width: 100px;
  text-align: center;
}

.price-container {
    margin-left: auto; 
    display: flex;
    align-items: center; 
    width: 100%; 
}

.priced {
	margin-top:7px;
    margin-left: 120px;
    display: flex; 
    align-items: center; 
   
}

</style>

</head>
<body>
<section>
	<div class="gap2 no-bottom">
		<div class="container">
			<div class="row">	
				<div class="col-lg-12">
					<div class="prod-detail">
						<div class="row">
							<div class="col-lg-6" >
								<div class="central-meta-bo">
								<ul class="no_dot">
											<li><img src="${goodsVO.goodsThumbnail }" alt="" style="width: 655px; height: 605px;"></li>
											</ul>
								</div>	
							</div>
							<div class="col-lg-6" id="product-container">
	  								<div class="central-meta-bo">
									<div class="full-postmeta">
										
										<i><a style="font-size: 22px;" href="/goods/shopList.do?agId=${goodsVO.goodsArtist}">${goodsVO.goodsArtist}</a>&nbsp;>&nbsp;<a style="font-size: 22px;" href="/goods/shopList.do?agId=${goodsVO.goodsArtist }&gcId=${goodsVO.gcId}">${goodsVO.gcId}</a></i>
	
	
										<h4>${goodsVO.goodsName }</h4>
										<p>
											배송 예정일은 상품 및 물류 상황에 따라 지연될 수 있습니다.<br/>
											일정이 변경될 경우 개별 안내될 예정입니다. <br/>
										</p>
										<p style="font-size: 19px;">
										현재 재고(${goodsVO.goodsQuantity })개
										</p>
										
										<form class="incre">
										      <button type="button" id="decrease-qty">-</button>
										    <input class="qty1" type="text" name="value" value="1">
										    <button type="button" id="increase-qty">+</button>
										     <span class="priced">
									        <fmt:formatNumber value="${goodsVO.goodsPrice}" pattern="#,###"/><span>원</span> 
									    </span>
										    <sec:csrfInput/>
										</form>
	
								<form action="/goods/goodsPurchase.do" method="post" id="purchaseForm">
									<input type="hidden" id="cartName" name="cartName" value="${goodsVO.goodsName }">
									<input type="hidden" id="authDate" name="authDate" value="${authDate }">
									<input type="hidden" id="odNo" name="odNo" value="${odNo }">
									<input type="hidden" id="goodsMembership" name="goodsMembership" value="${goodsVO.goodsMembership }">
									<input type="hidden" id="gcId" name="gcId" value="${goodsVO.gcId }">
									<input type="hidden" id="cartPrice" name="cartPrice" value="${goodsVO.goodsPrice }">
									<input type="hidden" id="cartQuantity" name="cartQuantity" value="3">
									<input type="hidden" id="goodsNo" name="goodsNo" value="${goodsVO.goodsNo }">
									<input type="hidden" id="goodsQuantity" name="goodsQuantity" value="${goodsVO.goodsQuantity }">
									<input type="hidden" id="goodsThumbnail" name="goodsThumbnail" value="${goodsVO.goodsThumbnail }">
									<input type="hidden" id="cartThumbnail" name="cartThumbnail" value="${goodsVO.goodsThumbnail }">
									<span class="prices style4" style="text-align: right;">
									    <!-- 기존의 <ins> 태그 내에 위치한 가격 표시 부분 -->
									
									</span>
									<div style="margin-top: 50px">
									<span class="total-amount" >총 상품금액(<span id="qty-total">1</span>개) <span id="total-price"><fmt:formatNumber value="${goodsVO.goodsPrice}" pattern="#,###"/></span>원</span>
									
									</div>
								<div class="add-to-cart-buttons">
								    <a class="shopnow shopnow-left"  id="add-to-cart" title="" href="#">카트 담기</a>
								    <a id="go-to-cart" href="cart.html" style="display:none;">장바구니로 이동</a>
								   <a class="shopnow shopnow-right" id="submitBtn" href="#">바로 구매</a>
								</div>
								<c:if test="${goodsVO.goodsQuantity == 0}">
								 <div id="sold-out-overlay" style="display:none; position:absolute; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5); color:white; justify-content:center; align-items:center; display:flex; font-size:24px;">
							        매진
							    </div>
							    </c:if>
								<sec:csrfInput/>
								</form>	
									  </div>  
									  
									</div>
								</div>
	  							</div>
						</div>
						<div class="gap2 no-bottom">
						    <div class="more-about">
						        <div class="central-meta-bo">
						            <div class="row"> 
						                <div class="col-md-12 offset-md-3"> <!-- col-md-9로 화면의 9칼럼을 차지하고, offset-md-2로 왼쪽에 2칼럼만큼의 공간을 둠 -->
						                    <img src="${gaDetailimg}" alt="Your Image Description" class="img-fluid"> <!-- img-fluid 클래스로 이미지가 부모 요소의 너비에 맞게 조절됨 -->
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
	
						<div class="central-meta-bo">
							<span class="title2">이달의 추천 상품</span>
							<div class="row">
							<c:forEach items="${goodsList}" var="goods"  varStatus="loop">
										<div class="col-lg-3 col-md-6">
											<div class="dig-pro">
												<figure>
													<img src="images/resources/dig-product1.jpg" alt="">
													<div class="user-avatr">
														<img alt="" src="images/resources/admin.jpg">
														<div>
															<span>Posted by</span>
															<ins>Jack Carter</ins>
														</div>	
													</div>
												</figure>
												<div class="digi-meta">
													
												<a href="/goods/shopDetail.do?goodsNo=${goods.goodsNo }">
												<img src="${goods.goodsThumbnail }" alt="">
												</a>
												<div class="user-avatr">
												        	<img src="${pageContext.request.contextPath }/resources/upload/ezgif.com-animated-gif-maker.gif" alt=""><br/>
					                                <img alt="" src="images/resources/admin.jpg">
<!-- 					                                <div> -->
<%-- 					                                    <img src="${pageContext.request.contextPath}/resources/upload/group/ezgif.com-animated-gif-maker.gif" alt="설명" class="profile-img"> --%>
<!-- 					                                </div> -->
					                            </div>
												<a href="/goods/shopDetail.do?goodsNo=${goods.goodsNo }" style="color: #535165 !important">
													${goods.goodsName} 
												</a>
													<div class="rate">
														<span class="qeemat" style="font-size: 18px;"><fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###원" /></span>
													</div>
												</div>
											</div>
										</div>
								</c:forEach>
										</div>												
										</div>												
									</div>
								</div>
							</div>
						</div>
	</section><!-- picture area -->
</body>
	<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function () {
    var price = ${goodsVO.goodsPrice}
 

//     var formattedPrice = formatter.format(price);
//     document.getElementById('total-price').innerHTML = formattedPrice;
});

$(document).ready(function() {
    $('#submitBtn').click(function(event) {
        event.preventDefault();

        var odNo = $('#odNo').val();
        var gcId = $('#gcId').val();
        var goodsMembership = $('#goodsMembership').val();
        var authDate = $('#authDate').val();
        var cartName = $('#cartName').val();
        var cartPrice = $('#cartPrice').val();
        var goodsNo = $('#goodsNo').val();
        var goodsThumbnail = $('#goodsThumbnail').val();
        var qtyTotal = $('#qty-total').text(); 
        console.log("cartName", cartName);
        console.log("qtyTotal", qtyTotal);
        $('#cartQuantity').val(qtyTotal);
        
        

        // 구매 로직 시작
        if ((gcId != 'MEMBERSHIP' || (gcId == 'MEMBERSHIP' && authDate > 0)) || (gcId == 'MEMBERSHIP' && goodsMembership == 'M') || (goodsMembership == 'Y' && odNo != null && odNo.trim() !== '')) {
            if (goodsMembership == 'Y' && odNo != null && odNo.trim() !== '') {
                swal.fire({
                    title: "계정당 1번만 구매 가능한 상품입니다!",
                    text: "다른 상품을 확인해보세요!",
                    icon: "error",
                    confirmButtonText: '확인',
                });
            } else {
            	 $('#purchaseForm').submit();
            }
        } else {
            swal.fire({
                title: "멤버십을 구매하세요!",
                text: "멤버십을 구매해야 구매할 수 있는 상품입니다!",
                icon: "error",
                confirmButtonText: '확인',
            });
        }
    });
});




$(document).ready(function() {
	var goodsQuantity = parseInt($('#goodsQuantity').val(), 10);
	var gcId = $('#gcId').val();
	console.log("gcId", gcId);
	console.log("goodsQuantity", goodsQuantity);
	
    
	// 수량 증가 버튼을 클릭했을 때
	$('#increase-qty').on('click', function() {
	    var currentQty = parseInt($('.qty1').val());

	    // gcId가 'MEMBERSHIP'이고 현재 수량이 이미 1인 경우
	    if (gcId == 'MEMBERSHIP' && currentQty >= 1) {
	        Swal.fire({
	            icon: "error",
	            title: "멤버십 상품은 1개만 구매 가능합니다.",
	            showConfirmButton: false,
	            timer: 1500
	        });
	    }
	    
	    // 1인 구매 제한 수량을 초과하지 않는지 확인
	    else if (currentQty >= 5) {
	        Swal.fire({
	            icon: "error",
	            title: "1인 구매 제한 수량은 5개입니다.",
	            showConfirmButton: false,
	            timer: 1500
	        });
	    }
	    
	    // 재고 수량 초과하지 않고, 5개 이하인 경우 수량 증가
	    else if (currentQty < goodsQuantity && currentQty < 5) {
	        $('.qty1').val(currentQty + 1).trigger('input');
	    } else {
	        Swal.fire({
	            icon: "error",
	            title: "현재 재고보다 많은 수량은 구매할 수 없습니다.",
	            showConfirmButton: false,
	            timer: 1500
	        });
	    }
	});


    // 수량 감소 버튼을 클릭했을 때
    $('#decrease-qty').on('click', function() {
        var currentQty = parseInt($('.qty1').val());
        if(currentQty > 1) { 
            $('.qty1').val(currentQty - 1).trigger('input');
        }
    });

    // 수량 입력 필드의 값이 변경될 때
    $('.qty1').on('input', function() {
        var qty = parseInt($(this).val(), 10);
        if(isNaN(qty) || qty < 1) {
            alert('유효한 수량을 입력하세요.');
            $(this).val(1); 
            return;
        } else if (qty > goodsQuantity) {
        	Swal.fire({

        		  icon: "error",
        		  title: "현재 재고보다 많은 수량은 구매할 수 없습니다.",
        		  showConfirmButton: false,
        		  timer: 1500
        		});
            $(this).val(goodsQuantity); 
            return;
        } else if (qty > 4 ) {
        	Swal.fire({

      		  icon: "error",
      		  title: "1인 구매제한 갯수는 5개 입니다.",
      		  showConfirmButton: false,
      		  timer: 1500
      		});
        	
        	
        }

        var goodsPrice = parseInt('${goodsVO.goodsPrice}'.replace(/,/g, ''), 10);
        var totalPrice = qty * goodsPrice;
        $('#qty-total').text(qty);
        $('#total-price').html(totalPrice.toLocaleString());
    });
});


$(document).ready(function() {
	$(".input-group-btn").css("opacity", "0");
	
    $('#add-to-cart').click(function(event) {
        event.preventDefault();

        var odNo = $('#odNo').val();
        console.log("odNo", odNo);
        var gcId = $('#gcId').val();
        var goodsMembership = $('#goodsMembership').val();
        var authDate = $('#authDate').val();
        var cartName = $('#cartName').val();
        var cartPrice = $('#cartPrice').val();
        var goodsNo = $('#goodsNo').val();
        var goodsThumbnail = $('#goodsThumbnail').val();
        var qtyTotal = $('#qty-total').text(); 
        console.log("qtyTotal", qtyTotal);
		
        if ((gcId != 'MEMBERSHIP' || (gcId == 'MEMBERSHIP' && authDate > 0)) || (gcId == 'MEMBERSHIP' && goodsMembership == 'M') || (goodsMembership == 'Y' && odNo != null && odNo.trim() !== '')) {
            if (goodsMembership == 'Y' && odNo != null && odNo.trim() !== '') {
                // 계정당 한 번만 구매 가능한 상품입니다 메시지 표시
                swal.fire({
                    title: "계정당 1번만 구매 가능한 상품입니다!",
                    text: "다른 상품을 확인해보세요!",
                    icon: "error",
                    confirmButtonText: '확인',
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: "/goods/goodsCart.do",
                    contentType: "application/json",
                    data: JSON.stringify({
                        cartName: cartName,
                        cartPrice: cartPrice,
                        goodsNo: goodsNo,
                        cartQuantity: qtyTotal,
                        cartThumbnail: goodsThumbnail
                    }),
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        swal.fire({
                            title: "카트에 추가되었습니다!",
                            text: "장바구니로 이동하시겠습니까?",
                            icon: "success",
                            showCancelButton: true,
                            confirmButtonText: '예',
                            cancelButtonText: '아니오',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/goods/goodsCart.do';
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        swal.fire({
                            title: "이미 담겨있는 상품입니다!",
                            text: "장바구니로 이동하시겠습니까?",
                            icon: "error",
                            showCancelButton: true,
                            confirmButtonText: '예',
                            cancelButtonText: '아니오',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/goods/goodsCart.do';
                            }
                        });
                    }
                });
            }
        } else {
            // MEMBERSHIP 카테고리인데 authDate 조건을 만족하지 못하고, 특별 조건도 만족하지 못할 경우
            swal.fire({
                title: "멤버십을 구매하세요!",
                text: "멤버십을 구매해야 구매할 수 있는 상품입니다!",
                icon: "error",
                confirmButtonText: '확인',
            });
        }

    }); 
}); 

</script>


	
</html>