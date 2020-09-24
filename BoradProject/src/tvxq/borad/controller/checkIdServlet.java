package tvxq.borad.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/checkIdServlet")
public class checkIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserVO vo = new UserVO();
		UserDAO dao = new UserDAO();
		PrintWriter script = response.getWriter();
		
		vo.setUserID(request.getParameter("id"));
		int result = dao.addUser(vo);
		if(result == -1){
			
			script.println("<script>");
			script.println("document.getElementById(\"checkid\").innerHTML=\"<font color='red'>이미 가입된 아이디입니다.</font>\";");
			script.println("history.back()");
			script.println("</script>");
			script.flush();
		}else {
			script.println("<script>");
			script.println("document.getElementById(\"checkid\").innerHTML=\"<font color='red'>이미 가입된 아이디입니다.</font>\";");
			script.println("history.back()");
			script.println("</script>");
			script.flush();
		}
		
	}

}
