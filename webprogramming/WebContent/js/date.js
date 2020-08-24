/**
 * 
 */

function proc1(){ 
	//	var now= new Date("2020.10.10");   //date에 값을 넣으면 원하는 시간으로 바뀐다.
	//	var now= new Date(2020,10,10,15,00);   // 11월 10일 (month가 0부터 시작된다. 10 입력 --> 11월  )
		
		var now = new Date(1000); //1970년 1월 1일 기준으로 밀리세컨드 만큼 지난 시간이 세팅
		now = now.toLocaleString();
		
		
		
		//now =now.toLocaleDateString();
		//now =now.toLocaleTimeString();
		
		
		document.getElementById("result").innerHTML = now;
}


function changeDay(day){
	/*숫자값 day를 요일로 변환하세요.*/
	
	if( day == 0){
		return "일";
	}else if(day==1){
		return "월";
	}else if(day==2){
		return "화";
	}else if(day==3){
		return "수";
	}else if(day==4){
		return "목";
	}else if(day==5){
		return "금";
	}else{
		return "토";
	}
	  
	
	/* var days =["일","월","화","수","목","금","토"];
	 * day = days[day];
	 */
	
	
	//return day; //일요일, 월요일 ......
	
	
}


function proc2(){
	 var now = new Date();  //오늘날짜
	 
	 var day = now.getDay(); //요일 숫자값
	 
	 document.getElementById("result").innerHTML = "오늘은"+changeDay(day)+"요일입니다.";
	
}

function proc3(){
	
	var now = new Date();  //오늘날짜
	var birth = new Date(1993,2,29); //자신의 생일 셋팅
	
	/*자기가 태어난 날부터 오늘까지의 날짜를 리턴하세요.
	 * 
	 * 힌트:
	 * birth.getTime() 하면 1970.11.1 부터 birth 날짜까지의 미리세컨드를 반환
	 * 
	 * */
	
	 var my = now.getTime()-birth.getTime();
	 res= parseInt(my/1000 /60 /60 /24); //xx일이 지났습니다.
	
	
	
	document.getElementById("result").innerHTML = "제가 태어난지 "+res+"일  입니다."; //1970년 1월 1일 부터의 밀리세컨드
	
}

function proc4(){
	/*오늘투버 100일 후의 날짜 출력*/
	var mil = 24 * 60 * 60 * 1000 * 100;
	var now = new Date();
	
	var times = now.getTime()+mil;
	
	var date = new Date(times);
	
	document.getElementById("result").innerHTML = date.toLocaleString();
}

function proc5(){
	
	/*
	getDate() :1~31일을 가져온다.
	getMonth() : 0~11 달을 가져온다.
	getFullYear() : 년도를 가져온다 2020
	getHours() : 0~23 시간을 가져온다.
	getMinutes() : 0~59 분을 가져온다
	getSeconds() :0~ 59 초를 가져온다.
	getMilliseconds(): 0~999 밀리초를 가져온다
	getTime(): 경과시간
	*/
	var res ="";
	var now = new Date();
	//2020년 02월 20일 10시 42분 20초 입니다.
	res += now.getFullYear()+"년";
	res += (now.getMonth()+1)+"월";
	res += now.getDate()+"일";
	res += now.getHours()+"시";
	res += now.getMinutes()+"분";
	res += now.getSeconds()+"초";
	
	document.getElementById("result").innerHTML = res;
	
}


function checkDate(){
	//오늘기준으로 13일이후에 산건 환불가능 
	//12일을 포함한 12일  이전에 산거 환불 불가능 
	
	var today = new Date();
	var date = document.getElementById("pdate").value;
	var chdate = new Date(date);  //"2020-02-20"
	var res ="";
	
	
	var chkdate = today.getTime() - chdate.getTime();
	var checkDay = parseInt(chkdate / 1000/ 60/ 60/ 24);
	
	
	// res += checkDay +"일이 지났습니다.";
	
	if(checkDay >7){
		res = "교환기간이 지났습니다.";
	}else{
		res ="교환이 가능합니다.";
	}
	
	document.getElementById("result").innerHTML = res;
	
}


















