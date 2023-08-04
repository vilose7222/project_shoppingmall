package ezen.shoppingmall.domain.customer.dao;

import java.sql.Connection;
import java.util.List;

import ezen.shoppingmall.domain.customer.dto.Customer;

/**
 * DB 회원 관리 명세
 * @author 윤동진
 *
 */
public interface CustomerDao {
	//회원 가입 메서드
	public boolean create(Connection connection, Customer customer);
	//ID와 비밀번호로 조회
	public Customer findByUser(Connection connection,String id, String pw);
	//전체 회원 리스트 반환
	public List<Customer> findByAll(Connection connection);
	//ID로 회원 조회
	public Customer findById(Connection connection, String id);
}

	



