package ezen.shoppingmall.domain.article.dto;

public class Memo {
	
	private String memoId;
	private String customerId;
	private String title;
	private String contents;
	private String datecreated;
	private String customer_name;
	
	public Memo() {}

	public Memo(String memoId, String customerId, String title, String contents, String datecreated, String customer_name) {
		this.memoId = memoId;
		this.customerId = customerId;
		this.title = title;
		this.contents = contents;
		this.datecreated = datecreated;
		this.customer_name = customer_name;
	}

	public Memo(String memoId, String customerId, String title, String contents, String datecreated) {
		this.memoId = memoId;
		this.customerId = customerId;
		this.title = title;
		this.contents = contents;
		this.datecreated = datecreated;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	} 

	public String getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(String datecreated) {
		this.datecreated = datecreated;
	}
	
	

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	@Override
	public String toString() {
		return "Memo [memoId=" + memoId + ", customerId=" + customerId + ", title=" + title + ", contents=" + contents
				+ ", datecreated=" + datecreated + ", customer_name=" + customer_name + "]";
	}



	
	
	
}
