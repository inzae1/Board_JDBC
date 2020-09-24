<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="tvxq.borad.dao.BoardDAO" %>
<%@ page import="tvxq.borad.vo.BoardVO" %>
<%@ page import="tvxq.borad.vo.RepleVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>view</title>
	</head>
	
	<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
			
			BoardVO boardVO = (BoardVO) request.getAttribute("boardVO"); 
			int board_no = boardVO.getBoard_no();
			if(board_no == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='boardForm.jsp'");
				script.println("</script>");
			}
			

			List<RepleVO> repleList = (List<RepleVO>) request.getAttribute("repleList");
		%>
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
					<li class="active"><a href="boardForm.jsp">게시판</a></li>
				</ul>
				<%
					// 로그인이 되어 있지 않다면
					if(userID == null){
				%>
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
				<%
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</nav>
		
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>		
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%=boardVO.getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replace(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=boardVO.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td><%=boardVO.getReg_date() %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="min-height: 200px; text-align: left;"><%=boardVO.getContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replace(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><%=boardVO.getViews() %></td>
						</tr>
						<tr>
							<td>추천수</td>
							<td><%=boardVO.getLikes() %></td>
						</tr>
					</tbody>
				</table>
				
				<div class="container">
					<div class="row">
					<%
					if(repleList != null) {
					%>
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead style="background-color: #eeeeee;">
								<tr>
									<th colspan="2" style="background-color: #eeeeee; text-align: center;">댓글</th>
								</tr>
								<tr>
									<th style="width: 20%; text-align: center;">작성자</td>
									<th colspan="2" style="text-align: center;">댓글 내용</td>		
								</tr>
							</thead>
							<tbody>
								
					<%
						for(RepleVO repleVO : repleList) {
					%>
								<tr>
									<td style="width: 20%;"><%=repleVO.getUserId() %></td>
									<td colspan="2"><%=repleVO.getContent() %></td>
								</tr>
					<%		
						}
					}
					%>
							</tbody>
						</table>
						<form action="writeReple" method="post">
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<tbody>
									<tr>
										<input hidden name="boardNo" value=<%=boardVO.getBoard_no() %>>
										<input hidden name="userId" value=<%=userID %>>
										<td><textarea type="text" class="form-control" placeholder="댓글 내용" name="reple" maxlength="2048" style="height: 50px;"></textarea></td>
									</tr>
								</tbody>
							</table>
							<input type="submit" class="btn btn-primary pull-right" value="댓글 입력">
						</form>
					</div>
				</div>
				
				
				<a href="boardForm.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(boardVO.getUserID())){
				%>
					<a href="update.jsp?board_no=<%=board_no %>" class="btn btn-primary">수정</a>
					<a href="deleteAction.jsp?board_no=<%=board_no %>" class="btn btn-primary">삭제</a>
				<%
					}else{
				%>
					<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?board_no=<%=board_no %>" class="btn btn-danger">추천</a>
				<%
					}
				%>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
	</body>
</html>