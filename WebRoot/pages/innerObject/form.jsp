<%@page import="com.oracle.bean.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <%--  <% Student student = (Student)session.getAttribute("student"); %>
  登陆用户：<%=student.getName() %> --%>
   <form action="<%=basePath%>pages/el/el.jsp" method="post">
      <input name="parameter1" value="1"/>
      <input name="parameter2" value="2"/>
      <input name="parameter3" value="3"/>
      <input name="parameter3" value="3-1"/>
      <input name="parameter4" value="4"/>
      
      <input name="submit" type="submit" value="submit"/>
   </form>
  </body>
</html>
