<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>아이디 확인 - KIWII</title>
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/idcheckpopup.css">
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/alert.css">
        <link rel="shortcut icon" type="image/x-icon" href="/img/kiwii_head_icon.ico">
    </head>

    <body>
        <div class="idcheck-popup-box center-aligns">
            <h3>고객님의 아이디는 ${memberId} 입니다.</h3>
            <p>개인정보 보호를 위해 앞 세글자만 보여드립니다.</p>
            <button id="idcheck-popup-button" class="idcheck-popup-button">로그인</button>
            <div class="idcheck-popup-footer"></div>
        </div>
    </body>

    <script>
        const popupButton = document.getElementById("idcheck-popup-button");
        popupButton.addEventListener('click', () => {
            window.opener.location.href = "../login";
            window.close();
        })
    </script>
</html>