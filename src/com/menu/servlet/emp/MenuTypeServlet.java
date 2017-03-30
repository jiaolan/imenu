package com.menu.servlet.emp;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.MenuType;
import com.menu.service.IMenuTypeService;
import com.menu.service.impl.MenuTypeService;
import com.menu.util.Pager;
import com.menu.util.ParameterUtil;

public class MenuTypeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IMenuTypeService menuTypeService = new MenuTypeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("list".equals(method)) {
			MenuType menuType = new MenuType();
			Pager pager = new Pager("servlet/MenuTypeServlet?1=1",req); 
			pager.setPageCount(5);
			req.setAttribute("typelist", menuTypeService.list(menuType, pager));
			req.getRequestDispatcher("/WEB-INF/menu/employee/typemag.jsp").forward(req, resp);
			return;
		}else if ("edit".equals(method)){
			String typeId = req.getParameter("typeId");
			
			if (typeId != null && !"".equals(typeId)){
				//不为空是修改，为空是添加
				req.setAttribute("type", menuTypeService.get(Integer.parseInt(typeId)));
				
			}
			
			MenuType menuType =  new MenuType();
			menuType.setParentId(-1);
			
			req.setAttribute("parentMenuTypes", menuTypeService.list(menuType));
			
			req.getRequestDispatcher("/WEB-INF/menu/employee/addtype.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MenuType menuType = ParameterUtil.put(MenuType.class, req);
		String method = req.getParameter("m");
		if ("save".equals(method)) {
			req.setCharacterEncoding("UTF-8");
			int typeId = menuType.getTypeId();
			
			if(typeId != 0 ){
				menuTypeService.update(menuType);
			}else{
				menuTypeService.save(menuType);
			}
			resp.sendRedirect(req.getContextPath() + "/servlet/MenuTypeServlet?m=list");
			return;
		}if("select".equals(method)){
			Pager pager = new Pager("servlet/MenuTypeServlet?1=1",req); 
			req.setAttribute("typelist", menuTypeService.list(menuType, pager));
			req.getRequestDispatcher("/WEB-INF/menu/employee/typemag.jsp").forward(req, resp);
			return;
		}
	
	}
	
}
