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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax.js"></script>
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
		$("#submit").click(function(){
			if(!/^[\u4e00-\u9fa5]{1,20}$/.test($("input[name=menuName]").val())){
		      alert("请正确输入菜谱名字，限1-20字的中文");
		      return false;
		    }
		    if(/^\s*$/.test($("select[name=typeId]").val())){
		      alert("请选择分类");
		      return false;
		    }
		});
     });
                                                                                                                                                                                                              0
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
    
    <form id="menuForm" action="${pageContext.request.contextPath}/servlet/MenuServlet?m=save" method="post">
    <ul class="forminfo">
    <li><label>菜谱名字</label>
    <input name="menuName" type="text" class="dfinput" value="${menu.menuName}"/>
    <input type="hidden" name="menuId" value="${menu.menuId}"/>
 	</li>
    <li><label>父分类</label>
	    <select name="parentId" id="firstType">
		 	 <option value="">全部父分类</option>
			 <c:forEach var="menuType" items="${menuTypes_application}">
			 	<option value="${menuType.typeId}" ${menu.type.parentId == menuType.typeId ? "selected='selected'":"" }>${menuType.typeName}</option>
			</c:forEach>
			</select>
			
			<select name="typeId" id="typeId">
				<option value="">全部子分类</option>
				<c:forEach var="menuType" items="${menuTypes_application_map[ora:int(menu.type.parentId * 1)].children}">
				<option value="${menuType.typeId}" ${menu.typeId == menuType.typeId ? "selected='selected'":"" }>${menuType.typeName}</option>
				</c:forEach>
		</select>
    </li>
    <li><label>所属用户</label>
    	<span>${menu.user.userName}</span>
    </li>
    <li><label>状态</label><cite>
     <input type="radio" name="menuStatus" id="r1" value="1" ${menu.menuStatus==1 ?"checked='checked'" : ""}><label for="r1" class="font-weight-400"><span></span>启用</label>
     <input type="radio" name="menuStatus" id="r2" value="0" ${(menu.menuStatus==0 || empty menu.menuStatus)?"checked='checked'" : ""}><label for="r2" class="font-weight-400"><span></span>禁用</label>
    </cite></li>
    <li><label>主图片</label>
    	<img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive zoom-img" alt="">
    </li>
    <li><label>&nbsp;</label><input id="submit" type="submit" class="empbtn" value="确认保存"/></li>
    </ul>
    </form>
    </div>
  </body>
</html>