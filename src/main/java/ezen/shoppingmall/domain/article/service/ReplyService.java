package ezen.shoppingmall.domain.article.service;

import java.util.List;

import ezen.shoppingmall.domain.article.dto.Reply;

/**
 * 
 * @author 윤동진
 *방명록 댓글 관련 비즈니스 로직 처리 및 트랜잭션 관리를 위한 명세
 */

public interface ReplyService {
	//댓글 작성 메서드 
	public Reply writeReply(String contents, String customerId, String memoId);
	
	public List<Reply> findReply(String memoId);
}
