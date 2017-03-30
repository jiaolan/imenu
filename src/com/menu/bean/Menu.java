package com.menu.bean;

import java.util.Date;

public class Menu {
	
	int menuId;
	String menuName;
	String menuCode;
	int typeId;
	int userId;
	Integer menuStatus;
	Date createTime;
	String menuImg;
	MenuType type;
	User user;
	
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Integer getMenuStatus() {
		return menuStatus;
	}
	public String getMenuStatusText() {
		return menuStatus == 0 ? "禁用" : "启用";
	}
	public void setMenuStatus(Integer menuStatus) {
		this.menuStatus = menuStatus;
	}

	
	public MenuType getType() {
		return type;
	}
	public void setType(MenuType type) {
		this.type = type;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMenuImg() {
		return menuImg;
	}
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
}
