<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/profileEdit.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">


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

#img_change_opt>div {
	border-radius: 20px;
	width: 450px;
	height: 250px;
	margin: 0 auto;
	margin-top: 220px;
	text-align: center;
	vertical-align: middle;
	background-color: white;
}

#img_change_opt>div>div {
	padding: 30px;
	font-size: 15pt;
	font-weight: bold;
}

#imgForm hr {
	margin: 0;
}

#imgForm div {
	height: 35pt;
	line-height: 35pt;
}

#imgForm label {
	font-size: 12pt;
	cursor: pointer;
	font-weight: bold;
}

#upload_label {
	color: #3399ff;
}

#delete_label {
	color: #ff3300;
}

#cancel {
	font-size: 12pt;
	cursor: pointer;
}

#myfile, #delete {
	display: none;
}

#prof_info {
	width: 70%;
	height: 20%;
	margin: 30px auto;
}

#prof_img {
	float: left;
}

#prof_info_sub {
	float: right;
	height: 100%;
	line-height: 50px;
	margin-right: 60px;
	text-align: center;
}

#prof_form {
	clear: both;
}

#prof_form table {
	margin: 0 auto;
	text-align: center;
	width: 400px;
}

#prof_form tr, td {
	height: 50px;
	line-height: 50px;
}

#prof_form td input {
	height: 30px;
	width: 260px;
}

#input_name {
	font-weight: bold;
	float: right;
}

#aa {
	margin: 50px;
}

#submit {
	width: 50px;
}

#img_change_btn {
	margin: 0;
	cursor: pointer;
	color: #3399ff;
}

#prof_info_sub div {
	font-size: 12pt;
}

#profile_menu {
	border-left: 2px solid black !important;
}

#profile_menu a {
	font-weight: bold;
	color: #444444;
}

</style>
<script type="text/javascript">
	$(function() {
		$(function() {
			$('.need').each(function(i, element) {
				$(element).keyup(function() { //입력창에 키보드 입력시 에러 메시지 지우기
					clearAll();
				})
			});
		})

		function clearAll() { //에러 메시지 지우기
			$('#errMsg').html("");
		}

		$('#img_change_btn').click(function() { //프사 편집 버튼 클릭시 프사 편집 선택 화면 보이기
			if ("<c:out value='${user.img}'/>" == "./userpic/default.jpg") //프사가 기본 이미지일 경우 바로 이미지파일 선택 창으로. 되는지 확인해야..
				$('#myfile').trigger('click');
			else
				$('#img_change_opt').css('visibility', 'visible');
		});
		$('#delete').click(function() { //프사 삭제 버튼 클릭시 value변경 -> 서블릿에서 val 확인해서 프사 삭제할것임
			if (confirm('삭제하시겠습니까?')) {
				$(this).val('delete');
				$('#imgForm').submit();
			}
		});
		$('#cancel').click(function() { //취소 버튼 클릭시 프사 편집 선택 화면 감추기
			$('#delete').val(''); //프사 삭제 버튼 초기화
			$('#img_change_opt').css('visibility', 'hidden');
		});
		$('.need').each(function(i, element) {
			$(element).keyup(function() { //입력창에 키보드 입력시 에러 메시지 지우기
				$('#errMsg').html("");
			})
		});
	});
</script>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<section id="sect">
		<aside id="left">
			<div id="menu">
				<div id="profile_menu">
					<a href="profile.do">프로필 편집</a>
				</div>
				<div id="password_menu">
					<a href="passwordEdit.jsp">비밀번호 변경</a>
				</div>
				<div id="withdraw_menu">
					<a href="withdraw.jsp">회원 탈퇴</a>
				</div>
			</div>
		</aside>
		<aside id="center">
			<div id="prof_info">
				<img src="${user.img}" alt="" id="prof_img" width=100 height=100>
				<div id="prof_info_sub">
					<div>${user.email}</div>
					<div>
						<h4 id="img_change_btn">프로필 사진 바꾸기</h4>
					</div>
				</div>
			</div>
			<form action="./profileEdit.do" method="post" id="prof_form">
				<table>
					<tr>
						<td id="input_name">이름</td>
						<td><input type="text" class="need" id="name" name="name"
							value="${user.name}" required="required"></td>
					</tr>
					<tr>
						<td id="input_name">이메일</td>
						<td><input type="email" class="need" id="email" name="email"
							value="${user.email}" required="required"></td>
					</tr>
				</table>
				<div id="aa">
					<span class="error" id="errMsg">${msg}</span>
				</div>
				<div>
					<input type="submit" id="submit" value="수정">
				</div>
			</form>
		</aside>
	</section>
	<div id="img_change_opt">
		<div>
			<!-- 수직 정렬 도와줘.....-->
			<div>프로필 사진 바꾸기</div>
			<form action="./profImgChange.do" method="post"
				enctype="multipart/form-data" id="imgForm">
				<hr>
				<div>
					<label for="myfile" id="upload_label"><input type="file"
						id="myfile" name="myfile" multiple="multiple"
						onchange="form.submit()">사진 업로드</label>
				</div>
				<hr>
				<div>
					<label for="delete" id="delete_label"><input type="text"
						id="delete" name="delete" value="">현재 사진 삭제</label>
				</div>
				<hr>
			</form>
			<h4 id="cancel">취소</h4>

		</div>
	</div>
	<%@include file="common/footer.jsp"%>
</body>

</html>