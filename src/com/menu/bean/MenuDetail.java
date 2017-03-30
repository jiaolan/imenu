package com.menu.bean;

public class MenuDetail {
	int detailId;  //详情id
	int menuId;   //菜谱id
    int materialId;   //用料id
    String menuTech;  //工艺
    String menuLevel;   //难道
    String menuTaste;   //口味
    String menuTime;   //预计用时
    String menuRemark;   //步骤详情     //clob
    String menuFeature; //特色
	public int getDetailId() {
		return detailId;
	}
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getMaterialId() {
		return materialId;
	}
	public void setMaterialId(int materialId) {
		this.materialId = materialId;
	}
	public String getMenuTech() {
		return menuTech;
	}
	public void setMenuTech(String menuTech) {
		this.menuTech = menuTech;
	}
	public String getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	public String getMenuTaste() {
		return menuTaste;
	}
	public void setMenuTaste(String menuTaste) {
		this.menuTaste = menuTaste;
	}
	public String getMenuTime() {
		return menuTime;
	}
	public void setMenuTime(String menuTime) {
		this.menuTime = menuTime;
	}
	public String getMenuRemark() {
		return menuRemark;
	}
	public void setMenuRemark(String menuRemark) {
		this.menuRemark = menuRemark;
	}
	public String getMenuFeature() {
		return menuFeature;
	}
	public void setMenuFeature(String menuFeature) {
		this.menuFeature = menuFeature;
	}
    
    
}
