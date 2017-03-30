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
	<script type="text/javascript">
	$(function(){
		$("#addBut").click(function(){
      		window.location.href = "${pageContext.request.contextPath}/servlet/EmployeeServlet?m=add";
  		});
  		$("#update").click(function(){
      		window.location.href = "${pageContext.request.contextPath}/servlet/EmployeeServlet?m=updatepwd";
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
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
           <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
              <div class="panel panel-default margin-10">
               
                <div class="panel-body">
                  <form id="selForm" action="${pageContext.request.contextPath}/servlet/EmployeeServlet?m=select" method="post">
                    <div class="form-group-menu">
						 <label>编号</label>
						 <input name="empNo" type="text" class="scinput" value="${param.empNo}"/>
                   	</div>
                    <div class="form-group-menu">
						 <label>姓名</label>
						 <input name="empName" type="text" class="scinput" value="${param.empName}"/>
						 <input type="hidden" name="userId"/>
                   	</div>
                    <div class="form-group-menu">
                  		<select class="select" name="empStatus">
						<option value="">全部</option>
						<option value="1" ${param.empStatus == 1 ? "selected='selected'":"" }>在职</option>
						<option value="0"  ${not empty param.empStatus && param.empStatus == 0 ? "selected='selected'":"" }>离职</option>
						</select>
						<label>&nbsp;</label><input id="selectBut" type="submit" class="scbtn" value="查询"/>
					</div>
				  </form>
                </div>  
              </div>              
            </div>
                                 
          </div> <!-- Second row ends -->
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>员工id</td>
                    <td>员工编号</td>
                   
                    <td>员工姓名</td>
                    <td>员工电话 </td>
                    <td>员工年龄</td>
                    <td>员工状态</td>
                    <td>修改</td>
                    <td>员工备注</td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employee}">
      			  <tr>
        			<td>${employee.empId}</td>
        			<td>${employee.empNo}</td>
        			<td>${employee.empName}</td>
        			<td>${employee.empPhone}</td>
        			<td>${employee.empAge}</td>
        			<td>
        			<c:if test="${employee.empStatus == 0}">${employee.empStatusText}</c:if>
        			<c:if test="${employee.empStatus != 0}">${employee.empStatusText}</c:if>
        			</td>
        			<td><a href="${pageContext.request.contextPath}/servlet/EmployeeServlet?m=update&empId=${employee.empId}" class="templatemo-edit-btn">Edit</a></td>
        			<td>${employee.empRemark}</td>
        		 </tr> 
      			 </c:forEach>
                           
                </tbody>
              </table>  
            </div> 
             <%@include file="/WEB-INF/menu/employee/inc/pager.jsp" %>                             
          </div>          
          <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
              <div class="panel panel-default margin-10">
                <div class="panel-heading"><h2 class="text-uppercase">您还可以：</h2></div>
                <div class="panel-body">
                  
                    <div class="form-group-emp">
                      	<font>需要新的员工吗？</font>
                      	<button id="addBut" type="submit" class="templatemo-blue-button">ADD</button>
                    </div>
                  	<div class="form-group-emp">
                      	<font>修改密码</font>
                      	<button id="update" type="submit" class="templatemo-blue-button">EditPwd</button>
                    </div>
                </div>                
              </div>              
            </div>
                                 
          </div> <!-- Second row ends -->
       </div>
       </div>
  </body>
</html>