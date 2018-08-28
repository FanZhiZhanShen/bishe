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
           function shoufeiDel(shoufeiId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/shoufeiDel.action?shoufeiId="+shoufeiId;
               }
           }
           
           function notice(shoufeiId)
           {
               if(confirm('您确定要发送通知吗？'))
               {
                   window.location.href="<%=path %>/shoufeiNotice.action?shoufeiId="+shoufeiId;
               }
           }
           
           function shoufeiEditPre(shoufeiId)
           {
               window.location.href="<%=path %>/shoufeiEditPre.action?shoufeiId="+shoufeiId;
           }
           
           function shoufeiAdd()
           {
                 var url="<%=path %>/admin/shoufei/shoufeiAdd.jsp";
				 window.location.href=url;
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
						<a href="#" onclick="shoufeiDel(<s:property value="#shoufei.shoufeiId"/>)">删除</a>
						<c:if test="${shoufei.isnotice == ''||shoufei.isnotice == null}">
							<a href="#" onclick="notice(<s:property value="#shoufei.shoufeiId"/>)">通知</a>
						</c:if>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="shoufeiAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
