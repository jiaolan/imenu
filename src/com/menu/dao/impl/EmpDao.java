package com.menu.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.menu.bean.Employee;
import com.menu.dao.IEmpDao;
import com.menu.util.JdbcUtil;
import com.menu.util.Pager;

public class EmpDao implements IEmpDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	
	@Override
	public void save(Employee employee) {
		String sql = "insert into M_EMP (EMP_ID,EMP_NO,EMP_NAME,EMP_PWD,EMP_STATUS,EMP_PHONE,EMP_REMARK,EMP_AGE) values (SEQ_EMPLOYEE.nextval,?,?,?,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{employee.getEmpNo(),employee.getEmpName(),employee.getEmpPwd(),employee.getEmpStatus(),employee.getEmpPhone(),employee.getEmpRemark(),employee.getEmpAge()});
	}

	@Override
	public void update(Employee employee) {
		String sql = "update M_EMP set EMP_NO = ?,EMP_NAME = ?,EMP_STATUS = ?,EMP_PHONE = ?,EMP_REMARK = ?,EMP_AGE = ? where EMP_ID = ?";

		jdbcUtil.execute(sql, new Object[]{employee.getEmpNo(),employee.getEmpName(),employee.getEmpStatus(),employee.getEmpPhone(),employee.getEmpRemark(),employee.getEmpAge(),employee.getEmpId()});
	}
	

	@Override
	public void delete(int empId) {
		String sql = "delete M_EMP where EMP_ID = ?";
		jdbcUtil.execute(sql, new Object[]{empId});
	}

	@Override
	public List<Employee> list(Employee employee) {
		String sql = "select e.* from M_EMP e where 1=1 ";
		
		//参数列表
		List<Object> parameterList = new ArrayList<Object>();
				
		if (employee != null){
			
			//动态拼装sql和参数列表
			String empNo = employee.getEmpNo();
			if(empNo != null && !"".equals(empNo)){
				sql += " and EMP_NO like '%' || ?  || '%' ";
				parameterList.add(empNo);
			}
			
			String empName = employee.getEmpName();
			if(empName != null && !"".equals(empName)){
				sql += " and EMP_NAME like '%' || ?  || '%' ";
				parameterList.add(empName);
			}
			
			Integer empStatus = employee.getEmpStatus();
			if(empStatus != null){
				sql += " and EMP_STATUS = ? ";
				parameterList.add(empStatus);
			}
		}
		
		sql += "order by EMP_NO desc "; 
		
		return jdbcUtil.executeQuery(Employee.class, sql, parameterList.toArray());
	}

	@Override
	public List<Employee> list(Employee employee, Pager pager) {
		String sql = "select e.* from M_EMP e where 1=1 ";
		
		//参数列表
		List<Object> parameterList = new ArrayList<Object>();
		
		if (employee != null){
		
			//动态拼装sql和参数列表
			String empNo = employee.getEmpNo();
			if(empNo != null && !"".equals(empNo)){
				sql += " and EMP_NO like '%' || ?  || '%' ";
				parameterList.add(empNo);
			}
			
			String empName = employee.getEmpName();
			if(empName != null && !"".equals(empName)){
				sql += " and EMP_NAME like '%' || ?  || '%' ";
				parameterList.add(empName);
			}
			
			Integer empStatus = employee.getEmpStatus();
			if(empStatus != null){
				sql += " and EMP_STATUS = ? ";
				parameterList.add(empStatus);
			}
		}
		sql += "order by EMP_NO desc "; 
		
		return jdbcUtil.executeQuery(Employee.class, sql, parameterList.toArray(),pager);
	}

	@Override
	public Employee getEmpId(int empId) {
		String sql = "select * from M_EMP  where EMP_ID = ?";
		return jdbcUtil.executeQuery(Employee.class, sql, new Object[]{empId}).get(0);
	}

	@Override
	public Employee get(String empName) {
		String sql = "select * from M_EMP  where EMP_NAME = ?";
		List<Employee> list =  jdbcUtil.executeQuery(Employee.class, sql, new Object[]{empName});
		
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Employee getByEmpNo(String empNo) {
		String sql = "select * from M_EMP  where EMP_NO = ?";
		
		List<Employee> list = jdbcUtil.executeQuery(Employee.class, sql, new Object[]{empNo});
		
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Employee login(String empNo, String empPwd) {
		String sql = "select * from M_EMP  where EMP_NO = ? and emp_pwd=?";
		
		List<Employee> list = jdbcUtil.executeQuery(Employee.class, sql, new Object[]{empNo,empPwd});
		
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public void updatePwd(Employee employee) {
		String sql = "update M_EMP set EMP_pwd = ? where EMP_ID = ?";

		jdbcUtil.execute(sql, new Object[]{employee.getEmpPwd(),employee.getEmpId()});
	}

}
