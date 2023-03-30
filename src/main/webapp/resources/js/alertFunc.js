let alertBody = document.querySelector("body");
let popupQuit = document.querySelector(".popup-quit");
let alertText = document.querySelector(".alert-text>span");
let registerAlert = document.querySelector(".alert-container");

let alertFunc = (alertMessage, onoff) => {
    alertText.innerHTML = alertMessage;
    registerAlert.style.display = `${onoff}`;

    if( onoff == "flex"){
        alertBody.classList.add('alert');
    }else{
        alertBody.classList.remove("alert");
    }
}

popupQuit.addEventListener('click', () => {
    alertFunc("", "none");
})