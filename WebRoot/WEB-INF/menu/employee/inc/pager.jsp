<%@ page language="java" pageEncoding="UTF-8"%>

  <div class="pagin">
    	<div class="message">共<i class="blue">${pager.totalCount}</i>条记录，共<i class="blue">${pager.totalPageCount}</i>页，当前第&nbsp;<i class="blue">${pager.currentPageNo}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><span class="pagepre"></span>
	          <c:if test="${pager.hasPrevious}">
	        	<a href="${pageContext.request.contextPath}/${pager.urlLink}&cno=1">首页</a>
	          </c:if>
	          <c:if test="${!pager.hasPrevious}">
	                              首页
	          </c:if>
        </li>
        <li class="paginItem">
	          <c:if test="${pager.hasPrevious}">
	        	<a href="${pageContext.request.contextPath}/${pager.urlLink}&cno=${pager.currentPageNo - 1}">上一页</a>
	          </c:if>
	          <c:if test="${!pager.hasPrevious}">
	                             上一页
	          </c:if>
        </li>
        <li class="paginItem">
	        <c:if test="${pager.hasNext}">
	        <a href="${pageContext.request.contextPath}/${pager.urlLink}&cno=${pager.currentPageNo + 1}">下一页</a>
	        </c:if>
	        <c:if test="${!pager.hasNext}">
	                         下一页
	        </c:if>
        </li>
        <li class="paginItem">
            <c:if test="${pager.hasNext}">
	        <a href="${pageContext.request.contextPath}/${pager.urlLink}&cno=${pager.totalPageCount}">尾页</a>
	        </c:if>
	        <c:if test="${!pager.hasNext}">
	                        尾页
	        </c:if>
        <span class="pagenxt"></span>
        
        </li>
        <li class="paginItem nohover"><input class="num" id="pageNum" value="${pager.currentPageNo}"/></li>
        <li class="paginItem"><input class="search" type="button" value="Go" onclick="goPage();"/></li>
        </ul>
    </div>
    <script type="text/javascript">
      function goPage(){
          var pageNum = $("#pageNum").val();
          if (/^\D*$/.test(pageNum) || parseInt(pageNum) < 1 || parseInt(pageNum) > ${pager.totalPageCount}){
              showTip("请填 写正确的页号");
          }else{
            window.location.href="${pageContext.request.contextPath}/${pager.urlLink}&cno=" + pageNum; 
          }
          
      }
    </script>
