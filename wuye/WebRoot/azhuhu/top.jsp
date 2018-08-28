<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link href="<%=path %>/css/base.css" rel="stylesheet" type="text/css">
    <script language='javascript'>
		function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";
		   }
		}
    </script>
  </head>
  
  <body bgColor='#ffffff' style="margin: 0;padding: 0">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=path %>/images/topbg.gif">
	  <tr>
	    <td width='30%' height="60" style="font-size:26px; font-weight: bold;">&nbsp;&nbsp;致馨公寓管理系统</td>
	    <td width='70%' align="right">
	    	<table width="750" border="0" cellspacing="0" cellpadding="0">
		      <tr>
			      <td align="right" height="26" style="padding-right:10px;line-height:26px;font-size:17px">
			        	<font style="font-size:16px; font-weight: bold;">
			        	    您好：<s:property value="#session.zhuhu.zhuhuName"/>&nbsp;&nbsp;&nbsp;&nbsp;
			        	</font>
			        	
			        	<a href="#" onclick="logout()">&lt;退出&gt;</a>
			      </td>
	          </tr>
	        </table>
	    </td>
	  </tr>
	</table>
  </body>
</html>
