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
import ezen.shoppingmall.domain.customer.dto.Customer;
import ezen.shoppingmall.web.mvc.controller.RestController;

public class ReplyController implements RestController {

    private ReplyService replyService = ServiceFactory.getInstance().getReplyService();

    @Override
    public void process(Map<String, String> paramMap, HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/json; charset=utf-8");
        try {
        	
            PrintWriter out = response.getWriter();
            //세션의 customer저장된 값 가져오기
            Customer customer = (Customer) request.getSession().getAttribute("loginCustomer"); 
            String memoId = paramMap.get("memoId"); // 클라이언트에서 전달한 memoId 값 가져오기
            String contents = paramMap.get("contents"); // 클라이언트에서 전달한 댓글 내용 가져오기
            String customerId = (String)request.getSession().getAttribute("id");
            String customerName = customer.getName();
//            System.out.println(customerName);
            // 댓글 작성 요청 처리
            if (memoId != null && contents != null) {
                Reply reply = new Reply();
                reply.setMemoId(memoId);
                reply.setContents(contents);
                reply.setCustomerId(customerId);
                // 댓글 작성
                reply = replyService.writeReply(contents, customerId, memoId);
                ObjectMapper objectMapper = new ObjectMapper();
                String jsonResponse = objectMapper.writeValueAsString(reply);
                out.println(jsonResponse);
            } else {
                // 댓글 목록 조회
                List<Reply> list = replyService.findReply(memoId); // 해당 memoId에 대한 댓글 목록 조회
                ObjectMapper objectMapper = new ObjectMapper();
                String jsonList = objectMapper.writeValueAsString(list);

                out.println(jsonList);
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

}
