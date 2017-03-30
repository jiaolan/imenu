<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oracle.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
     $(function(){
     
       $("#stuFrom").submit(function(){
         
           if (/^\s*$/.test($("input[name=stuName]").val())){
              alert("请填写正确的用户名");
              return false;
           }
           
           if (!/^\d{1,3}$/.test($("input[name=stuAge]").val())){
              alert("请填写正确的年龄");
              return false;
           }
           
           if (!/^[A-Za-z0-9]+$/.test($("input[name=stuNo]").val())){
              alert("请填写正确的学号");
              return false;
           }
           
           return true;
       });
     });
    </script>
    
    <title>新增学生信息</title>
  </head>
  
  <%  Student student =  (Student)request.getAttribute("student"); %>
  
  <body>
     编辑学生信息
    <form id="stuFrom" action="<%=basePath%>pages/student/save.jsp" method="post">
    <table style="border: 1px blue solid;">
    <tr>
	    <td>学生姓名 <font color="red">*</font></td>
	    <td>
	    <input name="id" type="hidden" value="<%=student == null ? "" : student.getId()%>"/>  
	    <input name="stuName"  type="text" maxlength="10" value="<%=student == null ? "" :student.getName()%>"/>  
	     </td>
     </tr>
    <tr><td>学生年龄  <font color="red">*</font></td>
    <td><input name="stuAge" type="text" maxlength="3" value="<%=student == null ? "" :student.getAge()%>"/>  </td></tr>
    <tr>
	    <td>学生性别  <font color="red">*</font></td>
	    <td>
	    <input name="stuSex" value="0" type="radio" <%=student == null || student.getSex() == 0 ?"checked=\"checked\"":""%> id="man"/> <label for="man"> 男 </label>
	    <input name="stuSex" value="1" type="radio" <%=student != null && student.getSex() == 1 ?"checked=\"checked\"":""%> id="woman"/><label for="woman"> 女 </label>
	    </td>
    </tr>
    <tr>
	    <td>学号  <font color="red">*</font></td>
	    <td>
	    <input name="stuNo" type="text" maxlength="30" value="<%=student == null ? "" :student.getStuNo()%>"/>
	    </td>
    </tr>
    
    <tr>
	    <td><input type="submit" value="保存"/> </td>
	    <td><input type="reset" value="重置"/></td>
    </tr>
    <tr>
	    <td><input type="button" value="返回" onclick="window.history.back();"/> </td>
	    <td>
	    </td>
    </tr>
    </table>
    </form>
  </body>
</html>
