package com.menu.service;

import java.util.List;

import com.menu.bean.Collect;

public interface ICollectService {
	public void save(Collect collect);
	
	public void detele(Collect collect);
	
	public Collect get(int menuId,int userId);
	
	public List<Collect> get(int userId);
}
