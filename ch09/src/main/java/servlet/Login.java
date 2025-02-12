package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 129509529672956551L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		// 아이디 abc123, 비밀번호 1234 
		if(uid.equals("abc123") && pass.equals("1234")) {
			
			// 현재 클라이언트 세션 가져오기
			HttpSession session = req.getSession();
			
			// 로그인 세션 처리
			session.setAttribute("username", uid);
			
			// 이동
			resp.sendRedirect("/ch09/3.Listener.jsp");
			
		}else {
			
			// 이동
			resp.sendRedirect("/ch09/3.Listener.jsp?login=100");
		}
	}

}