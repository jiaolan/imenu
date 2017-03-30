<%@page import="java.io.Writer"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

  //out.print(response.getCharacterEncoding());
  
  //response.setStatus(200);
  
 /* response.setContentType("image/jpeg");
 response.addHeader("Content-disposition", "attachment;filename=123456.jpeg");
 
 OutputStream outputStream =  response.getOutputStream();
 
 //outputStream.write("这是输出流".getBytes("UTF-8"));
 
 //outputStream.write("<input value=\"123\"/>".getBytes("UTF-8"));
 
 InputStream inputStream = new FileInputStream(new File("C:\\java\\测试流\\bmw.jpg"));
 int b;
 while((b = inputStream.read()) != -1){
     outputStream.write(b);
 }
outputStream.close();
inputStream.close(); */


Writer writer =  response.getWriter();
writer.write("这是Writer");

writer.close();
 out.clear();
 out = pageContext.pushBody(); 
 %>