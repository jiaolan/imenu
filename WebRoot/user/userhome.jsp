<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>${user_session.userName}的个人空间</title>
<link href="${pageContext.request.contextPath}/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Curabitur Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
 <script src="${pageContext.request.contextPath}/user/js/jquery-1.11.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/user/js/bootstrap.js"> </script>
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
		
		$("#collBut").hover(function(){
			$(".user-post").attr("style","display:none;");
			$(".user-coll").attr("style","display:block;");
		},function(){
		$(".user-coll").attr("style","display:block;");
			$(".user-post").attr("style","display:none;");
			
		});
			
		$("#postBut").hover(function(){
			$(".user-post").attr("style","display:block;");
			$(".user-coll").attr("style","display:none;");
		},function(){
			$(".user-post").attr("style","display:block;");
			$(".user-coll").attr("style","display:none;");
			
		});	
		
		});
		function del(menuId){
		 if(confirm("确定要删除菜谱吗？")){
	    	 window.location.href="${pageContext.request.contextPath}/servlet/UserHomeServlet?m=delPost&menuId=" + menuId;
	 	 }		
		}
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
<!-- checkout -->
<div class="cart-items">
	<div class="container">
	<input type="button" id="postBut" value="个人发布"/>
	<input type="button" id="collBut" value="个人收藏"/>
	</div>
	<div class="container">
			 <h1 class="user-coll">${user_session.userName}的个人收藏：</h1>
				
		<c:forEach var="menu" items="${collMenus}">
			 <div class="cart-header user-coll">
				 <a href="${pageContext.request.contextPath}/servlet/UserHomeServlet?m=delColl&menuId=${menu.menuId}"><div class="close-coll"></div></a>
				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}"><img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive zoom-img" alt=""></a>
						</div>
					   <div class="cart-item-info">
						<h3><a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}">${menu.menuName}</a><span></span></h3>
						<input type="hidden" name="menuId" value="${menu.menuId}" id="menuId"/>
					   </div>
					   <div class="clearfix"></div>
				  </div>
			 </div>
		 </c:forEach>
		  <h1 class="user-post">${user_session.userName}的个人发布：</h1>
		 <c:forEach var="menu" items="${postMenus}">
				 <div class="cart-header user-post">
				 <a onclick="del(${menu.menuId});"><div class="close1"></div></a>
				 
				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}"><img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive zoom-img" alt=""></a>
						</div>
					   <div class="cart-item-info">
						<h3><a href="${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=view&menuId=${menu.menuId}">${menu.menuName}</a><span></span></h3>
						<a href="${pageContext.request.contextPath}/servlet/UserHomeServlet?m=editMenu&menuId=${menu.menuId}">点击修改</a>
						<input type="hidden" value="${menu.menuId}" id="menuIdPost"/>
					   </div>
					   <div class="clearfix"></div>
				  </div>
			 </div>
		 </c:forEach>	
		 </div>
		 </div>
<!-- checkout -->	
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
	