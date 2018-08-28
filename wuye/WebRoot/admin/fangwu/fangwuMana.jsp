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
           function fangwuDel(id) {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/fangwuDel.action?id="+id;
               }
           }
           
           function fangwuEditPre(id)
           {
                   window.location.href="<%=path %>/fangwuEditPre.action?id="+id;
           }
           
           function fangwuAdd()
           {
                 var url="<%=path %>/admin/fangwu/fangwuAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <form action="<%=path %>/fangwuSearch.action" name="" method="post">
			              房屋名称：<input type="text" name="name" size="20"/>
			           <input type="submit" name="" value="查询"/>
			        </form>
			    </td>
			  </tr>
		    </table>
		    
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/images/tbg.gif">&nbsp;房屋维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">房号</td>
					<td width="10%">房屋名称</td>
					<td width="10%">面积</td>
					<td width="10%">位置</td>
					<td width="10%">房型</td>
					<td width="10%">单价</td>
					<td width="10%">总价</td>
					<td width="10%">住户</td>
					<td width="10%">住户电话</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.fangwuList" id="fangwu">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.fangwuno"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.name"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.mianji"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.weizhi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.fangxing"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.danjia"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.zongjia"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.zhuhu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#fangwu.zhuhuTel"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="fangwuDel(<s:property value="#fangwu.id"/>)">删除</a>
					    <a href="#" onclick="fangwuEditPre(<s:property value="#fangwu.id"/>)">编辑</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="fangwuAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
