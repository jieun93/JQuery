<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>가입결과화면</title>
	</head>
<body>
		
		<%String id = request.getParameter("id") ;%>
			<%=id %>
			<% String password = new String(request.getParameter("pass").getBytes("8859_1"), "UTF-8"); %>
			<%=password %>
			<% String password2 = new String(request.getParameter("pass").getBytes("8859_1"), "UTF-8"); %>
			<%=password2 %>
			<% String name = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %>
			<%=name %>
			<% String gender = new String(request.getParameter("gender").getBytes("8859_1"), "UTF-8"); %>
			<%=gender %>
			<%String year = request.getParameter("year") ;%>
			<%=year %>
			<%String month = request.getParameter("month") ;%>
			<%=month %>
				<%String day = request.getParameter("day") ;%>
			<%=day%>
			 <%String Email = request.getParameter("email") ;%>
			<%=Email %>
				 <%String CellPhone= request.getParameter("tel") ;%>
			<%=CellPhone %>
				 <%String CellPhone2= request.getParameter("cellphone") ;%>
			<%=CellPhone2 %>
				 <%String CellPhone3= request.getParameter("number") ;%>
			<%=CellPhone %>
		
</body>
</html>