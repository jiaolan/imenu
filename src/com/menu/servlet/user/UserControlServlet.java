package com.menu.servlet.user;


import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.User;
import com.menu.service.IUserService;
import com.menu.service.impl.UserService;
import com.menu.util.MD5;
import com.menu.util.ParameterUtil;


public class UserControlServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IUserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("reg".equals(method)) {
			req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
			return;
		}else if ("login".equals(method)){
			req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
			return;
		}else if ("out".equals(method)){
			User user = (User)req.getSession().getAttribute("user_session");
			//确实是登录状态再做退出
			if(user != null){
				
				Cookie cookie = new Cookie("userName",URLEncoder.encode(user.getUserName(), "UTF-8"));

				// 设置Cookie的生命周期,如果设置为负值的话,关闭浏览器就失效.0要删除该cookie
			    cookie.setMaxAge(0);//单位秒
				cookie.setPath("/");
				resp.addCookie(cookie);
				
				req.getSession().removeAttribute("user_session");
				req.getSession().invalidate();
			}
			
			resp.sendRedirect(req.getContextPath() +  "/user/index.jsp");
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("reg".equals(method)) {
			User user = ParameterUtil.put(User.class, req);
			User user_tmp =  userService.getUserName(user.getUserName());
			if (user_tmp != null) {
				req.setAttribute("msg", "用户名已被占用！");
				req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
				return;
			}
			user.setUserStatus(1);
			userService.save(user);
			resp.sendRedirect(req.getContextPath() +  "/user/index.jsp");
			return;
		}else if ("login".equals(method)){
			User user = ParameterUtil.put(User.class, req);
			User user_data = userService.getUserName(user.getUserName());
			
			if (user_data != null && user_data.getUserPwd().equals(MD5.createPassword(user.getUserPwd()))) {
				String remberLogin = req.getParameter("remberLogin");
				if ("1".equals(remberLogin)) {
					String userName = user_data.getUserName();
					Cookie cookie = new Cookie("userName",URLEncoder.encode(userName, "UTF-8"));
					
					// 设置Cookie的生命周期,如果设置为负值的话,关闭浏览器就失效.0要删除该cookie
				    cookie.setMaxAge(7 * 24 * 60 * 60);//单位秒
					
					cookie.setPath("/");
					resp.addCookie(cookie);
				}
				req.getSession().setAttribute("user_session", user_data);
				req.getRequestDispatcher("/index").forward(req, resp);
				return;
			}
			req.setAttribute("msg", "登录失败，请检查用户名和密码");
			req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
			return;
		}
	}

}
