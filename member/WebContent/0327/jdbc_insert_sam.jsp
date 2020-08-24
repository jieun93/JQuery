<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
	<%

	request.setCharacterEncoding("UTF-8"); 
    
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "jieun";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// submit으로 넘어 올 경우  name의  값으로  넘어오는거 

try {
	
		String flag = request.getParameter("flag");
	 	Class.forName("oracle.jdbc.driver.OracleDriver");
	 	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		if(flag.equals("1")){ // html flag 1부분
			
		String id = request.getParameter("id");  // html ajax의 data의 id 부분
		
		String sql = "select mem_id from memberjoin where mem_id=?"; // sql쿼리문
		pstmt = conn.prepareStatement(sql); // db랑 sql를 연결하는 부분
		pstmt.setString(1, id);        // pstmt에 id를 넣는거?
		
		rs = pstmt.executeQuery();     //executeQuery : ResultSet을 얻기 위한 메소드,주로 select 문이 이에 속한다
	
		String name = null; 
		
		if(rs.next()){
			name = rs.getString("mem_id"); // db의 데이터를 name에 담아두는거 
			
		};
		
		if(name == null){  // DB에 입력된 데이터가 없으면 
			out.print("{\"id\":\""+id+"사용가능한 아이디 입니다.\"}");
		}else{
			out.print("{\"id\":\""+id+"사용불가능한 아이디 입니다. \"}");
		}
	 
	
	}else if(flag.equals("2")){
		
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name 
	= new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
	String email = request.getParameter("email");
	 String zip = request.getParameter("zip"); 
	String add1 = request.getParameter("add1");
	String add2 = request.getParameter("add2");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("year");
	String birth1 = request.getParameter("month");
	String birth2 = request.getParameter("day");
	
	//String name = request.getParameter("name");
	
	 // sql 쿼리
 	 String sql = "INSERT INTO MEMBERJOIN VALUES(?,?,?,?,?,?,?,?,?,?) ";       

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, add1);
		pstmt.setString(5, add2);
		pstmt.setString(6, tel);
		pstmt.setString(7, gender);
		pstmt.setString(8, birth+birth1+birth2);
		pstmt.setString(9, email);
		 pstmt.setString(10, zip);
		
	
      int cnt = pstmt.executeUpdate();
	  if(cnt >0){
		  out.print("회원가입됐습니다.");
	  }else{
		  out.print("회원가입 실패입니다.");
	  }
	}
	
	
 conn.close(); 
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
