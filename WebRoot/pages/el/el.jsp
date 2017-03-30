<%@page import="com.oracle.bean.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>el表达式</title>
  </head>
  
  <body>
    
    <%  session.setAttribute("i", 9); %>
    ${i}<br/>
    
    <%   
    Student student = new Student();
    student.setAge(20);
    student.setName("张三");
    student.setSex(0);
    
    request.setAttribute("student", student); %>
    
    
   年龄：${student.age}<br/>
   姓名：${student.name}<br/>
   性别： ${student.sexText}<br/>
   
   <%  request.setAttribute("flag", false); %>
   
   i:${applicationScope.i}<br/>
   
   ${i == 1.1},${flag == "false"},${flag eq false}|${flag == null},${flag eq null},${!empty flag}<br/>
   
   ${i + 1},${i % 2},${i != 5},${i ne 4},${i > 1},${i gt 1},${i < 1},${i lt 1}<br/>
   
   ${i == 5 ? "等于5" : "不等于5"}<br/>
   
   ${param.parameter1}<br/> <%-- <%=request.getParameter("parameter1") %> ${param["parameter1"]} --%>
   ${param.parameter2}<br/>
   
   ${paramValues.parameter3}<br/> <%-- <%=request.getParamterValues("parameter1") %> ${paramValues["parameter3"]} --%>
   <br/>
   <c:forEach var="parameter" items="${paramValues.parameter3}">
      ${parameter},
   </c:forEach>
   <br/>
   ${param.parameter4}<br/>
   
  </body>
</html>
