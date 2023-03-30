<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내 페이지 - KIWII</title>
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/mypage.css">
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
                        <li class="active"><a href="http://localhost:9095/members">마이 페이지 홈</a></li>
                        <li><a href="http://localhost:9095/members/payments">결제내역</a></li>
                        <li><a href="http://localhost:9095/members/modify">정보변경</a></li>
                    </ul>
                </div>
                <div class="mykiwii-info-box">
                    <div class="mykiwii-basicinfo">
                       <h3>${memId}</h3>
                       <p>${memEmail}</p>
                    </div>

                    <div class="mykiwii-square-default mykiwii-mylibrary center-align">
                        <i class='bx bx-library'></i>
                        <h3>내 서재</h3>
                        <h2>${bookCount}권</h2>
                    </div>

                    <div class="mykiwii-square-default mykiwii-mycart center-align">
                        <i class='bx bx-cart'></i>
                        <h3>장바구니</h3>
                        <h2>${cartCount}권</h2>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
    </body>
</html>tml>