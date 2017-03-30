<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="prop"  uri="http://oracle.com/functions" %>
<sql:setDataSource driver="${prop:value('driverClassName')}" user="${prop:value('username')}" password="${prop:value('password')}" url="${prop:value('url')}"/>