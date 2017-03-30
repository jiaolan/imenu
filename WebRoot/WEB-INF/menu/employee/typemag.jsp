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
      		window.location.href = "${pageContext.request.contextPath}/servlet/MenuTypeServlet?m=edit";
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
        <div class="col-1">
         <div class="panel panel-default margin-10">
         <div class="panel-body">
                  <form id="selForm" action="${pageContext.request.contextPath}/servlet/MenuTypeServlet?m=select" method="post">
                    <div class="form-group-menu">
						 <label>编号</label>
						 <input name="typeCode" type="text" class="scinput" value="${param.typeCode}"/>
                   	</div>
                    <div class="form-group-menu">
						 <label>名字</label>
						 <input name="typeName" type="text" class="scinput" value="${param.typeName}"/>
						 <input type="hidden" name="userId"/>
                   	</div>
                   	<div class="form-group-menu">
                  	 <label>父分类</label>
                      	<select class="select" name="parentId" id="firstType">
						<option value="">全部</option>
						<c:forEach var="menuType" items="${menuTypes_application}">
						<option value="${menuType.typeId}" ${param.parentId == menuType.typeId ? "selected='selected'":"" }>${menuType.typeName}</option>
						</c:forEach>
						</select>
                    </div>
                    <div class="form-group-menu">
                  		<select class="select" name="typeStatus">
						<option value="">全部</option>
						<option value="1" ${param.menuStatus == 1 ? "selected='selected'":"" }>启用</option>
						<option value="0"  ${not empty param.menuStatus && param.typeStatus == 0 ? "selected='selected'":"" }>禁用</option>
						</select>
						<label>&nbsp;</label><input id="selectBut" type="submit" class="scbtn" value="查询"/>
					</div>
				  </form>
                </div>                
         </div> 
         </div> 
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>分类id</td>
                    <td>分类编号</td>
                    <td>分类名字 </td>
                    <td>父分类</td>
                    <td>分类状态</td>
                    <td>分类排序</td>
                    <td>修改</td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="type" items="${typelist}">
      			  <tr>
        			<td>${type.typeId}</td>
        			<td>${type.typeCode}</td>
        			<td>${type.typeName}</td>
        			<td>${type.parent.typeName}</td>
        			<td>
        			<c:if test="${type.typeStatus == 0}">${type.typeStatusText}</c:if>
         			<c:if test="${type.typeStatus != 0}">${type.typeStatusText}</c:if>
        			</td>
        			<td>${type.typeSort}</td>
        			<td><a href="${pageContext.request.contextPath}/servlet/MenuTypeServlet?m=edit&typeId=${type.typeId}" class="templatemo-edit-btn">Edit</a></td>
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
                <div class="panel-heading"><h2 class="text-uppercase">您还可以</h2></div>
                <div class="panel-body">
                    <div class="form-group">
                      	<font>此次添加新的分类</font>
                      	<button id="addBut" type="submit" class="templatemo-blue-button">ADD</button>
                    </div>
                </div>                
              </div>              
            </div>
         </div>
        </div>  
        </div>   
        </div>    
       </div>
  </body>
</html>