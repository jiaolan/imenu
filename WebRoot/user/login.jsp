<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>爱菜谱-登录</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/easing.js"></script>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
		
		$(function(){
		  $("#sub").click(function(){
		
		   if(/^\s*$/.test($("input[name=userName]").val())){
		      alert("请输入用户名");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=userPwd]").val())){
		      alert("请输入密码");
		      return false;
		   }
		    $("#loginForm").submit();
		  });
		  
		  if(${not empty msg}){
			  alert("${msg}");
		  }
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
			
			<!--contact-->
			<div class="content">
 			<div class="main-1">
			<div class="container">
			<div class="login-page">
			   <div class="account_grid">
			   <div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
			  	 <h3>新用户</h3>
				 <p>加入我们，来认识更多新朋友，新菜谱！</p>
				 <a class="acount-btn" href="${pageContext.request.contextPath}/servlet/UserControlServlet?m=reg">创建一个新帐号</a>
			   </div>
			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	<h3>已注册用户</h3>
				<p>如果您有帐号, 请登录.</p>
				<form id="loginForm" action="${pageContext.request.contextPath}/servlet/UserControlServlet?m=login" method="post">
				  <div>
					<span>用户名<label>*</label></span>
					<input name="userName" type="text"> 
				  </div>
				  <div class="login-pass">
					<span>密码<label>*</label></span>
					<input name="userPwd" type="password"> 
				  </div>
				  <div>
				   <label><input value="1" type="checkbox" name="remberLogin" checked=""><i> </i>记住密码？</label>
				  </div>
				  <!-- <a class="forgot" href="#">忘记密码?</a> -->
				  <input type="submit" value="登录" id="sub">
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>
		   </div>
		   </div>
	</div>
	</div>
<!-- login -->
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
	