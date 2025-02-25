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
import kr.co.jboard.dto.PageGroupDTO;
import kr.co.jboard.service.ArticleService;

@WebServlet("/article/search.do")
public class SearchController extends HttpServlet {

	private static final long serialVersionUID = 4384445431360960261L;

	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 수신
		String pg = req.getParameter("pg");
		String searchType = req.getParameter("searchType");
		String keyword= req.getParameter("keyword");
		
		// DTO 생성
		ArticleDTO dto = new ArticleDTO();
		dto.setSearchType(searchType);
		dto.setKeyword(keyword);
		
		// 페이징 처리 관련 서비스 호출
		int total = service.getCountArticleBySearch(dto);
		int lastPageNum = service.getLastPageNum(total);
		int currentPage = service.getcurrentPage(pg);
		int start = service.getStartNum(currentPage);
		
		// 페이지 그룹 구하기
		PageGroupDTO pageGroupDTO = service.getCurrentPageGroup(currentPage, lastPageNum);
		
		// 페이지 시작 번호 구하기
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 서비스 호출
		List<ArticleDTO> articles = service.searchAllArticle(dto, start);
		
		// 데이터 참조 공유
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("pageGroupDTO", pageGroupDTO);
		req.setAttribute("searchType", searchType);
		req.setAttribute("keyword", keyword);
		
		// View 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/searchList.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
}
