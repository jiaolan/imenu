package com.menu.service;

import java.util.List;

import com.menu.bean.Menu;
import com.menu.util.Pager;


public interface IMenuService {
	public void save(Menu menu);
	
	public void update(Menu menu);
	
	public List<Menu> list(Menu menu );
	
	public List<Menu> list(Menu menu ,Pager pager);
	
	public Menu getMenuId(int menuId);
	
	public List<Menu> getTypeId(int typeId);
	
	public List<Menu> getUserId(int userId);
	
	public void delete(int menuId);
}
