package entity;

public class Users {
	private int userId;
	private String name;
	private String pass;
	/**
	 * 1是顾客 ,2是客服,3是卖家 ,4是系统管理员 ,5是高级管理员
	 */
	private int role = -1;
	private String head;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", name=" + name + ", pass=" + pass
				+ ", role=" + role + ", head=" + head + "]";
	}
	
}
