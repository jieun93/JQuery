<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>전송결과화면</title>
	</head>
	<body>
	 	<%String id= request.getParameter("query") ;%>
		<%=id%>
		<%String email= request.getParameter("_name") ;%>
		<%=email %>
		
			<%String selType= request.getParameter("selType") ;%>
		<%=selType %>
		
	</body>
	
</html>