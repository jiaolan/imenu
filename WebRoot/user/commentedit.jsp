<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ora" uri="http://oracle.com/oracle/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Account</title>
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
<script src="${pageContext.request.contextPath}/user/js/img.js"> </script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
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
   UE.getEditor('editor');
   });
   $(function(){
		  $("#sub").click(function(){
			validateContext();
		   if(/^\s*$/.test($("input[name=comment]").val())){
		      alert("请输入内容");
		      return false;
		   }
		    $("#commForm").submit();
		  });
		});
   function validateContext(){
     
     $("input[name=commDetail]").val(UE.getEditor('editor').getContent());
       
       
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
		
 <!-- registration -->
	<div class="main-1">
		<div class="container">
			<div class="register">
		  	  <form action="${pageContext.request.contextPath}/servlet/CommentServlet?m=edit&menuId=${menuId}" method="post" id="commForm" onsubmit="validateContext();"> 
		
					<h3>请填写您的看法</h3><input type="hidden" name="menuId" value="${menuId}"/>
					<input type="hidden" name="commDetail"/>
					<script id="editor" type="text/plain" style="height:300px;">${menu.menuRemark}</script>
					<div class="clearfix"> </div>
					   <div class="register-but">
					   <input type="submit" value="submit" id="sub">
					   <div class="clearfix"> </div>
				   </div>
			
				</form>
		   </div>
		 </div>
	</div>
<!-- registration -->

</body>
</html>
	