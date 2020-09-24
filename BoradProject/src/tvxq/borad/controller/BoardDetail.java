package tvxq.borad.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tvxq.borad.dao.BoardDAO;
import tvxq.borad.dao.RepleDAO;
import tvxq.borad.vo.BoardVO;
import tvxq.borad.vo.RepleVO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/boardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDAO boardDAO = new BoardDAO();
		BoardVO boardVO = boardDAO.getBoard(boardNo);
		
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * String userID = null; if(session.getAttribute("id") != null){ userID =
		 * (String)session.getAttribute("id"); }
		 */
		
		request.setAttribute("boardVO", boardVO);
		
		List<RepleVO> repleList = new ArrayList<RepleVO>(); 
		RepleDAO repleDAO = new RepleDAO();
		
		for (RepleVO repleVO : repleDAO.getRepleList()) {
			if (boardNo == repleVO.getBoardNo()) {
				repleList.add(repleVO);
			}
		}
		
		request.setAttribute("repleList", repleList);
		
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		rd.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
}
