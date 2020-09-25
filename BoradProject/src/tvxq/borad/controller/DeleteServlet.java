package tvxq.borad.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tvxq.borad.dao.UserDAO;
import tvxq.borad.vo.UserVO;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/deleteUser")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDAO dao = new UserDAO();
		UserVO user = dao.getUserInfo(request.getParameter("id"));
		String userPassword = user.getUserPassword();
		String userCheckPassword = request.getParameter("userPassword");
		
		
		if (userPassword.equals(userCheckPassword)) {
			dao.deleteUser(user);
		} else {
			response.sendRedirect("deleteUser.jsp");
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원탈퇴가 완료되었습니다.');");
		out.println("location.href='logoutAction.jsp';");
		out.println("</script>");
		
		
		
	}

}
