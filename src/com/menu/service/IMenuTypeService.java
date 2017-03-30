package com.menu.service;

import java.util.List;

import com.menu.bean.MenuType;
import com.menu.util.Pager;


public interface IMenuTypeService {
public void save(MenuType menuType);
	
	public void update(MenuType menuType);
	
	public List<MenuType> list(MenuType menuType );
	
	public MenuType get(int typeId);
	
	public List<MenuType> list(MenuType menuType ,Pager pager);
}
