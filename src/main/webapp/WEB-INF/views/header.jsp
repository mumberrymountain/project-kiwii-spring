<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<body>
		<header class="header-1-inner vertical-align">
			<c:if test="${loginInfo ne true }">
	        	<ul class="login-register">
	            	<li><a href="http://localhost:9095/members/register">회원가입</a></li>       
	            	<li><a href="http://localhost:9095/members/login">로그인</a></li>
	            	<li><a href="#">고객센터</a></li>
	        	</ul>
	    	</c:if>
	    	
	    	<c:if test="${loginInfo eq true }">
	    		<ul class="login-register">     
		            <li><a href="http://localhost:9095/members/logout">로그아웃</a></li>
	                <li><a href="#">고객센터</a></li>
	            </ul>
	    	</c:if>
	    </header>
        
        <hr>

        <header class="header-2-inner">
            <div class="h-inner-1stLayer vertical-align">
                <div class="header-logo center-align">
                    <a href="/">
                        <img src="/img/kiwii_logo_01.png" alt="">
                    </a>
                </div>

                <form action="search" method="GET">
                    <div class="search-wrap">
                        <input type="hidden" class="order" id="order" name="order" value="publishdate">
                        <input type="text" class="hSearch" id="hSearch" name="hSearch">
                        <div class="search-erase-wrap">
                            <i class='bx bx-x'></i>
                        </div>
                        <label class="search-label center-align" for="search-button">
                            <i class="bx bx-search"></i>
                            <input type="button" class="search-button" onclick="search(this.form)" id="search-button"/>
                        </label>
                    </div>
                </form>
                
                <ul class="member-menu">
                    <li><a href="#"><span class="bx bxs-bell"></span></a></li>
                    <li id="go-mycart-page"><span class="bx bx-cart"></span></li>
                    <li id="go-mypage"><span class="bx bxs-user"></span></li>
                </ul>
            </div>
            <div class="h-inner-2ndLayer vertical-align">
                <ul class="category">
                    <li>
                        <div class="category-icon">
                            <i class='bx bx-menu'></i>
                            <span>카테고리</span>
                        </div>

                        <ul class="category-inner">
                            <li>
                                <div class="category-main">
                                    <a href="#">소설<i class='bx bx-chevron-right'></i></a>
                                </div>
                                <ul class="inner-submenu">
                                    <li><a href="#">소설 전체</a></li>
                                    <li><a href="#">한국 소설</a></li>
                                    <li><a href="#">영미 소설</a></li>
                                    <li><a href="#">일본 소설</a></li>
                                    <li><a href="#">중국 소설</a></li>
                                    <li><a href="#">북유럽 소설</a></li>
                                    <li><a href="#">독일 소설</a></li>
                                    <li><a href="#">프랑스 소설</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">경영/경제<i class='bx bx-chevron-right'></i></a>
                                </div>
                                <ul class="inner-submenu">
                                    <li><a href="#">경영/경제 전체</a></li>
                                    <li><a href="#">경영 일반</a></li>
                                    <li><a href="#">경제 일반</a></li>
                                    <li><a href="#">마케팅/세일즈</a></li>
                                    <li><a href="#">재테크/금융/부동산</a></li>
                                    <li><a href="#">CEO/리더쉽</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">인문/사회/역사<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">인문/사회.역사 전체</a></li>
                                    <li><a href="#">인문</a></li>
                                    <li><a href="#">정치/사회</a></li>
                                    <li><a href="#">예술/문화</a></li>
                                    <li><a href="#">역사</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">자기계발<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">자기계발 전체</a></li>
                                    <li><a href="#">성공/삶의 자세</a></li>
                                    <li><a href="#">기획/창의/리더쉽</a></li>
                                    <li><a href="#">설득/화술/협상</a></li>
                                    <li><a href="#">취업/창업</a></li>
                                    <li><a href="#">여성</a></li>
                                    <li><a href="#">인간관계</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">에세이/시<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">에세이/시 전체</a></li>
                                    <li><a href="#">에세이</a></li>
                                    <li><a href="#">시</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">여행<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">여행 전체</a></li>
                                    <li><a href="#">국내여행</a></li>
                                    <li><a href="#">해외여행</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">종교<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">종교 전체</a></li>
                                    <li><a href="#">종교 일반</a></li>
                                    <li><a href="#">가톨릭</a></li>
                                    <li><a href="#">기독교(개신교)</a></li>
                                    <li><a href="#">불교</a></li>
                                    <li><a href="#">기타</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">외국어<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">외국어 전체</a></li>
                                    <li><a href="#">비즈니스영어</a></li>
                                    <li><a href="#">일반영어</a></li>
                                    <li><a href="#">제2외국어</a></li>
                                    <li><a href="#">어학시험</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">과학<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">과학 전체</a></li>
                                    <li><a href="#">과학 일반</a></li>
                                    <li><a href="#">수학</a></li>
                                    <li><a href="#">자연과학</a></li>
                                    <li><a href="#">응용과학</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">진로/교육/교재<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">진로/교육/교재 전체</a></li>
                                    <li><a href="#">공부법</a></li>
                                    <li><a href="#">특목고/자사고</a></li>
                                    <li><a href="#">대입 수시</a></li>
                                    <li><a href="#">대입 논술</a></li>
                                    <li><a href="#">대입 합격수기</a></li>
                                    <li><a href="#">진로 탐색</a></li>
                                    <li><a href="#">유학/MBA</a></li>
                                    <li><a href="#">교재/수험서</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">컴퓨터/IT<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">컴퓨터/IT 전체</a></li>
                                    <li><a href="#">IT 비즈니스</a></li>
                                    <li><a href="#">개발/프로그래밍</a></li>
                                    <li><a href="#">컴퓨터/앱 활용</a></li>
                                    <li><a href="#">IT자격증</a></li>
                                    <li><a href="#">IT해외원서</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">건강/다이어트<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">건강/다이어트 전체</a></li>
                                    <li><a href="#">다이어트/운동/스포츠</a></li>
                                    <li><a href="#">스타일/뷰티</a></li>
                                    <li><a href="#">건강</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">가정/생활<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">가정/생활 전체</a></li>
                                    <li><a href="#">결혼/임신/출산</a></li>
                                    <li><a href="#">육아/자녀교육</a></li>
                                    <li><a href="#">취미/요리/기타</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">어린이/청소년<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">어린이/청소년 전체</a></li>
                                    <li><a href="#">유아</a></li>
                                    <li><a href="#">어린이</a></li>
                                    <li><a href="#">청소년</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">해외도서<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">해외도서 전체</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="category-main">
                                    <a href="#">잡지<i class='bx bx-chevron-right'></i></a>
                                </div>

                                <ul class="inner-submenu">
                                    <li><a href="#">잡지 전체</a></li>
                                    <li><a href="#">경영/재테크</a></li>
                                    <li><a href="#">문학/교양</a></li>
                                    <li><a href="#">여성/패션/뷰티</a></li>
                                    <li><a href="#">디자인/예술</a></li>
                                    <li><a href="#">건강/스포츠</a></li>
                                    <li><a href="#">취미/여행/요리</a></li>
                                    <li><a href="#">과학/IT</a></li>
                                    <li><a href="#">종교</a></li>
                                    <li><a href="#">만화</a></li>
                                    <li><a href="#">성인</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                </div>    
            </div>
        </header>
        <hr>

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
        
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="/js/alertFunc.js"></script>
        
        <script>
            const hSearch = document.querySelector("#hSearch");
            let xButton = document.querySelector(".search-wrap>.search-erase-wrap");

            hSearch.addEventListener('keyup', function(){

                if (hSearch.value != ""){
                    xButton.style.display = "inline";
                }else{
                    xButton.style.display = "none";
                }
            })      

            xButton.addEventListener('click', function(){
                hSearch.value = "";
                xButton.style.display = "none";
            })
        </script>

        <!-- 검색하기 -->
        <script>
            const search =(f) => {
                const hSearch = f.hSearch.value;
                if(hSearch == "") return alertFunc("검색어를 입력해주세요.", "flex");
                f.submit();
            }
        </script>   

        <!-- 장바구니 페이지 이동 -->
        <script>
            const goMyCartPage = document.querySelector("#go-mycart-page");
            goMyCartPage.addEventListener('click', async () => {
                const user = `${loginInfo}`;
                if(!user) return location.href = "http://localhost:9095/members/login";
                
                return location.href = "http://localhost:9095/cart";
            })

        </script>

        <!-- 내 페이지 이동 -->
        <script>
            const goMyPage = document.querySelector("#go-mypage");
            goMyPage.addEventListener('click', async () => {
                const user = `${loginInfo}`;
                if(!user) return location.href = "http://localhost:9095/members/login";

                return location.href = "http://localhost:9095/members/";
            })
        </script>
	</body>
</html>