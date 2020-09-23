package control;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		//로그인
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UserDAO dao = new UserDAO();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int user = dao.getUser(id, pw);
		
		if (user == -1) {
			// 아이디가 없을 때 회원 가입으로 가기 response.sendRedirect()
			out.println("<script>alert('가입되지 않은 아이디입니다.'); history.back();");
			out.println("</script>");
			out.flush();
		} else if (user == 0) {
			// 비밀번호 불일치 할 때 비밀번호 찾기로 가기 response.sendRedirect() 
			out.println("<script>alert('비밀번호 잘못 입력하셨습니다.'); history.back();");
			out.println("</script>");
			out.flush();
		} else if (user == 1) {
			// 로그인 성공 시 자유게시판 페이지로 이동 response.sendRedirect("main.jsp")
			session.setAttribute(id, pw);
			response.sendRedirect("main.jsp");
			
		} 	
	}

}
