<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
     $(function(){
        $("#stuFrom").submit(function(){
         
           if (/^\s*$/.test($("input[name=stuName]").val())){
              alert("请填写正确的用户名");
              return false;
           }
           
           if (!/^\d{1,3}$/.test($("input[name=stuAge]").val())){
              alert("请填写正确的年龄");
              return false;
           }
           
           if (!/^[A-Za-z0-9]+$/.test($("input[name=stuNo]").val())){
              alert("请填写正确的学号");
              return false;
           }
           
           return true;
       });
       
       if(${not empty student.img}){
          resizeImg(500,400,"img");
       }
       
     });
     
     //缩放图片
     function resizeImg(width,height,imgId){
       var img = $("#"+imgId);
       var _width = img.prop("width");
       var _height = img.prop("height");
       
       _height = _height * (width / _width);
       _width = width;//以宽为准进行变化
       
       if(_height > height){
        //以高为准再次变化
       _width = _width * (height / _height);
       _height = height;
       } 
       
       img.prop("width",_width);
       img.prop("height",_height);
       img.show();
     }
     
     function callBack(code,path,msg){
         $("#imgPath").val(path);
         $("#img").attr("src","/upload/" + path);
         $("#img").show();
         
         $("#img").on("load",function(){
            resizeImg(500,400,"img");
         });
         
     }
     
     function callBackAttachment(code,id,msg,fileName){
         $("#attaId").val(id);
         $("#attachment").html("<a href=\"${pageContext.request.contextPath}/servlet/DownLoadServlet?id=" + id + " \"> " + fileName + " </a>");
     }
   
    </script>
    
    <title>新增学生信息</title>
  </head>
  <body>
     编辑学生信息
    <form id="stuFrom" action="${pageContext.request.contextPath}/servlet/StudentServlet" method="post">
    <table style="border: 1px blue solid;width: 800px;">
    <tr>
	    <td>学生姓名 <font color="red">*</font></td>
	    <td>
	    <input type="hidden" name="id" value="${student.id}"/>
	    <input name="stuName"  type="text" maxlength="10" value="${student.name}"/>  
	     </td>
     </tr>
    <tr><td>学生年龄  <font color="red">*</font></td>
    <td><input name="stuAge" type="text" maxlength="3" value="${student.age}"/>  </td></tr>
    <tr>
	    <td>学生性别  <font color="red">*</font></td>
	    <td>
	    <input name="stuSex" value="0" type="radio" id="man" ${student.sex == 0 or empty student.sex ? "checked='checked'":""}/> <label for="man"> 男 </label>
	    <input name="stuSex" value="1" type="radio" id="woman" ${student.sex == 1 ? "checked='checked'":""}/><label for="woman"> 女 </label>
	    </td>
    </tr>
    <tr>
	    <td>学号  <font color="red">*</font></td>
	    <td>
	    <input name="stuNo" type="text" maxlength="30" value="${student.stuNo}"/>
	    </td>
    </tr>
    
    <tr>
	    <td>上传照片 </td>
	    <td>
	    <iframe src="${pageContext.request.contextPath}/pages/inc/upload.jsp?callBack=callBack" style="border: 0px;height: 30px;margin: 0px;" scrolling="no"></iframe>
	    <input id="imgPath" type="hidden" name="img" value="${student.img}"/>
	    </td>
    </tr>
    
    <tr>
	    <td></td>
	    <td>
	    <img id="img" alt="头像" src="/upload/${student.img}" style="display: none;"/>
	    </td>
    </tr>
    
    <tr>
	    <td>上传附件 </td>
	    <td>
	    <iframe src="${pageContext.request.contextPath}/pages/inc/upload.jsp?callBack=callBackAttachment&isAtta=1" style="border: 0px;height: 30px;margin: 0px;" scrolling="no"></iframe>
	    <input type="hidden" id="attaId" name="attaId" value="${student.attaId}"/>
	    </td>
    </tr>
    
    <tr>
	    <td></td>
	    <td id="attachment">
	     <c:if test="${not empty student.attaId}">
	    <a href="${pageContext.request.contextPath}/servlet/DownLoadServlet?id=${student.attaId}" target="_blank">${student.attaName}</a>
	    </c:if>
	    </td>
    </tr>
    <tr>
	    <td><input type="submit" value="保存"/> </td>
	    <td><input type="reset" value="重置"/></td>
    </tr>
    <tr>
	    <td><input type="button" value="返回" onclick="window.history.back();"/> </td>
	    <td>
	    </td>
    </tr>
    </table>
    </form>
  </body>
</html>
