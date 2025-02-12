package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class Logout extends HttpServlet {

	private static final long serialVersionUID = 2324242321L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 현재 클라이언트 세션 정보 해제
		HttpSession session = req.getSession();		
		session.invalidate();
		
		// 이동
		resp.sendRedirect("/ch09/3.Listener.jsp");
	}
}