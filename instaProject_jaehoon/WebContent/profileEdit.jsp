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

#img_change_opt {
	background-color: rgba(0, 0, 0, .5);
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1;
	visibility: hidden;
	vertical-align: middle;
}

#img_change_opt > div{
	border: 2px solid black;
	width: 300px;
	height: 400px;
	margin: 0 auto;
	margin-top: 200px;
	text-align: center;
	vertical-align: middle;
	background-color: white;
}
#myfile, #delete{
	display: none;
}
.error{
	color:red;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#img_change_btn').click(function() { //프사 편집 버튼 클릭시 프사 편집 선택 화면 보이기
			if("<c:out value='${user.img}'/>"=="./userpic/default.jpg") //프사가 기본 이미지일 경우 바로 이미지파일 선택 창으로. 되는지 확인해야..
				$('#myfile').trigger('click');
			else
				$('#img_change_opt').css('visibility', 'visible');
		});
		$('#delete').click(function() { //프사 삭제 버튼 클릭시 value변경 -> 서블릿에서 val 확인해서 프사 삭제할것임
			if(confirm('삭제하시겠습니까?')){
				$(this).val('delete');
				$('#imgForm').submit();
			}
		});
		$('#cancel').click(function() { //취소 버튼 클릭시 프사 편집 선택 화면 감추기
			$('#delete').val(''); //프사 삭제 버튼 초기화
			$('#img_change_opt').css('visibility', 'hidden');
		});
		$('.need').each(function(i,element){
			$(element).keyup(function(){ //입력창에 키보드 입력시 에러 메시지 지우기
				$('#errMsg').html("");
			})
		});
	});
	
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
			<div>
				<img src="${user.img}" alt="" id="prof_img" width=100 height=100> ${user.email}
				<button id="img_change_btn">프로필 사진 바꾸기</button>
			</div>
			<form action="./profileEdit.do" method="post">
			<div>
				이름 : <input type="text" id="name" name="name" value="${user.name}">
			</div>
			<div>
				이메일 : <input type="email" id="email" name="email" value="${user.email}">
			</div>
			<span class="error" id="errMsg">${msg}</span><br>
			<div><input type="submit" value="수정"></div>
			</form>
		</aside>
	</section>
	<div id="img_change_opt">
		<div> <!-- 수직 정렬 도와줘.....-->
			<div>프로필 사진 바꾸기</div>
			<form action="./profImgChange.do" method="post" enctype="multipart/form-data" id="imgForm">
			<div><label for="myfile"><input type="file" id="myfile" name="myfile" multiple="multiple" onchange="form.submit()">사진 업로드</label></div>
			<div><label for="delete"><input type="text" id="delete" name="delete" value="">현재 사진 삭제</label></div>
			</form>
			<button id="cancel">취소</button>
			
		</div>
	</div>
</body>
</html>