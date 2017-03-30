package com.menu.service;

import java.util.List;

import com.menu.bean.Employee;
import com.menu.util.Pager;

public interface IEmpService {
public int save(Employee employee);
	
	public int update(Employee employee);
	
	public void updatePwd(Employee employee);
	
	public void delete(int  empId);
	
	public List<Employee> list(Employee employee);
	
	public List<Employee> list(Employee employee,Pager pager);
	
	public Employee getEmpId(int  empId);
	
	public Employee get(String empUsername);
	
	public Employee getByEmpNo(String empNo);
	
	public Employee login(String empNo,String empPwd);
}
