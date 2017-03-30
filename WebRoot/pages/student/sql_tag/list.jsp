<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/student/sql_tag/datasource.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生信息列表</title>
    <style>
	thead{font-family: "微软雅黑";font-size: 16px;color: blue;}
	tbody{font-family: "黑体";font-size: 16px;color: gray;}
	tbody td{border: 1px gray solid;}
	tfoot{font-family: "微软雅黑";font-size: 12px;color: orange;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	  $(function(){
	     $("#add").click(function(){
	        window.location.href = "${pageContext.request.contextPath}/pages/student/sql_tag/edit.jsp";
	     });
	  });
	  
	  function del(id){
	     if(confirm("确认要删除此学生?")){
	         window.location.href = "${pageContext.request.contextPath}/pages/student/sql_tag/delete.jsp?id=" +id;
	     }
	  }
	</script>
  </head>
  
  <sql:query var="list">
         select * from student order by id desc
  </sql:query>
  
  
  <body>
     <input value="新增" type="button" id="add"/>
    <table style="border:1px gray solid;width: 800px;">
    <caption>学生信息列表</caption>
    <thead>
    <tr><td><input id="selectAll" type="checkbox" /></td><td>序号</td><td>学号</td><td>姓名</td><td>年龄</td><td>性别</td><td>操作</td> </tr>
    </thead>
    
    <tbody>
    <c:forEach var="student" items="${list.rows}" varStatus="vs">
    <tr>
	    <td><input type="checkbox" name="id" value="${student.id}" /></td>
	    <td>${vs.count}</td>
	    <td>${student.stu_no}</td>
	    <td>${student.name}</td>
	    <td>${student.age}</td>
	    <td>${student.sex == 0 ? "男" : "女"}</td>
	    <td>
	            <a href="${pageContext.request.contextPath}/pages/student/sql_tag/get.jsp?id=${student.id}">修改 </a>
	            <a href="javascript:del(${student.id});">删除 </a>
	   </td> 
    </tr>
    </c:forEach>
    </tbody>
    </table>
  </body>
</html>
