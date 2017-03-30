<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>爱菜谱员工端</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">
  </head>
  
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>爱菜谱后台管理</h1>
        </header>
        <div class="profile-photo-container">
          <img src="${pageContext.request.contextPath}/images/haishen.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <!-- <form class="templatemo-search-form" role="search">
           <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div> 
        </form> -->
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="${pageContext.request.contextPath}/servlet/EmpMainServlet?m=index" class="active"><i class="fa fa-home fa-fw"></i>网站详情</a></li>
            <li><a href="${pageContext.request.contextPath}/servlet/EmpMainServlet?m=emp"><i class="fa fa-bar-chart fa-fw"></i>员工管理</a></li>
            <li><a href="${pageContext.request.contextPath}/servlet/EmpMainServlet?m=type"><i class="fa fa-database fa-fw"></i>菜谱分类管理</a></li>
            <li><a href="${pageContext.request.contextPath}/servlet/EmpMainServlet?m=menu"><i class="fa fa-map-marker fa-fw"></i>菜谱管理</a></li>
            <li><a href="${pageContext.request.contextPath}/servlet/EmpMainServlet?m=user"><i class="fa fa-users fa-fw"></i>用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/servlet/EmployeeLoginServlet?m=out"><i class="fa fa-eject fa-fw"></i>退出</a></li>
          </ul>  
        </nav>
      </div>
  </body>
</html>
