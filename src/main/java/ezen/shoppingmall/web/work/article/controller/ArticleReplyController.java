package ezen.shoppingmall.web.work.article.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ezen.shoppingmall.domain.article.dto.Reply;
import ezen.shoppingmall.domain.article.service.ReplyService;
import ezen.shoppingmall.domain.common.factory.ServiceFactory;
import ezen.shoppingmall.web.mvc.controller.RestController;

/**
 * 댓글 처리 세부 컨트롤러 
 * /article
 */
public class ArticleReplyController implements RestController {

//	private ArticleService articleService = ServiceFactory.getInstance().getArticleService();

	@Override
	public void process(Map<String, String> paramMap, HttpServletRequest request, HttpServletResponse response) {
	    response.setContentType("application/json; charset=utf-8");
	    try {
	        PrintWriter out = response.getWriter();
	        String memoId = paramMap.get("id"); // 클라이언트에서 전달한 memoId 값 가져오기

	        // 댓글 조회 및 처리
	        ReplyService replyService = ServiceFactory.getInstance().getReplyService();
	        List<Reply> list = replyService.findReply(memoId);

	        // 댓글 리스트를 JSON 형태로 변환하여 클라이언트로 전달
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonList = objectMapper.writeValueAsString(list);
	        out.println(jsonList);
	    } catch (Exception e) {
	        throw new RuntimeException(e.getMessage());
	    }
	}
}