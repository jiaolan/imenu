package com.menu.servlet.user;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Collect;
import com.menu.bean.Material;
import com.menu.bean.Menu;
import com.menu.bean.MenuDetail;
import com.menu.bean.User;
import com.menu.service.ICollectService;
import com.menu.service.IMaterialService;
import com.menu.service.IMenuDetailService;
import com.menu.service.IMenuService;
import com.menu.service.IUserService;
import com.menu.service.impl.CollectService;
import com.menu.service.impl.MaterialService;
import com.menu.service.impl.MenuDetailService;
import com.menu.service.impl.MenuService;
import com.menu.service.impl.UserService;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class UserHomeServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	
	ICollectService collectService = new CollectService();
	
	IUserService userService = new UserService();
	
	IMenuService menuService = new MenuService();
	
	IMenuDetailService menuDetailService = new MenuDetailService();
	
	IMaterialService materialService = new MaterialService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)          
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("home".equals(method)) {
			//查用户收藏的菜谱
			String userId = req.getParameter("userId");
			List<Collect> collList = collectService.get(Integer.parseInt(userId));
			req.setAttribute("collMenus", collList);
			
			User user = userService.getUserId(Integer.parseInt(userId));
			
			req.setAttribute("userName", user.getUserName());
			
			//查用户发布的菜谱
			System.out.println(userId);
			List<Menu> postList = menuService.getUserId(Integer.parseInt(userId));
			req.setAttribute("postMenus", postList);
			
			req.getRequestDispatcher("/user/userhome.jsp").forward(req, resp);
		}else if ("delColl".equals(method)){
			String menuId = req.getParameter("menuId");
			
			User user = (User)req.getSession().getAttribute("user_session");
			int userId = user.getUserId();
			
			Collect collect = collectService.get(Integer.parseInt(menuId), userId);
			collectService.detele(collect);
			
			resp.sendRedirect(req.getContextPath() + "/servlet/UserHomeServlet?m=home&userId=" + userId);
			return;
		}else if ("delPost".equals(method)){
			String menuId = req.getParameter("menuId");
			
			User user = (User)req.getSession().getAttribute("user_session");
			int userId = user.getUserId();
			
			menuService.delete(Integer.parseInt(menuId));
			resp.sendRedirect(req.getContextPath() + "/servlet/UserHomeServlet?m=home&userId=" + userId);
			return;
		}else if ("editMenu".equals(method)){
			String menuId = req.getParameter("menuId");
			Menu menu = menuService.getMenuId(Integer.parseInt(menuId));
			MenuDetail menuDetail = menuDetailService.getMenuId(Integer.parseInt(menuId));
			int materialId = menuDetail.getMaterialId();
			Material material = materialService.get(materialId);
			req.setAttribute("menu", menu);
			req.setAttribute("menuDetail", menuDetail);
			req.setAttribute("material", material);
			
			req.getRequestDispatcher("/user/editmenu.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	
}
