<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="findPassword" method=post >
		<br>
		<label for="loginId" style="font-size:15px">ID</label> &nbsp;&nbsp;
		<input style="text" name="id" size=15 label=loginId placeholder="id"><br><br>
		
		
		<input type="submit" value="비밀번호 찾기" style="height:40x; width:240px;"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href=join.jsp style="font-size:10px; color:gray">회원가입</a>	
	</form>
</body>
</html>