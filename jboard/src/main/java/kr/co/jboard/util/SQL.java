package kr.co.jboard.util;

public class SQL {

	// terms
	public static final String SELECT_TERMS = "select * from `terms` where `no`=?";
	
	// user
	public static final String SELECT_COUNT_USER = "select COUNT(*) from `user` ";
	public static final String WHERE_UID = "where `uid`=?";
	public static final String WHERE_NICK = "where `nick`=?";
	public static final String WHERE_EMAIL = "where `email`=?";
	public static final String WHERE_HP = "where `hp`=?";
	
	public static final String SELECT_USER = "select * from `user` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String INSERT_USER = "insert into `user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	// article
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `article`";
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM `article`";
	public static final String SELECT_ALL_ARTICLE = "SELECT "
													+ "a.*,"
													+ "u.`nick` "
													+ "FROM `article` AS a "
													+ "JOIN `user` AS u "
													+ "ON a.writer = u.uid "
													+ "ORDER BY `no` desc "
													+ "LIMIT ?, 10";
	
	public final static String SELECT_ALL_ARTICLE_BY_SEARCH = "SELECT "
																+ "a.*, "
																+ "u.`nick` "
																+ "FROM `article` AS a "
																+ "JOIN `user` AS u ON a.writer = u.uid ";
	
	public final static String SELECT_COUNT_ARTICLE_FOR_SEARCH = "select count(*) from `article` as a ";
	public final static String JOIN_FOR_SEARCH_NICK  = "JOIN `user` as u ON a.writer = u.uid ";
	public final static String WHERE_FOR_SEARCH_TITLE   = "WHERE `title` LIKE ? ";
	public final static String WHERE_FOR_SEARCH_CONTENT = "WHERE `content` LIKE ? ";
	public final static String WHERE_FOR_SEARCH_WRITER  = "WHERE `nick` LIKE ? ";	
	public final static String ORDER_FOR_SEARCH  = "ORDER BY `no` DESC ";
	public final static String LIMIT_FOR_SEARCH  = "LIMIT ?, 10";
															
	
	public static final String INSERT_ARTICLE = "insert into `article` set "
													+ "`title`=?,"
													+ "`content`=?,"
													+ "`file`=?,"
													+ "`writer`=?,"
													+ "`regip`=?,"
													+ "`wdate`=NOW()";
	
	// file
	public static final String INSERT_FILE = "insert into `file` set "
												+ "`ano`=?,"
												+ "`oName`=?,"
												+ "`sName`=?,"
												+ "`rdate`=NOW()";
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}