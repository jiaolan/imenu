package com.menu.service.impl;

import java.util.List;

import com.menu.bean.MenuType;
import com.menu.dao.IMenuTypeDao;
import com.menu.dao.impl.MenuTypeDao;
import com.menu.service.IMenuTypeService;
import com.menu.util.Pager;

public class MenuTypeService implements IMenuTypeService{

	IMenuTypeDao menuTypeDao = new MenuTypeDao();
	@Override
	public void save(MenuType menuType) {
		menuTypeDao.save(menuType);
	}

	@Override
	public void update(MenuType menuType) {
		menuTypeDao.update(menuType);
	}

	@Override
	public List<MenuType> list(MenuType menuType) {
		return menuTypeDao.list(menuType);
	}

	@Override
	public MenuType get(int typeId) {
		return menuTypeDao.get(typeId);
	}

	@Override
	public List<MenuType> list(MenuType menuType, Pager pager) {
		return menuTypeDao.list(menuType, pager);
	}

}
