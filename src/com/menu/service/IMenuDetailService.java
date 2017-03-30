package com.menu.service;

import java.util.List;

import com.menu.bean.MenuDetail;

public interface IMenuDetailService {
public void save(MenuDetail menuDetail);
	
	public void update(MenuDetail menuDetail);
	
	public List<MenuDetail> list(MenuDetail menuDetail );
	
	public MenuDetail getMenuId(int menuId);
	
	public MenuDetail getDetailId(int detailId);
	
	public MenuDetail getMaterialId(int materialId);
}
