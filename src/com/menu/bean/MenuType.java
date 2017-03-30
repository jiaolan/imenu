package com.menu.bean;

import java.util.List;


public class MenuType {
	   
	
	int typeId; //type的id
	String typeName; //type的名字
	String typeCode; //编号
	int parentId; //父id
	Integer typeStatus; //状态
	List<MenuType> children;
	Integer typeSort;
	MenuType parent;
	
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public Integer getTypeStatus() {
		return typeStatus;
	}
	public String getTypeStatusText() {
		return typeStatus == 0 ? "禁用" : "启用";
	}
	public void setTypeStatus(int typeStatus) {
		this.typeStatus = typeStatus;
	}
	public Integer getTypeSort() {
		return typeSort;
	}
	public void setTypeSort(Integer typeSort) {
		this.typeSort = typeSort;
	}
	public List<MenuType> getChildren() {
		return children;
	}
	public void setChildren(List<MenuType> children) {
		this.children = children;
	}
	public MenuType getParent() {
		return parent;
	}
	public void setParent(MenuType parent) {
		this.parent = parent;
	}
	public void setTypeStatus(Integer typeStatus) {
		this.typeStatus = typeStatus;
	}
	
}
