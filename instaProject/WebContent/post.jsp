<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/post.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/footer.css">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style type="text/css">
.cDels {
	float: right;
	background-color: rgba( 255, 255, 255, 0 );
	border: none;
}

.commentName {
	font-weight: bold;
	margin: 5px;
}

#like {
	float: left;
	margin-left: 10px;
	vertical-align: middle;
	display: inline;
	height: 30px;
	vertical-align: middle;
}

#like img {
	display: inline;
	vertical-align: middle;
}

#like span {
	width: 100px;
	display: inline;
	vertical-align: middle;
}

.form-inline {
	clear: both;
	text-align: center;
	display: block;
	margin: 0 auto;
}

.form-group2 {
	display: inline;
	margin-top: 5px;
	margin-bottom: 5px;
}

.form-control {
	width: 100% !important;
}

#post_info {
	display: block;
	margin-top: 40px;
}

.this_user {
	cursor: pointer;
}

#next_left{
  -webkit-transform: scaleX(-1);
  -moz-transform: scaleX(-1);
  -o-transform: scaleX(-1);
  transform: scaleX(-1);
  filter: FlipH;
  -ms-filter: "FlipH";
	left: 20px;
}

#next_right{
	right: 20px;
}

.next{
	width: 50px;
	position: fixed;
	top: 320px;
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(function(){
	showComm();
	//display(${comment}); //코멘트뿌리기
	if(${empty login}){
		$('.form-control').attr('placeholder','로그인 후 이용 가능합니다.');
		$('.form-control').focus(function(){
			location.href("login.jsp");
		});
	}
	if(){
		
	}
	$('.this_user').click(function(){
		location.href("");
	});
	$('#next_left').click(function(){
		
	});
	$('#next_right').click(function(){
		
	});
});

function 


function showComm(){//data로 post id 보내줘야함 일단 임시로 1 보내기
	$.ajax(
			{
				 url:'showComment.do',
				 type:'get',
				 dataType:'json',
				 data: {post_id:1},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else
						display(data);
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
	
}

function insComm(){
	$.ajax(
			{
				 url:'insertComment.do',
				 type:'post',
				 dataType:'json',
				 data:{content:$('.form-control').val(),post_id:1},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else{
						//alert('추가되었습니다.');
						display(data);
					}
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
}

function delComm(delId){
	$.ajax(
			{
				 url:'deleteComment.do',
				 type:'post',
				 dataType:'json',
				 data: {id:delId,post_id:1},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else{
						//alert('삭제되었습니다.');
						display(data);
					}
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
	
}

function display(data){
	let tag = "";
	
	$(data).each((i,item)=>{
		 tag += "<li><div class='commenterImage'>";
	     tag += "<img src='"+item.img+"'/></div>";
	     tag += "<div class='commentText' id='c_"+item.id+"'><p><span class='commentName'>";
	     tag += item.name+"</span><span class=''>"+item.content+"</span>";
	     let login_id='${fn:substringBefore(login,"/")}';
	     if(item.user_id==login_id||'${post.user_id}'==login_id){
	     	tag += "<button class='cDels'><img src='img/delete-x.png' width=6 height=6></button>";
	     }
		 tag += "</p><span class='date sub-text'>";
	     tag += item.timestamp.substring(0,item.timestamp.length-4)+"</span></div></li>";
	
	});
	$('.commentList').html(tag);
	$('.cDels').each((i,item)=>{
		$(item).click(function(){
			delComm($(item.parentNode.parentNode).attr('id'));
		});
	});
}

</script>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<img class="next" id="next_left" src="img/next2.png">
	<section id="sect">
		<header>
			<span class="this_user"> <span class="userImage"> <img
					src="http://placekitten.com/40/40" />
			</span> <span class="user-name">${name}name</span>
			</span>
			<button class="btn follow-btn">팔로우</button>
		</header>

		<div class="container">
			<div class="uploadimage">
				<img id="uploadimage_img" alt="" src="${img}">
			</div>


			<div class="detailBox">
				<div class="commentBox">
					<p class="taskDescription">${content}</p>
				</div>
				<div class="titleBox">
					<label>댓글</label>
				</div>
				<div class="actionBox">
					<ul class="commentList">
					</ul>
				</div>
				<div id="post_info">
					<div id="like">
						<img alt="" src="img/heart.png" width=30 height=25> <span
							id="like_num">좋아요 ${like}개</span>
					</div>
					<div id="date">
						${fn:substring(timestamp,0,fn:length(timestamp)-3)}</div>
				</div>
				<form class="form-inline" role="form">
					<div class="form-group2">
						<input class="form-control" type="text"
							placeholder="Your comments" />
					</div>
					<div class="form-group2">
						<button class="btn btn-default" onclick="insComm()">등록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<img class="next" id="next_right" src="img/next2.png">
	<%@include file="common/footer.jsp"%>
</body>
</html>