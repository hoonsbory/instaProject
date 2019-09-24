<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


<body>
	<%@include file="common/header.jsp" %>
	<header>

		<div class="container">

			<div class="profile">

				<div class="profile-image">
				
					<img id="profileImage" src="https://i.imgur.com/VMumJLl.png"
						title="default-profile.png" style="width:150px ;height:150px;"/>
						<form action="profImgChange.do" method="post" enctype="multipart/form-data">
						 <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo" >
						</form>
					<script>
						$("#profileImage").click(function(e) {
							$("#imageUpload").click();
						});

						function fasterPreview(uploader) {
							if (uploader.files && uploader.files[0]) {
								$('#profileImage')
										.attr(
												'src',
												window.URL
														.createObjectURL(uploader.files[0]));
							}
						}
						$("#imageUpload").change(function() {
							fasterPreview(this);
						});
					</script>
				</div>
				<div class="profile-user">
				<div class="profile-user-settings">

					<h1 class="profile-user-name">janedoe_</h1>

					<button class="btn profile-edit-btn">프로필 편집</button>


				</div>
				<br>
				<div class="profile-stats">

					<ul>
						<li><span class="profile-stat-count">164</span> 게시물</li>
						<li><span class="profile-stat-count">188</span> 팔로워</li>
						<li><span class="profile-stat-count">206</span> 팔로잉</li>
					</ul>

				</div>

				<div class="profile-bio">

					<p>
						<span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor
						sit, amet consectetur adipisicing elit 📷✈️🏕️
					</p>

				</div>
</div>
			</div>

		</div>

	</header>
<!-- <a href="./upload.jsp" target="popup" 
          onclick="window.open('./upload.jsp','name','width=600,height=400')">new post</a> -->
	<div class="newwindow">
	<div onclick="window.open('./upload.jsp','파일업로드','width=800,height=600,top=100%,left=350%,transform=ranslate(-50%, -50%),position=absolute')" data-mce-onclick="">
  <button class="newpost"><font size=”6”>new post</font></button> 
</div></div>
	<div class="clickpost">
	<div onclick="window.open('./post.jsp','파일업로드','width=800,height=600,top=100%,left=350%,transform=ranslate(-50%, -50%),position=absolute')" data-mce-onclick="">
  <button class="newpost"><font size=”6”>post</font></button> 
</div></div>
	<hr>

	
	
	<%@include file="common/footer.jsp" %>
</body>
</html>