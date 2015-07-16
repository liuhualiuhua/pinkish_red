package entity;

public class Order {
	private int orderId;
	private int userId;
	private double price=0.0;
	/**
	 * 状态分为：已提交 已发货 交易成功（收货）
	 */
	private String status;
	private String postTime;

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", price="
				+ price + ", status=" + status + ", postTime=" + postTime + "]";
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

}
