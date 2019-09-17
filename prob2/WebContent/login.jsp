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
	int abc = 0;
	int def = 1;
	system.out.println("안녕하세요 ");

%>

	{"user" : <%= data %>}

