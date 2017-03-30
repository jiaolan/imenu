<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oracle.bean.Student"%>
<%@page import="com.oracle.dao.impl.StudentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
   request.setCharacterEncoding("UTF-8");  //设置请求的字符集
   
   String stuName = request.getParameter("stuName");//从请求当中接收学生姓名
   
  // stuName = new String(stuName.getBytes("ISO-8859-1"),"UTF-8");
   
   String id = request.getParameter("id");
   String stuAge = request.getParameter("stuAge");//从请求当中接收学生年龄
   String stuSex = request.getParameter("stuSex");////从请求当中接收学生性别
   String stuNo = request.getParameter("stuNo");//从请求当中接收学生学号
   
   StudentDao studentDao = new StudentDao();//实例化dao
   
   Student student = new Student(); // 封装学生数据
   student.setName(stuName);
   student.setAge(Integer.parseInt(stuAge));
   student.setSex(Integer.parseInt(stuSex));
   student.setStuNo(stuNo);
   
   if (id == null || "".equals(id)){
       studentDao.save(student);//执行保存
   }else{
       student.setId(Integer.parseInt(id));
       studentDao.update(student);
   }
  
   
   //request.getRequestDispatcher("list.jsp").forward(request, response);  请 求转发
   
   
   response.sendRedirect(basePath + "pages/student/list.jsp");//重定向
   
%>