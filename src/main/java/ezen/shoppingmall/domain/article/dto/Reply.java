package ezen.shoppingmall.domain.article.dto;

/**
 * 게시판 게시글의 댓글에 대한 컴포넌트
 * @author 윤동진
 *
 */
public class Reply {
	private String replyId;
	private String contents;
	private String writeDate;
	private String memoId;
	private String customerId;
	private String customerName;
	public Reply() {}

	
	
	
	//customerName 포함한 생성자
	public Reply(String replyId, String contents, String writeDate, String memoId, String customerId,
			String customerName) {
		super();
		this.replyId = replyId;
		this.contents = contents;
		this.writeDate = writeDate;
		this.memoId = memoId;
		this.customerId = customerId;
		this.customerName = customerName;
	}





	public Reply(String replyId, String contents, String writeDate, String memoId, String customerId) {
		this.replyId = replyId;
		this.contents = contents;
		this.writeDate = writeDate;
		this.memoId = memoId;
		this.customerId = customerId;
	}





	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getMemoId() {
		return memoId;
	}

	public void setMemoId(String memoId) {
		this.memoId = memoId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", contents=" + contents + ", writeDate=" + writeDate + ", memoId="
				+ memoId + ", customerId=" + customerId + ", customerName=" + customerName + "]";
	}


	

	
	
	
	
	
	
	
	
}
