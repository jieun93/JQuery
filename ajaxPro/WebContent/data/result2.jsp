<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	// post 형식으로 파라미터를 받을 경우
	request.setCharacterEncoding("UTF-8"); 
	%>
	<%-- 
	<% // get 방식으로 파라미터를 받는 경우
		 String str = 
		  new String(request.getParameter("name").getBytes("8859_1"), "UTF-8"); 
	%>
	<%
		 String str2 = 
		  new String(request.getParameter("age").getBytes("8859_1"), "UTF-8"); 
	%> --%>
	<%
	String str = request.getParameter("name");
	str += request.getParameter("age");
	%>
	<%=str%>
