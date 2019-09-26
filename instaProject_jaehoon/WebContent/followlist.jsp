<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	HttpSession session2 = request.getSession();
	
	int myid = (int)session2.getAttribute("id");
	
	FollowDAO dao = new FollowDAO();
	
	
    %>
    
     <%=dao.followlist(myid)%>