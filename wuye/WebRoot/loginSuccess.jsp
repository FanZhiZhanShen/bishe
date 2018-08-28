<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 引用struts标签库中的s标签 -->
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
       <script type="text/javascript">
           function tiao()
           {
           //使用的是struts的ognl表达式，从session取出userType的值	
               <s:if test="#session.userType==0">
                   window.location.href="<%=path %>/admin/index.jsp";
               </s:if>
               <s:if test="#session.userType==1">
                   window.location.href="<%=path %>/azhuhu/index.jsp";
               </s:if>
           }
           //将在1秒后执行tiao函数
           setTimeout(tiao,1000)
       </script>
       <br> <br> <br> <br> <br> <br> <br> <br> <br>
       <center><img src="<%=path %>/images/loading32.gif">页面跳转中</center>
  </body>
</html>
