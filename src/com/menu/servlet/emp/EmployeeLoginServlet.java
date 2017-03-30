package com.menu.servlet.emp;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Employee;
import com.menu.service.IEmpService;
import com.menu.service.impl.EmpService;

public class EmployeeLoginServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	
	IEmpService empService = new EmpService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("out".equals(method)){
			Employee employee = (Employee)req.getSession().getAttribute("employee_user");
			//确实是登录状态再做退出
			if(employee != null){
				
				req.getSession().removeAttribute("employee_user");
				req.getSession().invalidate();
			}
			
			req.getRequestDispatcher("/WEB-INF/menu/employee/login.jsp").forward(req, resp);
			return;
		}
		req.getRequestDispatcher("/WEB-INF/menu/employee/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			String method = req.getParameter("m");
			if ("login".equals(method)) {
				String empNo = req.getParameter("empNo");
				String empPwd = req.getParameter("empPwd");
				Employee employee = empService.login(empNo, empPwd);
				if (employee != null) {
					req.getSession().setAttribute("employee_user", employee);
					resp.sendRedirect(req.getContextPath()+ "/servlet/EmpMainServlet?m=index");
					return;
				}
				req.setAttribute("msg", "登录失败，请检查用户名和密码");
				req.getRequestDispatcher("/WEB-INF/menu/employee/login.jsp").forward(req, resp);
				return;
			}
		
	}
	

}