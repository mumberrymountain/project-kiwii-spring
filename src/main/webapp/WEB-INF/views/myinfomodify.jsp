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
        <title>정보변경 - KIWII</title>
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/myinfomodify.css">
        <link rel="stylesheet" href="/css/alert.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
                
                
                <c:if test = "${ memInfo eq null }">
                <div class="security-password-check">
                    <h2>정보 변경</h2>
                    <p>보안을 위해 비밀번호를 입력해 주세요.</p>
                    <label for="pwd">
                        <input  class="security-check-pwd" id="memPwd" name="memPwd" type="password">
                        <!-- <input type="button" class="pwd-check-button kiwii-button-default"
                        id="pwd-check-button" onclick="pwdCheck(this.form)" value="확인"> -->
                        <button class="pwd-check-button kiwii-button-default" 
                        id="pwd-check-button" onclick="pwdCheck()">확인</button>
                    </label>
                </div>
                </c:if>

                <c:if test = "${ memInfo ne null }">
                    <div class="info-modify-box">
                        <h1>정보변경</h1>
                            <div class="info-modify-table">
                                <div class="info-modify-name">
                                    <div class="info-modify-header vertical-align">
                                        <p>이름</p>
                                    </div>
                                    <div class="info-modify-body vertical-align">
                                        <p>${memInfo.getMemName()}</p>
                                    </div>
                                </div>
                                <div class="info-modify-id">
                                    <div class="info-modify-header vertical-align">
                                        <p>아이디</p>
                                    </div>
                                    <div class="info-modify-body vertical-align">
                                        <p>${memInfo.getMemId()}</p>
                                    </div>
                                </div>
                                <div class="info-modify-email">
                                    <div class="info-modify-header vertical-align">
                                        <p>이메일</p>
                                    </div>
                                    <div class="info-modify-body info-modify-body-email vertical-align">
                                        <p>${memInfo.getMemEmail()}</p>
                                        <label for="memEmail">
                                           	<input type="email" id="memEmail" name="memEmail" data-curEmail="${memInfo.getMemEmail()}">
                                            <button id="email-change-button" onclick="emailUpdate()">이메일 변경</button>
                                        </label>
                                    </div>
                                </div>
                                <div class="info-modify-pwd">
                                <div class="info-modify-header vertical-align">
                                    <p>비밀번호</p>
                                </div>
                                <div class="info-modify-body info-modify-body-pwd vertical-align">
                                    <label class="current-pwd" for="currentPassword">
                                        <input type="password" id="currentPassword" 
                                        name="currentPassword" placeholder="현재 비밀번호">
                                    </label>
                                    <label class="new-pwd" for="">
                                        <input type="password" id="newPassword" 
                                        name="newPassword" placeholder="새 비밀번호">
                                    </label>
                                    <label class="new-pwd-verify" for="">
                                        <input type="password" id="newPwdVerify" 
                                        name="newPwdVerify" placeholder="새 비밀번호 확인">
                                    </label>
                                    <button id="pwd-change-button" onclick="pwdUpdate()">비밀번호 변경</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>

        <script src="/js/validationVariable.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

        <script>
            const pwdCheck = async () => {
                const memPwd = document.getElementById("memPwd").value;
                if (memPwd == "") return alertFunc("비밀번호를 입력해 주세요.", "flex");

                try{
                    const res = await axios.post("http://localhost:9095/members/modify", {memPwd: memPwd});
                    location.reload();
                }catch(err){
                    const data = err.response.data;
                    alertFunc(data.message, "flex");
                }
            }
        </script>

        <!-- 이메일 수정 -->
        <script>
            const emailUpdate = async () => {
                const memEmail = document.getElementById("memEmail");
                const currentEmail = memEmail.dataset.curemail;
                if(memEmail.value == "") return alertFunc("이메일을 입력해주세요", "flex");
                if(!emailTest.test(memEmail.value)) return alertFunc("이메일 양식을 확인해주세요", "flex");
                if(memEmail.value == currentEmail) return alertFunc("현재 이메일과 다른 이메일을 입력해주세요", "flex");

                try{
                    const res = axios.patch("http://localhost:9095/members/modify/email", {memEmail: memEmail.value});
                    if(res) {
                        alert("이메일을 변경했습니다");
                        location.href = "http://localhost:9095/members";
                    }
                }catch(err){
                    const data = err.response.data;
                    alertFunc(data.message, "flex");
                }
            }
        </script>

        <script>
            const pwdUpdate = async () => {
                const currentPassword = document.getElementById("currentPassword").value;
                const newPassword = document.getElementById("newPassword").value;
                const newPwdVerify = document.getElementById("newPwdVerify").value;

                if(currentPassword == "") return alertFunc("현재 비밀번호를 입력해주세요.", "flex");
                if(newPassword == "") return alertFunc("새 비밀번호를 입력해주세요.", "flex");
                if(newPwdVerify == "") return alertFunc("새 비밀번호를 다시 한 번 입력해주세요.", "flex");
                if(newPassword.length < 9 || 
                   !numTest.test(newPassword) ||
                   !alpTest.test(newPassword) ||
                   !speTest.test(newPassword) ){
                      alertFunc("비밀번호 양식을 확인해주세요", "flex"); 
                      return;
                   }
                if(newPassword != newPwdVerify) return alertFunc("새 비밀번호와 확인 번호가 일치하지 않습니다.", "flex");


                try{
                    const res = await axios.patch("http://localhost:9095/members/modify", {memPwd: currentPassword});
                }catch(err){
                    const data = err.response.data;
                    return alertFunc(data.message, "flex");
                }

                try{
                    const res = await axios.post("http://localhost:9095/members/modify/pwd", {memPwd: newPassword});
                    alert("비밀번호를 변경했습니다");
                    location.href = "http://localhost:9095/members/";
                }catch(err){
                    const data = err.response.data;
                    return alertFunc(data.message, "flex");
                }
            }
        </script>
    </body>
</html>