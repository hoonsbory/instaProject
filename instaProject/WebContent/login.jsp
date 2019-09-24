<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(.need).each(function(i,element) {
		$(element).keyup(function() { // 입력창에 키보드로 입력시 에러 메세지 지우기
			clearAll();
		})
	});
})

function clearAll() { // 입력창_에러메세지 지우기
	$('.need').html("");
}
</script>


<style type="text/css">

.whole{
	position: fixed;
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
	color: #262626; /*원본 #262626, 청록 깔끔한 색:#269999 #273299*/ 
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
	bottom: 328px;
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
	border: 0.4pt solid #efefef; /*#1fefef;*/

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

.effect {
    display: inline-block;
    position: absolute;
    overflow: hidden; /* 불필요한 부분 가리기 */
    padding: 6px; /* 6px정도 이미지 밖으로 표현 */
}
.effect img {
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3); /*초기값:8 -> 80 ->  */
}
.effect:before,
.effect:after { /*이게 뭐길래  모서리 2군데가 절단되지?*/
    content: "";
    position: absolute;
    z-index: 1;
    width: 42px; /*초기값: 97 */
    height: 50px; /*초기값: 50*/
    background: #abc; /* 배경색과 같은 색 #fff -> #abc*/
    transform: rotate(-40deg); /*초기값: 30 */
}
/* 왼쪽 위 */
.effect:before {
    box-shadow: 0 10px 8px -12px rgba(0, 0, 0, 0.8);
    top: -24px; /*초기값: -24*/
    bottom: auto;
    right: auto;
    left: -26px;
}
/* 오른쪽 아래 */
.effect:after {
    box-shadow: 0 -10px 10px -10px rgba(0, 0, 0, 0.7);
    top: auto;
    bottom: -22px; /*-22 */
    right: -25px;
    left: auto;
}

</style>


<script type="text/javascript">

</script>

</head>
<body style="background: white;">
<article class="article-01">
  <div class="whole">
	 <div class="whole-01">
                                                       
		<fieldset class="whole-01__fieldset">
			<form action="login.do" method="post">
			
				<h1 class="whole-01__header" style="text-align: center;">Instagram</h1>
			
				<div class="whole-01__body">
			  	
 
					<input type="email" class="whole-01__body--email" id="email" name="email"  value="${email}" placeholder="E-mail" required="required"><br><br><br>

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
	<div class="effect">
		<img src="./img/img03.jpg">

	</div>
</article>	

</body>
</html>