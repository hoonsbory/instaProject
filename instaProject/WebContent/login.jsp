<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">
.div01  {
    color: #273299; /*원본 #262626, 청록 깔끔한 색:#269999*/ 
    background-color: #FFFFFF;
    margin-top: 12px;
    max-width: 380px;
    width: 100%; 
}

.login{ /*height 35인데 적당해보임*/
	background-color: #FAFAFA;
	padding: 9px 0px 7px 8px;
	width: 268px; height: 30px;
}
.btn{ 
	width: 268px; height: 30px;
	/*margin: 8px 40px;*/
	

}
#email,#pw,#btn{
	position: absolute;
	left: 60px;
}

#div04 {
	position: absolute;
	left: 60px; right: 30px; 
	width: 270px; height: 1px;
	border: 0.1px solid green;
	
	
}

</style>

<script type="text/javascript">

</script>

</head>
<body>

	<div class="div01 ">
                                                       
	
	<form action="login.do" method="post">
		<fieldset>
			<h1 class="" style="text-align: center;">Instagram</h1>
			
			<div class="div02">
				ID:   &nbsp; &nbsp; <input type="email" id="email" name="email" class="login" value="${email}"><br><br><br>
				PW:  &nbsp; <input type="password" id="pw" name="pw" class="login"><br>
				<br><br>
			<span class="error" id="errMsg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg}</span><br><br>
			<div id="div03"><button type="submit" id="btn" class="btn" name="btn01">로그인</button><br><br><br><br>
			</div>
			
			<div id="div04"></div><br>
	
			 &nbsp; &nbsp; &nbsp;비밀번호를 잊으셨나요? 
			<a href="pw_search.jsp">비밀번호 찾기</a>	<br><br><br><br>
			</div>
			
			<div>
			계정이 없으신가요?
			<a href="signUp.jsp">회원가입하기</a>
			</div>
		</fieldset>		
		</form>
		
	</div>
</body>
</html>