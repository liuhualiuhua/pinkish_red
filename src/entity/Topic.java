package entity;

public class Topic {
	private int tioicId;
	private String title;
	private String content;
	private int userId;
	private int replyId;
	public int getTioicId() {
		return tioicId;
	}
	public void setTioicId(int tioicId) {
		this.tioicId = tioicId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
}
