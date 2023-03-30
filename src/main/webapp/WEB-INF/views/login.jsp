<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인 - KIWII</title>
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/login.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/alert.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link rel="shortcut icon" type="image/x-icon" href="resources/img/kiwii_head_icon.ico">
    </head>

    <body>
    	<jsp:include page = "/WEB-INF/views/header.jsp"/>
        
        <section class="center-align">
                <div class="login-box">
                        <h3>로그인</h3>
                        <input type="text" id="memId" name="memId">
                        <input type="password" id="memPwd" name="memPwd">

                        <div class="login-option">
                            <label for="auto-login">
                                <input id="auto-login" type="checkbox" value="1"> 자동로그인
                            </label>
                            <p><a href="http://localhost:9095/members/find/id">아이디 찾기</a> / <a href="#">비밀번호 찾기</a></p>
                        </div>

                        <button class="kiwii-button-default" id="loginButton">로그인</button>
                        <button class="kiwii-button-default"><a href="http://localhost:9095/members/register">회원가입</a></button>
                </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>
        
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

        <!-- 아이디 or 비밀번호를 입력하지 않은 경우 -->
        <script>
            const loginButton = document.querySelector("#loginButton");

            loginButton.addEventListener('click', async function(){

                const memId = document.querySelector("#memId").value;
                const memPwd = document.querySelector("#memPwd").value;
                
                if(memId == ""){
                    alertFunc("아이디를 입력해 주세요", "flex");
                    return;
                }
                
                if(memPwd == ""){
                    alertFunc("비밀번호를 입력해 주세요", "flex");
                    return;
                }

                try{
                    const res = await axios.post('http://localhost:9095/members/login', {memId: memId, memPwd: memPwd});
                    if(res) location.href = "http://localhost:9095";
                }catch(err){
                    const data = err.response.data;
                    alertFunc(data.message, "flex");
                }
            })
        </script>
    </body>
</html>