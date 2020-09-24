
<%@page import="tvxq.borad.vo.UserVO"%>
<%@page import="tvxq.borad.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>Update page</title>
	</head>
	
	<body>
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>		
				</button>
				<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li><a href="bbs.jsp">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="userUpdate">
						<h3 style="text-align:center;">회원정보 수정</h3><br>
						<%
						UserDAO dao = new UserDAO();
						UserVO user = dao.getUserInfo((String) session.getAttribute("id"));
						%>
						ID : <div class="form-group">
							<input type="text" class="form-control" name="id" maxlength="20" value="<%=user.getUserID()%>" readonly>
						</div>
						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="password" name="userPassword" maxlength="20" value="<%=user.getUserPassword()%>">
						</div>
						비밀번호 확인 : <div class="form-group">
							<input type="password" class="form-control" id="checkPassword"  name="checkPassword" maxlength="20" value="<%=user.getUserPassword()%>">
							<input type="button" value="확인" onclick="check()">
						</div>
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
						<input type="submit" class="btn btn-primary form-control" value="수정">
 					</form>
				</div>
			</div>
		</div>
		
		<script >
			const userPassword  = document.getElementById("userPassword");
			const checkPassword = document.getElementById("checkPassword");
			const check = () => {
				if(userPassword.value === checkPassword.value) {
					alert("일치합니다.");
					checkPassword.disabled=true;
				} else {
					alert("일치하지 않습니다.");
					checkPassword.value = "";
					
				}
			}
		</script>
		
		<!-- <script src="https://code.jquery.com/jquery-1.11.3.js" integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0=" crossorigin="anonymous"></script> -->
		<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qcyjSMfHjOMaLKfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
	</body>
</html>