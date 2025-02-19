package kr.co.jboard.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.UserDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class UserDAO extends DBHelper {
	private static final UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCountUser(String type, String value) {
		// 카운트를 조회한다
		int count = 0;
		
		// 동적 처리, SQL문도 수정해야 함
		// String 불변성 (4byte)을 고려해
		// 동적 처리를 하기에 String 문자열을 쓰기에는 조금 안좋다
		// 그러므로 StringBuilder로 동적 SQL 생성한다
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {
			sql.append(SQL.WHERE_UID);
		}else if(type.equals("nick")) {
			sql.append(SQL.WHERE_NICK);
		}else if(type.equals("email")) {
			sql.append(SQL.WHERE_EMAIL);
		}else if(type.equals("hp")){
			sql.append(SQL.WHERE_HP);
		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			
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
	
	public UserDTO selectUser(String uid) {
		return null;
	}
	
	public UserDTO selectUser(UserDTO dto) {
		
		UserDTO userDTO = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				userDTO = new UserDTO();
				userDTO.setUid(rs.getString(1));
				userDTO.setPass(rs.getString(2));
				userDTO.setName(rs.getString(3));
				userDTO.setNick(rs.getString(4));
				userDTO.setEmail(rs.getString(5));
				userDTO.setHp(rs.getString(6));
				userDTO.setRole(rs.getString(7));
				userDTO.setZip(rs.getString(8));
				userDTO.setAddr1(rs.getString(9));
				userDTO.setAddr2(rs.getString(10));
				userDTO.setRegip(rs.getString(11));
				userDTO.setRegDate(rs.getString(12));
				userDTO.setLeaveDate(rs.getString(13));
			}
			closeAll();			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return userDTO;
	}
	
	public List<UserDTO> selectAllUser() {
		return null;
	}
	
	public void updateUser(UserDTO dto) {
		
	}
	
	public void deleteUser(String uid) {
		
	}
}