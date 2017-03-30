<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>爱菜谱员工端</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax.js"></script>
	<script type="text/javascript">
	$(function(){
		  $("#subpwd").click(function(){
		
		   if(/^\s*$/.test($("input[name=oldPwd]").val())){
		      alert("请输入旧密码");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=newPwd]").val())){
		      alert("请输入密码");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=newPwd2]").val())){
		      alert("请重复密码");
		      return false;
		   }
		   if($("input[name=newPwd]").val() != $("input[name=newPwd2]").val()){
		      alert("两次输入的密码不一致");
		      return false;
		   }

		    $("#employeeForm").submit();
		  });
		});
	</script>
  </head>
  <body>  
    <!-- Left column -->
     <%@include file="/WEB-INF/menu/employee/left.jsp" %>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><span style="font-size: 14px; float: right;">当前登录员工工号：${employee_user.empNo}，用户名：${employee_user.empName}</span></li>
              </ul>  
            </nav> 
          </div>
        </div>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <form id="employeeForm" action="${pageContext.request.contextPath}/servlet/EmployeeServlet?m=updatepwd" method="post">
    <ul class="forminfo">
   
    <li><label>输入旧密码</label>
    <input name="oldPwd" type="password" class="dfinput" id="oldPwd"/>
    </li>
    <li><label>输入新密码</label>
    <input name="newPwd" type="password" class="dfinput" id="newPwd"/>
    </li>
    <li><label>再次输入新密码</label>
    <input name="newPwd2" type="password" class="dfinput" id="newPwd2"/>
    </li>
    
    <li><label>&nbsp;</label><input id="subpwd" type="submit" class="" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>
    
  </body>
</html>