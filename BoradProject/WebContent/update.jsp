<%@page import="tvxq.borad.dao.BoardDAO"%>
<%@page import="tvxq.borad.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
	    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/animate.css">
	    <link rel="stylesheet" href="css/owl.carousel.min.css">
	    <link rel="stylesheet" href="css/owl.theme.default.min.css">
	    <link rel="stylesheet" href="css/magnific-popup.css"> 
	    <link rel="stylesheet" href="css/flaticon.css">
	    <link rel="stylesheet" href="css/style.css">
	<title>게시글 쓰기</title>
    
    <style type="text/css">
        #wrap {
            width: 2000px;
            margin: 0 auto;
        }
        #topForm{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }

        #bList{
            text-align :center;
        }
        a, a:hover{
			color: #000000;
			text-decoration: none;}
    </style>
	</head>
		
	<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
			
			int board_no = 0;
			if(request.getParameter("board_no") != null){
				board_no = Integer.parseInt(request.getParameter("board_no"));
			}
			if(board_no == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='boardForm.jsp'");
				script.println("</script>");
			}
			BoardVO boardVO = new BoardDAO().getBoard(board_no);
		%>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		    <div class="container-fluid">
		    	<a class="navbar-brand" href="main.jsp">Play Data</a>
		    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		        	<span class="oi oi-menu"></span> Menu
		      	</button>
	
		      <div class="collapse navbar-collapse" id="ftco-nav">
		      	<ul class="navbar-nav ml-auto">
		          <li class="nav-item"><a href="main.jsp" class="nav-link">메인</a></li>
		          <li class="nav-item"><a href="boardForm.jsp" class="nav-link">게시판</a></li>
		          <li class="nav-item"><a href="map.jsp" class="nav-link">지도</a></li>
		          <%
					// 로그인이 되어 있지 않다면
					if(userID == null){
				  %>
				<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    접속
					  </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
					</ul>
				</li>
				</div>
				<%
					} else {
				%>
				<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    회원관리
					  </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						<li><a class="dropdown-item" href="updateUserForm.jsp">정보수정</a></li>
						<li><a class="dropdown-item" href="deleteUser.jsp">회원탈퇴</a></li>
					</ul>
				</li>
				</div>
				<%
					}
				%>
		        </ul>
		      </div>
		    </div>
	 	</nav>
		
		<section class="hero-wrap" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.3">
			<div class="container">
				<div class="row no-gutters slider-text align-items-center">
		
		<div id="wrap">
				<form method="post" action="updateAction.jsp?board_no=<%=board_no %>">
				<div class="form-group">
					<label for="subject">Title</label>
					<input type="text" class="form-control" name ="title" id="subject" placeholder="Enter title" value=<%=boardVO.getTitle() %>>
					</div>
										
					<div class="form-group">
					<label for="content">Content:</label>
					<textarea class="form-control" rows="10" name="content" id="content" placeholder="Enter content"><%=boardVO.getContent() %>></textarea>
					<br>
					<input type="submit" class="btn btn-primary pull-right" value="글수정" style="width:60pt;height:30pt;">
				</form>
			</div>
		</div>
		</div>
		</section>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
	</body>
</html>