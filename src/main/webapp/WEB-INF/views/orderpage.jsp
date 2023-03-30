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
        <title>주문/결제 - KIWII</title>

        <link rel="stylesheet" href="/css/reset.css">
        <link rel="stylesheet" href="/css/menu.css">
        <link rel="stylesheet" href="/css/footer.css">
        <link rel="stylesheet" href="/css/alert.css">
        <link rel="stylesheet" href="/css/orderpage.css">

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
            <div class="order-info-box">
                <div class="order-info-header vertical-align">
                    <h2>주문 목록</h2>
                </div>
                <c:forEach var = "order" items = "${ orderList }">
	                <div class="order-info-component vertical-align">
	                   <div class="order-info-image-container">
	                        <img src="/img/${order.image}" alt="">
	                    </div>
	                    <div class="order-info-title-author">
	                        <p>${order.title}</p>
	                        <p>${order.author}</p>
	                    </div>
	                    <p class="order-info-price">${order.sellprice}원</p>
	                </div>
                </c:forEach>
            </div>
            <div class="payment-info-box">
                <div class="payment-info-header vertical-align">
                    <h2>결제 정보</h2>
                </div>
                <div class="payment-info-body">
                    <div class="order-total-price vertical-align">
                        <span class="total-price">총 주문 금액</span>
                        <span class="total-price-input">${totalPrice}원</span>
                    </div>
                    <div class="payment-total-price center-align">총 결제 금액 <span>${totalPrice}</span>원</div>
                    <div class="payment-method">
                        <ul class="method-list">
                            <li><h4>결제 수단</h4></li>
                            <li>
                                <label for="naver-pay">
                                    <input type="radio" name="pay-type" id="naver-pay" value="naver-pay" checked>
                                    <img src="/img/npay_20.png" alt="">
                                </label>
                            </li>
                            <li>
                                <label for="kakao-pay">
                                    <input type="radio" name="pay-type" id="kakao-pay" value="kakao-pay">
                                    <img src="/img/kakaopay_logo.png" alt="" width="50" height="20">
                                </label>
                            </li>
                            <li>
                                <label for="credit-card">
                                    <input type="radio" name="pay-type" id="credit-card" value="credit-card">
                                    <span>신용카드</span>
                                </label>
                            </li>
                            <li>
                                <label for="cell-phone-pay">
                                    <input type="radio" name="pay-type" id="cell-phone-pay" value="cell-phone-pay">
                                    <span>휴대폰</span>
                                </label>
                            </li>
                            <li>
                                <label for="account-transfer">
                                    <input type="radio" name="pay-type" id="account-transfer" value="cell-phone-pay">
                                    <span>계좌이체</span>
                                </label>
                            </li>
                            <li>
                                <label for="cultureland-pay">
                                    <input type="radio" name="pay-type" id="cultureland-pay" value="cultureland-pay">
                                    <span>컬쳐랜드 문화상품권</span>
                                </label>
                            </li>
                            <li>
                                <label for="book-coupon-pay">
                                    <input type="radio" name="pay-type" id="book-coupon-pay" value="book-coupon-pay">
                                    <span>도서 문화상품권</span>
                                </label>
                            </li>
                            <li>
                                <label for="happymoney-pay">
                                    <input type="radio" name="pay-type" id="happymoney-pay" value="happymoney-pay">
                                    <span>해피머니(모바일팝)</span>
                                </label>
                            </li>
                            <li>
                                <label for="overseas-credit-card">
                                    <input type="radio" name="pay-type" id="overseas-credit-card" value="overseas-credit-card">
                                    <span>해외발행 신용카드</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="payment-agreement-wrap">
                    <h2>구매 동의</h2>
                    <label for="buy-agree">
                        <input type="checkbox" id="buy-agree" name="buy-agree" class="buy-agree">
                        <span>구매에 동의합니다.</span>
                    </label>
                    <button id="payment-button" class="payment-button kiwii-button-default">결제하기</button>
                </div>
            </div>
        </section>

        <jsp:include page = "/WEB-INF/views/footer.jsp"/>

        <script src="https://js.tosspayments.com/v1/payment"></script>
        <script src="/js/uuid.js"></script>
        <script>
            const getPayType = () => {
                const payTypes = document.getElementsByName('pay-type');
                let payType = null;

                for(type of payTypes){
                    if(type.type == 'radio' && type.checked) payType = type.value;
                }

                return payType;
            }

            const tossPayments = TossPayments("test_ck_XLkKEypNArW7ePBzOpLrlmeaxYG5");
            const tossPaymentFunc = (type, amount, orderId, orderName, customerName) => {
                tossPayments.requestPayment(type, {
                    amount: amount, 
                    orderId: orderId,
                    orderName: orderName,
                    customerName: customerName,
                })
                .then((data) => {
                	location.href = "http://localhost:9095/cart/order/succeed?orderName=" + orderName + "&orderId=" + data.orderId + "&amount=" + data.amount;
                })
                .catch((error) => {
                    if (error.code === 'PAY_PROCESS_CANCELED') return alertFunc("결제창이 닫혀 결제가 중도취소됐습니다.", "flex");
                    if (error.code === 'INVALID_CARD_COMPANY') return alertFunc("카드 코드가 유효하지 않습니다.", "flex"); 
                })
            }

            const paymentButton = document.getElementById("payment-button");
            paymentButton.addEventListener('click', async () => {

                const buyAgree = document.getElementById("buy-agree");
                if(!buyAgree.checked) return alertFunc("결제 동의에 체크해주세요.", "flex");

                const orderListLength = `${orderList.size()}`;

                let orderName;
                if(orderListLength > 1) orderName = `${orderList[0].title} 외 ${orderList.size()}권`;
                else orderName = `${orderList[0].title}`;

                switch (getPayType()){
                    case "naver-pay" : 
                        console.log("네이버 카드로 결제");
                        break;
                    case "kakao-pay" :
                        console.log("카카오 카드로 결제");
                        break;
                    case "credit-card" :
                        tossPaymentFunc('카드', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                    case "cell-phone-pay" :
                        tossPaymentFunc('휴대폰', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                    case "account-transfer":
                        tossPaymentFunc('계좌이체', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                    case "cultureland-pay":
                        tossPaymentFunc('문화상품권', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                    case "book-coupon-pay":
                        tossPaymentFunc('도서문화상품권', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                    case "happymoney-pay":
                        console.log("해피머니로 결제");
                        break;
                    case "overseas-credit-card":
                        tossPaymentFunc('해외간편결제', 
                                        `${totalPrice}`, 
                                        uuidv4(),   
                                        orderName, 
                                        `${memName}`);
                        break;
                }
            })
        </script>
    </body>
</html>