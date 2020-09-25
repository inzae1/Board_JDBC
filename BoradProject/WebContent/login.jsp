<%@page import="tvxq.borad.vo.UserVO"%>
<%@page import="tvxq.borad.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>Login page</title>
	</head>
	
	<body>
	<nav class="navbar navbar-default" style="background-color: #e3f2fd;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>		
				</button>
				<a class="navbar-brand" href="main.jsp" style="color: #008000;">Play data</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li><a href="boardForm.jsp">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
<!-- <style>
	form {
	margin: 0 auto;
	width: 300px;
	}
</style> -->
<div class="container">
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
		<input type="submit" value="로그인" class="btn btn-primary form-control"><br>
		
		<a href=findId.jsp style="font-size:10px; color:gray" >아이디 찾기</a> 
		<a href=findPassword.jsp style="font-size:10px; color:gray" >/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
		<a href=join.jsp style="font-size:10px; color:gray">회원가입</a>	
	</form>
				</div>
			</div>
		</div>
	
	
		<!-- <script src="https://code.jquery.com/jquery-1.11.3.js" integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0=" crossorigin="anonymous"></script> -->
		<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qcyjSMfHjOMaLKfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
	</body>
</html>