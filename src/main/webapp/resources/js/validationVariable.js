let numTest = /[0-9]/; // 숫자
let alpTest = /[a-zA-Z]/; // 영어
let speTest = /[~!@#\#$%<>^&*]/; // 특수문자
let emailTest = /^[a-zA-Z]{1}[a-zA-Z0-9.\-_]+@[a-z0-9]{1}[a-z0-9\-]+[a-z0-9]{1}\.(([a-z]{1}[a-z.]+[a-z]{1})|([a-z]+))$/;
let phoneTest = /^(010|011|016|017|018|019)[^0][0-9]{2,3}[0-9]{4}$/; // 휴대폰 번호
let birthYearTest = /^(19[0-9][0-9]|201[0-9]|202[0-2])$/ // 태어난 해
let birthMonthTest = /^(0[0-9]|1[0-2])$/ // 태어난 달
let birthDayTest = /^(0[1-9]|[1-2][0-9]|3[0-1])$/ // 태어난 날
let birthTest = /^(19[0-9][0-9]|201[0-9]|202[0-2])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/ //생일