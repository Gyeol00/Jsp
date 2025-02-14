package controller.customer;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/shop/customer/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// 싱글톤 가져오기
	private CustomerService service = CustomerService.INSTANCE;
	
	// 로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// shop/customer의 register 출력
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 로그 출력 (1단계 ~ 5단계) - logback.xml에서 설정해둔 레벨부터 실행됨
		// 로그할 땐 info 배포할 땐 warn, error
		logger.trace("RegisterController logger trace...");
		logger.debug("RegisterController logger debug...");
		logger.info("RegisterController logger info...");
		logger.warn("RegisterController logger warn...");
		logger.error("RegisterController logger error...");
		
		RequestDispatcher dispatcher =  req.getRequestDispatcher("/WEB-INF/shop/customer/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	// register form을 출력
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		
		CustomerDTO dto = new CustomerDTO();
		dto.setCustId(custId);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAddr(addr);
		
		service.registerCustomer(dto);
		
		resp.sendRedirect("/ch11/shop/customer/register.do");
		
	}
}
