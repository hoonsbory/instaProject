<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="dao.InstaDao"%>

<%@ page import="java.io.File"%>

 

 

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

 

<title>파일업로드</title>

 

<style type="text/css">

 

body {

background-color: #fafafa;

}

 

#border {


padding:150px;

}

 

 

#content {

margin-top:50px;

display:inline;

border: dashed 1px #dbdbdb;

border-radius: 3rem;

width: 400px;

padding:20px;

height: 300px;

}

 

.uploadpostimage {

display:inline;

float:left;

margin: 50px;

background-color: white;

width: 400px;

border: dashed 1px #dbdbdb;

border-radius: 3rem;

transform: scale(1);

-webkit-box-shadow: 0 0 0 transparent;

box-shadow: 0 0 0 transparent;

padding-bottom:50px;

}

 

.uploadpostimage img {

display:inline;

cursor: pointer;

width: 300px;

border-radius:3rem;

margin-left:45px;

margin-top:50px;

}

 

#postUpload {

display: none;

}

 

p {


text-align: center;

font-size: 20px;

}

#up_submit , #up_cancel{

display:inline;

padding:5px;

border: dashed 1px #dbdbdb;

background-color:white;

border-radius:3rem;

margin:10px;

}

#myfile{

display:none;

}

 

#upload_label{

cursor : pointer;

width: 100px;

height: 100px;


}

 

 

 

</style>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

 

<script>

$(function() {


$('#up_cancel').click(function(){

location.href= 'home.do';

});


// 글자 등록 

$('#up_submit').click(insertPost);

 

$('#content').keyup(countPost);

 

});

 

function insertPost(){

let str = $("#content").val();

str = str.replace(/(?:\r\n|\r|\n)/g, '<br />'); //엔터 처리

    $("#content").val(str);

	$('#insertForm').submit();

};

 

 

function countPost(){

let textLength = $(this).val().length;

    $('#textCount').text(textLength+'/150');

    if (textLength > 150) {

        $(this).val($(this).val().substr(0, 150));

    }

};

 

 

</script>

 

 

<body>

 

<main>

<div id="border">

<!-- 이미지미리보기 -->


<form action="insertPost.do" method="post" id="insertForm" enctype="multipart/form-data">
<div class='uploadpostimage'>
<label for="myfile" id="upload_label"><input type="file" id="myfile" name="myfile" multiple="multiple">
<p>사진을 추가하세요.</p><img src="https://i.imgur.com/alGpiuJ.png"> </label>

</div>
<textarea form="insertForm" id="content" name="content" placeholder="    ...게시할 글을 작성하세요..." maxlength="150"></textarea>
<span id="textCount">0/150</span>
</form>
<div>

	<div class="buttons">
	<h4 class = 'btn' id="up_submit">확인</h4>
	<h4 class="btn" id="up_cancel">취소</h4>
</div>
</div>
</div>
</main>
</body>
</html>