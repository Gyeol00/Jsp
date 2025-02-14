package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import util.DBHelper;
import util.SQL;

public class CustomerDAO extends DBHelper {

	private static final CustomerDAO INSTENCE = new CustomerDAO();
	public static CustomerDAO getInstence() {
		return INSTENCE;
	}
	private CustomerDAO() {}
	
	// 로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insertCustomer(CustomerDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CUSTOMER);
			psmt.setString(1, dto.getCustId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAddr());
			psmt.executeUpdate();
			closeAll();

		}catch (Exception e) {
			e.printStackTrace();
			
			// 시스템 개선 및 업데이트 활용하기 위해 에러 내용을 로깅
			logger.error(e.getMessage());
		}
	}

	public CustomerDTO selectCustomer(String custId) {
		try {





		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<CustomerDTO> selectAllCustomer() {
		try {





		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateCustomer(CustomerDTO dto) {
		try {





		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteCustomer(String custId) {
		try {





		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
