<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String str = new String(request.getParameter("id").getBytes("8859_1"),"UTF-8");

%>
<%
	String str2 = new String(request.getParameter("pw").getBytes("8859_1"),"UTF-8");

%>

<%=str%>
<%=str2%>