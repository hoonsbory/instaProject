<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					display(data);
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
				 data: {id:delId},
				 success:function(data){
					alert('삭제되었습니다.');
					showComm();
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
		 tag += "<tr><td>";
	     tag += "<img src='"+item.img+"'width=100 height=100/></td><td>"+item.name+"</td><td>"+item.content
	     +"</td><td>"+item.timestamp+"</td><td><button class='cDels' id='cDel_"+item.id+"'>삭제</button>";
	     tag += "</td></tr>";
	 });
	tag+="</table>"
	$('#comment_table').html(tag);
	$('.cDels').each((i,item)=>{
		$(item).click(function(){
			delComm($(item).attr('id'));
		});
	});
}

</script>

</head>
<body>
<div id="comment_table">
</div>
</body>
</html>