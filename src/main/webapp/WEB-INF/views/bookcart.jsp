<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내 카트 - KIWII</title>
        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/bookcart.css">
        <link rel="stylesheet" href="/css/font.css">
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
            <h1>카트</h1>

            <div class="cart-wrap">
                <div class="cart-list-box">
                    <div class="select-all-erase vertical-align">
                        <label for="cart-select-all" class="vertical-align">
                            <input type="checkbox" id="cart-select-all" 
                            name="cart-select-all" class="cart-select-all">
                            <span>전체 선택</span> 
                        </label>

                        <button id="cart-select-delete-button">선택 삭제</button>
                    </div>
                    
                    <div class="cart-list">
                        <c:forEach var = "cart" items = "${ myCart }">
                            <div class="cart-component vertical-align">
                                <input type="checkbox" id="cart-component-checked"
                                name="cart-component-checked" class="cart-component-checked"
                                data-sellprice="${cart.sellprice }"
                                data-bookId="${cart.bookId}">
                                <div class="cart-component-image">
                                    <img src="/img/${cart.image}" alt="">
                                </div>
                                <div class="cart-component-info">
                                    <h3>${cart.title }</h3>
                                    <p>${cart.author }</p>
                                    <button id="cart-delete-button" data-bookId="${cart.bookId}">삭제</button>
                                </div>
                                <p class="cart-component-price">${cart.sellprice}원</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
    
                <div class="cart-selected-box">
                    <div class="cart-selected-price">
                        <p class="vertical-align"><i class='bx bxs-check-circle'></i> <span class="book-checked">0</span>개를 선택하셨습니다.</p>
                        <div>
                            <p class="total-price vertical-align">총 상품 금액 <span class="total-price-input"><span>0</span>원</span></p>
                        </div>
                    </div>

                    <button id="order-button" class="kiwii-button-default">소장으로 구매하기</button>
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

        <script>

            const totalPrice = () => {
                const cartComponentChecked = document.getElementsByName('cart-component-checked');
                let bookChecked = 0;
                let checkedBookPriceTotal = 0;
                let bookIdArr = [];

                cartComponentChecked.forEach((component) => {
                    const checkedBookPrice = parseInt(component.dataset.sellprice);
                    const bookId = parseInt(component.dataset.bookid);
                    if (component.checked) {
                        bookChecked++;
                        checkedBookPriceTotal = checkedBookPriceTotal+checkedBookPrice;
                        bookIdArr.push(bookId);
                    }
                })

                return {bookChecked: bookChecked, 
                        checkedBookPriceTotal: checkedBookPriceTotal, 
                        bookIdArr: bookIdArr};
            }

            //전체체크
            const cartSelectAll = document.getElementById('cart-select-all');
            cartSelectAll.addEventListener('change', () => {
                const cartComponentChecked = document.getElementsByName('cart-component-checked');

                if(cartSelectAll.checked){
                    cartComponentChecked.forEach((componentChecked) => {
                    componentChecked.checked = true;
                    })
                }else{
                    cartComponentChecked.forEach((componentChecked) => {
                    componentChecked.checked = false;
                    })
                }

                const bookChecked = document.querySelector('.book-checked')
                const totalPriceInput = document.querySelector('.total-price-input>span');
                bookChecked.innerHTML = totalPrice().bookChecked;
                totalPriceInput.innerHTML = totalPrice().checkedBookPriceTotal;
            })

            //개별적인 체크
            const cartComponentChecked = document.getElementsByName('cart-component-checked');
            cartComponentChecked.forEach((componentChecked) => {
                componentChecked.addEventListener('change', () => {
                    const bookChecked = document.querySelector('.book-checked')
                    const totalPriceInput = document.querySelector('.total-price-input>span');
                    bookChecked.innerHTML = totalPrice().bookChecked;
                    totalPriceInput.innerHTML = totalPrice().checkedBookPriceTotal;
                })
            })
            
        </script>

        <!-- 특정 장바구니 상품 삭제하기 -->
        <script>
            const cartDeleteButton = document.querySelectorAll("#cart-delete-button");

            cartDeleteButton.forEach((deleteButton) => {
                deleteButton.addEventListener('click', async () => {
                    const confirmDelete = confirm("해당 작품을 삭제하시겠습니까?");
                    if(confirmDelete) {
                        const bookId = deleteButton.dataset.bookid;

                        const res = await axios.delete('http://localhost:9095/cart?bookId=' + bookId);
                        const data = res.data;
                        if(data == "delete_succeed") return location.reload();
                    }
                })
            })
        </script>

        <!-- 선택한 장바구니 삭제 -->
        <script>
            const cartSelectDeleteButton = document.getElementById('cart-select-delete-button');
            cartSelectDeleteButton.addEventListener('click', async () => {
                const confirmDelete = confirm("선택한 " + totalPrice().bookChecked + "개의 작품을 삭제하시겠습니까?");
                if(confirmDelete) {
                    const bookIdArr = totalPrice().bookIdArr;
                    const res = await axios.post('http://localhost:9095/cart/delete/selected', {bookIdArr: bookIdArr});
                    const data = res.data;
                    if(data == "delete_succeed") return location.reload();
                }
            })
        </script>

        <script>
            const orderButton = document.getElementById("order-button");
            orderButton.addEventListener('click', async () => {
                const bookIdArr = totalPrice().bookIdArr;
            
                if(bookIdArr.length == 0) {
                    alertFunc("주문할 책을 선택해주세요.", "flex");
                    return;
                }

                location.href = "http://localhost:9095/cart/order?bookIdArr=" + bookIdArr;
            })
        </script>
    </body>
</html>