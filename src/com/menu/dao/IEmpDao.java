package com.menu.dao;

import java.util.List;

import com.menu.bean.Employee;
import com.menu.util.Pager;


public interface IEmpDao {
	public void save(Employee employee);
	
	public void update(Employee employee);
	
	public void updatePwd(Employee employee);
	
	public void delete(int empId);
	
	public List<Employee> list(Employee employee);
	
	public List<Employee> list(Employee employee, Pager pager);
	
	public Employee getEmpId(int empId);
	
	public Employee get(String empName);
	
	public Employee getByEmpNo(String empNo);
	
	public Employee login(String empNo,String empPwd);
}
