<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/student/sql_tag/datasource.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:update>
   delete student where id = ?
   <sql:param>${param.id}</sql:param>
</sql:update>

<c:redirect url="/pages/student/sql_tag/list.jsp"></c:redirect>
