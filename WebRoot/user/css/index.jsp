<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>

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
	</script

><!-- cart -->
		<script src="js/simpleCart.min.js"> </script>
	<!-- cart -->
  <script src="js/bootstrap.js"> </script>
  
</head>
<body>
		<!-- start-header section-->
			<div class="header">
				<div class="container">
				     <div class="top-header">
						<div class="phone">
							<ul>
								<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></li>
								<li><p>+4758 655 5947</p></li>
							</ul>
						</div>
						<div class="logo">
							<h1><a href="index.html">curabitur</a></h1>
						</div>
						<div class="header-right">
						<div class="login">
						<a href="login.html">login</a>
						</div>
						<div class="cart box_1">
							<a href="checkout.html">
								<h3> <span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span> items)<img src="${pageContext.request.contextPath}/user/images/bag.png" alt=""></h3>
							</a>	
							<p><a href="javascript:;" class="simpleCart_empty">Empty cart</a></p>
							<div class="clearfix"> </div>
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
							<li><a  href="${pageContext.request.contextPath}/user/index.jsp" class="active">home</a></li>
							<%-- <c:forEach var="menuType" items="${menuTypes_application}">
							<li><span>${menuType.typeName}</span></li> 
							</c:forEach> --%>
							<c:forEach var="menuType" items="${menuTypes_application}">
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${menuType.typeName} <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
										<c:forEach var="child" items="${menuType.children}">
											<li ><a href="" style="color:black; text-decoration: none;">${child.typeName}</a></li>
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
										<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
									</div>
								</li>
								<li>
									<div class="slider-info">
									<h2>Welcome</h2>
										<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
									</div>
								</li>
								<li>	
									<div class="slider-info">
									<h2>Welcome</h2>
										<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
									</div>
								</li>
							</ul>
						</div>
					</section>
						<!-- FlexSlider -->
							  <script defer src="js/jquery.flexslider.js"></script>
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
			<div class="banner-bottom">
				<div class="container">
				<div class="droop-down">
					<div class="col-md-3 droop">
							<div class="sort-by">
		            <label>Citys </label>
		            <select class="sel">
		                            <option value="">
		                   Columbia              </option>
		                            <option value="">
		                 Gobaret              </option>
		                            <option value="">
		                   Florissant               </option>
										<option value="">
		                   Fergeeson               </option>
						   
		            </select>
		        </div>
					</div>
					<div class="col-md-3 droop">
							<div class="sort-by">
		            <label>Name</label>
		            <select>
		                            <option value="">
		                  Cocoon Hotel              </option>
		                            <option value="">
		                   Chinese Room               </option>
		                            <option value="">
		                   Royal Orchid Central              </option>
						         <option value="">
		                   Royal Orchid Central              </option>
						         <option value="">
		                   Royal Orchid Central              </option>
		            </select>
		        </div>
					</div>
					<div class="col-md-3 droop">
							<div class="sort-by">
		            <label>Order</label>
		            <select>
		                            <option value="">
		                    Arugula              </option>
		                            <option value="">
		                  Baking Soda              </option>
		                            <option value="">
		                    Cilantro              </option>
							  <option value="">
		                Chicken              </option>
							  <option value="">
		                    Squash             </option>
		            </select>
		        </div>
					</div>
					<div class="col-md-3 search">
					<form>
					<input type="submit" value="search">
					</form>				
					</div>
					<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="content">
				<!--hot-offer-->
					<div class="today-offer">
						<div class="today-head">
						<h3> 今日推荐</h3>
							<p>Autem vel eum iriure dolor in hendrerit in volestie consequat vel illum</p>
					</div>
					<div class="today-grids">
						<div class="col-md-3 today-grid test1">
						<img src="${pageContext.request.contextPath}/user/images/p1.jpg" class="img-responsive" alt="/">
							<div class="textbox">
								<h4>FOOD QUALITY </h4>
								<p>Arenean nonummy hendrerit mau phaselntes nascetur ridic ulusm dui fusce feu. Cras vitae neque turpis…</p>
							</div>
						</div>
						<div class="col-md-3 today-grid test1">
						<img src="${pageContext.request.contextPath}/user/images/p2.jpg" class="img-responsive" alt="/">
						<div class="textbox">
								<h4>FOOD QUALITY </h4>
								<p>Arenean nonummy hendrerit mau phaselntes nascetur ridic ulusm dui fusce feu. Cras vitae neque turpis…</p>
							</div>
						</div>
						<div class="col-md-3 today-grid test1">
						<img src="${pageContext.request.contextPath}/user/images/p3.jpg" class="img-responsive" alt="/">
						<div class="textbox">
								<h4>FOOD QUALITY </h4>
								<p>Arenean nonummy hendrerit mau phaselntes nascetur ridic ulusm dui fusce feu. Cras vitae neque turpis…</p>
							</div>
						</div>
						<div class="col-md-3 today-grid test1">
						<img src="${pageContext.request.contextPath}/user/images/p4.jpg" class="img-responsive" alt="/">
						<div class="textbox">
								<h4>FOOD QUALITY </h4>
								<p>Arenean nonummy hendrerit mau phaselntes nascetur ridic ulusm dui fusce feu. Cras vitae neque turpis…</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!--end-hot-offer-->
				
				<div class="order-grids">
				<div class="container">
				<div class="order-head">
						<h3>What makes us Different</h3>
							<p>Autem vel eum iriure dolor in hendrerit in volestie consequat vel illum</p>
					</div>
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<div class="col-md-3 order-grid" style="position:relative;">
								<a href=""><img src="${pageContext.request.contextPath}/user/images/d1.jpg" class="img-responsive" alt="/"></a>
								<a href=""><span style="width:100%; position:absolute;text-align: center;">go to view</span></a>
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d2.jpg" class="img-responsive" alt="/">
								
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d3.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d4.jpg" class="img-responsive" alt="/">
								</div>
								<div class="clerafix"></div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								CHICKEN
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
							<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/p6.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/p7.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/p8.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/p9.jpg" class="img-responsive" alt="/">
								</div>
								<div class="clerafix"></div>
							</div>
						</div>
						</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							DESSERTS
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
							<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d1.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d2.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d3.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/d4.jpg" class="img-responsive" alt="/">
								</div>
								<div class="clerafix"></div>
							</div>
						</div>
					</div>
										<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFoure">
							SEAFOOD
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
							<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s1.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s2.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s3.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s4.jpg" class="img-responsive" alt="/">
								</div>
								<div class="clerafix"></div>
							</div>
						</div>
					</div>
										<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFive">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
								SALADS
								</a>
							</h4>
						</div>
						<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
							<div class="panel-body">
							<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s5.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s6.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s7.jpg" class="img-responsive" alt="/">
								</div>
								<div class="col-md-3 order-grid">
								<img src="${pageContext.request.contextPath}/user/images/s8.jpg" class="img-responsive" alt="/">
								</div>
								<div class="clerafix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		<div class="specials-section">
			<div class="container">
				<div class="col-md-3 specials">
				<h3>about</h3>
				<p>Morbi pretium gravida justo nec ultrices. Ut et facilisis justo. Fusce ac turpis eros, vel molestie lectus.feugiat velit velit non turpis</p>
				</div>
				<div class="col-md-3 specials1">
				<h3>specials</h3>
				<ul>
					<li><a href="#">New Listing Sign-Up</a></li>
					<li><a href="#">Consectetur adipiscing</a></li>
					<li><a href="#">Integer molestie lorem</a></li>
					<li><a href="#">Facilisis in pretium nisl</a></li>
				</ul>
				</div>
			<div class="col-md-3 specials1">
			<h3>recipes</h3>
			<ul>
				<li><a href="#">Integer molestie lorem</a></li>
				<li><a href="#">Integer molestie lorem</a></li>
				<li><a href="#">Consectetur adipiscing</a></li>
				<li><a href="#">Lorem ipsum dolor sit</a></li>
			</ul>
			</div>
			<div class="col-md-3 specials1">
			<h3>social</h3>
			<ul>
				<li><a href="#">facebook</a></li>
				<li><a href="#">twitter</a></li>
				<li><a href="#">google</a></li>
				<li><a href="#">viemo</a></li>
			</ul>
			</div>
			<div class="clearfix"></div>
			</div>
			</div>
	</div>
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>
	<div class="footer-section">
					<div class="container">
						<div class="footer-top">
						<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
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
	