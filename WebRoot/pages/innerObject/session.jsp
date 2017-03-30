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
    <%
    
      Student student = new Student();
      student.setName("张三");
      session.setAttribute("student", student);
      session.setAttribute("parameter1", 100);
      //session.removeAttribute("student");
      session.invalidate();
     %>
     
     <%--登陆用户：<%=student.getName() %><br/> 
 session创建时间：<%= new Date(session.getCreationTime()) %><br/>
 sessionId:<%=session.getId() %><br/>
 最后一次请求时间：<%=new Date(session.getLastAccessedTime())%><br/>
 session有效时间：<%=(session.getMaxInactiveInterval() / 1000 / 60) %> 分钟<br/>
 session作用域中的对象：<% Enumeration<String> paraters = session.getAttributeNames();
 
 
    while(paraters.hasMoreElements()){
      String parater = paraters.nextElement();
      out.print(parater + ":" + session.getAttribute(parater));
    }
  %>--%>
    parameter1:<%=application.getAttribute("parameter1") %>
    parameter2:<%=application.getAttribute("parameter2") %>
  </body>
</html>
