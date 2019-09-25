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
	background-color: rgba(255, 255, 255, 0);
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

#next_left {
	-webkit-transform: scaleX(-1);
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	transform: scaleX(-1);
	filter: FlipH;
	-ms-filter: "FlipH";
	left: 20px;
}

#next_right {
	right: 20px;
}

.next {
	width: 50px;
	position: fixed;
	top: 320px;
	cursor: pointer;
}

#dot_menu {
	position: relative;
	right: -385px;
	top: 5px;
	cursor: pointer;
}

#dot_menu_opt {
	background-color: rgba(0, 0, 0, .5);
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1;
	visibility: hidden;
	vertical-align: middle;
}

#dot_menu_opt>div {
	border-radius: 20px;
	width: 450px;
	height: 250px;
	margin: 0 auto;
	margin-top: 220px;
	padding-top: 100px;
	text-align: center;
	vertical-align: middle;
	background-color: white;
}

#dot_menu_opt> >hr {
	height: 1px;
	width: 450px;
}

#delete {
	font-size: 12pt;
	font-weight: bold;
	color: #ff3300;
	cursor: pointer;
}

#cancel {
	font-size: 12pt;
	font-weight: bold;
	cursor: pointer;
	margin: 12px;
}
</style>
<script type="text/javascript">
$(function(){
	showComm();
	setLike();
	if(${empty login}){
		$('.form-control').attr('placeholder','로그인 후 이용 가능합니다.');
		$('.form-control').focus(function(){
			location.href("login.jsp");
		});
	}
	if('${past_post}'==''){
		$('#next_left').hide();
	}
	if('${next_post}'==''){
		$('#next_right').hide();
	}
	$('.this_user').click(function(){
		location.href("");
	});
	$('#next_left').click(function(){
		
	});
	$('#next_right').click(function(){
		
	});
	$('#dot_menu').click(function(){
		$('#dot_menu_opt').css('visibility', 'visible');
	});
	$('#delete').click(function() {
		if (confirm('삭제하시겠습니까?')) {
		}
	});
	$('#cancel').click(function() {
		$('#dot_menu_opt').css('visibility', 'hidden');
	});
});

function setLike(){
	$('#dislike').click(function(){
		$.ajax({
			url : 'like.jsp',
			type : 'get',
			dataType : 'json',
			data : {user_id : ${fn:substring(login,0,fn:length(timestamp)-3)},
					post_id : post_id},
			success : ((data)=>{
				if(data.insert==1){
					 $('#like_num').html(data.count);
					 $('#dislike').hide();
					 $('#like').show();
				}
		}),error : ((e)=>{
				alert('실패');	
			})
		})
	});
	$('#like').click(function(){
		$.ajax({
			url : 'dislike.jsp',
			type : 'get',
			dataType : 'json',
			data : {user_id : user_id,
					post_id : post_id},
			success : ((data)=>{
				if(data.delete1 == 1){
					 $('#like_num').html(data.count);
					 $('#like').hide();
					 $('#dislike').show();
				}
		}),error : ((e)=>{
				alert('실패');	
			})
		})
	});
}

function showComm(){//data로 post id 보내줘야함 일단 임시로 1 보내기
	$.ajax(
			{
				 url:'showComment.do',
				 type:'get',
				 dataType:'json',
				 data: {post_id:${post.post_id}},
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
	if('${like}'==0){
		console.log('?');
		//$('#dislike').hide();
		$('#like').show();
	}else{
		//$('#like').hide();
		 $('#dislike').show();
	}
}

function insComm(){
	$.ajax(
			{
				 url:'insertComment.do',
				 type:'post',
				 dataType:'json',
				 data:{content:$('#form-comment').val(),post_id:${post.post_id}},
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
				 data: {id:delId,post_id:${post.post_id}},
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
	$(".commentList").scrollTop($(".commentList")[0].scrollHeight);
	
	
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
			</span> <span class="user-name">${post.user_name}</span>
			</span>
			<button class="btn follow-btn">팔로우</button>
		</header>

		<div class="container">
			<div class="uploadimage">
				<img id="uploadimage_img" alt="" src="${post.post_img}">
			</div>


			<div class="detailBox">
				<img class="" id="dot_menu" src="img/three-dots.png" width="20">
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
						<a href='like.jsp' class="like_btn" id="dislike"><img
							class="like_img" src="https://i.imgur.com/7FQcmdR.png" width=30
							height=25></a> <a href='dislike.jsp' class="like_btn" id="like"><img
							class="like_img" src="https://i.imgur.com/3N1sUeC.png" width=30
							height=25></a> <span id="like_num">좋아요 ${like}개</span>
					</div>
					<div id="date">
						${fn:substring(timestamp,0,fn:length(timestamp)-3)}</div>
				</div>
				<div class="form-inline" role="form">
					<div class="form-group2">
						<input class="form-control" id="form-comment" type="text"
							placeholder="Your comments" />
					</div>
					<div class="form-group2">
						<button class="btn btn-default" onclick="insComm()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="dot_menu_opt">
		<div>
			<h4 id="delete">삭제</h4>
			<hr>
			<h4 id="cancel">취소</h4>
		</div>
	</div>
	<form style="visibility: hidden" action="login.jsp" method="post"
		id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
	<img class="next" id="next_right" src="img/next2.png">
	<%@include file="common/footer.jsp"%>
</body>
</html>