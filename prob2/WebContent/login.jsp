<%@page import="vo.UserVO"%>
<%@page import="service.UserServiceImpl"%>
<%@page import="service.UserService"%>
<%@page import="dao.Userdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	String id =  request.getParameter("id"); 
	String pw =  request.getParameter("pw"); 
	
	Userdao dao = new Userdao();
	UserService service = new UserServiceImpl(dao);
	
	UserVO vo =  new UserVO();
	vo.setId(id);
	vo.setPassword(pw);
	
	int data = service.login(vo);
	

%>

	{"user" : <%= data %>}

