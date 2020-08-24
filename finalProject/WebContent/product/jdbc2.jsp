<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
String DB_USER = "jieun";
String DB_PASSWORD= "java";

Connection conn;
PreparedStatement pstmt = null;
ResultSet rs;

String lgu = request.getParameter("lgu");


// out.println(lgu);
	String result="";
try { 
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	// 오른쪽 콤보박스의 값 
 	String sql = "select prod_name, prod_id, prod_lgu, prod_cost, prod_buyer from prod where prod_lgu = ?";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
 	pstmt.setString(1, lgu);									// 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	
	rs = pstmt.executeQuery();									//  executeQuery : 데이터를 보내는거                                   
	 // jsp-->json 형태로 변형하는거 
	result ="[";												
	while(rs.next()){  // db의 값을  변수에 저장하기  반복하면서 한줄씩 가져오는거 
		String prod_lgu = rs.getString("prod_lgu"); // 키 값을 넣고 해당하는 데이터를 값을 넣어주요
		String prod_name = rs.getString("prod_name");
		String prod_id = rs.getString("prod_id");
		String prod_cost = rs.getString("prod_cost");
		String prod_buyer = rs.getString("prod_buyer");
	
	// json타입을 만들기 위해서 string처리를 한거
		result += "{\"prod_lgu\":\""+prod_lgu+"\",\"prod_name\":\""+prod_name+"\",\"prod_id\":\""+prod_id+"\",\"prod_cost\":\""+prod_cost+"\",\"prod_buyer\":\""+prod_buyer+"\"},";
	
	}
	result = result.substring(0, result.length()-1);  // 맨 뒤의 쉼표를 없애주는거 
	result +="]";
	
	out.println(result);
	//	out.println("테이블 select 완료 ");        // 성공시 메시지 출력
	
	

 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");

} catch(Exception e) {
 out.println("실패");
 out.println(e.getMessage());
}
%>

