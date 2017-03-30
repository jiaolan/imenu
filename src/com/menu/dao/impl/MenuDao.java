package com.menu.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.menu.bean.Menu;
import com.menu.bean.MenuType;
import com.menu.dao.IMenuDao;
import com.menu.util.JdbcUtil;
import com.menu.util.Pager;
import com.menu.util.Util;

public class MenuDao implements IMenuDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(Menu menu) {
		String sql = "insert into m_MENU (MENU_ID, MENU_NAME, TYPE_ID, USER_ID, MENU_STATUS, CREATE_TIME, MENU_IMG) " + 
				"values (seq_menu.nextval,?,?,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{menu.getMenuName(),menu.getTypeId(),menu.getUserId(),menu.getMenuStatus(),menu.getCreateTime(),menu.getMenuImg()});
	}

	@Override
	public void update(Menu menu) {
		String sql = "update m_menu set menu_name = ?,type_id = ?,menu_status =? where menu_id=?";
		jdbcUtil.execute(sql, new Object[]{menu.getMenuName(),menu.getTypeId(),menu.getMenuStatus(),menu.getMenuId()});
	}

	@Override
	public List<Menu> list(Menu menu) {
		String sql = "select m.*,mt.TYPE_NAME \"type.type_name\",mu.USER_NAME \"user.USER_NAME\" from m_menu m left join menu_type mt on mt.TYPE_ID = m.TYPE_ID " +
				" left join m_user mu on mu.user_id = m.user_id where 1=1 ";
		return jdbcUtil.executeQuery(Menu.class, sql, null);
	}
	@Override
	public List<Menu> list(Menu menu, Pager pager) {
		String sql = "select m.*,mt.TYPE_NAME \"type.type_name\",mu.USER_NAME \"user.USER_NAME\" from m_menu m left join menu_type mt on mt.TYPE_ID = m.TYPE_ID " +
				" left join m_user mu on mu.user_id = m.user_id where 1=1 ";
		List<Object> parameter = new ArrayList<Object>();
		if(menu != null){
			//处理商品名称
			String menuName = menu.getMenuName();
			if(Util.isNotEmpty(menuName)){
				sql += " and m.menu_name like '%' || ? || '%' ";
				parameter.add(menuName);
			}
			
			//处理一级分类
			MenuType type = menu.getType();
			if(type != null){
				sql += " and mt.parent_id = ? ";
				parameter.add(type.getParentId());
			}
			
			//处理二级分类
			int typeId = menu.getTypeId();
			if(typeId != 0){
				sql += " and mt.type_id = ? ";
				parameter.add(typeId);
			}
			
			//处理用户
			if (menu.getUser() != null) {
				String userName = menu.getUser().getUserName();
				if(Util.isNotEmpty(userName)){
					sql += " and mu.USER_NAME like '%' || ? || '%' ";
					parameter.add(userName);
				}
			}
			//处理状态
			Integer menuStatus = menu.getMenuStatus();
			if(menuStatus != null){
				sql += " and m.menu_status = ? ";
				parameter.add(menuStatus);
			}
			sql += "order by m.create_time";
			
		}
		return jdbcUtil.executeQuery(Menu.class, sql, parameter.toArray(), pager);
	}
	@Override
	public Menu getMenuId(int menuId) {
		String sql = "select m.*,mu.user_name \"user.user_name\",mt.parent_id \"type.parent_id\",mt.TYPE_NAME \"type.type_name\" from m_menu m left join menu_type mt on mt.TYPE_ID = m.TYPE_ID " +
					 "left join m_user mu on mu.user_ID = m.user_ID where menu_id = ? ";
		List<Menu> list =  jdbcUtil.executeQuery(Menu.class, sql, new Object[]{menuId});
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Menu> getUserId(int userId) {
		String sql = "select * from m_menu where user_id = ?";
		return jdbcUtil.executeQuery(Menu.class, sql, new Object[]{userId});
	}

	@Override
	public List<Menu> getTypeId(int typeId) {
		String sql = "select m.*,mt.TYPE_NAME \"type.type_name\" from m_menu m left join menu_type mt on mt.TYPE_ID = m.TYPE_ID " +
				 " where m.type_id = ? ";
		return jdbcUtil.executeQuery(Menu.class, sql, new Object[]{typeId});
	}

	@Override
	public Menu getRowid(int rowid) {
		String sql = "select * from m_menu where rowid = ?";
		return jdbcUtil.executeQuery(Menu.class, sql, new Object[]{rowid}).get(0);
	}

	@Override
	public void delete(int menuId) {
		String sql = "delete from m_menu where menu_id=?";
		jdbcUtil.execute(sql, new Object[]{menuId});
	}

	

	

}
