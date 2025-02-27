package kr.co.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.CommentDTO;
import kr.co.jboard.service.ArticleService;
import kr.co.jboard.service.CommentService;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1271261225653325736L;

	private ArticleService service = ArticleService.INSTANCE;
	private CommentService commentservice = CommentService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String no = req.getParameter("no");

		// 글 조회 서비스 호출
		ArticleDTO articleDTO = service.findArticle(no);

		// 댓글 조회 서비스 호출
		List<CommentDTO> comments = commentservice.findAllComment(no);
		
		// 해당 글의 모든 글 호출
		//commentservice.findAllComment(no);
		
		// 데이터 공유 참조
		// View.jsp 참조하게 하기
		// req 객체로 공유 참조
		req.setAttribute("articleDTO", articleDTO);
		req.setAttribute("comments", comments);

		// View forward
		RequestDispatcher dispatcher =  req.getRequestDispatcher("/WEB-INF/article/view.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
