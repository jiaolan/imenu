package com.menu.bean;

public class Comment {
	int commId;
	int userId;
	int menuId;
	String userName;
	String commDetail;
	
	public int getCommId() {
		return commId;
	}
	public void setCommId(int commId) {
		this.commId = commId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getCommDetail() {
		return commDetail;
	}
	public void setCommDetail(String commDetail) {
		this.commDetail = commDetail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
