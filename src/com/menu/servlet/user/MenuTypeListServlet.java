package com.menu.servlet.user;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Menu;
import com.menu.service.IMenuService;
import com.menu.service.IMenuTypeService;
import com.menu.service.impl.MenuService;
import com.menu.service.impl.MenuTypeService;
import com.menu.util.Pager;

public class MenuTypeListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IMenuService menuService = new MenuService();
	
	IMenuTypeService menuTypeService = new MenuTypeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("list".equals(method)) {
			String typeId = req.getParameter("typeId");
			req.setAttribute("type", menuTypeService.get(Integer.parseInt(typeId)));
			Pager pager = new Pager("servlet/menuTypeService?1=1",req);
			Menu menu = new Menu();
			menu.setTypeId(Integer.parseInt(typeId));
			List<Menu> list = menuService.list(menu, pager);
			
			req.setAttribute("typeMenus", list);
			req.getRequestDispatcher("/user/menutypelist.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	

}
