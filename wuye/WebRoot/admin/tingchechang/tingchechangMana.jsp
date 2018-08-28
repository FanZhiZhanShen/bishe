<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
           function tingchechangDel(id) {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/tingchechangDel.action?id="+id;
               }
           }
           
           function tingchechangEditPre(id)
           {
                   window.location.href="<%=path %>/tingchechangEditPre.action?id="+id;
           }
           
           function tingchechangAdd()
           {
                 var url="<%=path %>/admin/tingchechang/tingchechangAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <form action="<%=path %>/tingchechangSearch.action" name="" method="post">
			              停车场名称：<input type="text" name="tingchechangname" size="20"/>
			           <input type="submit" name="" value="查询"/>
			        </form>
			    </td>
			  </tr>
		    </table>
		    
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5" background="<%=path %>/images/tbg.gif">&nbsp;停车场维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				<!-- 	<td width="20%">车位编号</td> -->
					<td width="20%">停车场</td>
					<td width="20%">价格(元/小时)</td>
					<td width="20%">状态</td>
					<td width="20%">操作</td>
		        </tr>	
				<s:iterator value="#request.tingchechangList" id="tingchechang">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<!--  	<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tingchechang.id"/>
					</td>-->
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tingchechang.tingchechangname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tingchechang.danjia"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tingchechang.cheweizhuangtai"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="tingchechangDel(<s:property value="#tingchechang.id"/>)">删除</a>
					    <a href="#" onclick="tingchechangEditPre(<s:property value="#tingchechang.id"/>)">编辑</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="tingchechangAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
