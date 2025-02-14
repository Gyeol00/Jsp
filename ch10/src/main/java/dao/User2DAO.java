package dao;

import dto.User2DTO;
import util.DBHelper;
import util.SQL;

public class User2DAO extends DBHelper {

	private static final User2DAO INSTENCE = new User2DAO();
	public static User2DAO getInstence() {
		return INSTENCE;
	}
	private User2DAO() {}
	
	public void insertUser2(User2DTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER2);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectUser2() {
		
	}
	
	public void selectAllUser2() {
		
	}
	
	public void updateUser2() {
		
	}
	
	public void deleteUser2() {
		
	}
	
}
