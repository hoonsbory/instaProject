<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="login.do" method="post">
		<fieldset>
			ID: <input type="email" id="email" name="email"><br>
			PW: <input type="password" id="pw" name="pw"><br>
			<button type="submit" class="btn" name="btn01">로그인</button><br><br><br><br>
	
			비밀번호를 잊으셨나요? 
			<a href="pw_search.jsp">비밀번호 찾기</a>	<br><br><br><br>
			
			계정이 없으신가요?
			<a href="signUp.jsp">회원가입하기</a>
		</fieldset>
		</form>
</body>
</html>