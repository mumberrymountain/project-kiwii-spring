<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>주문완료 - KIWII</title>

        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/alert.css">
        <link rel="stylesheet" href="/css/ordercompletepage.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link rel="shortcut icon" type="image/x-icon" href="/img/kiwii_head_icon.ico">
    </head>

    <body>
        <jsp:include page = "/WEB-INF/views/header.jsp"/>

        <section>
            <div class="order-complete-container">
                <div class="bxs-check-circle-wrap center-align"><i class='bx bxs-check-circle'></i></div>
                <h1>결제가 완료되었습니다.</h1>
                <div class="ordered-book-list">
                    <c:if test="${orderList.size() <= 3 }">
                        <c:forEach var = "order" items = "${ orderList }">
                            <div class="ordered-book-component">
                                <p class="ordered-book-title">${order.title}</p>
                                <p class="ordered-book-author">${order.author}</p>
                                <span class="ordered-book-price">${order.sellprice}원</span>
                            </div>
                        </c:forEach>
                    </c:if>
-
                    <c:if test="${orderList.size() > 3 }">
                        <c:forEach var="i" begin="0" end="2" step="1">
                            <div class="ordered-book-component">
                                <p class="ordered-book-title">${orderList[i].title}</p>
                                <p class="ordered-book-author">${orderList[i].author}</p>
                                <span class="ordered-book-price">${orderList[i].sellprice}원</span>
                            </div>
                        </c:forEach>

                        <div class="ordered-book-etc center-align">
                            <span>ㆍㆍㆍ</span>
                        </div>
                    </c:if>
                    
                    <div class="ordered-book-total">
                        <p class="book-total-length">총 ${orderList.size()}권</p>
                        <span class="book-total-price">${totalPrice}원</span>
                    </div>
                </div>
            </div>
            <div class="go-to-mylibrary-container center-align">
                <a id="go-to-mylibrary-button" class="center-align" href="http://localhost:9095/members">내 서재로 이동 <i class='bx bxs-right-arrow'></i></a>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
    </body>
</html>