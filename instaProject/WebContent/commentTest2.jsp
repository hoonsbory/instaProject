<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	showComm(); //페이지 시작하자마자 실행(테스트). 원래는 사진 있고 그거 클릭해서 사진+코멘트 열리면 실행
});

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
				 data:{content:$('#comment').val(),post_id:1},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else{
						alert('추가되었습니다.');
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
						alert('삭제되었습니다.');
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
	let tag = "<table>";
	tag+="<tr><th>프사</th><th>이름</th><th>댓글</th><th>시간</th></tr>"
	$(data).each((i,item)=>{
		 tag += "<tr id='c_"+item.id+"'><td>";
	     tag += "<img src='"+item.img+"'width=100 height=100/></td><td>"+item.name+"</td><td>"+item.content
	     +"</td><td>"+item.timestamp+"</td><td><button class='cDels'>삭제</button>";
	     tag += "</td></tr>";
	 });
	tag+="</table>"
	$('#comment_table').html(tag);
	$('.cDels').each((i,item)=>{
		$(item).click(function(){
			delComm($(item.parentNode.parentNode).attr('id'));
		});
	});
}

</script>

</head>
<body>
	<h1>본인 게시글 (post_id=1 가정.. post가 자기껀지 아닌지 확인필요)</h1>
	<div id="comment_table"></div>
	<br>
	<br>
	<input type="text" id="comment">
	<button id="insert" onclick="insComm()">게시</button>
	<br>
	<a href="logout.do">로그아웃</a>
	<form style="visibility:hidden" action="login.jsp" method="post" id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
</body>
</html>