<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>格式化标签</title>
  </head>
  
  <body>
    <fmt:formatNumber value="12345678.8087" groupingUsed="true" minIntegerDigits="10" minFractionDigits="5"></fmt:formatNumber><br/>
    
    <fmt:formatNumber value="12345678.8087" currencySymbol="￥" type="CURRENCY"></fmt:formatNumber><br/>
    <fmt:formatNumber value="12345678.8087" pattern="0.0000000"></fmt:formatNumber>
    <br/>
    <fmt:formatNumber value="12345678.8087" pattern="0.######"></fmt:formatNumber>
    <br/>
    <fmt:setLocale value="ja_JP"/>
    <fmt:formatNumber value="12345678.8087" pattern="0,000.E0¤"></fmt:formatNumber>
    <br/>
    
    <fmt:parseNumber value="12,345,678.81" integerOnly="true"></fmt:parseNumber>
     <br/>
     <fmt:parseNumber value="5,678.81$" pattern="0,000.00$"></fmt:parseNumber>
     <br/>
     <fmt:parseNumber value="5,678.81$" pattern="0,000.00¤" parseLocale="en_US"></fmt:parseNumber>
     <br/>
     
     <fmt:formatDate value="<%=new Date() %>" dateStyle="SHORT" timeStyle="SHORT" type="both"/><br/>
     <fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss" timeZone="GMT-01:00"/><br/>
     <fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss" timeZone="America/Dawson" var="time"/>
     ${time}<br/>
     
     <fmt:parseDate value="2016-12-12 12:12:12" pattern="yyyy-MM-dd hh:mm:ss" timeZone="GMT-00:00"></fmt:parseDate>
     <br/>
     
     
     <c:set var="lang" value="zh"></c:set>
     <fmt:bundle basename="com.oracle.resource.StudentResource">
         <fmt:message key="student.${lang}.id"></fmt:message>
         <fmt:message key="student.${lang}.age"></fmt:message>
         <fmt:message key="student.${lang}.name"></fmt:message>
     </fmt:bundle>
     <br/>
     <fmt:bundle basename="com.oracle.resource.StudentResource" prefix="student.${lang}.">
         <fmt:message key="id"></fmt:message>
         <fmt:message key="age"></fmt:message>
         <fmt:message key="name"></fmt:message>
     </fmt:bundle>
     <br/>
     
     <fmt:setBundle basename="com.oracle.resource.StudentResource" var="resource"/>
     <fmt:message key="student.${lang}.id" bundle="${resource}"> </fmt:message>
     <fmt:message key="student.${lang}.age" bundle="${resource}"> </fmt:message>
     <fmt:message key="student.${lang}.name" bundle="${resource}"> </fmt:message>
     <br/>
     <fmt:setTimeZone value="GMT-00:00"/>
     <fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss"/>
     <br/>
     <fmt:timeZone value="Asia/Dili">
   		<fmt:formatDate value="<%=new Date()%>" dateStyle="DEFAULT" timeStyle="MEDIUM" type="both"/>
   	 </fmt:timeZone>
   	 
   	 
   	 <fmt:requestEncoding value="ISO-8859-1"/>
   	 <%  request.setCharacterEncoding("ISO-8859-1"); %>
   	
  </body>
</html>
