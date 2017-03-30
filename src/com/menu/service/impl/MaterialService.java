package com.menu.service.impl;

import java.util.List;

import com.menu.bean.Material;
import com.menu.dao.IMaterialDao;
import com.menu.dao.impl.MaterialDao;
import com.menu.service.IMaterialService;

public class MaterialService implements IMaterialService{

	IMaterialDao materialDao = new MaterialDao();
	@Override
	public void save(Material material) {
		materialDao.save(material);
	}

	@Override
	public void update(Material material) {
		materialDao.update(material);
	}

	@Override
	public List<Material> list(Material material) {
		return materialDao.list(material);
	}

	@Override
	public Material get(int materialId) {
		return materialDao.get(materialId);
	}

}
