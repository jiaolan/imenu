package com.menu.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.menu.bean.User;
import com.menu.dao.IUserDao;
import com.menu.util.JdbcUtil;
import com.menu.util.Pager;
import com.menu.util.Util;

public class UserDao implements IUserDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(User user) {
		String sql = "insert into m_user (user_id,user_name,user_pwd,user_email,user_status)values(seq_user.nextval,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{user.getUserName(),user.getUserPwd(),user.getUserEmail(),user.getUserStatus()});
	}
	@Override
	public void update(User user) {
		String sql = "update m_user set  user_name = ?,user_email = ?,user_status = ? where user_id = ?";
		jdbcUtil.execute(sql, new Object[]{user.getUserName(),user.getUserEmail(),user.getUserStatus(),user.getUserId()});
	}

	@Override
	public void delete(int userId) {
		String sql = "delete m_user where user_id = ?";
		jdbcUtil.execute(sql,new Object[]{userId});
	}

	@Override
	public List<User> list(User user) {
		String sql = "select * from m_user ";
		return jdbcUtil.executeQuery(User.class, sql, null);
	}

	@Override
	public List<User> pagerList(User user, Pager pager) {
		String sql = "select * from m_user where 1=1";
		List<Object> parameter = new ArrayList<Object>();
		if (user != null) {
			String userName = user.getUserName();
			if(Util.isNotEmpty(userName)){
				sql += " and user_name like '%' || ? || '%' ";
				parameter.add(userName);
			}
			int userStatus = user.getUserStatus();
			if(userStatus != 0){
				sql += " and user_status = ? ";
				parameter.add(userStatus);
			}
		}
		return jdbcUtil.executeQuery(User.class, sql, parameter.toArray(), pager);
	}

	@Override
	public User getUserId(int userId) {
		String sql = "select * from m_user where user_id = ?";
		
		return jdbcUtil.executeQuery(User.class, sql, new Object[]{userId}).get(0);
	}

	@Override
	public List<User> get(String userName) {
		String sql = "select * from m_user where user_name like '%' || ? || '%' ";
		
		List<User> list = jdbcUtil.executeQuery(User.class, sql, new Object[]{userName});
		
		return list;
	}
	@Override
	public User getUserName(String userName) {
		String sql = "select * from m_user where user_name = ?";
		
		List<User> list = jdbcUtil.executeQuery(User.class, sql, new Object[]{userName});
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
