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

	let check = "<c:out value='${check}'/>";
	if(check==1){
		$('#follow-btn').hide();
	}else{
		$('#follow-btn2').hide();
	}
	const log = console.log;
	let count = 0;
	let id1 = "<c:out value='${id}'/>";
		var myid = <%=(int)session.getAttribute("id")%>;
	 $.ajax({
		url : 'mypagepost.jsp',
		type : 'get',
		dataType : 'json',
		data : {id : id1},
		success : ((data)=>{
			for (i = data.length; i>0; i-=3){
				let divmain = document.createElement('div');
				divmain.setAttribute("id", "divmain"+i);
				divmain.setAttribute("class", "divmain");
				
				document.querySelector('#sec').appendChild(divmain);
			for(var j = 3; j>0; j--){
				if(data[count]!=null){
				let a = document.createElement("a");
				let img = document.createElement("img");
				document.querySelector("#divmain"+i).appendChild(a);
					
				
				img.setAttribute("src", data[count].id)
				img.setAttribute("height" , "300");
				img.setAttribute("width" , "300");
				img.setAttribute("alt" , "instapic");
				img.setAttribute("class" , "mainimg");
				a.setAttribute("href" , "www.naver.com");
				
				$(a).addClass("apic");
				document.querySelector("#divmain"+i).lastElementChild.appendChild(img);
				count++;
				}
			}
				
			}
			
		}),
		error : ((e)=>{
			alert('실패'+e);			
		})
		
	
	 
	
	}) 
	
	
	$('#follow-btn2').click(function(){
		$.ajax({
			url : 'unfollow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : id1 ,
					myid : myid},
			
			success : ((data)=>{
				if(data.delete1==1){
					 $('#follower').html(data.follower);
					 $('#follow-btn2').hide();
					 $('#follow-btn').show();
				}
		}),
			error : ((e)=>{
				alert('실팽');
				
			})
		
		})
	}
)
	$('#follow-btn').click(function(){
		$.ajax({
			url : 'follow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : id1 ,
					myid : myid},
			
			success : ((data)=>{
				if(data.insert==1){
					 $('#follower').html(data.follower);
					 $('#follow-btn').hide();
					 $('#follow-btn2').show();
					
				}
		}),
			error : ((e)=>{
				alert(e);
				
			})
		
		})
	}
)



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
						
						<div class="searchScroll"></div>
						
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

					<%-- <form action="follow.do">
						<input type="hidden" name="id" value="${id}">
					<input type="submit" class="follow-btn" value="팔로우">
					</form> --%>
					<button class="btn profile-edit-btn" id="follow-btn" >팔로우</button>
					<button class="btn profile-edit-btn" id="follow-btn2" >팔로잉 중</button>


				</div>
				<div class="profile-stats">

					<ul>
						<li><span class="profile-stat-count">${count}</span> 게시글</li>
						<li><span class="profile-stat-count" id="follower">${follower}</span> 팔로워</li>
						<li><span class="profile-stat-count" id="following">${follow}</span> 팔로잉</li>
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


	<section class="section1">
		<main>
		<section id="sec">
		<%-- <c:set var="size" value="${fn:length(list)}" />
		<c:set var="count" value="0" />
		<c:forEach var="data" items="${list}" begin="1" end="${size}" step="3">
			<div class="divmain">	
			<c:forEach var="data2" items="${list}" begin="0" end="2" step="1" varStatus="status">
			<a href="" class="apic"><img class="mainimg" src="${list[count].img}" ></a>
		<c:set var="count" value="${count+1}" />
			
			</c:forEach>
			</div>
		</c:forEach> --%>
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