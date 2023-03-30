// timerText는 countdown을 기록할 태그
// count는 카운트 예정인 초
const countDown = function(timerText, count){ 
	const Interval = setInterval(() => {
        const min = Math.floor(count/60); // 분 
        const sec = count-60*min; // 초
        
        if(count == 0){
            clearInterval(Interval);
            alertFunc("인증 시간을 초과했습니다", "flex");
            certifyTr.style.display = "none";
        }
    
        if(count%60 < 10){
            timerText.innerHTML = `${min}:0${sec}`;	
        }else{
        	timerText.innerHTML = `${min}:${sec}`;
        }
        count--;
        
    }, 1000)
}