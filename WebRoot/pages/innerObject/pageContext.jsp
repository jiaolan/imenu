<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

  </head>
  
  <body>
   <% 
   
   pageContext.setAttribute("parameter1", 100);
   
   pageContext.removeAttribute("parameter1");
   
    %>
    
    <%=pageContext.getAttribute("parameter1") %>
    
    应用初始化时读入的参数：<%=config.getServletContext().getInitParameter("name") %>
    
  </body>
</html>
