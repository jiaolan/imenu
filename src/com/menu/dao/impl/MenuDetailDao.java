package com.menu.dao.impl;

import java.util.List;

import com.menu.bean.MenuDetail;
import com.menu.dao.IMenuDetailDao;
import com.menu.util.JdbcUtil;

public class MenuDetailDao implements IMenuDetailDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(MenuDetail menuDetail) {
		String sql = "insert into MENU_DETAIL (DETAIL_ID, MENU_ID, MATERIAL_ID, MENU_TECH, MENU_LEVEL, MENU_TASTE, MENU_TIME, MENU_FEATURE, MENU_REMARK)" + 
				"values (SEQ_MENU_DETAIL.nextval,(SELECT max(menu_id) from M_MENU),(SELECT max(MATERIAL_id) from MATERIAL),?,?,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{menuDetail.getMenuTech(),menuDetail.getMenuLevel(),menuDetail.getMenuTaste(),menuDetail.getMenuTime(),menuDetail.getMenuFeature(),menuDetail.getMenuRemark()});
	}

	@Override
	public void update(MenuDetail menuDetail) {
		String sql = "update MENU_DETAIL set MENU_ID = ?,MATERIAL_ID = ?,MENU_TECH = ?,MENU_LEVEL = ?,MENU_TASTE = ?, MENU_TIME = ?,MENU_FEATURE = ?,MENU_REMARK = ? where DETAIL_ID = ?";
		jdbcUtil.execute(sql, new Object[]{menuDetail.getMenuId(),menuDetail.getMaterialId(),menuDetail.getMenuTech(),menuDetail.getMenuLevel(),menuDetail.getMenuTaste(),menuDetail.getMenuTime(),menuDetail.getMenuFeature(),menuDetail.getMenuRemark(),menuDetail.getDetailId()});
	}

	@Override
	public List<MenuDetail> list(MenuDetail menuDetail) {
		String sql = "select * from MENU_DETAIL";
		return jdbcUtil.executeQuery(MenuDetail.class, sql, null);
	}

	@Override
	public MenuDetail getMenuId(int menuId) {
		String sql = "select md.* from MENU_DETAIL md where menu_id = ?";
		List<MenuDetail> list = jdbcUtil.executeQuery(MenuDetail.class, sql, new Object[]{menuId});
		if(list.size() > 0){
			return list.get(0);
		}else{
			System.out.println();
			return null;
		}
	}

	@Override
	public MenuDetail getDetailId(int detailId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MenuDetail getMaterialId(int materialId) {
		// TODO Auto-generated method stub
		return null;
	}


}
