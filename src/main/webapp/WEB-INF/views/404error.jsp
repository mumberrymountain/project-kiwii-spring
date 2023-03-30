<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KIWII</title>

        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/alert.css">
        <link rel="stylesheet" href="/css/404errorpage.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link rel="shortcut icon" type="image/x-icon" href="/img/kiwii_head_icon.ico">
    </head>

    <body>
        <jsp:include page = "/WEB-INF/views/header.jsp"/>
        
        <section class="vertical-align">
            <div class="page-notfound-container">
                <i class='bx bxs-error-circle'></i>
                <h2>찾으시는 페이지가 없습니다.</h2>
                <h3>요청하신 페이지를 찾을 수 없습니다.</h3>
                <h3>입력하신 경로가 정확한지 다시 한 번 확인해주시기 바랍니다.</h3>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
    </body>
</html>