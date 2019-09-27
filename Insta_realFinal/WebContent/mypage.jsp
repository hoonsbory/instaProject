<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css?after">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/search&like.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
window.onload = function(){
	
	
	const log = console.log;
	let count = 0;
	let countdiv = 1;
	let pagecount = 1;
	let id1 = "<c:out value='${id}'/>";
	$.ajax({
		url : 'mypagepost.jsp',
		type : 'get',
		dataType : 'json',
		data : {id : id1},
		success : ((data)=>{
			
		if(data.length==0){
			$(".default-page").show()
		}else{
			$(".default-page").hide()
		}
			for (i = data.length; i>0; i-=3){
				let divmain = document.createElement('div');
				divmain.setAttribute("id", "divmain"+countdiv);
				divmain.setAttribute("class", "divmain");
				
				document.querySelector('#sec').appendChild(divmain);
			for(var j = 3; j>0; j--){
				if(data[count]!=null){
				let a = document.createElement("a");
				let img = document.createElement("img");
				document.querySelector("#divmain"+countdiv).appendChild(a);
					
				
				img.setAttribute("src", data[count].id);
				img.setAttribute("height" , "300");
				img.setAttribute("width" , "300");
				img.setAttribute("alt" , "instapic");
				img.setAttribute("class" , "mainimg");
				a.setAttribute("href" , "showPost.do?post_id="+data[count].postid);
				
				$(a).addClass("apic");
				document.querySelector("#divmain"+countdiv).lastElementChild.appendChild(img);
				count++;
				}
			}
				countdiv++;
			if(data.length >= 9 && count==9){
				break;
				
			}
			
				
			}
			
		}),
		error : ((e)=>{
			alert('실패'+e);			
		})
		
	
	 
	
	})
	
	  $(window).scroll(function(){
		  if ( $(window).scrollTop() == $(document).height() - $(window).height() ) {
			  pagecount++;	
			  $.ajax({
					url : 'mypagepost.jsp',
					type : 'get',
					dataType : 'json',
					data : {id : id1},
					success : ((data)=>{
						loop:
						for (i = data.length-count; i>0; i-=3){
							let divmain = document.createElement('div');
							divmain.setAttribute("id", "divmain"+countdiv);
							divmain.setAttribute("class", "divmain");
							
							document.querySelector('#sec').appendChild(divmain);
						for(var j = 3; j>0; j--){
							if(data[count]!=null){
							let a = document.createElement("a");
							let img = document.createElement("img");
							document.querySelector("#divmain"+countdiv).appendChild(a);
								
							
							img.setAttribute("src", data[count].id);
							img.setAttribute("height" , "300");
							img.setAttribute("width" , "300");
							img.setAttribute("alt" , "instapic");
							img.setAttribute("class" , "mainimg");
							a.setAttribute("href" , "post.do?id="+data[count].postid);
							
							$(a).addClass("apic");
							document.querySelector("#divmain"+countdiv).lastElementChild.appendChild(img);
							count++;
							}else{
								break loop;
							}
							
						}
						countdiv++;
						if(data.length >= 9*pagecount && count==9*pagecount){
							break;
							
						}
						
						}
						
					}),
					error : ((e)=>{
						alert('실패'+e);			
					})
					
				
				 
				
				})
		    }



		
		  
		  
	  })
	
	
	
	
	

	
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



	}
</script>
<style type="text/css">
#btnEdit2 {
	background: #3897f0 !important;
	color: white !important;
}

.apic {
	display: inline !important;
	margin-right: 28px;
}

.divmain {
	display: inline-block !important;
	position: relative;
	left: 20%;
	margin-bottom: 28px;
}

.mainimg {
	display: inline;
	width: 300px;
	height: 300px;
}

.mainimg:hover {
	opacity: 0.5;
}

