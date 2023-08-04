package ezen.shoppingmall.domain.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ezen.shoppingmall.domain.article.dto.Reply;

/**
 * DB 게시판 댓글 구현체
 * 
 * @author 윤동진
 *
 */
public class JdbcReplyDao implements ReplyDao {


	
	public Reply create(Connection connection, String contents, String memoId, String customerId) {
	    StringBuilder sb = new StringBuilder();
	    sb.append("INSERT INTO reply (")
	        .append("    reply_id,")
	        .append("    contents,")
	        .append("    memo_id,")
	        .append("    customer_id")
	        .append(" ) VALUES (")
	        .append("   reply_id_seq.NEXTVAL, ?, ?, ? )");

	    PreparedStatement pstmt = null;
	    try {
	        pstmt = connection.prepareStatement(sb.toString());
	        pstmt.setString(1, contents);
	        pstmt.setString(2, memoId);
	        pstmt.setString(3, customerId);
	        pstmt.executeUpdate();

	        // 생성한 댓글 객체를 조회하여 반환
	        Reply createdReply = new Reply();
	        createdReply.setContents(contents);
	        createdReply.setMemoId(memoId);
	        createdReply.setCustomerId(customerId);

	        return createdReply;
	    } catch (Exception e) {
	        throw new RuntimeException(e.getMessage());
	    } finally {
	        try {
	            if (pstmt != null)
	                pstmt.close();
	        } catch (Exception e) {
	        }
	    }
	}
	
	
	public Reply getAllReply(Reply reply) {
		Reply replys = null;
		
		
		
		
		return replys;
	}
	
	
	
	
	@Override
	public List<Reply> findByMemoId(Connection connection, String memoId) {
	    List<Reply> list = new ArrayList<>();
	    StringBuilder sb = new StringBuilder();
	    Reply reply = new Reply();
	    sb.append("SELECT reply_id, r.contents, TO_CHAR(writedate, 'yyyy-MM-DD DAY') writedate, r.memo_id, r.customer_id, c.name")
	      .append(" FROM reply r")
	      .append(" JOIN memo m")
	      .append(" ON m.memo_id = r.memo_id")
	      .append(" JOIN customer c")
	      .append(" ON c.id = r.customer_id")
	      .append(" WHERE m.memo_id = ?")
		  .append(" ORDER BY reply_id DESC");
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        pstmt = connection.prepareStatement(sb.toString());
	        pstmt.setString(1, memoId); 

	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            reply = new Reply();
	            String replyId = rs.getString("reply_id");
	            String contents = rs.getString("contents");
	            String writeDate = rs.getString("writedate");
	            String customerId = rs.getString("customer_id");
	            String customerName = rs.getString("name");
	            reply.setReplyId(replyId);
	            reply.setContents(contents);
	            reply.setWriteDate(writeDate);
	            reply.setMemoId(memoId); 
	            reply.setCustomerId(customerId); 
	            reply.setCustomerName(customerName); 
	            list.add(reply);
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


	@Override
	public List<Reply> findByAll(Connection connection) {
		List<Reply>  list = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT reply_id, memo_id, customer_id, contents, writedate")
		  .append(" FROM reply");
//		  .append(" ORDER BY reply_id DESC");
//		  .append(" WHERE post_id = ?");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(sb.toString());
//			pstmt.setString(1, memoId);
			rs = pstmt.executeQuery();
			list = new ArrayList<Reply>();
			while (rs.next()) {			
				String replyId = rs.getString("reply_id");
				String memoId = rs.getString("memo_ic");
				String customerId = rs.getString("customer_id");
				String contents = rs.getString("contents");
				String writeDate = rs.getString("writedate");
				Reply reply = new Reply();
				reply.setReplyId(replyId);
				reply.setMemoId(memoId);
				reply.setContents(contents);
				reply.setWriteDate(writeDate);
				reply.setCustomerId(customerId);
				list.add(reply);
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
