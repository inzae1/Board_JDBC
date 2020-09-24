package tvxq.borad.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tvxq.borad.dao.UserDAO;
import tvxq.borad.vo.UserVO;

/**
 * Servlet implementation class checkIdServlet
 */
@WebServlet("/checkEmailServlet")
public class checkEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserVO vo = new UserVO();
		UserDAO dao = new UserDAO();
		
		
		vo.setUserEmail(request.getParameter("email"));
		List<UserVO> userList = dao.getEmailList();
		
		for (UserVO user : userList) {
			if(user.getUserEmail() == vo.getUserEmail()) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('가입된 이메일이 있습니다.);");
				out.println("history.back();");
				out.println("<script>");
				break;
			}else if(user.getUserEmail() == null) {
				PrintWriter out = response.getWriter();
				out.println("아나나나");
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('사용가능한 이메일입니다.');");
				out.println("location.href='join.jsp';");
				out.println("<script>");
			}
		}
		
	}

}
