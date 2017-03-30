package com.menu.dao;

import java.util.List;

import com.menu.bean.Collect;

public interface ICollectDao {
	public void save(Collect collect);
	
	public void delete(Collect collect);
	
	public Collect get(int menuId,int userId);
	
	public List<Collect> get(int userId);
}
