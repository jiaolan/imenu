<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
   <sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" password="oracle" user="oracle" 
   url="jdbc:oracle:thin:@localhost:1521:orcl" var="dataSource"/>
   
  <%--  <sql:update var="count" dataSource="${dataSource}">
       insert into student(id,name,age,sex) values(seq_student.nextval,?,?,?)
       <sql:param value="张三"></sql:param>
       <sql:param value="20"></sql:param>
       <sql:param value="0"></sql:param>
   </sql:update> --%>
   
   <%-- <sql:update var="count" dataSource="${dataSource}">
       update student set name = ?, age = ?,sex = ? where id= ?
       <sql:param value="张三2"></sql:param>
       <sql:param value="202"></sql:param>
       <sql:param value="1"></sql:param>
       <sql:param value="72"></sql:param>
   </sql:update> --%>
   
   <sql:update var="count" dataSource="${dataSource}">
       update student set entry_date = ? where id= ?
       <sql:dateParam value="<%=new Date() %>"/>
       <sql:param value="38"></sql:param>
   </sql:update> 
   
  <%--  <sql:update var="count" dataSource="${dataSource}">
       delete student where id= ?
       <sql:param value="72"></sql:param>
   </sql:update> 
   
   <sql:query var="resultSet" sql="select * from student" dataSource="${dataSource}" maxRows="2" startRow="0" ></sql:query>
   
   <c:forEach var="student" items="${resultSet.rows}">
     ${student.id},${student.name},${student.age},${student.sex == 0 ? "男" :"女"}<br/>
   </c:forEach> --%>
   
   <%-- <sql:transaction dataSource="${dataSource}">
   
      <sql:update var="count">
       delete student where id= ?
       <sql:param value="38"></sql:param>
     </sql:update> 
   
    <sql:update var="count">
       delete student where sid= ?
       <sql:param value="37"></sql:param>
     </sql:update> 
   
   </sql:transaction> --%>
   
  </body>
</html>
