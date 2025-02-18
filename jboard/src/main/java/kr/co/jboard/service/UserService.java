package kr.co.jboard.service;

import java.util.List;

import kr.co.jboard.dao.UserDAO;
import kr.co.jboard.dto.UserDTO;

public enum UserService {
	INSTANCE;
	private UserDAO dao = UserDAO.getInstance();
	
	public void registeUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO findUser(String uid) {
		return dao.selectUser(uid);
	}
	
	public UserDTO findUser(UserDTO dto) {
		return dao.selectUser(dto);
	}
	
	public List<UserDTO> findAllUser() {
		return dao.selectAllUser();
	}
	
	public void modifyUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
}