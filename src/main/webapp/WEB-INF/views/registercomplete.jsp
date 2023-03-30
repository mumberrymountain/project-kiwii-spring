<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 성공 - KIWII</title>

        <link rel="stylesheet" href="resources/css/reset.css">
        <link rel="stylesheet" href="resources/css/menu.css">
        <link rel="stylesheet" href="resources/css/footer.css">
        <link rel="stylesheet" href="resources/css/alert.css">
        <link rel="stylesheet" href="resources/css/registercomplete.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link rel="shortcut icon" type="image/x-icon" href="resources/img/kiwii_head_icon.ico">
    </head>

    <body>
        <jsp:include page = "/WEB-INF/views/header.jsp"/>

        <section>
            <div class="register-complete-container center-align">
                <div class="registered-info-box">
                    <div class="registered-info-header center-align">
                        <h2>회원가입이 완료되었습니다.</h2> 
                    </div>
                    <div class="registered-info-body">
                        <div class="registered-info-body-row">
                            <div class="registered-info-body-col-1 vertical-align">아이디</div>
                            <div class="registered-info-body-col-2 vertical-align">
                                ${memId}
                            </div>
                        </div>
                        <div class="registered-info-body-row vertical-align">
                            <div class="registered-info-body-col-1 vertical-align">이름</div>
                            <div class="registered-info-body-col-2 vertical-align">
                                ${memName}
                            </div>
                        </div>
                        <div class="registered-info-body-row vertical-align">
                            <div class="registered-info-body-col-1 vertical-align">이메일</div>
                            <div class="registered-info-body-col-2 vertical-align">
                                ${memEmail}
                            </div>
                        </div>

                        <a class="go-mypage-button center-align" href="http://localhost:9095/members/login">로그인으로 이동</a>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
    </body>
</html>