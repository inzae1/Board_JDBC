<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="findId" method=post >
		<br>
		<label for="loginId" style="font-size:15px">이메일</label> &nbsp;&nbsp;
		<input style="text" name="email" size=15 label=loginId placeholder="이메일"><br><br>
		
		
		<input type="submit" value="아이디 찾기" style="height:40x; width:240px;"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href=join.jsp style="font-size:10px; color:gray">회원가입</a>	
	</form>
</body>
</html>