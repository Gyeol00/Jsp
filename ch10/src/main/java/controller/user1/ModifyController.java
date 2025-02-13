package controller.user1;

import java.io.IOException;

import dto.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/user1/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 4545645651L;
	
	private User1Service service = User1Service.getInstence();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String uid = req.getParameter("uid");
		
		// 수정 데이터 조회
		User1DTO dto = service.findUser1(uid);
		
		// 데이터 공유
		req.setAttribute("dto", dto);
		
		
		
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/modify.jsp");
		dispatcher.forward(req, resp);
	
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		// DTO 생성
		User1DTO dto = new User1DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		// 서비스 호출
		service.modifyUser1(dto);
		
		// 이동
		resp.sendRedirect("/ch10/user1/list.do");
		
	}

	
}
