<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oracle.dao.impl.StudentDao"%>
<%@page import="com.oracle.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
   String id = request.getParameter("id");
   
   StudentDao studentDao = new StudentDao();
   
   Student student = studentDao.get(Integer.parseInt(id));
   
   request.setAttribute("student", student);
   
   request.getRequestDispatcher("add.jsp").forward(request, response);
%>
</html>
