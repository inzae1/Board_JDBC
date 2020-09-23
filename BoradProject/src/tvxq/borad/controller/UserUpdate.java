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
		
		UserVO user = new UserVO();
		user.setUserID(request.getParameter("userID"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserName(request.getParameter("userName"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserGender(request.getParameter("userGender"));
		
		UserDAO dao = new UserDAO();
		dao.updateUser(user);
		
		response.sendRedirect("main.jsp");
	}

}
