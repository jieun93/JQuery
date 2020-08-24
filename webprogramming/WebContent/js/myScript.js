/**
 * 외부 스크립트 파일입니다.
 */

function gradeFunc(){

var grade  = prompt("성적을 입력해주세요(A-F까지)");

switch(grade){

	case "A" : alert("잘했어요!");
		break;
		
	case "B" : alert("좋은 정수군요");
	 	break;
	
	case "C" : alert("괜찮은 정수군요");
		break;
	
	case "D" : alert("좀 더 노력하세요");
		break;
	
	case "F" : alert("다음 학기 수강하세요");
		break;
	
	
	default : alert("알 수 없는 학점 입니다.");
	}
}

function gradeInput(grade){
	/*힌트 : parseInt 는 소수점일 경우 정수형으로 변경됨*/
	/*스위치 문으로
	 * 90점 이상이면 a 
	 * 80점 이상이면  b
	 * 70점 이상이면 c
	 * 60점 d
	 * 59점 이하는 f 
	 */
	var grade = parseInt (grade / 10);
	
	switch(grade){
		
		case 9 : alert("a");
		break;
		
		case 8 : alert("b");
		break;
		
		case 7 : alert("c");
		break;
		
		case 6 : alert("d");
		break;
		
		default : alert("f");
	
		
	}
	
	
}

/*가위 ,바위, 보 문제
 * 함수 호출 형태 result(p1, p2)
 * <<p1, p2 파라미터는 html 내부 스크립트에서 prompt로 입력받기>>
 * p2은 가위, 바위, 보 중에 하나의 텍스트를 입력 받아
 * 
 *  p1이 가위, p2가 보 라면
 *  "p1이 가위로 이겼습니다" 라고 출력
 *  
 *  
 * p1이 바위, p2가 바위 라면
 * "p1과 p2가 바위로 비겼습니다." 라고 출력
 */

function graderesult(result){
	 
	if(p1=="가위" && p2 =="보" || p1 == "보" && p2 =="주먹" || p1=="바위" && p2=="가위"){
		document.write("p1이 "+p1+"로 이겼습니다.");
	
	}else if(p1==p2){
		document.write("p1과p2가"+p1+"로 비겼습니다.");
	}
	
	
}




















