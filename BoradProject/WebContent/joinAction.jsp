<%@page import="DAO.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="DAO.UserVO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
			String userID = null;
			String userPassword = request.getParameter("userPassword"); 
			String checkPassword = request.getParameter("checkPassword");
			
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			
			/* if(userID != null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인 되어 있습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			} */
			
			
			
			
		
			if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
					|| user.getUserGender() == null || user.getUserEmail() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모두 입력이 되었는지 확인해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
				
			else if(userPassword != checkPassword) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('비밀번호가 틀렸습니다.')");
					script.println("history.back()");
					script.println("</script>");
			
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.addUser(user);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('존재하는 아이디입니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					session.setAttribute("userID", user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='login.jsp'");
					script.println("</script>");
				}
			}
		%>
	</body>
</html>