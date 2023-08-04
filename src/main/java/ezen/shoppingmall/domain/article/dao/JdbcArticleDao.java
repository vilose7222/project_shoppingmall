package ezen.shoppingmall.domain.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ezen.shoppingmall.domain.article.dto.Memo;

/**
 * RDB를 통해 게시글 저장 및 목록 구현체
 * @author 김기정
 */
public class JdbcArticleDao  implements ArticleDao {
	
	/**
	 * 신규글 등록
	 */
	public boolean create(Connection connection,  Memo memo){
		boolean success = false;
		StringBuilder sb = new StringBuilder();
		sb.append(" INSERT INTO memo (")
		  .append("    memo_id,")
		  .append("    contents,")
		  .append("    customer_id")
		  .append(" ) VALUES (")
		  .append("   memo_id_seq.NEXTVAL,")
		  .append("   ?,")
		  .append("   ?")
		  .append(")");
//		Customer customer = new Customer();
		PreparedStatement pstmt = null;
		try {
			pstmt = connection.prepareStatement(sb.toString());
			pstmt.setString(1, memo.getContents());
			pstmt.setString(2, memo.getCustomerId());
			pstmt.executeUpdate();
			success = true;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {}
		}
		return success;
	}
	
	
	
	@Override
	public int getCountAll(Connection connection) {
		int count = 0;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT COUNT(*) cnt")
		  .append(" FROM memo");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {}
		}
		return count;
		
		
	}
	
	@Override
	public List<Memo> findByAll(Connection connection, int requestPage, int elementSize) {
		List<Memo>  list = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT page, memo_id, datecreated, contents, customer_id")
		  .append(" FROM (SELECT ceil(ROWNUM / ?) page, memo_id, datecreated, contents, customer_id")
		  .append(" FROM (SELECT memo_id, to_char(datecreated, 'yyyy-MM-DD HH24:MI') datecreated, contents, customer_id")
		  .append(" FROM memo")
		  .append(" ORDER BY memo_id DESC))")
		  .append(" WHERE page = ?");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(sb.toString());
			pstmt.setInt(1, elementSize);
			pstmt.setInt(2, requestPage);
			rs = pstmt.executeQuery();
			list = new ArrayList<Memo>();
			while (rs.next()) {			
				String memo_id = rs.getString("memo_id");
				String datecreated = rs.getString("datecreated");
				String contents = rs.getString("contents");
				// 웹 페이지 줄바꿈 처리
				contents = contents.replaceAll("\r", "<br>");
				String customerId = rs.getString("customer_id");
//				String customerName = rs.getString("customer_name");
				Memo memo = new Memo();
				memo.setMemoId(memo_id);
				memo.setDatecreated(datecreated);
				memo.setContents(contents);
				memo.setCustomerId(customerId);
//				memo.setCustomer_name(customerName);
				list.add(memo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {}
		}
		return list;
	}
}


















