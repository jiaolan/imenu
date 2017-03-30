<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>爱菜谱-注册</title>
<link href="${pageContext.request.contextPath}/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Curabitur Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/flexslider.css" type="text/css" media="screen" />
 <script src="${pageContext.request.contextPath}/user/js/jquery-3.1.1.min.js"></script>
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
		   if(!/^\S{1,15}$/.test($("input[name=userName]").val())){
		      alert("用户名必须是1-15之间的字符");
		      return false;
		   }
		   if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("input[name=userEmail]").val())){
		      alert("请正确输入Email");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=userPwd]").val())){
		      alert("请输入密码");
		      return false;
		   }
		   if(!/^[\da-zA-Z]{6,16}$/.test($("input[name=userPwd]").val())){
		      alert("密码必须是由字母和数字组成的6-16位字符");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=reUserPwd]").val())){
		      alert("请重复密码");
		      return false;
		   }
		   if($("input[name=userPwd]").val() != $("input[name=reUserPwd]").val()){
		      alert("两次输入的密码不一致");
		      return false;
		   }

		    $("#regForm").submit();
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
		
 <!-- registration -->
	<div class="main-1">
		<div class="container">
			<div class="register">
		  	  <form action="${pageContext.request.contextPath}/servlet/UserControlServlet?m=reg" method="post" id="regForm"> 
				 <div class="register-top-grid">
					<h3>请填写注册信息</h3>
					
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>用户名<label>*</label></span>
						<input name="userName" type="text"> 
					 </div>
					
					 <div class="wow fadeInRight" data-wow-delay="0.4s">
						 <span>邮箱<label>*</label></span>
						 <input name="userEmail" type="email"> 
					 </div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
					   </a>
					 </div>
				     <div class="register-bottom-grid">
							 <div class="wow fadeInLeft" data-wow-delay="0.4s">
								<span>密码<label>*</label></span>
								<input name="userPwd" type="password">
							 </div>
							 <div class="wow fadeInRight" data-wow-delay="0.4s">
								<span>再次输入密码<label>*</label></span>
								<input name="reUserPwd" type="password">
							 </div>
					 </div>
				
				<div class="clearfix"> </div>
				<div class="register-but">
				   
					   <input type="submit" id="sub" value="提交">
					   <div class="clearfix"> </div>
				   
				</div>
				</form>
		   </div>
		 </div>
	</div>
<!-- registration -->

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
	