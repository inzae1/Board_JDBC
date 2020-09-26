<%@page import="tvxq.borad.vo.UserVO"%>
<%@page import="tvxq.borad.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/style.css">
		<title>회원 탈퇴</title>
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
					<form method="post" action="deleteUser" onsubmit="checkValue()">
						<h3 style="text-align:center;">회원 탈퇴</h3><br>
						<h4 style="text-align:center;">비밀번호를 입력하시오.</h4><br>
						<%
						UserDAO dao = new UserDAO();
						UserVO user = dao.getUserInfo((String) session.getAttribute("id"));
						%>
						
						ID : <div class="form-group">
							<input type="text" class="form-control" name="id" maxlength="20" value="<%=user.getUserID()%>" readonly>
						</div>
						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20">
						</div>
						
						<table>
						<td><input type="submit" style="width:70pt;height:25pt;" class="btn btn-primary form-control" value="탈퇴"></td>
						<td><div class="col-lg-4"></td>
						<td><input align="right" style="width:70pt;height:25pt;" type="button" class="btn btn-primary form-control" value="취소" onclick="history.back();"><td>
 						</table>
 					</form>
				</div>
			</div>
		</div>
		
		<!-- <script src="https://code.jquery.com/jquery-1.11.3.js" integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0=" crossorigin="anonymous"></script> -->
		<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qcyjSMfHjOMaLKfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
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
		
		<script type="text/javascript">
        function checkValue(){
        	var userPassword = document.getElementById("userPassword");
            if(userPassword.value === ""){
                alert("비밀번호를 입력하지 않았습니다.");
                location.href="deleteUser.jsp"
            }
        }
    	</script>
		
	</body>
</html>