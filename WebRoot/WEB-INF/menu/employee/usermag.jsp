<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ora" uri="http://oracle.com/oracle/functions" %>
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
	var menuTypeData = {};
   
   	<c:forEach var="menuType" items="${menuTypes_application}">
     menuTypeData[${menuType.typeId}] = [
         <c:forEach var="child" items="${menuType.children}" varStatus="vs">
          {id:${child.typeId},name:"${child.typeName}"}<c:if test="${!vs.last}">,</c:if>
         </c:forEach>
    	 ];
   </c:forEach>
	$(function(){
	$("#firstType").change(function(){
    	var firstType = $(this);
          var id = firstType.val();
          var secondType = $("#typeId");
          secondType.find("option").remove(":not(:first)");
         
            var children = menuTypeData[id];
             for(var i = 0; i < children.length; i++){
				secondType.append(new Option(children[i].name,children[i].id));
			 }
		});
	
		$("#addBut").click(function(){
      		window.location.href = "${pageContext.request.contextPath}/servlet/MenuServlet?m=edit";
  		});
  		
  		$("#selectBut").click(function(){
  			$("#selForm").submit();
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
                  <form id="selForm" action="${pageContext.request.contextPath}/servlet/EmpUserServlet?m=select" method="post">
                    <div class="form-group-menu">
						 <label>名字</label>
						 <input name="userName" type="text" class="scinput" value="${param.userName}"/>
                   	</div>
                    
                    <div class="form-group-menu">
                     	 <label>用户状态</label>
                  		<select class="select" name="userStatus">
						<option value="">全部</option>
						<option value="1" ${param.userStatus == 1 ? "selected='selected'":"" }>启用</option>
						<option value="2"  ${not empty param.userStatus && param.userStatus == 0 ? "selected='selected'":"" }>禁用</option>
						</select>
						
					</div>
					<div class="form-group-menu"><label>&nbsp;</label><input id="selectBut" type="submit" class="scbtn" value="查询"/></div>
				  </form>
                </div>                
              </div>              
            </div>
                                 
          </div> <!-- Second row ends -->
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>用户id </td>
                    <td>用户名字 </td>
                    <td>用户邮箱</td>
                    <td>用户状态</td>
                    <td>修改</td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
      			  <tr>
        			<td>${user.userId}</td>
        			<td>${user.userName}</td>
        			<td>${user.userEmail}</td>
        			<td>
        			<c:if test="${user.userStatus == 0}">${user.userStatusText}</c:if>
         			<c:if test="${user.userStatus != 0}">${user.userStatusText}</c:if>
        			</td>
        			<td><a href="${pageContext.request.contextPath}/servlet/EmpUserServlet?m=list&userId=${user.userId}" class="templatemo-edit-btn">修改状态</a></td>
        		 </tr> 
      			 </c:forEach>
                </tbody>
              </table>  
            </div>
            <%@include file="/WEB-INF/menu/employee/inc/pager.jsp" %>    
                                    
          </div>          
        </div> 
       </div>  
  </body>
</html>