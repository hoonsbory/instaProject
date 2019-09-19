<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$("#profileImage").click(function(e){
	$("#imageUpload").click();
});
	
	function fasterPreview(uploader){
		if(uploader.files && uploader.files[0]){
			$('#profileImage').attr('src',
					window.URL.createObjectURL(uploader.files[0]));
		}
	}
	$("#imageUpload").change(function(){
		fasterPreview(this);
	});

</script>
<body>
<header>

	<div class="container">

		<div class="profile">

			<div class="profile-image">

				<img id="profileImage" src="https://i.imgur.com/VMumJLl.png" title="default-profile.png"/>
				<input id="imageUpload" type="file"  name="profile_photo" placeholder="Photo" required="" capture>
                   
			</div>

			<div class="profile-user-settings">

				<h1 class="profile-user-name">janedoe_</h1>

				<button class="btn profile-edit-btn">프로필 편집</button>


			</div>
	<br>
			<div class="profile-stats">

				<ul>
					<li><span class="profile-stat-count">164</span> 게시글</li>
					<li><span class="profile-stat-count">188</span> 팔로워</li>
					<li><span class="profile-stat-count">206</span> 팔로잉</li>
				</ul>

			</div>

			<div class="profile-bio">

				<p><span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor sit, amet consectetur adipisicing elit 📷✈️🏕️</p>

			</div>

		</div>

	</div>

</header>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<hr>

<div class="container">
	<div class="gallery">
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		<div class="gallery-item">
		<img class="gallery-image" src="https://i.imgur.com/BfW1TDz.jpg" title="coloursurge.jpg"/>
			<div class="gallery-item-info">
				<ul>
				<li class="gallery-item-like"> <span class="visually-hidden">like;</span></li>
				<li class="gallery-item-comment"> <span class="visually-hidden">comments;</span></li>
				</ul>
			</div>
		</div>
		
	
	</div>
</div>
</body>
</html>