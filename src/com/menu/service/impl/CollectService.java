package com.menu.service.impl;

import java.util.List;

import com.menu.bean.Collect;
import com.menu.dao.ICollectDao;
import com.menu.dao.impl.CollectDao;
import com.menu.service.ICollectService;

public class CollectService implements ICollectService{

	ICollectDao collectDao = new CollectDao();
	@Override
	public void save(Collect collect) {
		collectDao.save(collect);
	}

	@Override
	public void detele(Collect collect) {
		collectDao.delete(collect);
	}

	@Override
	public Collect get(int menuId, int userId) {
		return collectDao.get(menuId, userId);
	}

	@Override
	public List<Collect> get(int userId) {
		return collectDao.get(userId);
	}

}
