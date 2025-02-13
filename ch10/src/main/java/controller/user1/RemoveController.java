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

@WebServlet("/user1/remove.do")
public class RemoveController extends HttpServlet {

	private static final long serialVersionUID = 4545645651L;

	private User1Service service = User1Service.getInstence();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String uid = req.getParameter("uid");

		// 데이터 삭제
		service.removeUser1(uid);

		// 이동
		resp.sendRedirect("/ch10/user1/list.do");


	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
