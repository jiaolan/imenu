package com.menu.servlet.user;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Collect;
import com.menu.bean.Menu;
import com.menu.bean.MenuDetail;
import com.menu.bean.User;
import com.menu.service.ICollectService;
import com.menu.service.ICommentService;
import com.menu.service.IMaterialService;
import com.menu.service.IMenuDetailService;
import com.menu.service.IMenuService;
import com.menu.service.impl.CollectService;
import com.menu.service.impl.CommentService;
import com.menu.service.impl.MaterialService;
import com.menu.service.impl.MenuDetailService;
import com.menu.service.impl.MenuService;

public class MenuDetailservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IMenuService menuService = new MenuService();
	
	IMenuDetailService menuDetailService = new MenuDetailService();
	
	IMaterialService materialService = new MaterialService();
	
	ICollectService collectService = new CollectService();
	
	ICommentService commentService = new CommentService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("view".equals(method)) {
			//根据menuID取出menu
			String menuId = req.getParameter("menuId");
			Menu menu = menuService.getMenuId(Integer.parseInt(menuId));
			req.setAttribute("menu", menu);
			//根据menuID取出menuDetail，并从menuDetail中取MaterialId
			MenuDetail menuDetail = menuDetailService.getMenuId(Integer.parseInt(menuId));
			int materialId = menuDetail.getMaterialId();
			req.setAttribute("menuDetail", menuDetail);
			//根据MaterialId去取Material
			req.setAttribute("material", materialService.get(materialId));
			//根据menuId去取评论
			req.setAttribute("comments", commentService.getmenuId(Integer.parseInt(menuId)));
			
			req.getRequestDispatcher("/user/about.jsp").forward(req, resp);
			return;
		}else if ("collAjax".equals(method)){
			
			resp.setCharacterEncoding("UTF-8");
			Collect collect = new Collect();
			String menuId = req.getParameter("menuId");
			if(menuId != null && !"".equals(menuId)){
				collect.setMenuId(Integer.parseInt(menuId));
			}
			User user = (User)req.getSession().getAttribute("user_session");
			int userId = user.getUserId();
			collect.setUserId(userId);
			Collect collect2 = new Collect();
			if(menuId != null && !"".equals(menuId)){
				collect2 = collectService.get(Integer.parseInt(menuId), userId);
			}
			if (collect2 == null) {
				collectService.save(collect);
				resp.getWriter().write("收藏成功");
				resp.getWriter().close();
				return;
			}
			resp.getWriter().write("已经收藏过了");
			resp.getWriter().close();
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
