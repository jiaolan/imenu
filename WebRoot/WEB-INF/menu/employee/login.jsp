<%@ page language="java" pageEncoding="UTF-8"%>
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
	    <script type="text/javascript">
	   $(function(){
	    	/* $("#login").click(function(){
	    		window.location.href = "${pageContext.request.contextPath}/servlet/EmployeeLoginServlet?m=login";
	    	}); */
	       $("#login").click(function(){
		
		   if(/^\s*$/.test($("input[name=userName]").val())){
		      alert("请输入账号");
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
	</head>
	<body class="light-gray-bg" style="background-image:url('${pageContext.request.contextPath}/images/bgp2.jpg');">
	<div>
		<div class="templatemo-content-widget templatemo-login-widget white-bg" style="margin-top: 160px;">
			<header class="text-center">
	          <div class="square"></div>
	          <h1>爱菜谱后台管理</h1>
	        </header>
	        <form id="loginForm" action="${pageContext.request.contextPath}/servlet/EmployeeLoginServlet?m=login" method="post">
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>	        		
		              	<input type="text" name="empNo" class="form-control" placeholder="请输入工号">           
		          	</div>	
	        	</div>
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="password" name="empPwd" class="form-control" placeholder="请输入密码">           
		          	</div>	
	        	</div>	          	
	          	<div class="form-group">
				    <div class="checkbox squaredTwo">
				       
				    </div>				    
				</div>
				<div class="form-group">
					<button id="login" type="submit" class="templatemo-blue-button width-100">Login</button>
				</div>
	        </form>
		</div>
	</div>	
	</body>
</html>