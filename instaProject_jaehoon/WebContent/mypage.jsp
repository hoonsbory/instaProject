<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css?after">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
window.onload = function(){
	const log = console.log;
	let count = 0;
	let countdiv = 1;
	let id1 = "<c:out value='${id}'/>";
	$.ajax({
		if(data.length==0){
			$(".default-page").show()
		}else{
			$(".default-page").hide()
		}
		url : 'mypagepost.jsp',
		type : 'get',
		dataType : 'json',
		data : {id : id1},
		success : ((data)=>{
			
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
				a.setAttribute("href" , "post.do?id="+data[count].postid);
				
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
						if(data.length >= 9 && count==8){
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
	
	
	
	$('#btnEdit').click(()=>{
			$('#frmEdit').submit();
		
	})
	$('#btnEdit2').click(()=>{
			$('#frmlogout').submit();
		
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


let name;
let email;
let img;
$('.search_input').keyup(function(){
	$('.searchScroll').css('display', 'block');
	$('.VR6_Q').css('display', 'block');
	
		$('.divdelete').remove();
		$.ajax({
			url : 'search.jsp',
			type : 'get',
			dataType : 'json',
			data : {id2 : $('.search_input').val().trim()},
			success : ((data)=>{
				if(data.length==0){
					$('.searchScroll').html('찾는 사용자가 없습니다.');
				}else{
					$('.searchScroll').html('');
				}
		if($('.search_input').val()!=""){
				log(data);
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('.searchScroll').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('.divdelete').appendChild(aSearch);
	
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		count2++;
		
		}
		}else{
			$('.searchScroll').hide();
			$('.VR6_Q').hide();
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
		
	
})

// 팔로우 리스트 기능 
$('#followlist').click(function(){
	$('.followlist_class').css('display', 'block');
	$('.followlist_div').css('display', 'block');
	
		$('.divfollowlist').remove();
		$.ajax({
			url : 'followlist.jsp',
			type : 'get',
			dataType : 'json',
			data : {id : id1},
			success : ((data)=>{
				if(data.length == 0){
					$('.followlist_class').html('팔로우가 없습니다.');
				}else{
					$('.followlist_class').html('');
				}
		if($('.followlist_class').val()!=""){
				log(data);
			let count3 = 0;
			let divfollowlist = document.createElement('div');
		document.querySelector('.followlist_class').appendChild(divfollowlist);
		divfollowlist.setAttribute("class" , "divfollowlist");
		for(let i = 1; i < data.length + 1; i++){
			let afollow = document.createElement('a');
			let div_followImg = document.createElement('div');
			let followimg = document.createElement('img');
			let divfollowName = document.createElement('div');
			let divfollowEmail = document.createElement('div');
			let followEmailSpan = document.createElement('span');
	followimg.setAttribute("class" , "followimg");
	afollow.setAttribute("class" , "afollow");
	afollow.setAttribute("id" , "afollow"+i);
	afollow.setAttribute("href" , "followlist.do?id="+data[count3].id);
	
	div_followImg.setAttribute("id" , "div_followImg"+i)
	div_followImg.setAttribute("class" , "div_followImg")
	divfollowName.setAttribute("class" , "divfollowName")
	divfollowName.setAttribute("id" , "divfollowName"+i)
	divfollowEmail.setAttribute("class" , "divfollowEmail")
	divfollowEmail.setAttribute("id" , "divfollowEmail"+i)
	followEmailSpan.setAttribute("class" , "followEmailSpan")
	followEmailSpan.setAttribute("id" , "followEmailSpan"+i)
		document.querySelector('.divfollowlist').appendChild(afollow);
	
		document.querySelector('#afollow'+i).appendChild(div_followImg);
		
		document.querySelector('#afollow'+i).appendChild(divfollowName);
		$('#divfollowName'+i).html(data[count3].name);
		if(data[count3]!=null){
			followimg.setAttribute("src", data[count3].img);
		}
			
		
		document.querySelector('#div_followImg'+i).appendChild(followimg);
		document.querySelector('#divfollowName'+i).appendChild(divfollowEmail);
		document.querySelector('#divfollowEmail'+i).appendChild(followEmailSpan);
		$('#followEmailSpan'+i).html(data[count3].email);
		count3++;
		
		}
		}else{
			$('.followlist_class').hide();
			$('.followlist_div').hide();
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
				
		})
	})
	
// 팔로워 리스트 기능 
$('#followerlist').click(function(){
	$('.followerlist_class').css('display', 'block');
	$('.followerlist_div').css('display', 'block');
	
		$('.divfollowerlist').remove();
		$.ajax({
			url : 'followerlist.jsp',
			type : 'get',
			dataType : 'json',
			data : {id : id1},
			success : ((data)=>{
				if(data.length == 0){
					$('.followerlist_class').html('팔로워가 없습니다.');
				}else{
					$('.followerlist_class').html('');
				}
		if($('.followerlist_class').val()!=""){
				log(data);
			let count4 = 0;
			let divfollowerlist = document.createElement('div');
		document.querySelector('.followerlist_class').appendChild(divfollowerlist);
		divfollowlist.setAttribute("class" , "divfollowerlist");
		for(let i = 1; i < data.length + 1; i++){
			let afollower = document.createElement('a');
			let div_followerImg = document.createElement('div');
			let followerimg = document.createElement('img');
			let divfollowerName = document.createElement('div');
			let divfollowerEmail = document.createElement('div');
			let followerEmailSpan = document.createElement('span');
	followerimg.setAttribute("class" , "followerimg");
	afollower.setAttribute("class" , "afollower");
	afollower.setAttribute("id" , "afollower"+i);
	afollower.setAttribute("href" , "followerlist.do?id="+data[count3].id);
	
	div_followerImg.setAttribute("id" , "div_followerImg"+i)
	div_followerImg.setAttribute("class" , "div_followerImg")
	divfollowerName.setAttribute("class" , "divfollowerName")
	divfollowerName.setAttribute("id" , "divfollowerName"+i)
	divfollowerEmail.setAttribute("class" , "divfollowerEmail")
	divfollowerEmail.setAttribute("id" , "divfollowerEmail"+i)
	followerEmailSpan.setAttribute("class" , "followerEmailSpan")
	followerEmailSpan.setAttribute("id" , "followerEmailSpan"+i)
		document.querySelector('.divfollowerlist').appendChild(afollower);
	
		document.querySelector('#afollower'+i).appendChild(div_followerImg);
		
		document.querySelector('#afollower'+i).appendChild(divfollowerName);
		$('#divfollowerName'+i).html(data[count3].name);
		if(data[count3]!=null){
			followerimg.setAttribute("src", data[count3].img);
		}
			
		
		document.querySelector('#div_followerImg'+i).appendChild(followimg);
		document.querySelector('#divfollowerName'+i).appendChild(divfollowEmail);
		document.querySelector('#divfollowerEmail'+i).appendChild(followEmailSpan);
		$('#followerEmailSpan'+i).html(data[count3].email);
		count3++;
		
		}
		}else{
			$('.followerlist_class').hide();
			$('.followerlist_div').hide();
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
				
		})
	})



}
</script>
<style type="text/css">
#btnEdit2{
	background:  #3897f0 !important;
	color: white !important;
}

.apic{
	display: inline !important;
	margin-right: 28px;
}
.divmain{
	display: inline-block !important;
	position: relative;
	left : 20%;
	margin-bottom: 28px;
}
.mainimg{
	display: inline;
	width: 300px;
	height: 300px;
}
.section1{
	margin-top: 30px;
}
.searchScroll{
	position : relative;
	top : 18px;
	width : 241px;
	max-height: 362px;
	background: white;
	display: none;
	 -webkit-overflow-scrolling: touch;
    overflow-x: hidden;
    overflow-y: auto;
    padding: 0;
    border : 1px solid #efefef;
    color: #999;
    font-size: 14px;
    padding: 15px;
    z-index: 2;
}
.VR6_Q {
	display: none;
    border: solid 1px #e6e6e6;
    -webkit-box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    height: 14px;
    left: 0;
    margin: auto;
    right: 0;
    top: 12px;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
    width: 14px;
    z-index: 1;
    background: #fff;
    content: ' ';
    position: absolute;

}
.userimg{
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.aSearch{
	padding-bottom: 8px;
	padding-top: 8px;
	padding-left: 14px;
	padding-right: 14px;
	border-bottom: 1px solid #efefef;
	text-decoration: none;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.aSearch:hover{
	background-color: #fafafa;
}
.SearchImg{
	margin-right : 10px;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
}
.divName{
	position : relative;
	top :  -15px;
	display: inline;
	color : black;
	font-weight: bold;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.EmailSpan{
	color : gray;
	font-size : 1.0em;
	font-weight: normal;
	overflow-x: hidden;
    overflow-y: auto;
    text-align: center;
     -webkit-overflow-scrolling: none;
     margin-left: 10px;
}
.divEmail{
	overflow-x: hidden;
    overflow-y: auto;
}

/* 팔로우 리스트 css */
.followlist_class{
	position : relative;
	top : 36px;
	width : 220px;
	max-height: 362px;
	background: white;
	display: none;
	 -webkit-overflow-scrolling: touch;
    overflow-x: hidden;
    overflow-y: auto;
    padding: 0;
    border : 1px solid #efefef;
    color: #999;
    font-size: 14px;
    padding: 15px;
    z-index: 2;
}
.followlist_div {
	display: none;
    border: solid 1px #e6e6e6;
    -webkit-box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    height: 14px;
    left: 0;
    margin: auto;
    right: 0;
    top: 30px;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
    width: 14px;
    z-index: 1;
    background: #fff;
    content: ' ';
    position: absolute;

}
.followimg{
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.afollow{
	padding-bottom: 8px;
	padding-top: 8px;
	padding-left: 14px;
	padding-right: 14px;
	border-bottom: 1px solid #efefef;
	text-decoration: none;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.afollow:hover{
	background-color: #fafafa;
}
.div_followimg{
	margin-right : 10px;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
}
.followName{
	position : relative;
	top :  -15px;
	display: inline;
	color : black;
	font-weight: bold;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.followEmailSpan{
	color : gray;
	font-size : 1.0em;
	font-weight: normal;
	overflow-x: hidden;
    overflow-y: auto;
    text-align: center;
     -webkit-overflow-scrolling: none;
     margin-left: 10px;
}
.divfollowEmail{
	overflow-x: hidden;
    overflow-y: auto;
}
/* 팔로워 리스트 css */
.followerlist_class{
	position : relative;
	top : 36px;
	width : 220px;
	max-height: 362px;
	background: white;
	display: none;
	 -webkit-overflow-scrolling: touch;
    overflow-x: hidden;
    overflow-y: auto;
    padding: 0;
    border : 1px solid #efefef;
    color: #999;
    font-size: 14px;
    padding: 15px;
    z-index: 2;
}
.followerlist_div {
	display: none;
    border: solid 1px #e6e6e6;
    -webkit-box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    box-shadow: 0 0 5px 1px rgba(0,0,0,.0975);
    height: 14px;
    left: 0;
    margin: auto;
    right: 0;
    top: 30px;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
    width: 14px;
    z-index: 1;
    background: #fff;
    content: ' ';
    position: absolute;

}
.followerimg{
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.afollower{
	padding-bottom: 8px;
	padding-top: 8px;
	padding-left: 14px;
	padding-right: 14px;
	border-bottom: 1px solid #efefef;
	text-decoration: none;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.afollower:hover{
	background-color: #fafafa;
}
.div_followerimg{
	margin-right : 10px;
	display: inline;
	overflow-x: hidden;
    overflow-y: auto;
}
.followerName{
	position : relative;
	top :  -15px;
	display: inline;
	color : black;
	font-weight: bold;
	overflow-x: hidden;
    overflow-y: auto;
	
}
.followerEmailSpan{
	color : gray;
	font-size : 1.0em;
	font-weight: normal;
	overflow-x: hidden;
    overflow-y: auto;
    text-align: center;
     -webkit-overflow-scrolling: none;
     margin-left: 10px;
}
.divfollowerEmail{
	overflow-x: hidden;
    overflow-y: auto;
}
.insert-post-a{
	width : 35px;
	height : 35px;
	margin : 0 auto;
	display : block;
}
.insert-post-img{
	width : 35px;
	height : 35px;
	margin : 0 auto;
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
						<div>
						<div class="VR6_Q"></div>
						<div class="searchScroll"></div>
						</div>
						
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
							
								<a href="home.do"> <span class="profile" aria-label="프로필"><img
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
				
					<img id="profileImage" src="${img}"
						title="default-profile.png" style="width:150px ;height:150px;"/>
						 <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo" >
						
					
				</div>
				<div class="profile-user">
				<div class="profile-user-settings">

					<a class="profile-user-name">${name}</a>
	
					<button class="btn profile-edit-btn" id="btnEdit">프로필 편집</button>
					<button class="btn profile-edit-btn" id="btnEdit2">로그아웃</button>
					<form action="profile.do" id="frmEdit" method="post">
					</form>
						<form action="logout.do" id="frmlogout" method="post">
					</form>
				</div>
				<div class="profile-stats">

					<ul>
						<li><span class="profile-stat-count">${count}</span> 게시글</li>
						<li><span class="profile-stat-count">${follower}</span> 팔로워</li>
						<div>
							<div class="followlist_class"></div>
							<div class="followlist_div"></div>
						</div>
						<li><span class="profile-stat-count">${follow}</span> 팔로잉</li>
						<div>
							<div class="followlist_class"></div>
							<div class="followlist_div"></div>
						</div>
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

<%-- <form action="insertPost.do" method="post" enctype="multipart/form-data">
	<input type="text" name="content">
	<input type="file" name="img" multiple="multiple">
	<input type="text" name="id" value="${id}">
	<input type="submit">
</form> --%>
<a href="" class="insert-post-a"><img src="https://i.imgur.com/lOwg0em.png" class="insert-post-img"></a>

	<section class="section1">
		<main>
		<section id="sec">
<%-- 		<c:set var="size" value="${fn:length(list)}" /> --%>
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