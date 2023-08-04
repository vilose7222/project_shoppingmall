package ezen.shoppingmall.domain.article.dao;

import java.sql.Connection;
import java.util.List;

import ezen.shoppingmall.domain.article.dto.Reply;

/**
 * 데이터 베이스 게시판 댓글 관리 명세
 * @author 윤동진
 *
 */
public interface ReplyDao {
	//댓글 작성 메서드
	public Reply create(Connection connection, String contents, String customerId, String memoId);
	//게시글번호에 해당하는 댓글 반환
	public List<Reply> findByMemoId(Connection connection , String memoId);
	//전체 게시글 목록
	public List<Reply> findByAll(Connection connection);
}
