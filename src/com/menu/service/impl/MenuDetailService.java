package com.menu.service.impl;

import java.util.List;

import com.menu.bean.MenuDetail;
import com.menu.dao.IMenuDetailDao;
import com.menu.dao.impl.MenuDetailDao;
import com.menu.service.IMenuDetailService;

public class MenuDetailService implements IMenuDetailService{

	IMenuDetailDao menuDetailDao = new MenuDetailDao();
	@Override
	public void save(MenuDetail menuDetail) {
		menuDetailDao.save(menuDetail);
	}

	@Override
	public void update(MenuDetail menuDetail) {
		menuDetailDao.update(menuDetail);
	}

	@Override
	public List<MenuDetail> list(MenuDetail menuDetail) {
		return menuDetailDao.list(menuDetail);
	}

	@Override
	public MenuDetail getMenuId(int menuId) {
		return menuDetailDao.getMenuId(menuId);
	}

	@Override
	public MenuDetail getDetailId(int detailId) {
		return menuDetailDao.getDetailId(detailId);
	}

	@Override
	public MenuDetail getMaterialId(int materialId) {
		return menuDetailDao.getMaterialId(materialId);
	}

}
