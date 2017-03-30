package com.menu.service.impl;

import java.util.List;

import com.menu.bean.Employee;
import com.menu.dao.IEmpDao;
import com.menu.dao.impl.EmpDao;
import com.menu.service.IEmpService;
import com.menu.util.MD5;
import com.menu.util.Pager;


public class EmpService implements IEmpService{
IEmpDao empDao = new EmpDao();
	
	@Override
	public int save(Employee employee) {
		
		//如果员工工号存在返回1,如果用户名存在 返回 2,如果保存成功返回0
		
		//校验员工工号
		Employee emp = empDao.getByEmpNo(employee.getEmpNo());
		if(emp != null){
			return 1;
		}
		//检验用户名
		emp = empDao.get(employee.getEmpName());
		if(emp != null){
			return 2;
		}
		String empPwd = employee.getEmpPwd();
		employee.setEmpPwd(MD5.createPassword(empPwd));
		empDao.save(employee);
		
		return 0;
		
	}

	@Override
	public int update(Employee employee) {
		
		empDao.update(employee);
		
		return 0;
	}

	@Override
	public void delete(int empId) {
		empDao.delete(empId);
		
	}

	@Override
	public List<Employee> list(Employee employee) {
		return empDao.list(employee);
	}

	@Override
	public List<Employee> list(Employee employee, Pager pager) {
		return empDao.list(employee, pager);
	}

	@Override
	public Employee getEmpId(int empId) {
		return empDao.getEmpId(empId);
	}

	@Override
	public Employee get(String empName) {
		return empDao.get(empName);
	}

	@Override
	public Employee getByEmpNo(String empNo) {
		return empDao.getByEmpNo(empNo);
	}

	@Override
	public Employee login(String empNo, String empPwd) {
		String pwd = MD5.createPassword(empPwd);
		return empDao.login(empNo, pwd);
	}

	@Override
	public void updatePwd(Employee employee) {
		String empPwd = employee.getEmpPwd();
		employee.setEmpPwd(MD5.createPassword(empPwd));		
		empDao.updatePwd(employee);
	}

}
