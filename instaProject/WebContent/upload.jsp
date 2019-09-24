<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.InstaDao" %>
<%@ page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.util.Enumeration" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/upload.css">
<title>파일업로드</title>
<style type="text/css">
body{
	background-color: white;
}

img{
  max-width:380px;
  display:inline;
  float:left;
  top:50%;
}

#post{
	display:inline;
	float:left;
	width:300px;
	height:190px;
}
input{
	display:inline;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();

			reader.onload = function(e) {
				$("#photo").attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>


<body>

	<h3>이미치 첨부 및 글 작성</h3>
	<!-- 이미지미리보기 -->
		<form action="insertPost.do" method="post" enctype="multipart/form-data">
	아이디:<input type="text" name="id">
	파일첨부:<input type='file' onchange="readURL(this);" /><br>
	<img id="photo" src="https://i.imgur.com/WNUTE8N.jpg" alt="your image" />
	<div class="comment-block">
			게시글:<textarea  name="post" id="post" 
				placeholder="게시할 글을 작성하세요..." maxlength="100" \></textarea>
				
				<div class="buttons">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
				</div>
	</div>
		</form>
</body>
</html>