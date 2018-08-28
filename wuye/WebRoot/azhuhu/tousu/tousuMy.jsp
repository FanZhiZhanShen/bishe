<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function tousuAdd()
           {
                 var url="<%=path %>/azhuhu/tousu/tousuAdd.jsp";
				 window.location.href=url;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="3" background="<%=path %>/images/tbg.gif">&nbsp;我的投诉&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="30%">投诉时间</td>
					<td width="40%">投诉事由</td>
					<td width="30%">状态</td>
		        </tr>	
				<s:iterator value="#request.tousuList" id="tousu">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tousu.tousuShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<!-- escape默认是true，表示将value内的内容强制转换成字符串显示，设置成false，表示将value值当做html代码去解析。 -->
					    <s:property value="#tousu.tousuYuanyin" escape="false"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:if test="#tousu.tousuZhuangtai=='weishouli'">
					         <font style="color: green;font-size: 23px;">未受理</font>
					    </s:if>
					    <s:if test="#tousu.tousuZhuangtai=='yishouli'">
					         <font color="red">已受理</font>
					    </s:if>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <input type="button" value="我要投诉" style="width: 80px;" onclick="tousuAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
