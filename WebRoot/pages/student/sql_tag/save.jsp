<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/student/sql_tag/datasource.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<c:if test="${empty param.id}">
	<sql:update>
	   insert into student(id,name,sex,age,stu_no) values(seq_student.nextval,?,?,?,?)
	   
	   <sql:param>${param.stuName}</sql:param>
	   <sql:param>${param.stuSex}</sql:param>
	   <sql:param>${param.stuAge}</sql:param>
	   <sql:param>${param.stuNo}</sql:param>
	</sql:update>
</c:if>

<c:if test="${not empty param.id}">
	<sql:update>
	   update student set name = ?,sex = ?,age = ?,stu_no = ? where id = ?
	   
	   <sql:param>${param.stuName}</sql:param>
	   <sql:param>${param.stuSex}</sql:param>
	   <sql:param>${param.stuAge}</sql:param>
	   <sql:param>${param.stuNo}</sql:param>
	   <sql:param>${param.id}</sql:param>
	</sql:update>
</c:if>

<c:redirect url="/pages/student/sql_tag/list.jsp"></c:redirect>