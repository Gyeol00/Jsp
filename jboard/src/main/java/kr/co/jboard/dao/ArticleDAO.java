package kr.co.jboard.dao;

import java.util.List;

import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.util.DBHelper;

public class ArticleDAO extends DBHelper {

	private static final ArticleDAO INSTANCE = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return INSTANCE;
	}
	private ArticleDAO() {}
	
	public void insertArticle(ArticleDTO dto) {

	}
	
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	
	
	public List<ArticleDTO> selectAllArticle() {
		return null;
	}
	
	
	public void updateArticle(ArticleDTO dto) {
		
	}
	
	
	public void deleteArticle(int no) {
		
	}

}
