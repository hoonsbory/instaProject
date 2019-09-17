<%@page import="vo.UserVO"%>
<%@page import="service.UserService"%>
<%@page import="dao.Userdao"%>
<%@page import="service.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");

		Userdao dao = new Userdao();
		UserService service = new UserServiceImpl(dao);

		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(pw);
		vo.setName(name);

		int c = service.addUser(vo);
		int a = 0;
	%>
	 

	{"add" : <%= c %>}
