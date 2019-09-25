<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in</title>
<link href="https://fonts.googleapis.com/css?family=Rum+Raisin&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<script type="text/javascript">
$(function () {
		$('#email').keyup(function() { // 입력창에 키보드로 입력시
			$('#errMsg').html(""); // 에러 메세지 지우기
		});
		$('#pw').keyup(function() { 
			$('#errMsg').html(""); 
		});
})

</script>

<script type="text/javascript">
	window.onload = function (){
		let count =0;
			let imgArray=new Array(); 
			imgArray[0]="./img/img03.jpg"; 
			imgArray[1]="./img/img02.jpg"; 
			imgArray[2]="./img/img05.jpg"; 
			imgArray[3]="./img/img04.jpg"; 
			imgArray[4]="./img/img01.jpg"; 

		function showImage(){ 
			//let imgNum=Math.round(Math.random()*4); 

			let objImg=document.getElementById("inner-img");  
			
			objImg.src=imgArray[count]; 
			count++;
			if(count==4){
				count = 0;
				
			}
			setTimeout(showImage,1500); 	
		}
		showImage();
	}		
		
</script>


<style type="text/css">

.whole{
	position: absolute;
	left: 50%;
	right: 800px;
	top: 100px;

    max-width: 380px;
    width: 100%; 
    height: 740px;

}

.whole-01  {
    background-color: #FFFFFF;
    margin-top: 12px;
}

.whole-01__fieldset{
	border-color: rgba(255,255,255,.5);
	height:430px;
}

.whole-01__header{
	color: #262626; 
	font-family: 'Rum Raisin', cursive;
	font-size: 60px;
	margin-bottom: 65px;
}


.whole-01__body--email, .need  {
	
	position: absolute;
	left: 10px;
	margin-left: 34px;
	width: 270px; 
	height: 30px;
	background-color: #FAFAFA;
	padding: 7px 7px 7px 8px;
	font-size: 20px;
}

.whole-01__body--errMsg{
	color: #ed4956;
	text-align: center;
}

.whole-01__body--login-btn{
	position: absolute;
	left: 43px;
	bottom: 308px;
	width: 290px; 
	height: 46px;
	font-size: 22px;
	font-weight: 600;
	border-radius: 5px 5px 5px 5px;
	background-color:#2E9AFE ;
	color: #FFFFFF;

	
	
}

.whole-01__body--divide-line {
	position:absolute;
	bottom: 330px;
	left: 1px;
	width: 99%; 
	height: 1px;
	border: 0.4pt solid #efefef;

}

.whole-01__body--search-question{
	position: absolute;
	bottom: 180px;
	left: 140px;
}

.whole-01__body--search-password{
	position: absolute;
	bottom: 147px;
	left: 180px;
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}


.whole-02 {
	margin-top: 20px;
	border-color: rgba(255,255,255,.5);
	color: #262626; 
	text-align: center;
}

.whole-02--href{
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}

.hp-img{ /*핸드폰 이미지 감싸고 있는 div 클래스명*/
	position:absolute;
	top:40px;
	left:422px;
	width:368px;
	height:685px;
	display: inline-block;
}

#hp-img{ /*핸드폰 이미지요소의 id 이름 */
	
}

.inner-img { 

	display: auto;
    position: absolute;
    left: 54px;
    width: 239px; 
    height: 385px;

}

#inner-img {
	
	position:relative;
	left: 485px;
	top: 122px;
    width: 241px;
    height: 385px;
}

</style>


</head>
<body style="background-color: #FAFAFA">

<article class="article-01">
  <div class="whole">
	 <div class="whole-01">
                                                       
		<fieldset class="whole-01__fieldset">
			<form action="login.do" method="post">
			
				<h1 class="whole-01__header" style="text-align: center;">Instagram</h1>
			
				<div class="whole-01__body">
			  	
 
					<input type="email" class="whole-01__body--email" id="email" name="email"  value="${email}" placeholder="E-mail" required="required" autofocus="autofocus"><br><br><br>

					<input type="password" class="need" id="pw" name="pw" placeholder="Password" required="required" >	<br><br><br>
				
					<div class="whole-01__body--errMsg" id="errMsg"> 
						${msg} ${param.msg}
					</div> <br><br>
				
					<button type="submit" class="whole-01__body--login-btn" name="btn01">로그인</button>	<br><br><br><br>
				
			
				</div>
		
			</form>
		</fieldset>		
	 </div>	
	 
	<fieldset class="whole-02">
			계정이 없으신가요?
		<a href="signUp.jsp" class="whole-02--href">회원가입</a>
	</fieldset>
  </div>
</article>	


<article class="article-02">
	
	<div class="img-container">
		<div class="hp-img">
			<img id="hp-img" alt="핸드폰사진" src="./img/img06.png">
		</div>
	
	
		<div class="inner-img">
			<img id="inner-img" src="./img/img03.jpg">
		</div>
	</div>
</article>	

</body>
</html>