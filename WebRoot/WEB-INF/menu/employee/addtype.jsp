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
		
		   if(/^\s*$/.test($("input[name=typeName]").val())){
		      alert("请输入分类名称");
		      return false;
		   }
		   if(!/^\S{1,15}$/.test($("input[name=typeName]").val())){
		      alert("分类名称必须是15位以内的字符");
		      return false;
		   }
		   if(!/^[a-zA-Z0-9]{1,10}$/.test($("input[name=typeCode]").val())){
		      alert("分类编号必须长10位以内，只能包含数字和字母");
		      return false;
		   }
		
		   if(!/^[0-9]+$/.test($("input[name=typeSort]").val())){
		      alert("分类排序只能是数字");
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
    
    <form id="employeeForm" action="${pageContext.request.contextPath}/servlet/MenuTypeServlet?m=save" method="post">
    <ul class="forminfo">
    <li><label>名称</label>
    <input name="typeName" type="text" class="dfinput" value="${type.typeName}"/>
    <input type="hidden" name="typeId" value="${type.typeId}"/>
    <li><label>编号</label>
    <input name="typeCode" type="text" class="dfinput" value="${type.typeCode}"/>
    </li>
    <li><label>父分类</label>
	    <select name="parentId">
	    <option value="">全部</option>
	    <c:forEach var="parentMenuType" items="${parentMenuTypes}">
	    <option value="${parentMenuType.typeId}" ${type.parentId == parentMenuType.typeId ? "selected='selected'" : ""}>${parentMenuType.typeName}</option>
	    </c:forEach>
	    </select>
    </li>
    <li><label>顺序</label><input name="typeSort"  class="dfinput" type="text" value="${type.typeSort}"/></li>
	<li><label>状态</label><cite>
     <input type="radio" name="typeStatus" id="r1" value="1" ${type.typeStatus==1 ?"checked='checked'" : ""}><label for="r1" class="font-weight-400"><span></span>启用</label>
     <input type="radio" name="typeStatus" id="r2" value="0" ${(type.typeStatus==0 || empty type.typeStatus)?"checked='checked'" : ""}><label for="r2" class="font-weight-400"><span></span>禁用</label>
    </cite></li>
    <li><label>&nbsp;</label><input id="submit" type="submit" class="empbtn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>
    
  </body>
</html>