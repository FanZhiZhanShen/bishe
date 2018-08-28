package com.model;

public class TAdmin implements java.io.Serializable {

	private Integer userId;

	private String userName;

	private String userPw;

	public TAdmin() {
	}

	public TAdmin(String userName, String userPw) {
		this.userName = userName;
		this.userPw = userPw;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return this.userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public Integer getUserId()
	{
		return userId;
	}

	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}

}