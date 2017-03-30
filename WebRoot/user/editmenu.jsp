<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ora" uri="http://oracle.com/oracle/functions" %>
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
		
		 var menuTypeData = {};
   
   <c:forEach var="menuType" items="${menuTypes_application}">
     menuTypeData[${menuType.typeId}] = [
         <c:forEach var="child" items="${menuType.children}" varStatus="vs">
          {id:${child.typeId},name:"${child.typeName}"}<c:if test="${!vs.last}">,</c:if>
         </c:forEach>
    	 ];
   </c:forEach>
   
    function callBack(code,path,msg){
         $("input[name=menuImg]").val(path);
         $("#menuImg").attr("src","/upload/" + path);
         $("#menuImg").show();
         $("#menuImg").on("load",function(){
            resizeImg("500","400","menuImg");
         });
         
     }
   
   $(function(){
   		UE.getEditor('editor');
   
    	$("#firstType").change(function(){
    		var firstType = $(this);
         	var id = firstType.val();
         	var secondType = $("#typeId");
         	secondType.find("option").remove(":not(:first)");
         
            var children = menuTypeData[id];
            for(var i = 0; i < children.length; i++){
				secondType.append(new Option(children[i].name,children[i].id));
			}
		});
		
       if(${not empty menu.menuImg}){
          resizeImg("500","400","menuImg");
       }
       
       $("#sub").click(function(){
		  $("input[name=menuRemark]").val(UE.getEditor('editor').getContent());
		  
		   if(!/^[\u4e00-\u9fa5]{1,20}$/.test($("input[name=menuName]").val())){
		      alert("请正确输入菜谱名字，限1-20字的中文");
		      return false;
		   }
		   if(/^\s*$/.test($("select[name=typeId]").val())){
		      alert("请选择分类");
		      return false;
		   }
		   if(/^\s*$/.test($("select[name=menuTech]").val())){
		      alert("请选择工艺");
		      return false;
		   }
		   if(/^\s*$/.test($("select[name=menuLevel]").val())){
		      alert("请选择难度");
		      return false;
		   }
		   if(!/^[\u4e00-\u9fa5]{1,15}$/.test($("input[name=menuTaste]").val())){
		      alert("请输入口味，限1-15字的中文");
		      return false;
		   }
		   if(/^\s*$/.test($("select[name=menuTime]").val())){
		      alert("请选择预计用时");
		      return false;
		   }
		   if(!/^[\u4e00-\u9fa5\，\,]{1,20}$/.test($("input[name=menuFeature]").val())){
		      alert("请输入特色，限1-20字的中文");
		      return false;
		   }
		   if(!/^[\u4e00-\u9fa5\，\,0-9]{10,150}$/.test($("input[name=mainMaterial]").val())){
		      alert("请输入主料，限10-150字的中文,数字和逗号");
		      return false;
		   }
		   if(!/^[\u4e00-\u9fa5\，\,0-9]{10,150}$/.test($("input[name=assistMaterial]").val())){
		      alert("请输入辅料，限10-150字的中文，数字和逗号");
		      return false;
		   }
		   if(!/^[\u4e00-\u9fa5\，\,0-9]{10,150}$/.test($("input[name=flavour]").val())){
		      alert("请输入调料，限10-150字的中文，数字和逗号");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=menuImg]").val())){
		      alert("请选择主图片上传");
		      return false;
		   }
		   if(/^\s*$/.test($("input[name=menuRemark]").val())){
		      alert("请输入详情");
		      return false;
		   }
		  
		    $("#regForm").submit();
		  });
		  
		  if(${not empty msg}){
			  alert("${msg}");
		}
   });
   
   function validateContext(){
   
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
		  	  <form action="${pageContext.request.contextPath}/servlet/UserMenuServlet?m=edit&menuId=${menu.menuId}" method="post" id="regForm" onsubmit="validateContext();"> 
				 <div class="register-top-grid">
					<h3>请填写菜谱信息</h3>
					
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>菜谱名字<label>*</label></span>
						<input name="menuName" type="text" value="${menu.menuName}"> 
						<input name="menuId" type="hidden"> 
					 </div>
					 <div class="wow fadeInRight" data-wow-delay="0.4s">
					 	<span>请选择分类<label>*</label></span>
					 	<select name="parentId" id="firstType">
					 	 <option value="">全部父分类</option>
						 <c:forEach var="menuType" items="${menuTypes_application}">
						 	<option value="${menuType.typeId}" ${menu.type.parentId == menuType.typeId ? "selected='selected'":"" }>${menuType.typeName}</option>
						</c:forEach>
						</select>
						
						<select name="typeId" id="typeId">
							<option value="">全部子分类</option>
							<c:forEach var="menuType" items="${menuTypes_application_map[ora:int(menu.type.parentId * 1)].children}">
							<option value="${menuType.typeId}" ${menu.typeId == menuType.typeId ? "selected='selected'":"" }>${menuType.typeName}</option>
							</c:forEach>
						</select>
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>菜谱工艺<label>*</label></span>
						<select name="menuTech" id="menuTech">
							<option value="">请选择</option>
							<option value="煎" ${menuDetail.menuTech == "煎" ? "selected='selected'":"" }>煎</option>
							<option value="煮" ${menuDetail.menuTech == "煮" ? "selected='selected'":"" }>煮</option>
							<option value="烹" ${menuDetail.menuTech == "烹" ? "selected='selected'":"" }>烹</option>
							<option value="炸" ${menuDetail.menuTech == "炸" ? "selected='selected'":"" }>炸</option>
							<option value="蒸" ${menuDetail.menuTech == "蒸" ? "selected='selected'":"" }>蒸</option>
							<option value="烤" ${menuDetail.menuTech == "烤" ? "selected='selected'":"" }>烤</option>
						</select>
						<input type="hidden" name="detailId"/>
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>菜谱难度<label>*</label></span>
						<select name="menuLevel" id="menuLevel">
							<option value="">请选择（数字越大越难）</option>
							<option value="难度1" ${menuDetail.menuLevel == "难度1" ? "selected='selected'":"" }>难度1</option>
							<option value="难度2" ${menuDetail.menuLevel == "难度2" ? "selected='selected'":"" }>难度2</option>
							<option value="难度3" ${menuDetail.menuLevel == "难度3" ? "selected='selected'":"" }>难度3</option>
							<option value="难度4" ${menuDetail.menuLevel == "难度4" ? "selected='selected'":"" }>难度4</option>
						</select>
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>菜谱口味<label>*</label></span>
						<input name="menuTaste" type="text" value="${menuDetail.menuTaste}"> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>预计用时<label>*</label></span>
						<select name="menuTime" id="menuTime">
							<option value="">请选择</option>
							<option value="1-10分钟" ${menuDetail.menuTime == "1-10分钟" ? "selected='selected'":"" }>1-10分钟</option>
							<option value="10-20分钟" ${menuDetail.menuTime == "10-20分钟" ? "selected='selected'":"" }>10-20分钟</option>
							<option value="20-30分钟" ${menuDetail.menuTime == "20-30分钟" ? "selected='selected'":"" }>20-30分钟</option>
							<option value="30-60分钟" ${menuDetail.menuTime == "30-60分钟" ? "selected='selected'":"" }>30-60分钟</option>
							<option value="1小时以上" ${menuDetail.menuTime == "1小时以上" ? "selected='selected'":"" }>1小时以上</option>
						</select>
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>菜谱特色<label>*</label></span>
						<input name="menuFeature" type="text" value="${menuDetail.menuFeature}"/> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>主料<label>*</label></span>
						<input name="mainMaterial" type="text" value="${material.mainMaterial}"/> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>辅料<label>*</label></span>
						<input name="assistMaterial" type="text" value="${material.assistMaterial}"/> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>调料<label>*</label></span>
						<input name="flavour" type="text" value="${material.flavour}"> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
					 	<span>预览图：<label>*</label></span>
						<iframe src="${pageContext.request.contextPath}/pages/inc/upload.jsp?callBack=callBack" style="border: 0px;height: 30px;margin: 0px;" scrolling="no"></iframe>
   						<input name="menuImg"  type="hidden" value="${menu.menuImg}"/>
   						<img id="menuImg" alt="logo" src="/upload/${menu.menuImg}"  ${empty menu.menuImg ? "style='display:none;'":""}/>
					 </div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
					   </a>
					 </div>
				     <div class="register-bottom-grid">
					 </div>
					 <input name="menuRemark" type="hidden"/>
					<script id="editor" type="text/plain" style="height:300px;">${menuDetail.menuRemark}</script>
					<div class="clearfix"> </div>
					   <div class="register-but">
					   <input type="submit" id="sub" value="submit">
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
	