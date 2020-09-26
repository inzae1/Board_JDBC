<%@page import="tvxq.borad.vo.UserVO"%>
<%@page import="tvxq.borad.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Login page</title>
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
				  <div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    접속
					  </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
					</ul>
				</div>
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
							<header>
								<h2 style="text-align:center;"><b>로그인</b></h2>
							</header>
								<br>
								<fieldset>
								
								<form action="login1" method=post >
									<br>
									<label for="loginId" style="font-size:15px">아이디</label>
									<input style="text" name="id" class="form-control" label=loginId placeholder="ID"><br>
										
									<label for="loginPw" style="font-size:15px">비밀번호</label>
									<input type="password" name="pw" class="form-control" maxlength='20' size=20 label=loginPw placeholder="Password"><br><br>
									<div id="checkid"></div>
									<input type="submit" value="로그인" class="btn btn-primary form-control">
									
									<a href=findId.jsp style="font-size:10px; color:gray" >아이디 찾기</a> 
									<a href=findPassword.jsp style="font-size:10px; color:gray" >/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
									<a href=join.jsp style="font-size:10px; color:gray">회원가입</a>	
								</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		
	
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