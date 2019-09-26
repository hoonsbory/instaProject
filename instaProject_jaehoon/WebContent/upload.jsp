<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.InstaDao"%>
<%@ page import="java.io.File"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<title>파일업로드</title>
<style type="text/css">
*, *::before, *::after {
	box-sizing: content-box;
}

body {
	background-color: #fafafa;
}

#border {
	
	padding:150px;
}


#content {
	margin-top:50px;
	display:inline;
	border: dashed 1px #dbdbdb;
	border-radius: 3rem;
	width: 400px;
	height: 300px;
}

.uploadpostimage {
	display:inline;
	float:left;
	margin: 50px;
	background-color: white;
	width: 400px;
	border: dashed 1px #dbdbdb;
	border-radius: 3rem;
	transform: scale(1);
	-webkit-box-shadow: 0 0 0 transparent;
	box-shadow: 0 0 0 transparent;
	padding-bottom:50px;
}

.uploadpostimage img {
	display:inline;
	cursor: pointer;
	width: 300px;
	border-radius:3rem;
	margin-left:45px;
	margin-top:50px;
}

#postUpload {
	display: none;
}

p {
	
	text-align: center;
	font-size: 20px;
}
#submit , #reset{
	display:inline;
	padding:5px;
	border: dashed 1px #dbdbdb;
	background-color:white;
	border-radius:3rem;
	margin:10px;
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

	<%@include file="common/header.jsp"%>

	<main>
	<div id="border">
		<!-- 이미지미리보기 -->
		<form action="insertPost.do" method="post"
			enctype="multipart/form-data">

			<div class="uploadpostimage">
				<p>사진을 추가하세요</p>
				<img id="photo" src="https://i.imgur.com/5UrUQkG.png"
					title="click.png" /> <input id="postUpload" name="img" type="file"
					name="profile_photo" placeholder="Photo">
				<script>
					$("#photo").click(function(e) {
						$("#postUpload").click();
					});

					function fasterPreview(uploader) {
						if (uploader.files && uploader.files[0]) {
							$('#photo')
									.attr(
											'src',
											window.URL
													.createObjectURL(uploader.files[0]));
						}
					}
					$("#postUpload").change(function() {
						fasterPreview(this);
					});
				</script>
			</div>
			게시글:
			<textarea name="content" id="content"
				placeholder="    ...게시할 글을 작성하세요..." maxlength="200"\></textarea>

			<div class="buttons">
			<input type="hidden" value="${id}">
				<input type="submit" value="등록" id="submit"> 
				<input type="reset"value="취소" id="reset">
		</form>
	</div>
	</div>
	</main>
	<%@include file="common/footer.jsp"%>
</body>
</html>