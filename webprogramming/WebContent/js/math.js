/**
 * 
 */
function proc1(){
	
	var number = Math.floor(Math.random()*10 +1); //정수값만 가져오게 함
	/*1~10까지의 난수를 발생하고 해당 수를 맞추는 문제
	 * 
	 * 
	 * prompt로 숫자를 입력하면 해당 난수보다  작성한 값이 작으면 "작성한 값이 작습니다."
	 * 해당 난수보다 작성한 값이 크면 "작성한 값이 큽니다."
	 * 동일하면 "맞췄습니다"
	 * 
	 */
	
	//document.getElementById("result").innerHTML = number;

	var input = 0;
	var res ="";
	while(true){
		input=parseInt(prompt("값을 입력해주세요"));
		count++;
		
		if(input==number) 	break;
		else if(input<number)
			res ="작성한 값이 작습니다.";
		else if(input>number)
			res ="작성한 값이 큽니다.";
		
			
		}
	 res = count + "몇번째 맞췄습니다."
		
		document.getElementById("result").innerHTML = res;
		
}


function proc2(){
	var arr=["가위","바위","보"];
	var number = Math.floor(Math.random()*3);  //math.floor 는 소수점을 버리는거
	/*0~2까지 난수를 발생시켜서 컴퓨터가  가위, 바위, 보 중에서 하나를 선택할 수 있게 지정*/
	
	/*prompt로 가위, 바위, 보를 입력하여 컴퓨터와 비교시"이겼습니다","졌습니다","비겼습니다."
	 * 비겼ㅇ르 경우는 한번 더 가위바위보 실행*/
	
	var input2 = " ";
	var res1 = " ";
	input2 = prompt("값을 입력해주세여.");
	
	while(true){
			
		if(arr[number]==input2){res1 = "비겼습니다.";}
		
		if((input2=="가위" && arr[number]=="보" )||( input2=="바위 "&& arr[number]=="가위") ||(input2 =="보" && arr[number]=="바위")){
			res1 ="이겼습니다.";
		break;
		} 
		
		if((input2 =="보 " && arr[number]=="가위") || (input2=="가위"&&arr[number]=="바위")|| (input2 =="바위" && arr[number]=="보")){
			res1 ="졌습니다."; break;
		}
		
		
	}
	document.getElementById("result").innerHTML = res1;
	
}

function proc3(){
		
	var randomNum = "";
	var tempRanddomNum = "";
	
	for(j=0; j<5;){
		for(i = 0; i<6;){
			tempRanddomNum = Math.floor(Math.random()*45)+1;
			if(randomNum.indexOf(tempRanddomNum+" ")== -1){  //-1은 값이 없다는 뜻 
				randomNum += tempRanddomNum + " ";
				i++;
			}
			if( i==6) break;
			
		}
	}
	document.getElementById("result").innerHTML =randomNum;	
	
	
	
	
}
	
	
