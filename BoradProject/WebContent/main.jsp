<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BoardDAO"%>
<%@page import="DAO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<div id="wrap">
    <br>
    <div id="topForm">
        <c:if test="${sessionScope.sessionID!=null}">
            <a href="BoardWriteForm.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </c:if>    
    </div>
    <br>
    <div id="board">
        <table id="bList" width="800" border="3" bordercolor="lightgray">
            <thead>
	            <tr heigh="30">
	                <td>글번호</td>
	                <td>작성자</td>
	                <td>제목</td>
	                <td>작성일</td>
	                <td>조회수</td>
	                <td>추천수</td>
	            </tr>    
	        </thead>
	        <tbody>
	            <%
	           		BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++){
				%>
					<tr>
						<td><%=list.get(i).getNo() %></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle() %></a></td>
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
				<a href="main.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			}if(boardDAO.nextPage(pageNumber + 1)){
		%>
				<a href="main.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
		<%
			}
		%>
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
 
</body>
</html>
