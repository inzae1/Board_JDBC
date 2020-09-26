<%@page import="java.util.ArrayList"%>
<%@page import="tvxq.borad.dao.BoardDAO"%>
<%@page import="tvxq.borad.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <%
 response.setContentType("text/html; charset=utf-8");
 %>
 
<!DOCTYPE html>
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
	<title>전체 게시글</title>
    
    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
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
    
    <script type="text/javascript">
        function writeForm(){
            location.href="BoardWriteForm.jsp";
        }
    </script>
</head>
<body>    
 <%
	String userID = null;
	if(session.getAttribute("id") != null){
		userID = (String)session.getAttribute("id");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
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
		    <div id="board">
		    	<h2><b>자유게시판</b></h2><br>
		        <table class="table table-striped" width="800" border="3" bordercolor="lightgray">
		            <thead>
			            <tr heigh="30">
			                <td style="background-color: #96BB7C; color: #fff;">글번호</td>
			                <td style="background-color: #96BB7C; color: #fff;">작성자</td>
			                <td style="background-color: #96BB7C; color: #fff;">제목</td>
			                <td style="background-color: #96BB7C; color: #fff;">작성일</td>
			                <td style="background-color: #96BB7C; color: #fff;">조회수</td>
			                <td style="background-color: #96BB7C; color: #fff;">추천수</td>
			            </tr>    
			        </thead>
			        <tbody>
			            <%
			           		BoardDAO boardDAO = new BoardDAO();
							ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
							for(int i = 0; i < list.size(); i++){
						%>
							<tr>
								<td><%=list.get(i).getBoard_no() %></td>
								<td><%=list.get(i).getUserID() %></td>
								<td><a href="boardDetail?boardNo=<%=list.get(i).getBoard_no()%>"><%=list.get(i).getTitle() %></a></td>
								<td><%=list.get(i).getReg_date() %></td>
								<td><%=list.get(i).getViews() %></td>
								<td><%=list.get(i).getLikes() %></td>
							</tr>
						<%
						
							}
						%>
			        </tbody>
		        </table>
		        <%
					if(pageNumber != 1){
				%>
						<a href="boardForm.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
				<%
					}if(boardDAO.nextPage(pageNumber + 1)){
				%>
						<a href="boardForm.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
				<%
					}
				%>
				<a href="BoardWriteForm.jsp" class="btn btn-primary pull-right">글쓰기</a>
		    </div>
		    <br>
		    <div id="pageForm">
		        페이지 번호
		    </div>
		    <br>
		    <div id="searchForm">
		        <form>
		            <select name="opt">
		                <option value="0">제목</option>
		                <option value="1">내용</option>
		                <option value="2">제목+내용</option>
		                <option value="3">글쓴이</option>
		            </select>
		            <input type="text" size="20" name="condition"/>&nbsp;
		            <input type="submit" value="검색"/>
		        </form>    
		    </div>
		</div>
		</div>
		</div>
		</section>
		    
 		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
 	    <script src="js/jquery.min.js"></script>
	    <script src="js/jquery-migrate-3.0.1.min.js"></script>
   	    <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/jquery.stellar.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/jquery.animateNumber.min.js"></script>
		<script src="js/scrollax.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 		<script src="js/bootstrap.js"></script>
</body>
</html>
