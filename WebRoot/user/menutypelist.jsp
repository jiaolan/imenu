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
  <script src="${pageContext.request.contextPath}/user/js/bootstrap.js"> </script>
  <!---- start-smoth-scrolling---->
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/move-top.js"></script>
<script type="text/jav  ascript" src="${pageContext.request.contextPath}/user/js/easing.js"></script>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();                                                        
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
		$(function(){
			$("#collBut").click(function(){
			if(${not empty user_session}){
				window.location.href = "${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=coll&menuId=${menu.menuId}";
				if(${not empty msg}){
  				alert("${msg}");
  				}
	
			}else{
				alert("请先登录");
			}
  			});
  			$("#commentBut").click(function(){
			if(${not empty user_session}){
				window.location.href = "${pageContext.request.contextPath}/servlet/CommentServlet?m=comm&menuId=${menu.menuId}";
			}else{
			alert("请先登录");
			}
  			});
  			
  			
		});
		
	</script>
<!---End-smoth-scrolling---->

</head>
<body>
		<!-- start-header section-->
		<%@include file="/user/top.jsp" %>	
		<!-- end-header section-->
		<!--start-banner-->
			<div class="banner ban1">
				<div class="container">
				<%@include file="/user/type.jsp" %>	
					</div>	
			</div>
		<!--end-banner-->
		<div class="events-section">
					<div class="container">
					<h3>${type.typeName}</h3>
						<div class="events-grids">
							<div class="events1">
							<c:forEach var="menu" items="${typeMenus}">
								<div class="col-md-4 event-grid">
								<a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}" class="mask">
							    <img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive zoom-img" alt=""></a>
								<h4>${menu.menuName}</h4>
								<a href="#" class="button">查看详情</a>
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
	