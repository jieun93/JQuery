<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%

	request.setCharacterEncoding("UTF-8"); 
    
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe"; // db연결
	String DB_USER = "jieun";
	String DB_PASSWORD= "java";
	
	// 변수 선언하는거 
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;	// 데이터를 담아왔을 땨ㅒ
	String result ="";

	String dd = request.getParameter("dd");                 
	
	      
try {

	Class.forName("oracle.jdbc.driver.OracleDriver");
 	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
 	String sql ="	select    board_no, board_title, board_writer ,board_content"+
			  "to_char(board_date, 'YYYY-MM-DD') board_date"+
			  "board_cnt from jdbc_board"+ 
			  "order by  board_no desc ";
 	
 	pstmt = conn.prepareStatement(sql);
 	
 	rs = pstmt.executeQuery();  
 	
 	result ="[";
 	while(rs.next()){
 		Int board_no = rs.getString("board_no");
 		String board_title = rs.getString("board_title");
 		String board_writer = rs.getString("board_writer");
 		String board_content = rs.getString("board_content");
 		String board_date = rs.getString("board_date");
 		Int board_cnt = rs.getString("board_cnt");
 		
 		result +="{\"board_no\":\""+board_no+"\",\"board_title\":\""+board_title+"\",\"board_writer\":\""+board_writer+"\",\"board_content\":\""+board_content
 			+"\",\"board_date\":\""+board_date+"\",\"board_cnt\":\""+board_cnt+"\"},"; 
 			
 	}
 	result = result.substring(0, result.length()-1);
 	result += "]";
 	
 	out.println(result);
 	
 	conn.close();
 	                                                                                                                                                                                                                                                                                                                                                           
} catch(Exception e) {
 out.println(e.getMessage());
}
%>