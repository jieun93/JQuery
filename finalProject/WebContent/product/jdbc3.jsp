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
	String dd = request.getParameter("dd"); // 데이터를 받은거 

try { 
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	String sql = "select * from prod where prod_lgu = ? ";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	pstmt.setString(1,dd);	// 첫번째 파라미터는 ?의 순서  / dd= 값 넣는거 
	
	rs = pstmt.executeQuery();                                   // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	
	 // jsp-->json 형태로 변형하는거 
	result ="[";												
	while(rs.next()){  // db의 값을  변수에 저장하기 
		String prod_lgu = rs.getString("prod_lgu");
		String prod_name = rs.getString("prod_name");
		String prod_id = rs.getString("prod_id");
		String prod_cost = rs.getString("prod_cost");
		String prod_buyer = rs.getString("prod_buyer");
	
		result += "{\"prod_lgu\":\""+prod_lgu+"\",\"prod_name\":\""+prod_name+"\",\"prod_id\":\""+prod_id+"\",\"prod_cost\":\""+prod_cost+"\",\"prod_buyer\":\""+prod_buyer+"\"},";
	
	}
	result = result.substring(0, result.length()-1);  // 맨 뒤의 쉼표를 없애주는거 
	result +="]";
	
	out.println(result); // 데이터를 보내는거 
	//	out.println("테이블 select 완료 ");        // 성공시 메시지 출력
	
	

 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");

} catch(Exception e) {
 out.println("실패");
 out.println(e.getMessage());
}
%>
