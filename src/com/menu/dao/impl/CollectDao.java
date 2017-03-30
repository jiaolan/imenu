package com.menu.dao.impl;

import java.util.List;

import com.menu.bean.Collect;
import com.menu.dao.ICollectDao;
import com.menu.util.JdbcUtil;

public class CollectDao implements ICollectDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(Collect collect) {
		String sql = "insert into m_collect (coll_id,user_id,menu_id) values (seq_collect.nextval,?,?)";
		jdbcUtil.execute(sql, new Object[]{collect.getUserId(),collect.getMenuId()});
	}

	@Override
	public void delete(Collect collect) {
		String sql = "delete from m_collect where coll_id=?";
		jdbcUtil.execute(sql, new Object[]{collect.getCollId()});
	}

	@Override
	public Collect get(int menuId, int userId) {
		String sql = "select * from m_collect where menu_id=? and user_id=?";
		List<Collect> list = jdbcUtil.executeQuery(Collect.class, sql, new Object[]{menuId,userId});
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Collect> get(int userId) {
		String sql = "select * from m_menu where menu_id in(select menu_id from m_collect where user_id = ?)";
		return jdbcUtil.executeQuery(Collect.class, sql, new Object[]{userId});
	}

}
