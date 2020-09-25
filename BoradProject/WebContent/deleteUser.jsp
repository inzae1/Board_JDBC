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
		
		<script type="text/javascript">
        function checkValue(){
        	var userPassword = document.getElementById("userPassword");
            if(userPassword.value === ""){
                alert("비밀번호를 입력하지 않았습니다.");
                location.href="deleteUser.jsp"
            }
        }
    	</script>

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
			</div>
		</nav>
		
		<div class="container">
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
	</body>
</html>