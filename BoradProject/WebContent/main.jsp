<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
	    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/animate.css">
	    <link rel="stylesheet" href="css/owl.carousel.min.css">
	    <link rel="stylesheet" href="css/owl.theme.default.min.css">
	    <link rel="stylesheet" href="css/magnific-popup.css"> 
	    <link rel="stylesheet" href="css/flaticon.css">
	    <link rel="stylesheet" href="css/style.css">
		<title>main</title>
	</head>
	
	<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
		%>
		
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
		          <%
					// 로그인이 되어 있지 않다면
					if(userID == null){
				  %>
				
					<li class="nav-item dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="nav-link"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" role="button"
								aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
							</ul>
						</li>
				<%
					} else {
				%>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" role="button"
								aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">회원관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그아웃</a></li>
								<li><a href="updateUserForm.jsp">정보수정</a></li>
								<li><a href="deleteUser.jsp">회원탈퇴</a></li>
							</ul>
						</li>
				<%
					}
				%>
		        </ul>
		      </div>
		    </div>
	 	</nav>
	 	
	 	<section class="hero-wrap" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.3">
	      <div class="overlay"></div>
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-center">
	          <div class="col-md-10 col-lg-7 ftco-animate d-flex align-items-end">
	          	<div class="text">
		            <h1 class="mb-4">JSP 게시판 <span>동방신기 (TVXQ)</span> </h1>
		            <p style="font-size: 18px;">"팀원 : 박해린 윤인재 정동진 이성현 김태형"</p>
		            <div class="d-flex meta">
			        	<div class=""><p class="mb-0"><a href="boardForm.jsp" class="btn btn-primary py-3 px-2 px-md-4">게시판으로 이동</a></p></div>
			        </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
	    
	    <section class="ftco-section testimony-section bg-light">
	      <div class="container">
	        <div class="row justify-content-center mb-5">
	          <div class="col-md-7 text-center heading-section ftco-animate">
	          	<span class="subheading">동방신기</span>
	            <h2 class="mb-3">팀원을 소개합니다.</h2>
	          </div>
	        </div>
	        <div class="row ftco-animate">
	          <div class="col-md-12">
	            <div class="carousel-testimony owl-carousel">
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                  <div class="text">
	                  	<span class="fa fa-quote-left"></span>
	                    <p class="mb-4">If you do not walk today, you will have to run tomorrow. and United we stand, divided we fall.</p>
	                    <div class="d-flex align-items-center">
	                    	<div class="user-img" style="background-image: url(images/567.png)"></div>
	                    	<div class="pl-3">
			                    <p class="name">윤인재</p>
			                    <span class="position">Marketing Manager</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                  <div class="text">
	                  	<span class="fa fa-quote-left"></span>
	                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <div class="d-flex align-items-center">
	                    	<div class="user-img" style="background-image: url(images/123.jpeg)"></div>
	                    	<div class="pl-3">
			                    <p class="name">정동진</p>
			                    <span class="position">Marketing Manager</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                  <div class="text">
	                  	<span class="fa fa-quote-left"></span>
	                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <div class="d-flex align-items-center">
	                    	<div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
	                    	<div class="pl-3">
			                    <p class="name">이성현</p>
			                    <span class="position">Marketing Manager</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                  <div class="text">
	                  	<span class="fa fa-quote-left"></span>
	                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <div class="d-flex align-items-center">
	                    	<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
	                    	<div class="pl-3">
			                    <p class="name">김태형</p>
			                    <span class="position">Marketing Manager</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                  <div class="text">
	                  	<span class="fa fa-quote-left"></span>
	                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <div class="d-flex align-items-center">
	                    	<div class="user-img" style="background-image: url(images/1234.png)"></div>
	                    	<div class="pl-3">
			                    <p class="name">박해린</p>
			                    <span class="position">Marketing Manager</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
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
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
		 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
	</body>
</html>
