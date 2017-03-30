package com.menu.service.impl;

import java.util.List;

import com.menu.bean.User;
import com.menu.dao.IUserDao;
import com.menu.dao.impl.UserDao;
import com.menu.service.IUserService;
import com.menu.util.MD5;
import com.menu.util.Pager;

public class UserService implements IUserService{

	IUserDao userDao = new UserDao();
	@Override
	public void save(User user) {
		String pwd = user.getUserPwd();
		
		user.setUserPwd(MD5.createPassword(pwd));
		
		userDao.save(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
		
	}

	@Override
	public void delete(int userId) {
		userDao.delete(userId);
		
	}

	@Override
	public List<User> pagerList(User user, Pager pager) {
		return userDao.pagerList(user, pager);
	}

	@Override
	public User getUserId(int userId) {
		return userDao.getUserId(userId);
	}

	@Override
	public List<User> get(String userName) {
		return userDao.get(userName);
	}

	@Override
	public List<User> list(User user) {
		return userDao.list(user);
	}

	@Override
	public User getUserName(String userName) {
		
		return userDao.getUserName(userName);
	}
}
