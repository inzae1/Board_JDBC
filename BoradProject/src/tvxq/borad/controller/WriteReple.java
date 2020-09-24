package tvxq.borad.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tvxq.borad.dao.RepleDAO;
import tvxq.borad.vo.RepleVO;

/**
 * Servlet implementation class WriteReple
 */
@WebServlet("/writeReple")
public class WriteReple extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String userId = request.getParameter("userId");
		String content = request.getParameter("reple");
		
		RepleVO repleVO = new RepleVO();
		repleVO.setBoardNo(boardNo);
		repleVO.setUserId(userId);
		repleVO.setContent(content);
		
		RepleDAO repleDAO = new RepleDAO();
		repleDAO.addReple(repleVO);
		
		// post
		RequestDispatcher rd = request.getRequestDispatcher("boardDetail");
		rd.forward(request, response);
		
//		// get
//		response.sendRedirect("boardDetail");
		
	}

}
