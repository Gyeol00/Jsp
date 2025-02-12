package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		// 서블릿을 초기화(최초 실행)
		System.out.println("Hello init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 GET방식일 때
		System.out.println("Hello doGet...");
		
		// HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>Hello</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>Hello Servlet</h3>");
		writer.println("<a href='/ch09/hello.do'>Hello</a>");
		writer.println("<a href='/ch09/welcome.do'>Welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>Greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 POST방식일 때
		System.out.println("Hello doPost...");
	}
	
	@Override
	public void destroy() {
		// 서블릿이 종료될 때(WAS가 중지될 때)
		System.out.println("Hello destroy...");
	}

}