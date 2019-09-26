<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.InstaDao" %>
<%@ page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<title>사진,글 업로드</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);


#form-div-01 {

    background-color: rgba(93, 93, 93, 0.4); /*93,93,93,0.4*/ /*연보라 1, 1, 93, 0.4*/
    padding:35px 35px 50px;
    width: 450px;
    height: 260px;
    top: 10%;
    left: 50%;
    position: relative;
    margin-top:30px;
    margin-left: -260px;
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
}

#form-div-02 {

    background-color: rgba(93, 93, 93, 0.4);
    padding:35px 35px 50px;
    width: 450px;
    height: 295px;
    top: 50%;
    left: 50%;
    position: relative;
    margin-top:30px;
    margin-bottom:90px;
    margin-left: -260px;
    
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
}


.feedback-input {
    color:#3c3c3c;
    font-family: Helvetica, Arial, sans-serif;
    font-weight:500;
    font-size: 18px;
    border-radius: 0;
    line-height: 22px;
    background-color: #ffffff;
    padding: 13px 13px 13px 54px;
    margin-bottom: 10px;
    width:100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box;
    border: 3px solid rgba(0,0,0,0);
}

.feedback-input:focus{
    background: #fff;
    box-shadow: 0;
    /*border: 3px solid #3498db;*/
    border-color: #3498db;
    color: #3498db;
    outline: none;
    /*padding: 13px 13px 13px 54px;*/
}

.focused {
    color:#30aed6;
    border:#30aed6 solid 3px;
}

/* Icons */


#comment{
    background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg);
    background-size: 30px 30px;
    background-position: 11px 8px;
    background-repeat: no-repeat;
}

textarea {
    width: 100%;
    height: 150px;
    line-height: 150%;
    resize:vertical;
}

input:hover, textarea:hover,
input:focus, textarea:focus {
    background-color:white;
}

#button-blue, #button_photo-upload{
    font-family: 'Montserrat', Arial, Helvetica, sans-serif;
    float:left; /* 플롯 중요(::after 가상요소 이용)*/
    width: 100%;
    border: #fbfbfb solid 4px; /*하얀색 테두리*/
    cursor:pointer; /*커서를 가져다대면, 손가락으로 가리키는 모양의 포인터로 바뀜*/
    background-color: #3498db;
    color:white;
    font-size:24px;
    padding-top:22px;
    padding-bottom:22px;
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    transition: all 0.3s;
    margin-top:-4px;
    font-weight:700;
    text-align: center;
}

#file {
	display: none;
}

#photo {
	position:relative;
	bottom: 12px;
	width: 100%;
	height: 35%;
	text-align: center;
	cursor: pointer;
}

#button-blue:hover, #button_photo-upload:hover{
    background-color: rgba(0,0,0,0);
    color: #0493bd;
}


.submit:hover {
    width:100%;
    background-color:white;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
	function readURL(input) {
		if (input.files && input.files[0]) {  //파일이 있으면
			let reader = new FileReader(); //파일을 읽는 객체 생성
			reader.onload = function(e) {  //파일을 읽기에 성공하면 e 변수로 접근
				//이미지 Tag의 SRC속성에 읽어들일 File내용을 지정
				$("#photo").attr('src', e.target.result); //html태그 중 id 가 photo 인 태그에 src 속성 값을 읽은 파일로 변경 ( src = "파일에서 읽은 값 즉 파일")
	            //alert(e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</head>
<body>
<%@include file="common/header.jsp" %>

<div id="form-div-01">
    <form class="form" id="form1">
		<img id="photo" src="./img/photo02.jpg" title="사진 클릭시 업로드"/> 
		<!--  <img class="photo" src="./img/insta01.jpg" title="사진 클릭시 업로드"/>  -->

        <p>
            <input id="file" type="file" name="img" placeholder="photo" >
        </p>
        <div>
        	<input type="button" value="사진 업로드" id="button_photo-upload">
        </div>

     </form>    
</div>
        


<div id="form-div-02">
    <form class="form" id="form2">

        <p class="text">
            <textarea name="text" class="validate[required,length[6,300]] feedback-input" id="comment" name="content" placeholder="Comment"></textarea>
        </p>
        <div class="submit">
            <input type="submit" value="공유하기" id="button-blue"/>
            <div class="ease"></div>
        </div>
     </form>    
</div>
    


				<script>
					    <!-- #postImage -->
						$("#photo, #button_photo-upload").click(function(e) {
							// #file 
							$("#file").click();
						});
						
						function fasterPreview(uploader) {
							if (uploader.files && uploader.files[0]) {
								// #postImage
								$('#photo')
										.attr(
												'src',
												window.URL
														.createObjectURL(uploader.files[0]));
							}
						}

						$("#file").change(function() {
							fasterPreview(this);
						});
				</script>
				
<%@include file="common/footer.jsp" %>
</body>
</html>