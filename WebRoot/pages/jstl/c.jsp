<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oracle.bean.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>c_out</title>
    

  </head>
  
  <body>
   <c:out value="<font color=red>123</font>" default="value is empty" escapeXml="false"></c:out>
    
    <c:set value="abcde" var="str" scope="request"></c:set>
    
    <c:out value="${requestScope.str}"></c:out>
    ${str}
    
    <c:set var="student" value="<%=new Student() %>"/>
    <c:set target="${student}" property="id" value="1"/>
    <c:set target="${student}" property="name" value="张三"/>
    <c:set target="${student}" property="sex" value="1"/>
    
    <br/>
      学生id:${student.id}<br/>
      学生姓名:${student.name}<br/>
      学生性别:${student.sex}<br/>
      
    <c:remove var="student"/>
    
     学生id:${student.id}<br/>
      学生姓名:${student.name}<br/>
      学生性别:${student.sex}<br/>
      
      <c:catch var="e">
       <%  int i = 5 / 0; %>
      </c:catch>
      ${e}
      <br/>
      <%--stauts: 0 购物车， 1 已下单，2 已付款 ，3 已配送 ，4 订单完成 ，5 订单删除 --%>
      <c:set value="5" var="stauts"></c:set>
      <c:if test="${stauts == 0}">购物车</c:if>
      <c:if test="${stauts == 1}">已下单</c:if>
      <c:if test="${stauts == 2}">已付款 </c:if>
      <c:if test="${stauts == 3}">已配送</c:if>
      <c:if test="${stauts == 4}">订单完成</c:if>
      <c:if test="${stauts == 5}" var="result">订单删除</c:if>
      
      <c:choose>
          <c:when test="${stauts == 0}">购物车</c:when>
	      <c:when test="${stauts == 1}">已下单</c:when>
	      <c:when test="${stauts == 2}">已付款 </c:when>
	      <c:when test="${stauts == 3}">已配送</c:when>
	      <c:when test="${stauts == 4}">订单完成</c:when>
	      <c:otherwise>订单删除</c:otherwise>
      </c:choose>
      <br/>
      <c:import url="file:/C:/Users/闫飞/Desktop/随堂资料/jstl.txt" charEncoding="GBK" ></c:import>
      <br/>
      <c:forEach begin="0" end="10" var="i" step="2">
         ${i}
      </c:forEach>
       <br/>
      <c:set var="array" value="<%=new int[]{1,2,3,4,5} %>"></c:set>
      
      <c:forEach var="i" items="${array}" varStatus="vs">
         ${i},${vs.index},${vs.count},${vs.first},${vs.last}<br/>
      </c:forEach>
      
     <%--  <c:redirect url="/pages/jstl/index.jsp">
         <c:param name="p1" value="1"></c:param>
         <c:param name="p2" value="2"></c:param>
      </c:redirect> --%>
      
      <br/>
      
      <c:forTokens items="1,2,3,4,5" delims="," var="item" varStatus="vs">
          ${item},${vs.index},${vs.count},${vs.first},${vs.last}
          <c:if test="${vs.last}">已经到达末尾</c:if>
          <br/>
      </c:forTokens>
      
      
      <c:url value="http://www.baidu.com" var="url">
       <c:param name="p1" value="1"></c:param>
       <c:param name="p2" value="2"></c:param>
       <c:param name="p3" value=" "></c:param>
       <c:param name="p4" value="我们"></c:param>
     </c:url>
     
     ${url}
      
      
      
  </body>
</html>
