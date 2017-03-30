package com.menu.bean;

public class Employee {
	
	int empId; //员工id
	String empNo; //员工编号
	String empName; //员工姓名
	String empPwd; //员工密码
	Integer empStatus; //员工状态，0表示禁用，1表示启用
	Long empPhone; //员工电话
	String empRemark; //员工备注
	Integer empAge;
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public Integer getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(Integer empStatus) {
		this.empStatus = empStatus;
	}
	public Long getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(Long empPhone) {
		this.empPhone = empPhone;
	}
	public String getEmpRemark() {
		return empRemark;
	}
	public void setEmpRemark(String empRemark) {
		this.empRemark = empRemark;
	}
	public Integer getEmpAge() {
		return empAge;
	}
	public void setEmpAge(Integer empAge) {
		this.empAge = empAge;
	}
	
	public String getEmpStatusText() {
		return empStatus == 0 ? "离职" : "在职";
	}
	public void setEmpStatusText(Integer empStatus) {
		this.empStatus = empStatus;
	}
}
