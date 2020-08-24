<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
String DB_USER = "jieun";
String DB_PASSWORD= "java";
Connection conn;
PreparedStatement pstmt = null;
ResultSet rs;

String result="";
try {
	// 입력창에  입력받은  정보를 저장
	 String id = request.getParameter("iid"); // html의 data의 "id"
	 String pw = request.getParameter("pw");
			 
	 
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	String sql = "SELECT mem_id, mem_pass from member";          // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	rs = pstmt.executeQuery();                                   // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

	while(rs.next()){  // db의 값을  변수에 저장하기 
		String mem_id = rs.getString("mem_id");
		String mem_pw = rs.getString("mem_pass");
	
		// 조건문으로 값을 비교하여  결과 출력하기 
		if(mem_id.equals(id) && mem_pw.equals(pw)){
			result ="로그인되었습니다.";
			break;
		}else{
			result="로그인 실패";
		}
		
	}
	/* id, password 체크해서 로그인 되었습니다. 실패했습니다. body태그에 출력*/
	
	
	
	out.println(id+","+pw);
	//	out.println("테이블 select 완료 ");        // 성공시 메시지 출력
	
	

 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");
 out.println(result);
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
