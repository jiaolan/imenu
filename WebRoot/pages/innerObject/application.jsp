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
   
     application.setAttribute("parameter1", 100);
     application.setAttribute("parameter2", 200);
     application.removeAttribute("parameter1");
    %>
    
    parameter1:<%=application.getAttribute("parameter1") %>
    parameter2:<%=application.getAttribute("parameter2") %>
    server:<%=application.getServerInfo() %><br/>
    realPath:<%=application.getRealPath("pages/innerObject/application.jsp") %><br/>
    resource:<%=application.getResource("pages/innerObject/application.jsp") %><br/>
    
    file:<%=application.getResourceAsStream("pages\\innerObject\\application.jsp") %>
    
    parameter1 in page : <%=pageContext.getAttribute("parameter1") %>
  </body>
</html>
