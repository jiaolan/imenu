package com.menu.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Employee;


public class EmpMainServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("index".equals(method)) {
			Employee employee = (Employee) req.getSession().getAttribute("employee_user");
			String empName = employee.getEmpName();
			req.setAttribute("name", empName);
			req.getRequestDispatcher("/WEB-INF/menu/employee/index.jsp").forward(req, resp);
		}else if("emp".equals(method)){
			resp.sendRedirect(req.getContextPath() + "/servlet/EmployeeServlet?m=list");
		}else if("user".equals(method)){
			resp.sendRedirect(req.getContextPath() + "/servlet/EmpUserServlet?m=list");
		}else if("type".equals(method)){
			resp.sendRedirect(req.getContextPath() + "/servlet/MenuTypeServlet?m=list");
		}else if("menu".equals(method)){
			resp.sendRedirect(req.getContextPath() + "/servlet/MenuServlet?m=list");
		}else {
			req.getRequestDispatcher("/WEB-INF/menu/employee/main.jsp").forward(req, resp);
		}
	}

}
