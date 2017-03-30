package com.menu.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.menu.bean.MenuType;
import com.menu.dao.IMenuTypeDao;
import com.menu.util.JdbcUtil;
import com.menu.util.Pager;

public class MenuTypeDao implements IMenuTypeDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(MenuType menuType) {
		String sql = "insert into menu_type(type_id,type_name,type_code,parent_id,type_status,type_sort) values(seq_menu_type.nextval,?,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{menuType.getTypeName(),menuType.getTypeCode(),menuType.getParentId(),menuType.getTypeStatus(),menuType.getTypeSort()});
	}

	@Override
	public void update(MenuType menuType) {
		String sql = "update menu_type set type_name = ?,type_code = ?,type_status = ?,parent_id = ?,type_sort = ? where type_id = ?";
		jdbcUtil.execute(sql, new Object[]{menuType.getTypeName(),menuType.getTypeCode(),menuType.getTypeStatus(),menuType.getParentId(),menuType.getTypeSort(),menuType.getTypeId()});
	}

	@Override
	public List<MenuType> list(MenuType menuType) {
		String sql = "select t.*,pt.type_name as \"parent.type_name\" from menu_type t  left join menu_type pt on pt.type_id = t.parent_id where 1=1 ";
		
		if(menuType != null){
			if (menuType.getParentId() < 1){
				sql += " and t.parent_id is null or t.parent_id = 0 ";
			}else{
				sql += " and t.parent_id = " + menuType.getParentId();
			}
		}
		
		sql += " order by t.type_sort ";
		return jdbcUtil.executeQuery(MenuType.class, sql, null);
	}

	@Override
	public MenuType get(int typeId) {

		String sql = "select * from menu_type where type_id = ?";
	
		return jdbcUtil.executeQuery(MenuType.class, sql, new Object[]{typeId}).get(0);
	}

	@Override
	public List<MenuType> list(MenuType menuType, Pager pager) {
		String sql = "select t.*,pt.type_name as \"parent.type_name\" from menu_type t  left join menu_type pt on pt.type_id = t.parent_id where 1=1 ";
		List<Object> parameter = new ArrayList<Object>();
		if(menuType != null){
			if (menuType.getParentId() > 0){
				sql += " and t.parent_id = " + menuType.getParentId();
			}
			if(menuType.getTypeCode() != null && menuType.getTypeCode() != ""){
				String typeCode = menuType.getTypeCode();
				sql += " and t.TYPE_CODE like '%' || ?  || '%' ";
				parameter.add(typeCode);
			}
			if(menuType.getTypeName() != null && menuType.getTypeName() != ""){
				String typeName = menuType.getTypeName();
				sql += " and t.TYPE_NAME like '%' || ?  || '%' ";
				parameter.add(typeName);
			}
			if(menuType.getTypeStatus() != null){
				Integer typeStatus = menuType.getTypeStatus();
				sql += " and t.TYPE_STATUS = ? ";
				parameter.add(typeStatus);
			}
		}
		
		sql += " order by t.type_sort ";
		return jdbcUtil.executeQuery(MenuType.class, sql, parameter.toArray(),pager);
	}

}
