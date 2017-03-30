<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>爱菜谱</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Curabitur Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/flexslider.css" type="text/css" media="screen" />
 <script src="${pageContext.request.contextPath}/user/js/jquery-1.11.1.min.js"></script>
 <!---- start-smoth-scrolling---->
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/easing.js"></script>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
		$(function(){
			$("#addMenu").click(function(){
			if(${not empty user_session}){
				window.location.href = "${pageContext.request.contextPath}/servlet/UserMenuServlet?m=add";
			}else{
			alert("请先登录");
			}
  			});
		});
	</script>
	<!-- cart -->
		<script src="${pageContext.request.contextPath}/user/js/simpleCart.min.js"> </script>
	<!-- cart -->
  <script src="${pageContext.request.contextPath}/user/js/bootstrap.js"> </script>
  
</head>
<body>
		<!-- start-header section-->
			<div class="header">
				<div class="container">
				     <div class="top-header">
						<div class="phone">
							<ul>
								<li></li>
								<li><p></p></li>
							</ul>
						</div>
						<div class="logo">
							<h1><a href="${pageContext.request.contextPath}/index" style="font-family: cursive;">爱菜谱</a></h1>
						</div>
						<div class="header-right">
						<c:if test="${empty user_session}">
						<div class="login">
							<a href="${pageContext.request.contextPath}/servlet/UserControlServlet?m=login">登录</a>
						</div></c:if>
						<c:if test="${empty user_session}">
						<div class="login">
							<a href="${pageContext.request.contextPath}/servlet/UserControlServlet?m=reg">注册</a>
						</div></c:if>
						<div>
						<c:if test="${not empty user_session}">
						<div class="login">
							<a href="${pageContext.request.contextPath}/servlet/UserHomeServlet?m=home&userId=${user_session.userId}" id="userHome">${user_session.userName}</a><a href="${pageContext.request.contextPath}/servlet/UserControlServlet?m=out">退出</a>
						</div>
						</c:if>
						<div class="addmenubut" style="float: right;">
							<input type="button" id="addMenu" value="添加菜谱"/>
						</div>
						</div>
		
						<div class="clearfix"></div>
					</div>	
				</div>
			</div>
		<!-- end-header section-->
		<!--start-banner-->
			<div class="banner">
				<div class="container">
					<div class="top-menu">
					<span class="menu"><img src="${pageContext.request.contextPath}/user/images/nav.png" alt=""/> </span>
						<ul>
							<li><a  href="${pageContext.request.contextPath}/index" class="active">home</a></li>
							<c:forEach var="menuType" items="${menuTypes_application}">
							<li class="dropdown menu__item">
								<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${menuType.typeName} <span class="caret"></span></a>
								<ul class="dropdown-menu multi-column columns-3">
										<c:forEach var="child" items="${menuType.children}">
											<li ><a href="${pageContext.request.contextPath}/servlet/MenuTypeListServlet?m=list&typeId=${child.typeId}" style="color:black; text-decoration: none;">${child.typeName}</a></li>
										</c:forEach>
							</ul>
							</li>
							</c:forEach>
						</ul>
						<!-- script for menu -->
									
							 <script>
							 $("span.menu").click(function(){
							 $(".top-menu ul").slideToggle("slow" , function(){
							 });
							 });
							 </script>
						<!-- //script for menu -->

					</div>
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<div class="slider-info">
										<h2>Welcome</h2>
										<p>在这里你可以随心地寻找你喜爱的菜谱，与他人分享你的喜悦，快来加入我们.</p>
									</div>
								</li>
								<li>
									<div class="slider-info">
									<h2>Share</h2>
										<p>你可以和别人分享你的烹饪经验，一起提高吧.</p>
									</div>
								</li>
								<li>	
									<div class="slider-info">
									<h2>Good</h2>
										<p>小白必看，指引你通往美食殿堂！</p>
									</div>
								</li>
							</ul>
						</div>
					</section>
						<!-- FlexSlider -->
							  <script defer src="${pageContext.request.contextPath}/user/js/jquery.flexslider.js"></script>
							  <script type="text/javascript">
									$(function(){
									  SyntaxHighlighter.all();
									});
									$(window).load(function(){
									  $('.flexslider').flexslider({
										animation: "slide",
										start: function(slider){
										  $('body').removeClass('loading');
										}
									  });
									});
							  </script>
						<!-- FlexSlider -->
				</div>	
			</div>
		<!--end-banner-->
			
			
				<!--end-hot-offer-->
				<div class="events-section">
					<div class="container">
					<h3></h3>
						<div class="events-grids">
							<div class="events1">
							<c:forEach var="menu" items="${menus}">
								<div class="col-md-4 event-grid">
								<a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}" class="mask">
							    <img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive zoom-img" alt=""></a>
								<h4>${menu.menuName}</h4>
								<a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}" class="button">查看详情</a>
								</div>
							</c:forEach>	
						   
						
						<div class="clearfix"></div>
						<%@include file="/WEB-INF/menu/employee/inc/pager.jsp" %> 
						</div>
						<div class="clearfix"></div>
						</div>
						</div>
						</div>
		<div class="specials-section">
			<img alt="" src="${pageContext.request.contextPath}/user/images/slidernew.jpg" style="float: right; width: 1423px;height: 305px;">
			</div>
	</div>
	<div class="footer-section">
					<div class="container">
						<div class="footer-top">
						
					</div>
					<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>


					</div>
					</div>


	
</body>
</html>
	