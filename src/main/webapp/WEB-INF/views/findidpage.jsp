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
        <link rel="stylesheet" href="/css/findidpage.css">
        <link rel="stylesheet" href="/css/footer.css">
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

        <section class="center-align">
            <div class="idcheck-box">
                <div class="idcheck-header center-align">
                    <h2>아이디 찾기</h3>
                </div>
                <ul class="idcheck-method">
                    <li class="check-by-cellphone center-align active">휴대폰 인증</li>
                    <li class="check-by-email center-align">이메일 인증</li>
                </ul>
                <div class="idcheck-input-wrap idcheck-input-wrap-1">
                    <div class="idcheck-input-box idcheck-input-box-1">
                        <div class="idcheck-input-name">
                            <p>이름</p>
                            <input class="name" id="name-1" 
                            type="text" placeholder="이름을 입력해 주세요.">
                        </div>

                        <div class="idcheck-input-cellphone">
                            <p>휴대폰번호</p>
                            <input class="cellphone" id="cellphone" 
                            type="text" placeholder="휴대폰 번호를 입력해 주세요.">
                        </div>
                    </div>

                    <button type="submit" id="idcheck-button-phone" 
                    class="idcheck-button idcheck-button-phone kiwii-button-default">휴대폰 인증</button>
                </div>

                <div class="idcheck-input-wrap idcheck-input-wrap-2">
                    <div class="idcheck-input-box idcheck-input-box-2">
                        <div class="idcheck-input-name">
                            <p>이름</p>
                            <input class="name" id="name-2" 
                            type="text" placeholder="이름을 입력해 주세요.">
                        </div>

                        <div class="idcheck-input-email">
                            <p>이메일</p>
                            <input class="email" id="email" 
                            type="text" placeholder="이메일을 입력해 주세요.">
                        </div>
                    </div>

                    <button type="submit" id="idcheck-button-email" 
                    class="idcheck-button idcheck-button-email kiwii-button-default">이메일 인증</button>
                </div>
                
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>

        <div class="alert-container">
            <div class="alert-popup">
                <div class="alert-text center-align">
                    <span></span>
                </div>
                <div class="popup-quit center-align">
                    <span>확인</span>
                </div>
            </div>
        </div>
    </body>
    <script src="/js/validationVariable.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <script>
        let idCheckMethod = document.querySelectorAll(".idcheck-method>li");

        for(let i=0; i<2; i++){
            idCheckMethod[i].addEventListener('click', (event) => {
                // Border 바꾸기
                if(i == 0) event.target.nextElementSibling.style.borderBottom = "none";
                if(i == 1) event.target.previousElementSibling.style.borderBottom = "none";
                event.target.style.borderBottom = "2px solid #8cba21";

                const inputWrap = document.querySelectorAll('.idcheck-input-wrap');
                inputWrap[i].style.display = "block";
                inputWrap[(i+1)%2].style.display = "none";
            })
        }
    </script>

    <!-- 휴대폰으로 인증 -->
    <script>
        const idCheckButtonPhone = document.getElementById("idcheck-button-phone");
        idCheckButtonPhone.addEventListener('click', async () => {
            let name = document.getElementById('name-1').value;
            const phone = document.getElementById('cellphone').value;
            name = encodeURIComponent(name);

            if(name == "") return alertFunc("이름을 입력해 주세요", "flex");
            if(phone == "") return alertFunc("휴대폰 번호를 입력해 주세요", "flex");
            if (!phoneTest.test(phone)) return alertFunc("휴대폰 번호 양식으로 입력해 주세요", "flex"); 

            try{
                const res = await axios.post("http://localhost:9095/members/find/id", {memName: name, memCellNum: phone});
                const memberId = res.data;

                const url = "idcheck-popup/?memberId=" + memberId;
                const popupName = "아이디 팝업창";
                const option = "width = 500, height = 135, top = 350, left = 680, resizable=no";
                window.open(url, popupName, option);
            }catch(err){
                const data = err.response.data;
                alertFunc(data.data, "flex");
            }
            
        })
    </script>

    <!-- 이메일로 인증 -->
    <script>
        const idCheckButtonEmail = document.getElementById("idcheck-button-email");
        idCheckButtonEmail.addEventListener('click', async () => {
            const name = document.getElementById('name-2').value;
            const email = document.getElementById('email').value;

            if(name == "") return alertFunc("이름을 입력해 주세요", "flex");
            if(email == "") return alertFunc("이메일을 입력해 주세요", "flex");
            if (!emailTest.test(email)) return alertFunc("이메일 양식으로 입력해 주세요", "flex"); 

            try{
                const res = await axios.post("http://localhost:9095/members/find/id", {memName: name, memEmail: email});
                let memberId = res.data;

                const url = "http://localhost:9095/members/popup/?memberId=" + memberId;
                const popupName = "아이디 팝업창";
                const option = "width = 500, height = 135, top = 350, left = 680, resizable=no";
                window.open(url, popupName, option);
            }catch(err){
                const data = err.response.data;
                alertFunc(data.message, "flex");
            }
        })
    </script>
</html>