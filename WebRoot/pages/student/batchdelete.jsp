<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oracle.dao.impl.StudentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%  

  String[] ids = request.getParameterValues("id");
  
  StudentDao studentDao = new StudentDao();
   
  for (String id : ids){
    studentDao.delete(Integer.parseInt(id));
  }
  
  response.sendRedirect(basePath + "pages/student/list.jsp");

 %>
</html>
