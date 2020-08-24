function solution(n, money) {
    var answer = 0;
    answer = [n];
    
    for(var i = 0; i <= n; i++){
    	if((i +1)% money[0] == 0){
            answer[i]=1;
        }
    }
    
    for(var  i = 1; i <money.length; i++ ){
    	var a = money[i];
        for(var j = a-1; j<n; j++){
        if(j == a-1)answer[j]=(answer[j]+1)%1000000007;
            else if(j >a-1){
                answer[j] = (answer[j]+answer[j-a])%1000000007;
            }
    	}
    }   
   return answer[n-1];
}
console.log(solution(5,[1,2,5])); //4