package com.menu.dao;

import java.util.List;

import com.menu.bean.User;
import com.menu.util.Pager;


public interface IUserDao {
	public void save(User user);
	
	public void update(User user);
	
	public void delete(int  userId);
	
	public List<User> list(User user);
	
	public List<User> pagerList(User user, Pager pager);
	
	public User getUserId(int  userId);
	
	public User getUserName(String userName);
	
	public List<User> get(String userName);
}
