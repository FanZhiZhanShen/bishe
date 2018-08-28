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
	<!-- 引入jQuery -->
	<script language="JavaScript" src="<%=path %>/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script language='javascript'>
		function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";
		   }
		}
		count();
		var baoxiuWaitDealCount = 0;
		var tousuWaitDealCount = 0;
		function count(){
			$.ajax({ 
			   type: "POST", //请求方式
			   url: "baoxiuWaitDealCount.action", //发送请求的地址
			   success: function(data){ //请求成功后调用的回调函数，这里的data不是上面的，是服务器端返回的data
			   							//这里是response.getWriter().print("{baoxiuWaitDealCount:"+baoxiuList.size()+"}");
			   		var baoxiuWaitDealCountTmp = parseInt(eval(data));
			   		if(baoxiuWaitDealCountTmp > baoxiuWaitDealCount) {
			   			baoxiuWaitDealCount = baoxiuWaitDealCountTmp;
			   			$("#baoxiuWaitDealCount").html(baoxiuWaitDealCount);
			   			alert("您有" + (baoxiuWaitDealCount) + "条待受理报修申请!");
			   		}
			   } ,
	           error : function(){//请求失败后调用的回调函数
	               alert("error");
	           }
			});
			$.ajax({ 
			   type: "POST", 
			   url: "tousuWaitDealCount.action", 
			   data: "提交的数据", 
			   success: function(data){ 
			   		var tousuWaitDealCountTmp = parseInt(eval(data));
			   		if(tousuWaitDealCountTmp > tousuWaitDealCount) {
			   			tousuWaitDealCount = tousuWaitDealCountTmp;
			   			$("#tousuWaitDealCount").html(tousuWaitDealCount);
			   			alert("您有" + (tousuWaitDealCount) + "条待受理投诉!");
			   		}
			   } ,
	           error : function(){
	               alert("error");
	           }
			});
		}		
</script>
  </head>
  
  <body bgColor='#ffffff' style="margin: 0;padding: 0">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=path %>/images/topbg.gif">
	  <tr>
	    <td width='30%' height="60" style="font-size:26px; font-weight: bold;">&nbsp;&nbsp;致馨公寓管理系统</td>   
	    <td width='55%' align="right">
	    	<table width="750" border="0" cellspacing="0" cellpadding="0">
		      <tr>
			      <td align="right" height="26" style="padding-right:10px;line-height:26px;font-size:17px">
			        	<font style="font-size:16px; font-weight: bold;">
			        	    您好：管理员&nbsp;&nbsp;&nbsp;&nbsp;
			        	</font>
			        	<!-- href=#表示跳转到当前页 -->
			        	<a href="#" onclick="logout()">&lt;退出&gt;</a>
			      </td>
	          </tr>
	        </table>
	    </td>
	    <td width='15%' align="center" style="color: blue;font-size: 22px">
	    	<div style="margin-top:-10px;color: red; font-weight:bold;">未处理投诉： <span id="tousuWaitDealCount" style="color: red;font-size: 23px;">0</span> 条</div>
	    	<div style="margin-top:-10px;color: red; font-weight:bold;">未处理报修： <span id="baoxiuWaitDealCount" style="color: red;font-size: 23px;">0</span> 条</div>
	    </td>
	  </tr>
	</table>
  </body>
</html>

