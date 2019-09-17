<%@page import="dao.empdao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<% 
		empdao dao = new empdao(); 
		%>
  
   
   
   <%= dao.chartemp()%>
  
   
   
   