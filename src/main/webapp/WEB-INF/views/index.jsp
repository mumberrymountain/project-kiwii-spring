<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KIWII</title>
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/index.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/alert.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@7400&family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link rel="shortcut icon" type="image/x-icon" href="/img/kiwii_head_icon.ico">
        
        <style>
            .bx-wrapper{box-shadow: 0 0 0;}
            .bx-wrapper .bx-pager{
                display: none;
            }

            .bx-wrapper .bx-controls-direction a {
                z-index: 10;
            }

            .recommend-container>.bx-wrapper{
                margin-top: 15px;
            }

            .recommend-container .bx-prev{
                position: absolute;
                top: 50%;
                transform: translateX(-50%);
                left: 0%;
            }

            .recommend-container .bx-next{
                position: absolute;
                top: 50%;
                transform: translateX(-50%);
                left: 100%;
            }
        </style>
    </head>

    <body>
        <jsp:include page = "/WEB-INF/views/header.jsp"/>

        <section class="slider-container">
            <div class="headerslider">
                <div class="hs-contents contents-layer-1">
                    <p>할인</p>
                    <h1>KIWII <br> 오픈기념 <br> 최대 50%할인!</h1>
                </div>
                <div class="hs-contents contents-layer-2">테스트2</div>
                <div class="hs-contents contents-layer-3">테스트3</div>
                <div class="hs-contents contents-layer-4">테스트4</div>
            </div>
        </section>

        <section class="recommend-container">
            <h1>주목! 오늘의 추천서</h1>
            <div class="recommend-slider">
            	<c:forEach var="n" begin="0" end="1" step="1">
            		<div class="rs-contents">
            			<c:forEach var="m" begin="${4 * n}" end="${4* (n+1) - 1}" step="1">
	            			<div class="rs-li">
	                            <div class="rs-image" id="goToBookView">
	                                <a href="http://localhost:9095/books?id=${bt[m].id}">
	                                    <img src="/img/${bt[m].image}" alt="">
	                                </a>
	                            </div>
	                            <p>${bt[m].title}</p>
	                        </div>
            			</c:forEach>
            		</div>
            	</c:forEach>
            </div>
        </section>

        <section class="bestseller-container">
            <h1>베스트셀러</h1>
            <div class="bestsellerSlider">
            	<c:forEach var="l" begin="0" end="1" step="1">
            		<div class="bs-contents">
            			<c:forEach var="k" begin="${9 * l}" end="${ 9 * (l+1) - 1 }" step="1">
	            			<div class="bs-li">
	                            <div class="bs-image" id="goToBookView">
	                                <a href="http://localhost:9095/books?id=${bs[k].id}">
	                                <img src="/img/${bs[k].image}" alt="">
	                                </a>
	                            </div>
	                            <div class="bs-rank center-align">${k+1}</div>
	                            <div class="bs-info vertical-align">
	                                <h3>
	                                    <a href="http://localhost:9095/books?id=${bs[k].id}">
	                                        ${bs[k].title}
	                                    </a>
	                                </h3>
	                                <p>
	                                    <a href="http://localhost:9095/books?id=${bs[k].id}">
	                                        ${bs[k].author}
	                                    </a>
	                                </p>
	                            </div>
	                        </div>
            			</c:forEach>
            		</div>
            	</c:forEach>
            </div>
        </section>

        <section class="newbook-container">
            <h1>신간</h1>
            <div class="newbookSlider">
	            <c:forEach var="i" begin="0" end="2" step="1">
	            	<div class="ns-contents">
		            	<c:forEach var="j" begin="${ 6 * i }" end="${6 * (i+1) - 1}" step="1">
		            		<div class="ns-li">
                                <div class="ns-image" id="goToBookView">
                                    <a href="http://localhost:9095/books?id=${nb[j].id}">
                                    <img src="/img/${nb[j].image}" alt="">
                                    </a>
                                </div>
                                <h6>
                                    <a href="http://localhost:9095/books?id=${nb[j].id}">
                                        ${nb[j].title}
                                    </a>
                                </h6>
                                <p>
                                    <a href="http://localhost:9095/books?id=${nb[j].id}">
                                        ${nb[j].author}
                                    </a>
                                </p>
                            </div>
		            	</c:forEach>
	            	</div>
	            </c:forEach>
            </div>
        </section>

		<jsp:include page = "/WEB-INF/views/footer.jsp"/>

        <div class="go-up"></div>

        <script src="/js/jQuery/jquery-3.6.1.min.js"></script>
        <script src="/js/jQuery/jquery.bxslider.min.js"></script>

        <!-- 슬라이더 -->
        <script>
            $('.headerslider').bxSlider({
                easing : 'ease-in-out',
            });

            $('.recommend-slider').bxSlider({
                easing : 'ease-in-out',
                infiniteLoop : false,
                hideControlOnEnd : true,
                touchEnabled : false
            });

            $('.bestsellerSlider').bxSlider({
                infiniteLoop : false,
                easing : 'ease-in-out',
                touchEnabled : false
            });

            $('.newbookSlider').bxSlider({
                infiniteLoop : false,
                easing : 'ease-in-out',
                hideControlOnEnd : true,
                touchEnabled : false
            })
        </script>
    </body>
</html>