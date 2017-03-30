package com.menu.service.impl;

import java.util.List;

import com.menu.bean.Menu;
import com.menu.dao.IMenuDao;
import com.menu.dao.impl.MenuDao;
import com.menu.service.IMenuService;
import com.menu.util.Pager;

public class MenuService implements IMenuService{

	IMenuDao menuDao = new MenuDao();
	@Override 
	public void save(Menu menu) {
		menuDao.save(menu);
	}

	@Override                         
	public void update(Menu menu) {
		menuDao.update(menu);
	}

	@Override
	public List<Menu> list(Menu menu) {
		return menuDao.list(menu);
	}
	
	@Override
	public List<Menu> list(Menu menu, Pager pager) {
		return menuDao.list(menu, pager);
	}

	@Override
	public Menu getMenuId(int menuId) {
		return menuDao.getMenuId(menuId);
	}

	@Override
	public List<Menu> getTypeId(int typeId) {
		return menuDao.getTypeId(typeId);
	}

	@Override
	public List<Menu> getUserId(int userId) {
		return menuDao.getUserId(userId);
	}

	@Override
	public void delete(int menuId) {
		menuDao.delete(menuId);
	}

	

}
