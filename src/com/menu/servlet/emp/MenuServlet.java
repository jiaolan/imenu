package com.menu.servlet.emp;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Menu;
import com.menu.bean.User;
import com.menu.service.IMenuService;
import com.menu.service.IMenuTypeService;
import com.menu.service.IUserService;
import com.menu.service.impl.MenuService;
import com.menu.service.impl.MenuTypeService;
import com.menu.service.impl.UserService;
import com.menu.util.Pager;
import com.menu.util.ParameterUtil;
import com.menu.util.Util;

public class MenuServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	IMenuService menuService = new MenuService();
	
	IUserService userService = new UserService();
	
	IMenuTypeService menuTypeService = new MenuTypeService();
	
	int[] userIds;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("list".equals(method)) {
			Menu menu = new Menu();
			
			Pager pager = new Pager("servlet/MenuServlet?1=1",req);
			pager.setPageCount(5);
			List<Menu> menuList = menuService.list(menu, pager);
			req.setAttribute("menuList", menuList);
			req.getRequestDispatcher("/WEB-INF/menu/employee/menumag.jsp").forward(req, resp);
			return;
		}else if ("edit".equals(method)){
			String menuId = req.getParameter("menuId");
			
			req.setAttribute("menu", menuService.getMenuId(Integer.parseInt(menuId)));
	
			req.getRequestDispatcher("/WEB-INF/menu/employee/addmenu.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("save".equals(method)) {
			Menu menu = ParameterUtil.put(Menu.class, req);
			menuService.update(menu);
			resp.sendRedirect(req.getContextPath() + "/servlet/MenuServlet?m=list");
			return;
		}else if ("select".equals(method)){
			Menu menu = ParameterUtil.put(Menu.class, req);
			String menuName = req.getParameter("menuName");
			String userName = req.getParameter("userName");
			
			User user = new User();
			user.setUserName(userName);
			menu.setUser(user);
		
			menu.setMenuName(menuName);
			
			int typeId = menu.getTypeId();
			if (typeId != 0) {
				menu.setType(menuTypeService.get(typeId));
			}
			
			Pager pager = new Pager("servlet/MenuServlet?1=1",req);
			
			List<Menu> menuList = menuService.list(menu, pager);
			req.setAttribute("menuList", menuList);
			req.getRequestDispatcher("/WEB-INF/menu/employee/menumag.jsp").forward(req, resp);
			return;
		}
	}

}
