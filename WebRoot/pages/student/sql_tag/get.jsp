<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/student/sql_tag/datasource.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" scope="request">
select * from student where id = ?
<sql:param value="${param.id}"></sql:param>
</sql:query>


<c:set var="student" value="${rs.rows[0]}" scope="request"></c:set>

<jsp:forward page="/pages/student/sql_tag/edit.jsp"></jsp:forward>