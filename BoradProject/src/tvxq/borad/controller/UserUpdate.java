package tvxq.borad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tvxq.borad.dao.UserDAO;
import tvxq.borad.vo.UserVO;




@WebServlet("/userUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserVO user = new UserVO();
		user.setUserID(request.getParameter("id"));
		user.setUserPassword(request.getParameter("password"));
		user.setUserName(request.getParameter("name"));
		user.setUserEmail(request.getParameter("email"));
		user.setUserGender(request.getParameter("gender"));
		
		UserDAO dao = new UserDAO();
		dao.updateUser(user);
		
		response.sendRedirect("main.jsp");
	}

}
