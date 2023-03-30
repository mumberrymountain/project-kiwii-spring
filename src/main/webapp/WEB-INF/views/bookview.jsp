<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${book.getTitle()} - KIWII</title>

        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/bookview.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/cartalert.css">
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
            <div class="bookinfo-wrap">
                <div class="bookinfo-box">
                    <div class="bookinfo-box-inner-1">
                        <div class="bookinfo-inner-image">
                            <img src="/img/${book.getImage()}" alt="">
                        </div>
                        <div class="bookinfo-inner-info1st">
                            <p>
                                <span class="genre">${book.getGenre()}</span> > <span class="subgenre">${book.getSubgenre() }</span>
                            </p>
                            <h1>${book.getTitle()}</h1>
                            <p>
                                <span class="author">${book.getAuthor()}</span> 저
                            </p>
                            <p>
                                <span class="publisher">${book.getPublisher()}</span> 출판
                            </p>

                            <div class="price-table">
                                <div class="possession center-align">소장</div>
                                <div class="price-list">
                                    <div class="price-list-tr">
                                        <span>종이책 정가</span>
                                        <span>${book.getPbPrice()}원</span>
                                    </div>
                                    <div class="price-list-tr">
                                        <span>전자책 정가</span>
                                        <span>${book.getEbPrice()}원</span>
                                    </div>
                                    <div class="price-list-tr">
                                        <span>판매가</span>
                                        <span>${book.getSellPrice()}원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="bookinfo-inner-menu">
                            <li><a href="#"><i class='bx bxs-heart'></i></a></li>
                            <li id="putIntoCart" data-bookId="${book.getId()}"><i class='bx bx-cart'></i></li>
                            <li><a href="#"><i class='bx bx-gift'></i></a></li>
                            <li class="center-align kiwii-button-default">소장하기</li>
                        </ul>
                    </div>

                    <div class="bookinfo-box-inner-2 vertical-align">
                        <ul class="publisher-file-isbn">
                            <li>출간일 : ${book.getPublishDate()}</li>
                            <li>파일정보 : ${book.getFileInfo()}</li>
                            <li>ISBN : ${book.getIsbn()}</li>
                        </ul>
                    </div>
                </div>
                <div class="bookintro-box">
                    <div class="book-default-header vertical-align">
                        <h2>출판사 서평</h2>
                    </div>
                    <div class="book-default-body">
                        <p class="bookview-content box-folded">${book.getIntroduce()}</p>
                        <p><span class="fold-button">펼쳐보기 <i class='bx bxs-caret-down-circle'></i></span></p>
                    </div>
                </div>
                <div class="authorprofile-box">
                    <div class="book-default-header vertical-align">
                        <h2>저자 프로필</h2>
                    </div>
                    <div class="book-default-body authorprofile-box-body">
                        <h3>${book.getAuthor()}</h3>
                        <p>국적 <span>대한민국</span></p>
                        <p>학력 <span>서울대학교 대학원 경제학부 박사</span></p>
                        <p>경력 <span>미국 스탠퍼드 대학교 후버 연구소 객원연구원</span></p>
                        <p>수상 <span>2007년 제34회 한국방송대상 올해의 보도기자상</span></p>
                    </div>
                </div>
                <div class="authorintro-box">
                    <div class="book-default-header vertical-align">
                        <h2>저자 소개</h2>
                    </div>
                    <div class="book-default-body">
                        <p class="bookview-content box-folded">${book.getAuthorInfo()}</p>
                        <p><span class="fold-button">펼쳐보기 <i class='bx bxs-caret-down-circle'></i></span></p>
                    </div>
                </div>
                <div class="toc-box">
                    <div class="book-default-header vertical-align">
                        <h2>목차</h2>
                    </div>
                    <div class="book-default-body">
                        <p class="bookview-content box-folded">${book.getToc()}</p>
                        <p><span class="fold-button">펼쳐보기 <i class='bx bxs-caret-down-circle'></i></span></p>
                    </div>
                </div>

                <div class="review-head-box">
                    <div class="book-default-header vertical-align">
                        <h2>리뷰</h2>
                    </div>

                    <div class="book-feedback-container vertical-align">
                        <div class="book-feedback">
                            <div class="book-rating">
                                <input type="radio" name="ratings" id="rating-5" value="5">
                                <label for="rating-5"></label>
                                <input type="radio" name="ratings" id="rating-4" value="4">
                                <label for="rating-4"></label>
                                <input type="radio" name="ratings" id="rating-3" value="3"> 
                                <label for="rating-3"></label>
                                <input type="radio" name="ratings" id="rating-2" value="2">
                                <label for="rating-2"></label>
                                <input type="radio" name="ratings" id="rating-1" value="W1">
                                <label for="rating-1"></label>
                            </div>
                        </div>
                    </div>

                    <div class="book-review">
                       <textarea class="book-review-content" id="book-review-content" 
                       name="book-review-content" cols="30" rows="10"></textarea>
                       <div class="book-review-submit">
                           <button class="review-submit-button kiwii-button-default" id="review-submit-button" 
                           data-bookId="${book.getId()}">리뷰 남기기</button>
                           <label for="spoiler-check" class="spoiler-check vertical-align">
                                <input type="checkbox" id="spoiler-check" name="spoiler-check">
                                <span>스포일러 포함</span>
                            </label>
                       </div>
                    </div>
                </div>

                <div class="review-body-box">
                    <div class="review-body-commenter vertical-align">
                        <a href="#">전체 <span>1</span></a>
                    </div>
                    <div class="review-body-list">
                        <c:forEach var = "c" items = "${ comment}">
                            <div class="review-body-component">
                                <div class="member-profile">
                                    <p class="member-id">${c.getCommenterId()}</p>
                                    <p class="comment-registered-date">${c.getCommentedDate()}</p>
                                </div>
                                <div class="review-content">
                                    <p class="content-wraps">${c.getContent()}</p>
                                    <div class="content-button-layer">
                                        <div class="content-button-wrap">
                                            <button id="show-reply-button"><i class='bx bxs-message-rounded-dots'></i>댓글</button>
                                            <button>공감 ${c.getLikeCount()}</button>
                                        </div>
                                    </div>

                                    <div class="reply-comment-list">
                                        <div class="reply-comment-component">
                                            <p class="reply-content">테스트용 답글입니다.</p>
                                            <p class="replier-info">
                                                <span class="replier-id">test111</span>│
                                                <span class="replied-date">2023.01.28</span>
                                            </p>
                                        </div>
                                    
                                        <div class="reply-register">
                                            <textarea name="reply-content" id="reply-content" 
                                            class="reply-content" cols="70" rows="2"></textarea>
                                            <button id="reply-register-button" class="reply-register-button">댓글 달기</button>
                                        </div>
                                    </div>
                          
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>

        <div class="cart-alert-container">
            <div class="cart-alert-popup">
                <div class="cart-alert-complete center-align">
                    <span>선택완료</span>
                </div>

                <div class="cart-alert-text center-align">
                    <span>장바구니에 추가했습니다.</span>
                </div>

                <div class="cart-popup-quit center-align">
                    <button class="keep-shopping">쇼핑 계속하기</button>
                    <button class="check-my-cart">장바구니 확인</button>
                </div>
            </div>
        </div>

        <script src="/js/cartAlertFunc.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

        <script>
            const putIntoCart = document.querySelector("#putIntoCart");
            putIntoCart.addEventListener('click', async () => {
                const bookId = putIntoCart.dataset.bookid;
                console.log(bookId);
                const user = `${loginInfo}`;
                if(!user) return location.href = "http://localhost:9095/members/login";

                const insertRes = await axios.post('http://localhost:9095/cart', {bookId: bookId});
                const data = insertRes.data;
                if(data == "duplicatedCartExists") {
                    cartAlertFunc("이미 장바구니에 존재하는 상품입니다.", "flex");
                    return;
                }
                if(data == "insertCartSucceed") {
                    cartAlertFunc("장바구니에 상품을 추가했습니다.", "flex");
                    return;
                }
            })
            
        </script>

        <!-- 접고 펼치기 옵션 -->
        <script>
            let foldButton = document.querySelectorAll(".fold-button");
            let bookDefaultBody = document.querySelectorAll(".book-default-body");
            let bookViewContent = document.querySelector(".bookview-content");
            let foldOption = true;
            let firstTime = true;
            

            foldButton.forEach((button) => {
                button.addEventListener('click',(event)=> {
                    // 처음 시도하는 경우
                    if(firstTime == true){
                        bookViewContent.classList.remove("box-folded");
                        button.innerHTML = "접기<i class='bx bxs-caret-up-circle'></i>";
                        firstTime = false;
                        return;
                    }

                    if(foldOption == true){
                    	bookViewContent.classList.add("box-folded");
                        button.innerHTML = "펼쳐보기<i class='bx bxs-caret-down-circle'></i>";
                    }else{
                    	bookViewContent.classList.remove("box-folded");
                        button.innerHTML = "접기<i class='bx bxs-caret-up-circle'></i>";
                        firstTime = false;
                    }

                    foldOption = !foldOption;
                })
            })
        </script>

        <!-- 댓글 작성시 우선 로그인 -->
        <%-- <script>
            let bookRatings = document.getElementsByName("ratings");
            let bookReviewContent = document.getElementById("book-review-content");
            
            bookRatings.forEach((rating) => {
                rating.addEventListener('click', async() => {
                    const user = '<%= user %>';
                    if(!user) return location.href = "http://localhost:9095/members/login";
                })
            })

            bookReviewContent.addEventListener('click', async () => {
               const user = '<%= user %>';
                if(!user) return location.href = "http://localhost:9095/members/login";
            })
        </script> --%>

        <!-- 리뷰남기기 버튼 클릭 -->
        <!-- <script>
            const reviewSubmitButton = document.getElementById("review-submit-button");

            const getRatingVal = () => {
                const bookRatings = document.getElementsByName("ratings");
                let rating = null;

                for(r of bookRatings){
                    if(r.type == 'radio' && r.checked) rating = r.value;
                }

                return rating;
            }

            reviewSubmitButton.addEventListener('click', async () => {
                const bookId = parseInt(reviewSubmitButton.dataset.bookid);
                const rating = getRatingVal();
                const content = bookReviewContent.value;
                let spoiler = 0;

                const spoilerCheck = document.getElementById("spoiler-check");
                if(spoilerCheck.checked) spoiler = 1;

                const res = await axios.post("http:/localhost:9095/books/comment-register", {bookId: bookId, rating: rating,
                                                                   spoiler: spoiler, content: content});
                const data = res.data;
                if(res.data == "registerSucceed") location.reload();
            })
        </script> -->

        <!-- 답글 보여주기 -->
        <script>
            // const showReplyButton = document.getElementById("show-reply-button");
            // let showCheck = false;

            // showReplyButton.addEventListener('click', () => {
              

            //   const replyCommentList = document.querySelector('.reply-comment-list');
            //   if(showCheck == false) {
            //     replyCommentList.style.display = "block";
            //     showCheck = true;
            //   }else{
            //     replyCommentList.style.display = "none";
            //     showCheck = false;
            //   }
              
            // })
        </script>
</html>