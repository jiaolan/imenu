package com.menu.servlet.emp;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.User;
import com.menu.service.IUserService;
import com.menu.service.impl.UserService;
import com.menu.util.Pager;
import com.menu.util.ParameterUtil;

public class EmpUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IUserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("list".equals(method)) {
			User user = new User();
			String userId = req.getParameter("userId");
			
			
			Pager pager = new Pager("servlet/EmpUserServlet?1=1",req);
			
			if (userId != null) {
				User user2 = userService.getUserId(Integer.parseInt(userId));
				if (user2.getUserStatus() == 1) {
					user2.setUserStatus(0);
				}else {
					user2.setUserStatus(1);
				}
				userService.update(user2);
			}
			List<User> userList = userService.pagerList(user, pager);
			
			req.setAttribute("userList", userList);
			req.getRequestDispatcher("/WEB-INF/menu/employee/usermag.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("select".equals(method)){
			User user = ParameterUtil.put(User.class, req);
			
			Pager pager = new Pager("servlet/EmpUserServlet?1=1",req);
			List<User> userList = userService.pagerList(user, pager);
			

			req.setAttribute("userList", userList);
			req.getRequestDispatcher("/WEB-INF/menu/employee/usermag.jsp").forward(req, resp);
			return;
		}
	}

	
}
