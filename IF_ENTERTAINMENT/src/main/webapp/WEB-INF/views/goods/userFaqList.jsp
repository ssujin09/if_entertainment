<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
    .btn.btn-link > span {
        color: white;
        font-size: 12px;
        position: absolute;
        right: 20px;
        top: 13px;
    }

    .gradient-badge {
        background: #9551fc;
    }
    
    .card-footer {
    	border-top: none;
    }
    
    .card * {
    	font-size: 20px !important;
    }
    
    .card-body {
	    min-height: 150px;
	    padding: 1.25rem;
	    padding-top: 40px;
	}
	
	.card-header {
	    margin-top: 20px !important;
	    margin-bottom: 20px !important;
	}
	
	.card:first-child {
		border-top: 1px solid #dddddd;
	}
    
</style>

<section>
	<div class="gap">
		<div class="container">
			<div class="row" id="page-contents">

				<div class="col-lg-12">

					<div class="pitnik-title">
						<h1>FAQ</h1>
<!-- 						<p> -->
<!-- 							굿즈샵 관련 문의사항이 있으시면 밑 버튼을 클릭하여 문의해 주세요. <br /> 저희는 항상 여러분의 의견에 귀 -->
<!-- 							기울이고 도와드리겠습니다. -->
<!-- 						</p> -->
					</div>

					<div class="faq-area">
						<div style="display: flex; justify-content: space-between; align-items: center;">
							<h4 style="display: flex;">📌 자주묻는 질문</h4>
							<div class="card-footer prod-footer clearfix" id="pagingArea" style="display: flex; justify-content: flex-end; background-color: transparent; border: none;">
								<form method="post" id="searchForm">
									<div class="custom-searchform-box" style="display: flex;">
										<input type="text" name="searchWord" placeholder="검색" value="${searchWord }" style="margin-right: 10px">
										<button type="submit">검색</button>
									</div>
									<sec:csrfInput/>
								</form>
							</div>
						</div>
							<p>자주묻는 질문에 원하는 답변이 없을 땐 1:1문의하기를 이용해주세요</p>
						<div class="accordion" id="accordion">
						<c:set value="${pagingVO.dataList }" var="faqList"/>
						<c:choose>
							<c:when test="${empty faqList }">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#collapseOne"
												aria-expanded="false" aria-controls="collapseOne">
												faq내역이 존재하지 않습니다.</button>
										</h5>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${faqList }" var="faq" varStatus="loop">
									<div class="card" style="border-bottom: 1px solid #dddddd;">
										<div class="card-header" id="heading${loop.index}">
											<h5 class="mb-0">
												<button class="btn btn-link collapsed" type="button"
													data-toggle="collapse" data-target=#collapse${loop.index}
													aria-expanded="false" aria-controls="collapseThree">
													${faq.bfTitle }</button>
											</h5>
										</div>
										<div id="collapse${loop.index}" class="collapse"
											aria-labelledby="headingThree" data-parent="#accordion">
											<div class="card-body">${faq.bfContent }</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							
						</div>
					</div>
					<div class="card-footer prod-footer clearfix" id="pagingArea">
						<form method="post" id="searchForm">
							<input type="hidden" name="page" id="page" />
<!-- 							<div class="custom-searchform-box" style="display: flex"> -->
<%-- 								<input type="text" name="searchWord" placeholder="검색" value="${searchWord }"> --%>
<!-- 								<button type="submit">검색</button> -->
<!-- 							</div> -->
							<sec:csrfInput/>
						</form>
						${pagingVO.pagingHTML }
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
    $(function () {
        var pagingArea = $("#pagingArea");
        var searchForm = $("#searchForm"); // searchForm 변수를 정의

        pagingArea.on("click", "a", function (event) {
            event.preventDefault();
            var pageNo = $(this).data("page");
            searchForm.find("#page").val(pageNo);
            searchForm.submit();
        });

    });

 	// 페이지 로딩 후 아코디언을 닫은 상태로 시작
    $('.collapse').collapse('hide');

    // 아코디언 헤더를 클릭하면 해당 아코디언 열기/닫기
    $('.card-header').click(function() {
        var collapse = $(this).next('.collapse');
        collapse.collapse('toggle'); // 클릭된 아코디언 열거나 닫기

        // 클릭된 아코디언 이외의 다른 아코디언 닫기
        $('.collapse').not(collapse).collapse('hide');
    });
    
    
</script>