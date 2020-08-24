<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
			<!-- 한글입력하는거 -->
			<% String name = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8"); %>
			<%=name %>
			<% String add = new String(request.getParameter("add").getBytes("8859_1"), "UTF-8"); %>
			<!--영문으로 하는방법 <%//String add= request.getParameter("add") ;%> -->
			<%=add %>
			<%String email= request.getParameter("email") ;%>
			<%=email %>
			<%String gender = request.getParameter("gender") ;%>
			<%=gender %>
	</body>
</html>