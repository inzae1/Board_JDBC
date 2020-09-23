<%@page import="tvxq.borad.dao.BoardDAO"%>
<%@page import="tvxq.borad.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기</title>
	</head>
		
	<body>
		<%
			// 세션
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			} 
			// 글 번호를 받아와 int 타입으로 바꿈
			int board_no = 0;
			if(request.getParameter("board_no") != null){
				board_no = Integer.parseInt(request.getParameter("board_no"));
			}
			// 글 번호 못받았을 때
			if(board_no == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='boardForm.jsp'");
				script.println("</script>");
			}
			BoardVO boardVO = new BoardDAO().getBoard(board_no);
			if(!userID.equals(boardVO.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='boardForm.jsp'");
				script.println("</script>");
			}else{
			
				if(request.getParameter("title") == null || request.getParameter("content") == null 
						|| request.getParameter("title").equals("") || request.getParameter("content").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 모두 되지 않았습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.update(board_no, request.getParameter("title"), request.getParameter("content"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='boardForm.jsp'");
						script.println("</script>");
					}
				}
			}
		%>
	</body>
</html>