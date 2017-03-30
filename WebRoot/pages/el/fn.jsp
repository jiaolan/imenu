<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    <%
      request.setAttribute("str", " aB>cd ef> ");
      request.setAttribute("array", new String[]{"1","2","3","4","5","6"});
      
     %>
     
     ${fn:contains(str,"bcd")},
     ${fn:containsIgnoreCase(str,"bcd")}<br/>
     
     ${fn:endsWith(str,"ef")},${fn:endsWith(str,"ef3")}<br/>
     
     
     ${fn:escapeXml(str)},${str}<br/>
     
     
     ${fn:indexOf(str,">")}<br/>
     
     ${fn:join(array,">")}<br/>
     
     ${fn:length(array)},${fn:length("abcde")}<br/>
     
     ${fn:replace(str,">","&gt;")}
     
     <c:forEach items="${fn:split(str,'>')}" var="obj">
        ${obj},
     </c:forEach>
     <br/>
     ${fn:startsWith(str,"ef")},${fn:startsWith(str,"aB")}<br/>
     
     ${fn:substring(str,0,2)}<br/>
     ${fn:substringAfter(str,">")}<br/>
     ${fn:substringBefore(str,">")}<br/>
     ${fn:toLowerCase(str)}<br/>
     ${fn:toUpperCase(str)}<br/>
     ${fn:trim(str)}<br/>
     
  </body>
</html>
