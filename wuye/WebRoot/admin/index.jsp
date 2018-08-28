<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>致馨公寓管理系统</title>
    <!-- 禁止浏览器从本地计算机的缓存中访问页面内容。这样设定，访问者将无法脱机浏览 -->
	<meta http-equiv="pragma" content="no-cache">
	<!-- 禁止被缓存 -->
	<meta http-equiv="cache-control" content="no-cache">
	<!-- 设置网页的到期时间 -->
	<meta http-equiv="expires" content="0">    
	<!-- 设置搜索引擎的关键字 -->
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<!-- 设置对页面的描述 -->
	<meta http-equiv="description" content="This is my page">
    <style>
	body
	{
	  scrollbar-base-color:#C0D586;
	  scrollbar-arrow-color:#FFFFFF;
	  scrollbar-shadow-color:DEEFC6;
	}
	</style>
  </head>
  <frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
	  <frame src="<%=path %>/admin/top.jsp" name="topFrame" scrolling="no">
	  <frameset cols="180,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
	  <!-- noresize属性指定frame的分块位置固定，不能改变分块的大小 -->
	    <frame src="<%=path %>/admin/menu.jsp" noresize name="menu" scrolling="yes">
	    <frame src="<%=path %>/welcome.jsp" noresize name="main" scrolling="yes">
	  </frameset>
  </frameset>
</html>
