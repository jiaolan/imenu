package com.menu.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.menu.bean.MenuType;
import com.menu.service.IMenuTypeService;
import com.menu.service.impl.MenuTypeService;

public class ApplicationListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		updateCache(event.getServletContext());
	}

	public void updateCache(ServletContext application){
		
		//商品分类服务
		IMenuTypeService menuTypeService = new MenuTypeService();
		
		MenuType menuType = new MenuType();
		menuType.setParentId(-1);
		
		//list列表
		List<MenuType> list = menuTypeService.list(menuType);
		
		//map
		Map<Integer,MenuType> map = new HashMap<Integer,MenuType>();
		
		for (MenuType mt : list){
			int parentId =  mt.getTypeId();
			menuType.setParentId(parentId);
			
			//放一级分类
			
			map.put(mt.getTypeId(), mt);
			
			 List<MenuType> children = menuTypeService.list(menuType);
			 mt.setChildren(children);

			//放二级分类
			 for (MenuType mt2 : children){
					map.put(mt2.getTypeId(), mt2);
			 }
			
		}
		//商品分类列表
		application.setAttribute("menuTypes_application", list);
		
		//商品分类map
		application.setAttribute("menuTypes_application_map", map);
		
	}
}
