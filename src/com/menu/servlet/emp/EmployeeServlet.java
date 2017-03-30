package com.menu.servlet.emp;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.bean.Employee;
import com.menu.service.IEmpService;
import com.menu.service.impl.EmpService;
import com.menu.util.MD5;
import com.menu.util.Pager;
import com.menu.util.ParameterUtil;

public class EmployeeServlet extends HttpServlet {

	IEmpService empService = new EmpService();
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("m");
		if ("list".equals(method)) {
			Employee employee = new Employee();
			Pager pager = new Pager("servlet/EmployeeServlet?1=1",req);
			pager.setPageCount(5);
			req.setAttribute("employee", empService.list(employee, pager));
			req.getRequestDispatcher("/WEB-INF/menu/employee/manage-users.jsp").forward(req, resp);
			return;
		}else if ("add".equals(method)){
			req.getRequestDispatcher("/WEB-INF/menu/employee/addemp.jsp").forward(req, resp);
			return;
		}else if ("update".equals(method)){
			String empId = req.getParameter("empId");
			
			Employee employee = empService.getEmpId(Integer.parseInt(empId));
			req.setAttribute("employee", employee);
			req.getRequestDispatcher("/WEB-INF/menu/employee/addemp.jsp").forward(req, resp);
			return;
		}else if ("updatepwd".equals(method)){
			req.getRequestDispatcher("/WEB-INF/menu/employee/updatepwd.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String method = req.getParameter("m");
		if ("save".equals(method)) {
			Employee employee = ParameterUtil.put(Employee.class, req);
			String empId = req.getParameter("empId");
			
			int code = 0;
			if(empId == null || "".equals(empId) || Integer.parseInt(empId) == 0){
				code = empService.save(employee);
			}else{
				code = empService.update(employee);
			}
			
			if (code != 0) {
				req.setAttribute("code", code);
				req.setAttribute("employee", employee);
				req.getRequestDispatcher("/WEB-INF/menu/employee/addemp.jsp").forward(req, resp);
				return;
			}
			resp.sendRedirect(req.getContextPath() + "/servlet/EmployeeServlet?m=list");
			return;
		}else if ("updatepwd".equals(method)){
			Employee employee = (Employee) req.getSession().getAttribute("employee_user");
			String oldPwd = req.getParameter("oldPwd");
			String newPwd = req.getParameter("newPwd");
			if (MD5.createPassword(oldPwd).equals(employee.getEmpPwd())) {
				employee.setEmpPwd(newPwd);
				empService.updatePwd(employee);
			}
			
			resp.sendRedirect(req.getContextPath() + "/servlet/EmployeeServlet?m=list");
			return;
		}else if ("select".equals(method)) {
			Employee employee = ParameterUtil.put(Employee.class, req);
			Pager pager = new Pager("servlet/EmployeeServlet?1=1",req);
			pager.setPageCount(5);
			req.setAttribute("employee", empService.list(employee, pager));
			req.getRequestDispatcher("/WEB-INF/menu/employee/manage-users.jsp").forward(req, resp);
			return;
		}
	}

}
