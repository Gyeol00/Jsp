package util;

public class SQL {

	// user1
	public static final String INSERT_USER1 = "insert into `user1` values (?,?,?,?)";
	public static final String SELECT_USER1 = "select * from `user1` where `uid` = ?";
	public static final String SELECT_ALL_USER1 = "select * from `user1`";
	public static final String UPDATE_USER1 = "update `user1` set "
													+ "`name`=?,"
													+ "`hp`=?,"
													+ "`age`=? where `uid`=?";
		
	public static final String DELETE_USER1 = "delete from `user1` where `uid`=?";

	// user2
	public static final String INSERT_USER2 = "insert into `user2` values (?,?,?,?)";
}
