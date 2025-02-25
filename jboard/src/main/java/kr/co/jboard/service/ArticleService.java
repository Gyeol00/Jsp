package kr.co.jboard.service;

import java.util.List;

import kr.co.jboard.dao.ArticleDAO;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.PageGroupDTO;

public enum ArticleService {

	INSTANCE;	
	private ArticleDAO dao = ArticleDAO.getInstance();

	public int registerArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}

	public ArticleDTO findArticle(int no) {
		return dao.selectArticle(no);
	}

	public int getCountArticle() {
		return dao.selectCountArticle();
	}

	public List<ArticleDTO> findAllArticle(int start) {
		return dao.selectAllArticle(start);
	}
	
	public int getCountArticleBySearch(ArticleDTO dto) {
		return dao.selectCountArticleBySearch(dto);
	}
	
	public List<ArticleDTO> searchAllArticle(ArticleDTO dto, int start) {
		return dao.selectAllArticleBySearch(dto, start);
	}

	public void modifyArticle(ArticleDTO dto) {
		dao.updateArticle(dto);
	}

	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}

	// 마지막 페이지 번호 계산
	public int getLastPageNum(int total) {

		int lastPageNum = 0;

		// +1을 왜 하는지 알기
		if(total % 10 == 0) {
			lastPageNum = total / 10;
		}else {
			lastPageNum = total / 10 + 1;
		}

		return lastPageNum;
	}
	
	// 현재 페이지 번호 구하기
	public int getcurrentPage(String pg) {
		
		int currentPage = 1;
		
		if(pg != null) {
			// LIMIT용 start의 0을 계산한다
			// 숫자로 변환
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	// 페이지 시작번호 구하기(LIMIT용)
	public int getStartNum(int currentPage) {
		// 커런트 페이지가 1이면 0 2이면 10?
		return (currentPage - 1) * 10;
	}
	
	// 페이지 그룹 계산하기
	public PageGroupDTO getCurrentPageGroup(int currentPage, int lastPageNum) {
		
		// 1~10까지 1, 11~20까지 2 ~
		// 2그룹일 경우 스타트가 11, 엔드가 20
		int currentPageGroup = (int) Math.ceil(currentPage/10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		// pageGroupEnd가 마지막페이지 번호보다 큰 경우
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		return new PageGroupDTO(pageGroupStart, pageGroupEnd);
		
	}
	
	// 페이지 시작 번호 구하기
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		return total - start;
	}

}









