package kr.co.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class ArticleDAO extends DBHelper {	
	private static final ArticleDAO INSTANCE = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return INSTANCE;
	}
	private ArticleDAO() {}
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
public int insertArticle(ArticleDTO dto) {
		
		int no = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			psmt.executeUpdate();
			
			// 글 번호 조회 쿼리 실행
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			if(rs.next()) {
				no = rs.getInt(1);
			}
			
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return no;
	}
	
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	
	public int selectCountArticle() {
		
		int total = 0;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_ARTICLE);
			if(rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
			
			
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	
	public List<ArticleDTO> selectAllArticle(int start) {
		
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ALL_ARTICLE);
			psmt.setInt(1, start);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setWdate(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
			}
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return articles;
	}// selectAllArticle end
	
	public int selectCountArticleBySearch(ArticleDTO articleDTO) {
		
		int count = 0;
		
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_ARTICLE_FOR_SEARCH);
		
		if(articleDTO.getSearchType().equals("title")) {
			sql.append(SQL.WHERE_FOR_SEARCH_TITLE);
		}else if(articleDTO.getSearchType().equals("content")) {
			sql.append(SQL.WHERE_FOR_SEARCH_CONTENT);
		}else if(articleDTO.getSearchType().equals("writer")) {
			sql.append(SQL.JOIN_FOR_SEARCH_NICK);
			sql.append(SQL.WHERE_FOR_SEARCH_WRITER);
		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%"+articleDTO.getKeyword()+"%");
			logger.debug(psmt.toString());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return count;
	}
	
	public List<ArticleDTO> selectAllArticleBySearch(ArticleDTO articleDTO, int start) {
		
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		
		// String sql = SQL.SELECT_ALL_ARTICLE_BY_SEARCH;
		StringBuilder sql = new StringBuilder(SQL.SELECT_ALL_ARTICLE_BY_SEARCH);
		
		if(articleDTO.getSearchType().equals("title")) {
			// 제목 검색일 때
			// 서치 컨트롤러의 서치 타입으로 구분
			// 아티클DTO에 추가 필드 선언 (서치DTO 클래스를 생성해서 해도 됨)
			
			// sql += SQL.WHERE_FOR_SEARCH_TITLE;
			sql.append(SQL.WHERE_FOR_SEARCH_TITLE);
			sql.append(SQL.ORDER_FOR_SEARCH);
			sql.append(SQL.LIMIT_FOR_SEARCH);
		}else if(articleDTO.getSearchType().equals("content")) {
			// 내용 검색일 때
			// sql += SQL.WHERE_FOR_SEARCH_CONTENT;
			sql.append(SQL.WHERE_FOR_SEARCH_CONTENT);
			sql.append(SQL.ORDER_FOR_SEARCH);
			sql.append(SQL.LIMIT_FOR_SEARCH);
		}else if(articleDTO.getSearchType().equals("writer")) {
			// 글쓴이 검색일 때
			// sql += SQL.WHERE_FOR_SEARCH_WRITER;
			sql.append(SQL.WHERE_FOR_SEARCH_WRITER);
			sql.append(SQL.ORDER_FOR_SEARCH);
			sql.append(SQL.LIMIT_FOR_SEARCH);
		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			// 검색 키워드 맵핑
			psmt.setString(1, "%"+articleDTO.getKeyword()+"%");
			psmt.setInt(2, start);
			logger.debug(psmt.toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setWdate(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
			}
			closeAll();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		// 반환타입 void X, 반환타입 잘 바꿔주기
		return articles;
		
	}
	
	
	
	public void updateArticle(ArticleDTO dto) {
		
	}
	
	public void deleteArticle(int no) {
		
	}
}