package com.menu.servlet.user;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Comment;
import com.menu.bean.User;
import com.menu.service.ICommentService;
import com.menu.service.impl.CommentService;
import com.menu.util.ParameterUtil;

public class CommentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	ICommentService commentService = new CommentService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("edit".equals(method)) {
			Comment comment = ParameterUtil.put(Comment.class, req);
			   
			String menuId = req.getParameter("menuId");
			comment.setMenuId(Integer.parseInt(menuId));
			
			User user = (User)req.getSession().getAttribute("user_session");
			comment.setUserId(user.getUserId());
			comment.setUserName(user.getUserName());
			
			commentService.save(comment);
			resp.sendRedirect(req.getContextPath() + "/servlet/MenuDetailservlet?m=view&menuId=" + menuId);
			return;
		}
	}



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("comm".equals(method)) {
			String menuIdString= req.getParameter("menuId");
			int menuId = Integer.parseInt(menuIdString);
			req.setAttribute("menuId", menuId);
			req.getRequestDispatcher("/user/commentedit.jsp").forward(req, resp);
			return;
		}
	}
	
	

}
