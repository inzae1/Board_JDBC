<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String password = (String) request.getAttribute("password");
	if (password != null) {
	%>
	<label>password: <%=password%></label>
	<%
		} else {
	%>
	<h2>password를 찾을 수 없습니다.</h2>
	<%
		}
	%>
	<a href="login.jsp">
		<button>로그인</button>
	</a>
</body>
</html>