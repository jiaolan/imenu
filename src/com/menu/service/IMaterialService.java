package com.menu.service;

import java.util.List;

import com.menu.bean.Material;


public interface IMaterialService {
	public void save(Material material);
	
	public void update(Material material);
	
	public List<Material> list(Material material );
	
	public Material get(int materialId);
}
