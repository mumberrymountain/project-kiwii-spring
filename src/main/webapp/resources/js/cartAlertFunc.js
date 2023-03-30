const cartAlertBody = document.querySelector("body");
const keepShopping = document.querySelector(".keep-shopping");
const cartRegisterAlert = document.querySelector(".cart-alert-container");
const checkMyCart = document.querySelector(".check-my-cart");
const cartAlertText = document.querySelector('.cart-alert-text');

const cartAlertFunc = (cartAlertMessage, onoff) => {
    cartAlertText.innerHTML = cartAlertMessage;
    cartRegisterAlert.style.display = `${onoff}`;

    if( onoff == "flex"){
        cartAlertBody.classList.add('alert');
    }else{
        cartAlertBody.classList.remove("alert");
    }
}

keepShopping.addEventListener('click', () => {
    cartAlertFunc("", "none");
})

checkMyCart.addEventListener('click', () => {
    return location.href = "../cart";
})