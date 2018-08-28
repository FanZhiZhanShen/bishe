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
           function shoufeiEditPre(shoufeiId)
           {
               window.location.href="<%=path %>/userShoufeiEditPre.action?shoufeiId="+shoufeiId;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6" background="<%=path %>/images/tbg.gif">&nbsp;收费管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">住户姓名</td>
					<td width="20%">收费时间</td>
					<td width="20%">收费项目</td>
					<td width="10%">应缴金额</td>
					<td width="10%">已缴金额</td>
					<td width="20%">操作</td>
		        </tr>	
				<s:iterator value="#request.shoufeiList" id="shoufei">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shoufei.zhuhuName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shoufei.shoufeiShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#shoufei.shoufeiXiangmu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#shoufei.shoufeiJine"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#shoufei.yijiaojine"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${shoufei.shoufeiJine-shoufei.yijiaojine>0}">
							<a href="#" onclick="shoufeiEditPre(<s:property value="#shoufei.shoufeiId"/>)">缴费</a>
						</c:if>
						<c:if test="${shoufei.shoufeiJine-shoufei.yijiaojine<=0}">
							已缴费
						</c:if>
					</td>
				</tr>
				</s:iterator>
			</table>
			
	</body>
</html>
