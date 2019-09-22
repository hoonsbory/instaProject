<%@page import="dao.InstaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String id = request.getParameter("id");
	
	
	InstaDao dao = new InstaDao(); 
	
	
	
	
    
    
    %>
    
    
    <%=dao.getAllBookJSON(Integer.parseInt(id))%>