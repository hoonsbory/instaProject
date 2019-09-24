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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	

let page = 1;	// 페이징 
$(function(){	// 페이지를 로드하면 데이터를 가져오고 페이지를 증가시킨다. 
	getList(page);
	page++;
});
$(window).scroll(function(){	// 스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	if($(window).scrollTop() >= $(document).height() - $(window).height()){
		getList(page);
		page++;
	}
});
function getList(page){
	const log = console.log;
	let count = 0;
	let id1 = "<c:out value='${id}'/>";
	$.ajax({
		url : 'mypagepost.jsp',
		type : 'get',
		dataType : 'json',
		data : {id : id1},
		success : function(returnData){
			let row = returnData.rows;
			let html= "";
			if(page == 1){	// 페이지가 1일 경우에만 id가 list인 html을 비운다.
				$(".divmain").html(" ");
			}
			if(returnData.startNum <= returnData.totCnt){
				if(data.length>0){
					((data) >= {
							for (i = data.length; i>0; i-=3){
								let divmain = document.createElement('div');
								divmain.setAttribute("id", "divmain"+i);
								divmain.setAttribute("class", "divmain"); 
								document.querySelector('#sec').appendChild(divmain);
							for(var j = 3; j>0; j--){
								let a = document.createElement("a");
								let img = document.createElement("img");
								document.querySelector("#divmain"+i).appendChild(a);
								img.setAttribute("src", data[count].id)
								img.setAttribute("height" , "300");
								img.setAttribute("width" , "300");
								img.setAttribute("alt" , "instapic");
								img.setAttribute("class" , "mainimg");
								a.setAttribute("href" , "www.naver.com")
								
								$(a).addClass("apic");
								document.querySelector("#divmain"+i).lastElementChild.appendChild(img);
								count++;
									}
								}
							})
						}
				else{
					alert("데이터가 더이상 없습니다. ");
				}
			}
			if(page != 1){
				$(".mainimg").append(html);
			}	
		},
		error : ((e)=>{
			alert('실패'+e);			
		})
	})
};


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
<style type="text/css">
.apic{
	display: inline !important;
}
.divmain{
	display: inline-block !important;
	position: relative;
	left : 20%;
}
.mainimg{
	display: inline;
}
</style>
<title>Insert title here</title>
</head>

<body>
	<nav class="header_nav">
		<div class="header_div1"></div>
		<div class="header_div2">
			<div class="header_div3">
				<div class="top_menu">
					<div class="top_left">
						<a class="top_left_a" href="./myprofile.jsp">
							<div class="top_left_div1">
								<span class="top_left_icon1" aria-label="Instagram"><img
									id="instaicon" src="https://i.imgur.com/Hp5O9oV.png"></span>
								<div class="top_left_div2"></div>
								<div class="title">
									<span class="top_left_icon2" aria-label="Instagram"><img
										id="instagram" src="https://i.imgur.com/ODfS3Zz.png"></span>
								</div>
							</div>
						</a>
					</div>
					<div class="top_mid">
						<input class="search_input" type="text" placeholder="검색">
						<span class="search_span"><img id="search_img"
							src="https://i.imgur.com/dxQeZSn.png"></span>
						<div class="dialog" role="dialog" tabindex="0"></div>
						<div class="search" role="button"></div>
					</div>
					<div class="top_right">
						<div class="top_right_div1">
							<div class="icon">
								<a class="like_account" href=""> <span class="heart"
									aria-label="활동 피드 "><img id="heart"
										src="https://i.imgur.com/wQeFSv5.png"></span>
								</a>
							</div>
							<div class="icon">
								<a href=""> <span class="profile" aria-label="프로필"><img
										id="profile" src="https://i.imgur.com/C0ZD1ii.png"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<header>

		<div class="container">

			<div class="profile">

				<div class="profile-image">
				
					<img id="profileImage" src="https://i.imgur.com/VMumJLl.png"
						title="default-profile.png" style="width:150px ;height:150px;"/>
						 <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo" >
						
					
				</div>
				<div class="profile-user">
				<div class="profile-user-settings">

					<h1 class="profile-user-name">janedoe_</h1>

					<a href="./profileEdit.jsp"><button class="btn profile-edit-btn" >프로필 편집</button></a>


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

					<p>
						<span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor
						sit, amet consectetur adipisicing elit 📷✈️🏕️
					</p>

				</div>
</div>
			</div>

		</div>

	</header>
	<form action="/insertPost.do" method="post" enctype="multipart/form-data">
		<input type="text" name="id">
		<input type="text" name="content">
		<input type="file" name="filename" multiple="multiple">
		<input type="submit">
		</form>

	<hr>
	<section class="section1">
		<main>
		<section id="sec">
		
		</section>
		</main>
		<footer class="footer">
			<div class="footer_div">
				<nav class="footer_nav">
					<ul class="footer_ul">
						<li class="footer_list">INSTAGRAM 정보</li>
						<li class="footer_list">지원</li>
						<li class="footer_list">홍보센터</li>
						<li class="footer_list">API</li>
						<li class="footer_list">채용 정보</li>
						<li class="footer_list">개인정보처리방침</li>
						<li class="footer_list">약관</li>
						<li class="footer_list">디렉토리</li>
						<li class="footer_list">프로필</li>
						<li class="footer_list">해시태그</li>
						<li class="footer_list">언어</li>
					</ul>
				</nav>
				<span class="footer_span">© 2019 INSTAGRAM</span>
			</div>
		</footer>
	</section>
</body>
</html>