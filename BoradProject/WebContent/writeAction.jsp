<%@page import="DAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="board" class="DAO.BoardVO" scope="page" />
<jsp:setProperty name="board" property="title" />
<jsp:setProperty name="board" property="content" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기</title>
	</head>
		
	<body>
		<%
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alter('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
				script.flush();
			} else{
				if(board.getTitle() == null || board.getTitle() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alter('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.write(board.getTitle(), userID, board.getContent());
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alter('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					} else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='main.jsp'");
						script.println("</script>");
					}
				}
			}
		%>
	</body>
</html>