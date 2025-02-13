package service;

import java.util.List;

import dao.User1DAO;
import dto.User1DTO;

public class User1Service {
	
	// 싱글톤
	private final static User1Service INSTENCE = new User1Service();
	public static User1Service getInstence() {
		return INSTENCE;
	}
	public User1Service() {
	}
	
	// DAO 호출 (가져오기) - 서비스의 이름으로 변경
	private User1DAO dao = User1DAO.getInstance();

	public void registerUser1(User1DTO dto) {
		dao.insertUser1(dto);
	}


	public User1DTO findUser1(String uid) {
		return dao.selectUser1(uid);
	}


	public List<User1DTO> findAll() {
		return dao.selectAllUser1();
	}


	public void modifyUser1(User1DTO dto) {
		dao.updateUser1(dto);
	}


	public void removeUser1(String uid) {
		dao.deleteUser1(uid);
	}
}
