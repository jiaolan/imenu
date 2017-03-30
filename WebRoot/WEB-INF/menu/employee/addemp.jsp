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
	       $("#submit").click(function(){
		
		   if(/^\s*$/.test($("input[name=empName]").val())){
		      alert("请输入员工名字");
		      return false;
		   }
		   if(!/^\S{1,15}$/.test($("input[name=empName]").val())){
		      alert("员工名字必须是15位以内的字符");
		      return false;
		   }
		   if(!/^[a-zA-Z0-9]{1,10}$/.test($("input[name=empNo]").val())){
		      alert("员工工号必须长10位以内，只能包含数字和字母");
		      return false;
		   }
		   if(!/^[0-9]{11}$/.test($("input[name=empPhone]").val())){
		      alert("员工电话必须是由长11位的数字组成");
		      return false;
		   }
		   if(!/^[0-9]+$/.test($("input[name=empAge]").val())){
		      alert("请输入员工年龄");
		      return false;
		   }
		   if(!/^[\da-zA-Z]{1,16}$/.test($("input[name=empPwd]").val())){
		      alert("员工密码必须由最多16位的字母或数字组成");
		      return false;
		   }
		    $("#employeeForm").submit();
		  });
		   
		  if(${not empty msg}){
			  alert("${msg}");
		  }
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
    
    <form id="employeeForm" action="${pageContext.request.contextPath}/servlet/EmployeeServlet?m=save" method="post">
    <ul class="forminfo">
    <li><label>员工姓名</label>
    <input name="empName" type="text" class="dfinput" value="${employee.empName}"/>
    <input type="hidden" name="empId" value="${employee.empId}"/>
 	</li>
    <li><label>员工编号</label>
    <input name="empNo" type="text" class="dfinput" value="${employee.empNo}"/><i id="msg_empNo" style="color:red;">${code == 1 ? "保存失败,工号已存在" : ""}</i>
    <input id="empNoResult" type="hidden" value="1" />
    </li>
    <li><label>员工电话</label>
    <input name="empPhone" type="text" class="dfinput" value="${employee.empPhone}" />
    <input id="userPhoneResult" type="hidden" value="1" />
    </li>
    <li><label>员工年龄</label>
    <input name="empAge" type="text" class="dfinput" value="${employee.empAge}" />
    <input id="userAgeResult" type="hidden" value="1" />
    </li>
    <c:if test="${empty employee}">
    <li><label>员工密码</label>
    <input name="empPwd" type="password" class="dfinput" value="${employee.empPhone}" />
    <input id="userPhoneResult" type="hidden" value="1" />
    </li>
    </c:if>
    <!-- <li><label>状态</label><cite><input name="empStatus" type="radio" value="0" ${employee.empStatus==0 ?"checked='checked'" : ""}  />离职&nbsp;&nbsp;&nbsp;&nbsp;<input name="emplStatus" type="radio" value="1" ${(employee.empStatus==1 || empty employee.empStatus)?"checked='checked'" : ""}/>在职</cite></li> -->
    <li><label>状态</label><cite>
     <input type="radio" name="empStatus" id="r1" value="1" ${employee.empStatus==0 ?"checked='checked'" : ""}><label for="r1" class="font-weight-400"><span></span>在职</label>
     <input type="radio" name="empStatus" id="r2" value="0" ${(employee.empStatus==1 || empty employee.empStatus)?"checked='checked'" : ""}><label for="r2" class="font-weight-400"><span></span>离职</label>
    </cite></li>
    <li><label>备注</label><textarea name="empRemark" cols="" rows="" class="textinput">${employee.empRemark}</textarea></li>
    <li><label>&nbsp;</label><input id="submit" type="submit" class="empbtn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>
    
  </body>
</html>