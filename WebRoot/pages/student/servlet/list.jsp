<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生信息列表</title>
    <style>
	thead{font-family: "微软雅黑";font-size: 16px;color: blue;text-align: center;}
	tbody{font-family: "黑体";font-size: 16px;color: gray;}
	tbody td{border: 1px gray solid;text-align: center;}
	tfoot{font-family: "微软雅黑";font-size: 12px;color: orange;}
	.page td{border: 0px gray solid;text-align: center;}
	.search td{border: 0px gray solid;text-align: center;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	  $(function(){
	  
	   $("#add").click(function(){
	      window.location.href = "${pageContext.request.contextPath}/servlet/StudentServlet?method=add";
	   });
	  
	  });
	  
	  function del(id){
	  
		  if(confirm("确实要删除此学生吗")){
		   window.location.href = "${pageContext.request.contextPath}/servlet/StudentServlet?method=del&id=" + id;
		  }
	  }
	</script>
  </head>
  
  <body>
 
    <table style="width: 800px;" class="search">
    <tr>
	    <td>姓名</td>
	    <td><input /> </td>
	    <td>年龄</td>
	    <td><input /></td>
	    <td>学号</td>
	    <td><input /></td>
	    <td>性别</td>
	    <td>
	    <select>
	     <option>不限</option>
	     <option>男</option>
	     <option>女</option>
	    </select>
	    </td>
	    <td>
	      <input value="Search" type="submit"/>
	   </td> 
    </tr>
    </table>
    
     <input id="add" value="新增" type="button"/>
     <input value="批量删除" type="button"/>
    
    <table style="border:1px gray solid;width: 800px;">
    <caption>学生信息列表</caption>
    <thead>
    <tr><td><input id="selectAll" type="checkbox" /></td><td>序号</td><td>学号</td><td>姓名</td><td>年龄</td><td>性别</td><td>操作</td> </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${list}" varStatus="vs">
    <tr>
	    <td><input type="checkbox" name="id" value="${student.id}" /></td>
	    <td>${vs.count}</td>
	    <td>${student.stuNo}</td>
	    <td>${student.name}</td>
	    <td>${student.age}</td>
	    <td>${student.sexText}</td>
	    <td>
	            <a href="${pageContext.request.contextPath}/servlet/StudentServlet?method=edit&id=${student.id}">修改 </a>
	            <a href="javascript:del(${student.id});">删除 </a>
	   </td> 
    </tr>
    </c:forEach>
    <tr class="page">
	    <td>首页</td>
	    <td>上一页</td>
	    <td>下一页</td>
	    <td>尾页</td>
	    <td>第 <select></select>  页</td>
	    <td>共 条记录</td>
	    <td>共 页</td>
    </tr>
    </tbody>
    </table>
  </body>
</html>
