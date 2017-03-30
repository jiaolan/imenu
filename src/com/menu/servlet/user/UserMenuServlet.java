package com.menu.servlet.user;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Material;
import com.menu.bean.Menu;
import com.menu.bean.MenuDetail;
import com.menu.bean.User;
import com.menu.service.IMaterialService;
import com.menu.service.IMenuDetailService;
import com.menu.service.IMenuService;
import com.menu.service.impl.MaterialService;
import com.menu.service.impl.MenuDetailService;
import com.menu.service.impl.MenuService;
import com.menu.util.ParameterUtil;
import com.sun.xml.internal.bind.v2.model.core.ID;

public class UserMenuServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	IMenuService menuService = new MenuService();
	
	IMenuDetailService menuDetailService = new MenuDetailService();
	
	IMaterialService materialService = new MaterialService();
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("add".equals(method)) {
			req.getRequestDispatcher("/user/editmenu.jsp").forward(req, resp);
			return;
		}
		if ("typeList".equals(method)) {
			String typeId = req.getParameter("typeId");
			
			List<Menu> list = menuService.getTypeId(Integer.parseInt(typeId));
			
			req.setAttribute("typeMenus", list);
			
			req.getRequestDispatcher("/user/typemenu.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("edit".equals(method)) {
			String menuId = req.getParameter("menuId");
			
			//保存menu表
			Menu newMenu = ParameterUtil.put(Menu.class, req);
			
			//保存material表
			Material material = ParameterUtil.put(Material.class, req);
			
			//保存menudetail表
			MenuDetail newMenuDetail = ParameterUtil.put(MenuDetail.class, req);
			
			if (menuId != null && menuId != "") {
				MenuDetail menuDetail = menuDetailService.getMenuId(Integer.parseInt(menuId));
				newMenu.setMenuId(Integer.parseInt(menuId));
				material.setMaterialId(menuDetail.getMaterialId());
				newMenuDetail.setDetailId(menuDetail.getDetailId());
				newMenuDetail.setMaterialId(menuDetail.getMaterialId());
				menuService.update(newMenu);
				materialService.update(material);
				menuDetailService.update(newMenuDetail);
				resp.sendRedirect(req.getContextPath() +  "/index");
				return;
			}
			//保存menu表
			User user = (User)req.getSession().getAttribute("user_session");
			newMenu.setUserId(user.getUserId());
			newMenu.setCreateTime(new Date());
			newMenu.setMenuStatus(1);
			menuService.save(newMenu);
			//保存material表
			materialService.save(material);
			//保存menudetail表
			menuDetailService.save(newMenuDetail);
			
			resp.sendRedirect(req.getContextPath() +  "/index");
			return;
		}
	}

}
