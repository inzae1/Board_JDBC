
<%@page import="tvxq.borad.vo.UserVO"%>
<%@page import="tvxq.borad.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>회원정보수정</title>
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
				<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    접속
					  </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
					</ul>
				</li>
				</div>
				<%
					} else {
				%>
				<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    회원관리
					  </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						<li><a class="dropdown-item" href="updateUserForm.jsp">정보수정</a></li>
						<li><a class="dropdown-item" href="deleteUser.jsp">회원탈퇴</a></li>
					</ul>
				</li>
				</div>
				<%
					}
				%>
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
					<form method="post" action="userUpdate">
						<h2 style="text-align:center;"><b>회원정보 수정</b></h2><br>
						<%
						UserDAO dao = new UserDAO();
						UserVO user = dao.getUserInfo((String) session.getAttribute("id"));
						%>
						ID : <div class="form-group">
							<input type="text" class="form-control" name="id" maxlength="20" value="<%=user.getUserID()%>" readonly>
						</div>
						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20" value="<%=user.getUserPassword()%>">
						</div>
						비밀번호 확인 : <div class="form-group">
							<table>
								<td><input type="password" class="form-control" id="checkPassword" placeholder="비밀번호 확인" name="checkPassword" maxlength="12"></td>
								<td><input type="button" style="width:40pt;height:25pt;" class="btn btn-primary form-control" value="확인" onclick="check()"></td>
							</div>
							
							</table>
							<div id ="my"></div><br>
							
						이름 : <div class="form-group">
							<input type="text" class="form-control" name="name" maxlength="20" value="<%=user.getUserName()%>">
						</div>
						이메일 : <div class="form-group">
							<input type="email" class="form-control" name="email" maxlength="50" value="<%=user.getUserEmail()%>">
						</div>
						<div class="form-group" style="text-align:center;">
							<%if (user.getUserGender() == "남자") {%>
							<div class="btn-group" data=toggle="buttons">
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="여자">여자
								</label>
							</div>
							<%} else {%>
							<div class="btn-group" data=toggle="buttons">
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="남자">남자
								</label>
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="여자" checked>여자
								</label>
							</div>
							<%} %>
						</div>
						<table>
						<td><input type="submit" style="width:70pt;height:25pt;" class="btn btn-primary form-control" value="수정"></td>
						<td><div class="col-lg-4"></td>
						<td><input align="right" style="width:70pt;height:25pt;" type="button" class="btn btn-primary form-control" value="취소" onclick="history.back();"><td>
 						</table>
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
					/* checkPassword.disabled=true; */
				}else{
					document.getElementById("my").innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
					checkPassword.value = "";
				}
			}
				
		</script>
		
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
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
		 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
	</body>
</html>