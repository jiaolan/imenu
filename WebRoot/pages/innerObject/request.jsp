<%@page import="com.oracle.bean.Student"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>内置对象-request</title>
  </head>
  
  <body>
   <% Student student = (Student)session.getAttribute("student"); %>
  登陆用户：<%=student.getName() %>
  <% request.setCharacterEncoding("UTF-8"); %>
    字符集:<%=request.getCharacterEncoding() %><br/>
    参数1：<%=request.getParameter("parameter0") %><br/>
    参数2：<%=request.getParameter("parameter1") %><br/>
    参数3：<%=request.getParameter("parameter2") %><br/>
     参数4：
     
     <% String[] parameters =  request.getParameterValues("parameter3"); 
     
        for(String str : parameters){
            out.print(str + ",");
        }
     %>
     <br/>
     
 枚举所有参数：<br/>
   <%  Enumeration<String> parameterNames  = request.getParameterNames(); 
       while(parameterNames.hasMoreElements()){
          String parameterName =  parameterNames.nextElement();
          out.print(parameterName + ",");
       }
   
   %>
<br/>

所有参数和值：
     <%
      Map<String,String[]>  parameterMap = request.getParameterMap();
      for (Entry<String,String[]> entry : parameterMap.entrySet()){
         String[] values = entry.getValue();
         String parameterValue = "";
         for (String value : values){
            parameterValue += value + ",";
         }
         
          
         out.print(entry.getKey() + ":" + parameterValue + "<br/>");
      }
      
      %>
      
      <%  request.setAttribute("name", "张三");
          request.setAttribute("age", 20);
       %>
attribute:<%=request.getAttribute("name")%>,<%=request.getAttribute("age")%><br/>
method:<%=request.getMethod()%><br/>
URI:<%=request.getRequestURI()%><br/>
URL:<%=request.getRequestURL()%><br/>
queryString:<%=request.getQueryString()%><br/>

协议：<%=request.getProtocol()%><br/>
服务的主机名：<%=request.getLocalName()%><br/>
服务的IP地址：<%=request.getLocalAddr()%><br/>
服务的端口号：<%=request.getLocalPort()%><br/>
客户端的主机名：<%=request.getRemoteHost()%><br/>
客户端的IP地址：<%=request.getRemoteAddr()%><br/>
客户端的端口号：<%=request.getRemotePort()%><br/>

ContextPath:<%=request.getContextPath()%><br/>
ServletPath:<%=request.getServletPath()%><br/>
  </body>
</html>