.section1 {
	margin-top: 30px;
}
.profile-edit-btn2{
	text-align: center;
	font-size: 1.0rem;
    font-weight: bold;
    background-color: rgba(0,0,0,0);
	line-height:1.6;
	width: 100px;
	border-radius:0.3rem;
	padding: 0 0.8rem;
	margin:20px auto;
    border: 1px solid #3399ff;
    color: #3399ff;
    padding: 5px;
	position: absolute;
	bottom : 17%;
	right : 0;
	z-index: 1;
}


.profile-edit-btn3{
	right : 0;
	position: absolute;
	bottom : 17%;
	text-align: center;
	font-size: 1.0rem;
    font-weight: bold;
	line-height:1.6;
	width: 100px;
	border-radius:0.3rem;
	padding: 0 0.8rem;
	margin:20px auto;
    border: 1px solid #3399ff;
    padding: 5px;
    background-color: #3399ff;
	color: white;
	float : left;
	z-index: 1;
}
.default-page{
	text-align: center;
}

</style>
<title>Insert title here</title>
</head>

<body>



	<%@include file="common/header.jsp"%>
	<header>

		<div class="container">

			<div class="profile">

				<div class="profile-image">

					<img id="profileImage" src="${img}" title="default-profile.png"
						style="width: 150px; height: 150px;" /> <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo">


				</div>
				<div class="profile-user">
					<div class="profile-user-settings">

						<a class="profile-user-name">${name}</a>

						<button class="btn profile-edit-btn" id="btnEdit">프로필 편집</button>
						<button class="btn profile-edit-btn" id="btnEdit2">로그아웃</button>
						<form action="profile.do" id="frmEdit" method="post"></form>
						<form action="logout.do" id="frmlogout" method="get"></form>
					</div>
					<div class="profile-stats">

							<div class = "back" id = "backfollower">
							<div>
							<div class="followerlist_class"></div>
						</div>
						</div>
							<div class="back" id="backfollow">
							<div>
							<div class="followlist_class"></div>
						</div>
						</div>
						<ul>
							<li><span class="profile-stat-count">${count}</span> 게시글</li>
							<li id="followerlist"><span class="profile-stat-count" id="follow">${follower}</span> 팔로워</li>
							<li id="followlist"><span class="profile-stat-count" id="follower">${follow}</span> 팔로잉</li>
						</ul>

					</div>
					<br>


					<div class="profile-bio">
						<p>
							<span class="profile-real-name">${name}</span> ${info}
						</p>

					</div>
				</div>
			</div>

		</div>

	</header>


<a href="./upload.jsp" class="insert-post-a"><img src="https://i.imgur.com/lOwg0em.png" class="insert-post-img"></a>
	<section class="section1">
		<main>
		<section id="sec">
			<%-- 		<c:set var="size" value="${fn:length(list)}" />   아작스가 아닌 서블릿방법--%>
			<%-- 		<c:set var="count" value="0" /> --%>
			<%-- 		<c:forEach var="data" items="${list}" begin="1" end="${size}" step="3"> --%>
			<!-- 			<div class="divmain">	 -->
			<%-- 			<c:forEach var="data2" items="${list}" begin="0" end="2" step="1" varStatus="status"> --%>
			<%-- 			<a href="" class="apic"><img class="mainimg" src="${list[count].img}" ></a> --%>
			<%-- 		<c:set var="count" value="${count+1}" /> --%>

			<%-- 			</c:forEach> --%>
			<!-- 			</div> -->
			<%-- 		</c:forEach> --%>
<div class="default-page">
	<h1 style="font-size:30px; font-weight:30">게시물 업로드</h1><br>
	<h4>친구들과 사진 및 글을 공유해 보세요!</h4><br>
	<a href="./upload.jsp"><button class="upload-btn">업로드</button></a>
	</div>
		</section>
		</main>
		<%@include file="common/footer.jsp"%>
	</section>
	<script src="./script.js/insta.js"></script>
</body>
</html>