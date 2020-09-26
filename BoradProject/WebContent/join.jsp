<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Join page</title>
	</head>
	
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		    <div class="container-fluid">
		    	<a class="navbar-brand" href="main.jsp">Play Data</a>
		    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		        	<span class="oi oi-menu"></span> Menu
		      	</button>
	
		      <div class="collapse navbar-collapse" id="ftco-nav">
		      	<ul class="navbar-nav ml-auto">
		          <li class="nav-item"><a href="main.jsp" class="nav-link">메인</a></li>
		          <li class="nav-item"><a href="boardForm.jsp" class="nav-link">게시판</a></li>
		          <li class="nav-item"><a href="map.jsp" class="nav-link">지도</a></li>
				  <li class="dropdown">
				  	<a class="dropdown-toggle" role="button"
						aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				  </li>
		        </ul>
		      </div>
		    </div>
	 	</nav> 
		
		<section class="hero-wrap" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.3">
			<div class="container">
			<div class="row no-gutters slider-text align-items-center">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="jumbotron" style="padding-top: 20px;">
						<form method="post" action="joinServlet">
							<h3 style="text-align:center;"><b>회원가입</b></h3><br>
							ID :<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="30">
							<a href="checkIdServlet"></a>
							</div>
							<!-- <input type="button" style="width:60pt;height:25pt;" class="btn btn-primary form-control" value="중복검사">
	
							<div id = "checkid"></div>
	-->						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="userPassword" placeholder="숫자 4~12자리" name="userPassword" minlength="4" maxlength="12">
							</div>
							비밀번호 확인 : <div class="form-group">
							<table>
								<td><input type="password" class="form-control" id="checkPassword" placeholder="비밀번호 확인" name="checkPassword" maxlength="12"></td>
								<td><input type="button" style="width:40pt;height:25pt;" class="btn btn-primary form-control" value="확인" onclick="check()"></td>
							</div>
								
							</table>
								<div id ="my"></div><br>
							이름 : <div class="form-group">
								<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
							</div>
							이메일 : <div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="50">
							</div>
							<div class="form-group" style="text-align:center;">
								<div class="btn-group" data=toggle="buttons">
									<label class="btn btn-primary activate">
										<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
									</label>
									<label class="btn btn-primary activate">
										<input type="radio" name="gender" autocomplete="off" value="여자">여자
									</label>
								</div>
							</div>
							<input type="submit" class="btn btn-primary form-control" value="회원가입">
						</form>
					</div>
				</div>
				</div>
			</div>
		</section>
		
		<script type= "text/javascript">
			const userPassword  = document.getElementById("userPassword");
			const checkPassword = document.getElementById("checkPassword");
			
			const check = () => {
				if (userPassword.value.length < 4 | userPassword.value.length > 12) {
					document.getElementById("my").innerHTML="<font color='red'>4~12자리의 숫자를 입력해주세요.</font>";
					checkPassword.value = "";
					userPassword.value = "";
				}else if(userPassword.value === checkPassword.value) {
					document.getElementById("my").innerHTML="<font color='blue'>비밀번호가 일치합니다.</font>";
				}else{
					document.getElementById("my").innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
					checkPassword.value = "";
				}
			}
			
				
		</script>
		
 		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
 	    <script src="js/jquery.min.js"></script>
	    <script src="js/jquery-migrate-3.0.1.min.js"></script>
   	    <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/jquery.stellar.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/jquery.animateNumber.min.js"></script>
		<script src="js/scrollax.min.js"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>