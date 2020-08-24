<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	/*한글로 바꿔주는거*/ 
	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "jieun";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;


try{
	// 입력창에  받은 데이터를 저장
	String idid = request.getParameter("iid");
	String pwpw = request.getParameter("ppw");
	String nmnm = new String(request.getParameter("nname").getBytes("8859_1"),"UTF-8");
	String adad = new String(request.getParameter("aadd").getBytes("8859_1"),"UTF-8");
	String arar = new String(request.getParameter("aaddr").getBytes("8859_1"),"UTF-8");
	String telltell = request.getParameter("ttel");
			
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	
	//sql 쿼리
	String sql = "INSERT INTO MEMBERJOIN VALUES(?,?,?,?,?,?)";
	
	// prepareStatement
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, idid);
	pstmt.setString(2, pwpw);
	pstmt.setString(3, nmnm);
	pstmt.setString(4, adad);
	pstmt.setString(5, arar);
	pstmt.setString(6, telltell);
	
	pstmt.executeUpdate();
	out.println("데이터 insert 완료");
	
	conn.close();
	
}catch(Exception e){
	out.println(e.getMessage());
}



%>