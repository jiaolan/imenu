<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>爱菜谱</title>
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
				$.ajax({
			 		  type: "get",
			  		  url: "${pageContext.request.contextPath}/servlet/MenuDetailservlet?m=collAjax",
			 		  data: {"menuId":${menu.menuId}},
			 		  
					  success: function(msg){
			  		  	alert(msg);
			 		  }
				});
			}else{
				alert("请先登录");
			}
  			});
  			
  			function msg(){
  				if(${not empty msg}){
					alert("${msg}");
				}
  			}
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
			
			<div class="content">
				<div class="aboutus">
					<div class="container">
						<input type="hidden" value="${menu.menuId}" name="menuId"/>
							<div class="about-grids">
								<div class="col-md-7 about-grid">
								<img src="${not empty menu.menuImg ? '/upload/'.concat(menu.menuImg) : (pageContext.request.contextPath).concat('/user/images/noimg.png')}" class="img-responsive" alt="/">
								</div>
								<div class="col-md-5 about-grid1">
									<h3>${menu.menuName}<input type="button" id="collBut" value="加入收藏" style="font-size: 16px;"/></h3>
									
									<div class="history">
										<div class="hist-year">
										<h5>工艺:</h5>
										</div>
										<div class="hist-text">
										<P>${menuDetail.menuTech}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>难度:</h5>
										</div>
										<div class="hist-text">
										<P>${menuDetail.menuLevel}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>口味:</h5>
										</div>
										<div class="hist-text">
										<P>${menuDetail.menuTaste}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>预计用时:</h5>
										</div>
										<div class="hist-text">
										<P>${menuDetail.menuTime}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>特色:</h5>
										</div>
										<div class="hist-text">
										<P>${menuDetail.menuFeature}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>作者:</h5>
										</div>
										<div class="hist-text">
										<P>${menu.user.userName}</P>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="history">
										<div class="hist-year">
										<h5>创建时间:</h5>
										</div>
										<div class="hist-text">
										<P>${menu.createTime}</P>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="col-md-xq remark">
								<h4>用料：</h4>
								<div class="hist-year">
								<h5>主料:</h5>
								</div>
								<div class="hist-text">
								<P>${material.mainMaterial}</P>
								</div>
								</div>
								<div class="col-md-xq remark">
								<div class="hist-year">
								<h5>辅料:</h5>
								</div>
								<div class="hist-text">
								<P>${material.assistMaterial}</P>
								</div>
								</div><div class="col-md-xq remark">
								<div class="hist-year">
								<h5>调料:</h5>
								</div>
								<div class="hist-text">
								<P>${material.flavour}</P>
								</div>
								</div>
								<div class="col-md-xq remark">
								<h4>步骤详情：</h4>
								<P>${menuDetail.menuRemark}</P>
								</div>
							</div>
					</div>
				</div>
				<div class="container">
					<div class="comment-but">
					<input type="button" id="commentBut" value="说出您的看法"/></div>
				</div>
				<div class="ourteam">
					<div class="container">
					<c:forEach var="comment" items="${comments}">
					<div class="team-grids">
					<div class="comment-left team-grid">
						<a><h5>${comment.userName}:</h5></a>
					</div>
					<div class="comment-right team-grid">
						<p>${comment.commDetail}</p>
					</div>
					</div>
					<div class="biankuang"></div>
					</c:forEach>
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
	