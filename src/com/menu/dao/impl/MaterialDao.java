package com.menu.dao.impl;

import java.util.List;

import com.menu.bean.Material;
import com.menu.dao.IMaterialDao;
import com.menu.util.JdbcUtil;

public class MaterialDao implements IMaterialDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(Material material) {
		String sql = "insert into material (material_id,main_material,assist_material,flavour) values (SEQ_MATERIAL.nextval,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{material.getMainMaterial(),material.getAssistMaterial(),material.getFlavour()});
	}

	@Override
	public void update(Material material) {
		String sql = "update material set main_material = ?,assist_material = ?,flavour = ? where material_id = ?";
		jdbcUtil.execute(sql, new Object[]{material.getMainMaterial(),material.getAssistMaterial(),material.getFlavour(),material.getMaterialId()});
	}

	@Override
	public List<Material> list(Material material) {
		String sql = "select * from material";
		return jdbcUtil.executeQuery(Material.class, sql, null);
	}

	@Override
	public Material get(int materialId) {
		String sql = "select * from material where MATERIAL_ID = ?";
		List<Material> list = jdbcUtil.executeQuery(Material.class, sql, new Object[]{materialId});
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
