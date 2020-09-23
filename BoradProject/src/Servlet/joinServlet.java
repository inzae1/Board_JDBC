package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import DAO.UserVO;

/**
 * Servlet implementation class joinServlet
 */
@WebServlet("/joinServlet")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		UserDAO userdao = new UserDAO();
		UserVO user = new UserVO();
		
		String userID = null;
		String userPassword = request.getParameter("userPassword"); 
		String checkPassword = request.getParameter("checkPassword");
		
		if(session.getAttribute("id") != null){
			userID = (String)session.getAttribute("id");
		}
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
				|| user.getUserGender() == null || user.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력이 되었는지 확인해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.addUser(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입이 완료되었습니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
		
	}

}
