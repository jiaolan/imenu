<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">

</script>
<div class="top-menu">
					<span class="menu"><img src="${pageContext.request.contextPath}/user/images/nav.png" alt=""/> </span>
						<ul>
							<li><a  href="${pageContext.request.contextPath}/index" class="active">home</a></li>
							<c:forEach var="menuType" items="${menuTypes_application}">
							<li class="dropdown menu__item">
								<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${menuType.typeName} <span class="caret"></span></a>
								<ul class="dropdown-menu multi-column columns-3">
										<c:forEach var="child" items="${menuType.children}">
											<li ><a href="${pageContext.request.contextPath}/servlet/MenuTypeListServlet?m=list&typeId=${child.typeId}" style="color:black; text-decoration: none;">${child.typeName}</a></li>
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