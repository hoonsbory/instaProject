<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/upload.css">
<title>Insert title here</title>
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

	<h3>이미치 첨부하기</h3>
	<input type='file' onchange="readURL(this);" />
	<img id="photo" src="https://i.imgur.com/WNUTE8N.jpg" alt="your image" />
	<!-- <div class="remove">
<img src="image" />
<button onclick="removeImage"><i class="fas fa-trash"></i></button>
</div> -->
	<div class="comment-block">
		<form action="">
			<textarea name="" id="" cols="30" rows="3"
				placeholder="write something"></textarea>
		</form>
		<button type="submit">submit</button>
	</div>
</body>
</html>