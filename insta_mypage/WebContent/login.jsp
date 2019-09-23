<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in</title>
<link href="https://fonts.googleapis.com/css?family=Rum+Raisin&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<script type="text/javascript">
$(function () {
	$(.need).each(function(i,element) {
		$(element).keyup(function() { // 입력창에 키보드로 입력시 에러 메세지 지우기
			clearAll();
		})
	});
})

function clearAll() { // 입력창_에러메세지 지우기
	$('#errMsg').html("");
}
</script>


<style type="text/css">

.whole{
    max-width: 486px;
    width: 100%; 
    height: 740px;
	position: absolute;
	right: 800px;
	top: 180px;
}

.whole-01  {
    background-color: #FFFFFF;
    margin-top: 12px;
}

.whole-01__fieldset{
	border-color: rgba(255,255,255,.5);
	height:600px;
}

.whole-01__header{
	color: #262626; /*원본 #262626, 청록 깔끔한 색:#269999 #273299*/ 
	font-family: 'Rum Raisin', cursive;
	font-size: 60px;
	margin-bottom: 65px;
}


.whole-01__body--email, .need  {
	
	position: absolute;
	left: 50px;
	margin-left: 34px;
	width: 300px; 
	height: 30px;
	background-color: #FAFAFA;
	padding: 7px 7px 7px 8px;
	font-size: 20px;
}

.whole-01__body--errMsg{
	color: #ed4956;
	text-align: center;
}

.whole-01__body--login-btn{
	position: absolute;
	left: 83px;
	bottom: 280px;
	width: 320px; 
	height: 46px;
	font-size: 22px;
	font-weight: 600;
	border-radius: 5px 5px 5px 5px;
	background-color:#2E9AFE ;
	color: #FFFFFF;
	
	
}

.whole-01__body--divide-line {
	position:absolute;
	bottom: 240px;
	left: 1px;
	width: 99%; 
	height: 1px;
	border: 0.4pt solid #efefef; /*#1fefef;*/

}

.whole-01__body--search-question{
	position: absolute;
	bottom: 180px;
	left: 140px;
}

.whole-01__body--search-password{
	position: absolute;
	bottom: 147px;
	left: 180px;
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}


.whole-02 {
	margin-top: 20px;
	border-color: rgba(255,255,255,.5);
	color: #262626; /*원본 #262626, 청록 깔끔한 색:#269999*/ 
	text-align: center;
}

.whole-02--href{
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}

</style>


<script type="text/javascript">

</script>

</head>
<body>
  <div class="whole">
	 <div class="whole-01">
                                                       
		<fieldset class="whole-01__fieldset">
			<form action="login.do" method="post">
			
				<h1 class="whole-01__header" style="text-align: center;">Instagram</h1>
			
				<div class="whole-01__body">
			  	
					<span class="whole-01__body--email_">
					</span>  
					<input type="email" class="whole-01__body--email" id="email" name="email"  value="${email}" placeholder="E-mail" required="required"><br><br><br>
					<span class="need_">
					</span> 
					<input type="password" class="need" id="pw" name="pw" placeholder="Password" required="required" >	<br><br><br>
				
					<div class="whole-01__body--errMsg" id="errMsg"> 
						${msg}
					</div> <br><br>
				
					<button type="submit" class="whole-01__body--login-btn" name="btn01">로그인</button>	<br><br><br><br>
				
			
					<div class="whole-01__body--divide-line">
					</div>	<br>
				</div>
	
					<div class="whole-01__body--search-question">비밀번호를 잊으셨나요? <br>
					</div>
					<div >
					<a href="pw_search.jsp" class="whole-01__body--search-password" >비밀번호 찾기</a>
					</div>	
			</form>
		</fieldset>		
		
	 </div>
		
			
	<fieldset class="whole-02">
			계정이 없으신가요?
		<a href="signUp.jsp" class="whole-02--href">회원가입</a>
	</fieldset>

  </div>
		

</body>
</html>