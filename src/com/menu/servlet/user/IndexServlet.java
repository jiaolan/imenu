package com.menu.servlet.user;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Menu;
import com.menu.service.IMenuService;
import com.menu.service.impl.MenuService;
import com.menu.util.Pager;

public class IndexServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	
	IMenuService menuService = new MenuService();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Menu menu = new Menu();
		Pager pager = new Pager("index?1=1",req);
		pager.setPageCount(6);
		req.setAttribute("menus", menuService.list(menu, pager));
		
		req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
		return;
	}

}
