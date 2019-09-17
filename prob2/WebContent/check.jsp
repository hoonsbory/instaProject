<%@page import="vo.UserVO"%>
<%@page import="service.UserServiceImpl"%>
<%@page import="service.UserService"%>
<%@page import="dao.Userdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String id = request.getParameter("id");
    
    Userdao dao = new Userdao();
	UserVO vo = new UserVO();
	UserService service = new UserServiceImpl(dao);

	vo.setId(id);
    
	int check = service.checkUser(vo);
    %>
    
    
    
    
    
    {"c" : <%= check %>}
   
    