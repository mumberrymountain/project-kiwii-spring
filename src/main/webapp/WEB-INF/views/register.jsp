<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 - KIWII</title>
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/register.css">
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
        
        <section>
            <div class="register-title center-align">
                <h1>회원가입</h1>
            </div>
			
            <div class="register-body">
                <div class="register-tr">
                    <div class="register-data">
                        <span>아이디</span>
                    </div>
                    <div class="register-input">
                        <input type="text" id="memId" name="memId" 
                        placeholder="아이디를 입력해주세요">
                        <span class="id-warning"></span>
                    </div>
                    <button class="id-check-button">중복확인</button>
                </div>

                <div class="register-tr">
                    <div class="register-data">
                        <span>비밀번호</span>
                    </div>
                    <div class="register-input">
                        <input type="password" id="memPwd" name="memPwd" 
                        placeholder="비밀번호를 입력해주세요">
                        <span class="pwd-warning"></span>
                    </div>
                </div>
                
                <div class="register-tr">
                    <div class="register-data">
                        <span>비밀번호확인</span>
                    </div>
                    <div class="register-input">
                        <input type="password" id="pwdRecheck" name = "pwdRecheck" 
                        placeholder="비밀번호를 한번 더 입력해주세요">
                        <span class="recheck-warning"></span>
                    </div>
                </div>

                <div class="register-tr">
                    <div class="register-data">
                        <span>이름</span>
                    </div>
                    <div class="register-input">
                        <input type="text" id="memName" name="memName" 
                        placeholder="이름을 입력해주세요">
                        <!-- <span>6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</span> -->
                    </div>
                </div>

                <div class="register-tr">
                    <div class="register-data">
                        <span>이메일</span>
                    </div>
                    <div class="register-input">
                        <input type="email" id = "memEmail" name = "memEmail" 
                        placeholder="예시: kiwiikim@kiwii.com">
                        <span class="email-warning"></span>
                    </div>
                </div>

                <div class="register-tr" style="display: flex;">
                    <div class="register-data">
                        <span>휴대폰</span>
                    </div>
                    <div class="register-input">
                            <input type="text" id="memCellNum" name="memCellNum" 
                            class="phoneNum" maxlength="11" placeholder="휴대폰 번호를 입력해주세요.">
                        <span></span>
                    </div>
                    <button class="phone-check-button">인증번호 받기</button>
                </div>
                
                <div class="register-tr certify-tr">
                	<div class="register-data certify-data">
                	</div>
                	<div class="register-input certify-input">
                		<div class="input-box certify-input-box">
                			<input type="text" id="phoneNumCertify" name="phoneNumCertify" 
                            class="input-box-inner">
                			<span class="certify-timer"></span>
                		</div>
                	</div>
                	<button class="certify-button">인증번호 확인</button>
                </div>

                <div class="register-tr">
                    <div class="register-data">
                        <span>성별</span>
                    </div>
                    <div class="register-gender">
                        <label for="subject1">
                            <input type="radio" id="man" value="man"
                            name="register-gender"><span>남자</span></label>
                        <label for="subject2">
                            <input type="radio" id="woman" value="woman"
                            name="register-gender"><span>여자</span></label>
                        <label for="subject3">
                            <input type="radio" id="none" value="none"
                            name="register-gender"><span>선택안함</span></label>
                    </div>
                </div>

                <div class="register-tr">
                    <div class="register-data">
                        <span>생년월일</span>
                    </div>
                    <div class="register-input">
                        <div class="input-box birth-input-box">
                            <input type="text" id="birth-year" name="birth-year" 
                            class="birth-year" maxlength="4" placeholder="YYYY">
                            <span>/</span>
                            <input type="text" id="birth-month" name="birth-month"
                            class="birth-month" maxlength="2" placeholder="MM">
                            <span>/</span>
                            <input type="text" id="birth-day" name="birth-day" 
                            class="birth-day" maxlength="2" placeholder="DD">
                        </div>
                        <span class="birth-warning"></span>
                    </div>
                </div>
            </div>

            <div class="register-agreement">
                <div class="agreement-title">
                    <span>이용약관 동의</span>
                </div>
                <div class="agreement-content">
                    <div class="agreement-tr">
                        <label for=""><input type="checkbox" id="agree-all" name="agree-all">
                        <h3>전체 동의합니다.</h3></label>
                        <p>선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
                    </div>

                    <div class="agreement-tr">
                        <label for="">
                            <input type="checkbox" id="agree-1st" name="agree-item">
                            	이용약관 동의 <span>(필수)</span>
                        </label>
                    </div>

                    <div class="agreement-tr">
                        <label for="">
                            <input type="checkbox" id="agree-2nd" name="agree-item">
                            	개인정보 수집·이용 동의 <span>(필수)</span>
                        </label>
                    </div>

                    <div class="agreement-tr">
                        <label for="">
                            <input type="checkbox" id="agree-3rd" name="agree-item">
                            	개인정보 수집·이용 동의 <span>(선택)</span>
                        </label>
                    </div>

                    <div class="agreement-tr">
                        <label for="">
                            <input type="checkbox" id="agree-4th" name="agree-item">
                            	무료배송,할인쿠폰 등 혜택/정보 수신 동의 <span>(선택)</span>
                        </label>
                    </div>
                </div>
            </div>
			
            <div class="register-button center-align">
                <button class="kiwii-button-default">가입하기</button>
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

        <script src="resources/js/validationVariable.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <!-- 회원가입 정보 양식 체크 -->
		<script>
	            // 아이디 체크
	            let memId = document.querySelector("#memId");
	            memId.addEventListener("keyup", () => {
	                let idWarning = document.querySelector(".id-warning");
	                
	                if ( 5 < memId.value.length && 
                         memId.value.length < 17 &&
	                     numTest.test(memId.value) && 
	                     alpTest.test(memId.value))
	                     idWarning.innerHTML = "";
	                else idWarning.innerHTML = "6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합";
	            
	            })
	
	            // 비밀번호 체크
	            let memPwd = document.querySelector("#memPwd");
	            memPwd.addEventListener("keyup", () => {
	                let pwdWarning = document.querySelector(".pwd-warning");
	            
	                if(memPwd.value.length >= 8 && 
	                   numTest.test(memPwd.value) &&
	                   alpTest.test(memPwd.value) &&
	                   speTest.test(memPwd.value) ) pwdWarning.innerHTML = "";
	                else pwdWarning.innerHTML = "8자 이상, 영문/숫자/특수문자 각개 한글자 이상 포함";
	            })
	
	            let pwdRecheckComplete = 0;
	            let pwdRecheck = document.querySelector("#pwdRecheck");
	            
	            //비밀번호 다시 체크
	            pwdRecheck.addEventListener("keyup", () => {
	                let recheckWarning = document.querySelector(".recheck-warning");
	
	                if(pwdRecheck.value == memPwd.value){
	                	recheckWarning.innerHTML = "";
	                	pwdRecheckComplete = 1;
	                }else {
	                	recheckWarning.innerHTML = "동일한 비밀번호를 입력";
	                	pwdRecheckComplete = 0;
	                }
	            })
	
	            //이메일 체크
	            let memEmail = document.querySelector("#memEmail");
	            memEmail.addEventListener("keyup", () => {
	                let emailWarning = document.querySelector(".email-warning");
	
	                if(emailTest.test(memEmail.value)) emailWarning.innerHTML = "";
	                else emailWarning.innerHTML = "이메일 형식으로 입력";
	            })
	            
	            // emailTest.test(email.value)
	            
	            let birthYear = document.querySelector("#birth-year");          
	            let birthWarning = document.querySelector('.birth-warning');
	            birthYear.addEventListener("keyup", () => {
	            	if(birthYearTest.test(birthYear.value)) {
	            		birthWarning.innerHTML = "";
	            	}
	            	else birthWarning.innerHTML = "태어난 해를 확인";
	            })
	            
	            let birthMonth = document.querySelector("#birth-month");
	            birthMonth.addEventListener("keyup", () => {
	            	if(birthMonthTest.test(birthMonth.value)) {
	            		birthWarning.innerHTML = "";
	            	}
	            	else birthWarning.innerHTML = "태어난 월을 정확히 입력";
	            })
	            
	            let birthDay = document.querySelector("#birth-day");
				birthDay.addEventListener("keyup", () => {
					if(birthDayTest.test(birthDay.value)) {
						birthWarning.innerHTML = "";
					}
					else birthWarning.innerHTML = "태어난 날을 정확히 입력";
				})
	    </script>

        <!-- 아이디 중복 확인 -->
        <script>
			let idCheckComplete = 0; // 0: 아직 완료하지 않음
			memId.addEventListener('change', () => {idCheckComplete = 0;}) // input 내용물이 바뀌면 중복체크를 해제
			
			let idCheckButton = document.querySelector(".id-check-button");
			
			idCheckButton.addEventListener('click', async function() {
				let memId = document.querySelector("#memId").value;
				
				if ( 5 >= memId.length ||
                          memId.length >= 17 ||
	                     !numTest.test(memId) || 
	                     !alpTest.test(memId)){
	                      alertFunc("아이디 양식을 확인해주세요", "flex"); 
	                      return;
	                     }
				
                const res = await axios.post('/members/idcheck', {memId: memId});
                const data = res.data;

                if(data == "sameid_exists"){
					alertFunc("사용 불가능한 아이디입니다", "flex"); 
					return;
				}
					
				if(data == "sameid_not_exists"){
					alertFunc("사용 가능한 아이디입니다.", "flex");
					idCheckComplete = 1;
					return;
				}
		    })
        </script>
		
	
		<script src="/js/countDown.js"></script>
        
        <!-- 휴대폰 인증 -->
        <!-- <script>
            let certifyTr = document.querySelector(".certify-tr");
            certifyTr.style.display = "none";

            let phoneCheckComplete = 0; // 0: 휴대폰 인증 아직 완료하지 않음
            let memCellNum = document.querySelector("#memCellNum"); // 휴대폰 번호
            memCellNum.addEventListener('change', () => {phoneCheckComplete = 0;}) // 휴대폰 번호 input 내용이 바뀌면 초기화
            
            let phoneCheckButton = document.querySelector(".phone-check-button");
            phoneCheckButton.addEventListener('click', async () => {
                if (!phoneTest.test(memCellNum.value)){
                    alertFunc("휴대폰 번호 양식으로 입력해 주세요", "flex"); 
                    return;
                }

                try{
                    const res = await axios.post('/members/cellphonenumber-certify-send', {memCellNum: memCellNum.value});

                    alertFunc("인증번호를 전송했습니다.", "flex"); 
                    certifyTr.style.display = "flex";

                    let certifyTimer = document.querySelector(".certify-timer");
                    let count = 180;

                    countDown(certifyTimer, count);	
                }catch(err){
                    const data = err.response.data;
                    alertFunc(data.data, "flex");
                }	
            })
        </script> -->
        
        <!-- <script>
            let certifyButton = document.querySelector(".certify-button");
            certifyButton.addEventListener('click', async () => {
                let phoneNumCertify = document.querySelector("#phoneNumCertify").value;

                const res = await axios.post('/members/check-phonecertify-number', {phoneNumCertify: phoneNumCertify});
                const data = res.data;

                if(data == "cerfify_failure"){
                    alertFunc("인증번호를 다시 입력해주세요.", "flex");
                    return;
                }

                if(data == "certify_success"){
                    alertFunc("휴대폰 인증이 완료됐습니다.", "flex");
                    phoneCheckComplete = 1;
                    certifyTr.style.display = "none";
                return;
                }
            })
        </script> -->

        <script>
            let agreeAll = document.querySelector("#agree-all");
            let agreeItem = document.getElementsByName("agree-item");
            
            agreeAll.addEventListener("change", () => {
				if(agreeAll.checked){
					agreeItem.forEach((item) => {
						item.checked = true;
		            })
				}else{
					agreeItem.forEach((item) => {
						item.checked = false;
		            })
				}//else
            })//addEventListenr
        </script>

        <!-- '가입하기' 버튼 클릭 -->
        <script>
            let registerButton = document.querySelector(".register-button>button");

            //회원가입 버튼 눌렀을 때
            registerButton.addEventListener('click', async () => {
               
                //아이디체크
                if ( 5 >= memId.value.length ||
                     memId.value.length >= 17 ||
                     !numTest.test(memId.value) || 
                     !alpTest.test(memId.value)){
                      alertFunc("아이디 양식을 확인해주세요", "flex"); 
                      return;
                    }
                
                //아이디 중복체크
                if (idCheckComplete == 0){
                	alertFunc("아이디 중복 체크를 해주세요", "flex");
                	return;
                }

                //비밀번호체크
                if(memPwd.value.length < 9 || 
                   !numTest.test(memPwd.value) ||
                   !alpTest.test(memPwd.value) ||
                   !speTest.test(memPwd.value) ){
                      alertFunc("비밀번호 양식을 확인해주세요", "flex"); 
                      return;
                   }
                
                //비밀번호 확인
                if(pwdRecheckComplete == 0){
                	alertFunc("비밀번호를 한 번 더 입력해주세요", "flex");
                	return;
                }
                
                //이름체크
                let memName = document.querySelector("#memName");
                if( memName.value == ""){
                    alertFunc("이름을 입력해 주세요", "flex");
                    return;
                }
                
                //이메일체크
                if(!emailTest.test(memEmail.value)){
                	alertFunc("이메일 양식을 확인해주세요", "flex");
                	return;
                }
                
                //휴대폰체크
                /* if(phoneCheckComplete == 0){
                	alertFunc("휴대폰 인증을 완료해주세요", "flex");
                	return;
                } */
				
             	//성별체크
            	let genderRadio = document.getElementsByName("register-gender");
            	let memGender = "";
            	
               	genderRadio.forEach((g) => {
               		if(g.checked){
                        memGender = g.value; //체크된 성별 value 값을 gender 변수에 담아준다.
               		}
               	})
               	
               	
               	if(memGender == ""){
               		alertFunc("성별을 선택해주세요", "flex");
               		return;
               	}
               	
               	//생년월일 체크
               	let memBirth = birthYear.value + birthMonth.value + birthDay.value;
               	if(!birthTest.test(memBirth)){
               		alertFunc("생일 양식을 확인해주세요", "flex");
               		return;
               	}
               	
               	//필수 이용약관 체크 
               	let agree1st = document.querySelector("#agree-1st");
               	let agree2nd = document.querySelector("#agree-2nd");
               	if(!agree1st.checked || !agree2nd.checked){
               		alertFunc("필수적인 이용약관에 동의해주세요","flex");
               		return;
               	}

                const memIdParam = memId.value;
                const memPwdParam = memPwd.value;
                const memEmailParam = memEmail.value;
                const memCellNumParam = memCellNum.value;
                const memNameParam = memName.value;
                // const memNameParam = encodeURIComponent(memName.value);
               	
                try{
                    const res = await axios.post('/members/register', 
                        {memId: memIdParam, memPwd: memPwdParam, memName: memNameParam, 
                         memEmail: memEmailParam, memCellNum: memCellNumParam, 
                         memGender: memGender, memBirth: memBirth});
                    const data = res.data; 
                    if (data == "register-success") location.href = "http://localhost:9095/members/register/success";
                }catch(err){
                    const data = err.response.data;
                    alertFunc(data.message, "flex");
                    location.reload();
                }
                
            })
        </script>
    </body>
</html>