<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
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
.error{
	color:red;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.need').each(function(i,element){ //입력창에 키보드 입력시 에러 메시지 지우기
			$(element).keyup(function(){
				clearAll();
			})
		});
	})

	function clearAll(){ //에러 메시지 지우기
		$('#errMsg').html("");
	}

	function check(){ //새로운 패스워드 두 개 같은지 확인
		if($('#new_pw').val()!=$('#new_pw2').val()){
			$('#errMsg').html("입력한 새 패스워드 두 개가 일치하는지 확인하세요");
			$('#new_pw').focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<section>
		<aside id="left">
			<div>
				<a href="profile.do">프로필 편집</a>
			</div>
			<div>
				<a href="passwordEdit.jsp">비밀번호 변경</a>
			</div>
			<div>
				<a href="withdraw.jsp">회원 탈퇴</a>
			</div>
		</aside>
		<aside id="center">
			<form action="passwordEdit.do" method="post" onsubmit="return check()" onreset="clearAll()">
			<div>
				이전 비밀번호 : <input type="password" id="past_pw" name="past_pw" class="need" required="required">
			</div>
			<div>
				새 비밀번호 : <input type="password" id="new_pw" name="new_pw" class="need" required="required" pattern="(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,}">
			<span>영문자, 숫자, 특수문자 포함 6자 이상</span>
			</div>
			<div>
				새 비밀번호 확인 : <input type="password" id="new_pw2" name="new_pw2" class="need" required="required">
			</div>
			<span class="error" id="errMsg">${msg}</span><br>
			<input type="submit" value="수정">
			<input type="reset" value="초기화">
			</form>
		</aside>
	</section>
</body>
</html>