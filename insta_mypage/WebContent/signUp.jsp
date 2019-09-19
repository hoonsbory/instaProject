<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<style type="text/css">
.error{
	color:red;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.need').each(function(i,element){
		$(element).keyup(function(){
			$('#err'+(i+1)).html("");
			$('#errMsg').html("");
		})
	});
})

function clearAll(){
	$('.error').each(function(i, element) {
		$(element).html("");
	});
}

function check(){ //required+pattern 속성으로 할까? 함수로 할까? 일단 함수는 사용x
	if($('#email').val().length==0){
		$('#errMsg').html("이메일 주소를 입력하세요");
		$('#err1').html("!");
		$('#email').focus();
		return false;
	}
	if($('#name').val().length==0){
		$('#errMsg').html("성명을 입력하세요");
		$('#err2').html("!");
		$('#name').focus();
		return false;
	}
	if($('#pw').val().length<6){
		$('#errMsg').html("비밀번호를 6자 이상 입력하세요");
		$('#err3').html("!");
		$('#pw').focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<h1>Instagram</h1>
<h2>회원 가입</h2>
<div>친구들의 사진과 동영상을 보려면 가입하세요.</div>
<form action="signUp.do" method="post" onreset="clearAll()">
<div>이메일 주소: <input type="email" id="email" name="email" class="need" required="required"><span class="error" id="err1"></span></div>
<div>성명: <input type="text" id="name" name="name" class="need" required="required"><span class="error" id="err2"></span></div>
<div>비밀번호: <input type="password" id="pw" name="pw" class="need" required="required" pattern="(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,}">
<span class="error" id="err3"></span><span>영문자, 숫자, 특수문자 포함 6자 이상</span></div>
<span class="error" id="errMsg">${msg}</span><br>
<input type="submit" value="가입">
<input type="reset" value="초기화">
</form>
<br><br>
<div>계정이 있으신가요?<a href="login.jsp">로그인</a></div>
</body>
</html>