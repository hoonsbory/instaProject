<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
section {
	height: 500px;
	width: 800px;
	text-align: center;
	margin: 0 auto;
}

#left {
	float: left;
	border: 1px solid black;
	width: 30%;
	height: 100%;
}

#center {
	float: left;
	border: 1px solid black;
	border-left: none;
	width: 60%;
	height: 100%;
}
</style>
</head>
<body>
	<section>
		<aside id="left">
			<div>
				<a href="profileEdit.jsp">프로필 편집</a>
			</div>
			<div>
				<a href="passwordEdit.jsp">비밀번호 변경</a>
			</div>
			<div>
				<a href="withdraw.jsp">회원 탈퇴</a>
			</div>
		</aside>
		<aside id="center">
			<a href="withdraw.do">탈퇴하기</a>
		</aside>
	</section>
</body>
</html>