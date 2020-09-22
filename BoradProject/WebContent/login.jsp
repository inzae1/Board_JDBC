<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
</head>

<body>	
<style>
	form {
	margin: 0 auto;
	width: 300px;
	}
</style>

<header><h1><center>자유게시판</center></h1></header>
	<br>
	<fieldset>
	
	<form action="login" method=post >
		<br>
		<label for="loginId" style="font-size:15px">아이디&nbsp;&nbsp;&nbsp;</label>
		<input style="text" name="id" size=20 label=loginId placeholder="ID"><br>
			
		<label for="loginPw" style="font-size:15px">비밀번호</label>
		<input style="password" name="pw" size=20 label=loginPw placeholder="Password"><br><br>
		<input type="submit" value="로그인" style="height:40x; width:240px;"><br>
		&nbsp;&nbsp;
		<a href=?findId style="font-size:10px; color:gray" >아이디 찾기</a> 
		<a href=?findId style="font-size:10px; color:gray" >/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
		<a href=?joinMember style="font-size:10px; color:gray">회원가입</a>	
	</form>
	</fieldset>
</body>
</html>