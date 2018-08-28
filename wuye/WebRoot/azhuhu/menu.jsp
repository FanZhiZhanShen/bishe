<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>致馨公寓管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" />
	<link rel="stylesheet" href="<%=path %>/css/menu.css" type="text/css" />
	<style type="text/css">
	    div {
			padding:0px;
			margin:0px;
		}
		
		body {
		 scrollbar-base-color:#bae87c;
		 scrollbar-arrow-color:#FFFFFF;
		 scrollbar-shadow-color:#c1ea8b;
		 padding:0px;
		 margin:auto;
		 text-align:center;
		 background-color:#9ad075;
		}
		
		dl.bitem {
			width:148px;
			margin:0px 0px 5px 4px;
		}
		
		dl.bitem dt {
		  background:url(<%=path %>/images/menubg.gif);
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		
		dl.bitem dd {
		  padding:3px 3px 3px 3px;
		  background-color:#fff;
		}
		
		.fllct
		{
			float:left;
			
			width:90px;
		}
		
		.flrct
		{
			padding-top:3px;
			float:left;
		}
		
		div.items
		{
			line-height:22px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 9px;
		}
		
		span.items
		{
			padding:10px 0px 10px 22px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 12px;
		}
		
		ul {
		  padding-top:3px;
		}
		
		li {
		  height:22px;
		}
		
		.sitemu li {
			padding:0px 0px 0px 22px;
			line-height:24px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 9px;
		}
	</style>
	<script language='javascript'>
		function showHide(id)
		{
			var show=document.getElementById(id);
			if(show.style.display=='block')
			{
				show.style.display='none';
			}
			else
			{
				show.style.display='block';
			}
		}

	</script>
	<base target="main" />
  </head>
  
  <body target="main">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("1")'><b>个人信息</b></dt>
	        <dd style='display:block' class='sitem' id='1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/zhuhuInfo.action' target='main'>个人信息</a> </li>
	            <li><a href='<%=path %>/azhuhu/userinfo/userPw.jsp' target='main'>个人密码修改</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("2")'><b>投诉信息</b></dt>
	        <dd style='display:block' class='sitem' id='2'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/tousuMy.action' target='main'>我的投诉信息</a></li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("3")'><b>报修信息</b></dt>
	        <dd style='display:block' class='sitem' id='3'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/baoxiuMy.action' target='main'>我的报修信息</a></li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("4")'><b>缴费信息</b></dt>
	        <dd style='display:block' class='sitem' id='4'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/userShoufeiMana.action' target='main'>我的缴费信息</a></li>
	          </ul>
	        </dd>
	      </dl>
		  </td>
	  </tr>
	</table>
  </body>
</html>
