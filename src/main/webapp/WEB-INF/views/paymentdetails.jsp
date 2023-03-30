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
        <title>내 페이지/결제내역 - KIWII</title>
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/paymentdetails.css">
        <link rel="stylesheet" href="/css/alert.css">

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
            <div class="mykiwii-container">
                <div class="mykiwii-menu">
                    <ul>
                        <li><h3>마이 페이지</h3></li>
                        <li><a href="http://localhost:9095/members">마이 페이지 홈</a></li>
                        <li class="active"><a href="http://localhost:9095/members/payments">결제내역</a></li>
                        <li><a href="http://localhost:9095/members/modify">정보변경</a></li>
                    </ul>
                </div>
                <div class="mykiwii-payment-box">
                    <h2>결제 내역</h2>
                    <div class="mykiwii-payment-table">
                        <div class="mykiwii-payment-header">
                            <div class="mykiwii-payment-date center-align">구매일</div>
                            <div class="mykiwii-payment-detail vertical-align">결제내역</div>
                            <div class="mykiwii-payment-amount center-align">주문금액</div>
                        </div>
                        <c:forEach var = "p" items = "${ payment }">
                        <div class="mykiwii-payment-body">
                            <div class="mykiwii-payment-date center-align">${p.purchasedate}</div>
                            <div class="mykiwii-payment-detail vertical-align">${p.paymentdetail}</div>
                            <div class="mykiwii-payment-amount center-align">${p.amount}원</div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
    </body>
</html>