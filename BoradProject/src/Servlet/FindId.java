package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/findId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		UserDAO userDAO = new UserDAO();
		
		String id = userDAO.findUserIdByEmail(email);
		
		request.setAttribute("id", id);
		RequestDispatcher rd = request.getRequestDispatcher("showId.jsp");
		rd.forward(request, response);
	}

}
