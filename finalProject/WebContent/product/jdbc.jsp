"<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
String DB_USER = "jieun";
String DB_PASSWORD= "java";

Connection conn;
PreparedStatement pstmt = null;
ResultSet rs;

// 왼쪽 박스 db 설정 
String result="";

try { 
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	String sql = "select lprod_gu, lprod_nm from lprod";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	rs = pstmt.executeQuery();                                   // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	
	 // jsp-->json 형태로 변형하는거 
	result ="[";												
	while(rs.next()){  // db의 값을  변수에 저장하기 
		String lprod_gu = rs.getString("lprod_gu");
		String lprod_nm = rs.getString("lprod_nm");
	
		result += "{\"lprod_gu\":\""+lprod_gu+"\",\"lprod_nm\":\""+lprod_nm+"\"},";
	
	}
	result = result.substring(0, result.length()-1);  // 맨 뒤의 쉼표를 없애주는거 
	result +="]";
	
	out.println(result);
	//	out.println("테이블 select 완료 ");        // 성공시 메시지 출력
	
	

 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");

} catch(Exception e) {
 out.println(e.getMessage());
}
%>
