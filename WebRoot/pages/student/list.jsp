<%@page import="com.oracle.dao.impl.StudentDao"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ page 
import="java.util.*" 
import="com.oracle.dao.StudentDao" 
import="com.oracle.bean.Student" 
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%  

StudentDao StudentDao = new StudentDao(); 
List<Student> list = StudentDao.list();
%>

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
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	  $(function(){
	  
		  $("#selectAll").click(function(){
		    $("input[name=id]").prop("checked", $(this).prop("checked"));
		  });
		  
		  $("#add").click(function(){
		      window.location.href="<%=basePath%>pages/student/add.jsp";
		  });
		  
		  $("#batchDel").click(function(){
			   if ($("input[name=id]:checked").length > 0){
				      if(confirm("确实要执行批量删除吗?")){
				          $("#form").submit();
			           } 
			   }else{
			     alert("请至少选择一条学生信息");
			   }
		  });
	  });
	  
	  function del(value){
	     if(confirm("确实要删除此学生吗?")){
	        //执行删除
	        window.location.href="<%=basePath%>pages/student/delete.jsp?id=" + value;
	     }
	     
	     return;
	  }
	</script>
  </head>
  
  <body>
     <input value="新增" type="button" id="add"/>  <input value="批量删除" type="button" id="batchDel"/>
    <form id="form" action="<%=basePath%>pages/student/batchdelete.jsp" method="post">
    <table style="border:1px gray solid;width: 800px;">
    <caption>学生信息列表</caption>
    <thead>
    <tr><td><input id="selectAll" type="checkbox" /></td><td>序号</td><td>学号</td><td>姓名</td><td>年龄</td><td>性别</td><td>操作</td> </tr>
    </thead>
    
    <tbody>
    <%  for (int i = 0; i < list.size(); i++){
         Student student = list.get(i);
     %>
    <tr>
	    <td><input type="checkbox" name="id" value="<%=student.getId() %>" /></td>
	    <td><%=i + 1 %></td>
	    <td><%=student.getStuNo() %></td>
	    <td><%=student.getName()%></td>
	    <td><%=student.getAge()%></td>
	    <td><%=student.getSexText()%></td>
	    <td>
	            <a href="<%=basePath%>pages/student/update.jsp?id=<%=student.getId() %>">修改 </a>
	            <a href="javascript:del(<%=student.getId() %>);">删除 </a>
	   </td> 
    </tr>
      <% 
    } %>
    
    </tbody>
    </table>
    </form>
  </body>
</html>
