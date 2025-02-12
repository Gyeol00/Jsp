package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/greeting.do")
public class Greeting extends HttpServlet {

	private static final long serialVersionUID = 3L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 GET방식일 때
		System.out.println("Greeting doGet...");
		
		// HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>Greeting</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>Greeting Servlet</h3>");
		writer.println("<a href='/ch09/hello.do'>Hello</a>");
		writer.println("<a href='/ch09/welcome.do'>Welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>Greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}