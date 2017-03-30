<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
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
<!-- start-header section-->
			<div class="header">
				<div class="container">
				     <div class="top-header">
						<div class="phone">
							<ul>
								
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