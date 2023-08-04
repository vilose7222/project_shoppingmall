package ezen.shoppingmall.domain.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import ezen.shoppingmall.domain.article.dao.ReplyDao;
import ezen.shoppingmall.domain.article.dto.Reply;
import ezen.shoppingmall.domain.common.factory.ServiceFactory;

public class ReplyServiceImpl implements ReplyService {

	private DataSource dataSource;
	private ReplyDao replyDao;

	public ReplyServiceImpl(DataSource dataSource, ReplyDao replyDao) {
		this.dataSource = dataSource;
		this.replyDao = replyDao;
	}

	@Override
	public Reply writeReply(String contents, String customerId, String memoId) {
	    Connection connection = null;
	    try {
	        connection = dataSource.getConnection();
	        connection.setAutoCommit(false); // 트랜잭션 시작

	        Reply reply = new Reply();
	        reply.setContents(contents);
	        reply.setMemoId(memoId);

	        // DAO를 통해 DB에 작성한 댓글 객체를 얻어옴
	        reply = replyDao.create(connection, contents, memoId, customerId);

	        // 모든 DAO 메서드가 성공적으로 실행되면 트랜잭션 커밋
	        connection.commit();

	        return reply; // 작성한 댓글 객체 반환
	    } catch (Exception e) {
	        try {
	            if (connection != null)
	                connection.rollback(); // 만약 하나라도 오류가 발생하면 트랜잭션 롤백
	        } catch (SQLException e1) {
	            // 롤백 오류 처리
	        } finally {
	            try {
	                if (connection != null)
	                    connection.close();
	            } catch (SQLException e1) {
	                // Connection 닫기 오류 처리
	            }
	        }

	        // 예외를 다시 던져서 호출자에게 오류를 알림
	        throw new RuntimeException(e.getMessage());
	    }
	}

	@Override
	public List<Reply> findReply(String memoId) {
		List<Reply> list = null;
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
			list = replyDao.findByMemoId(connection, memoId);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException e1) {
			}
		}

		return list;
	}

	// 테스트 메인
	public static void main(String[] args) {
		ReplyService replyService = ServiceFactory.getInstance().getReplyService();
//		List<Reply> list = replyService.findReply("206");
//		System.out.println(list);

		Reply reply = replyService.writeReply("컨텐츠", "vilose7222", "1");
		System.out.println(reply);

	}
}
