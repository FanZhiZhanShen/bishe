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
           function zhuhuDel(zhuhuId) {
           //confirm用于弹窗，点击OK返回true
               if(confirm('您确定删除吗？'))
               {
              		//action通过?这种方式给zhuhuDel方法里的zhuhuId赋值
                   window.location.href="<%=path %>/zhuhuDel.action?zhuhuId="+zhuhuId;
               }
           }
           
           function zhuhuEditPre(zhuhuId)
           {
                   window.location.href="<%=path %>/zhuhuEditPre.action?zhuhuId="+zhuhuId;
           }
           
           function zhuhuAdd()
           {
                 var url="<%=path %>/admin/zhuhu/zhuhuAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <form action="<%=path %>/zhuhuSearch.action" name="" method="post">
			              住户姓名：<input type="text" name="zhuhuName" size="20"/>
			           <input type="submit" name="" value="查询"/>
			        </form>
			    </td>
			  </tr>
		    </table>
		    
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="12" background="<%=path %>/images/tbg.gif">&nbsp;住户维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">房号</td>
					<td width="8%">姓名</td>
					<td width="9%">身份证号</td>
					<td width="7%">联系方式</td>
					<td width="8%">房型</td>
					<td width="8%">建筑面积</td>
					<td width="8%">入住时间</td>
					<td width="8%">车辆信息</td>
					<td width="5%">登录帐号</td>
					<td width="5%">登录密码</td>
					<td width="10%">操作</td>
		        </tr>	
		        <!-- 先用ognl表达式#获取域对象 -->
				<s:iterator value="#request.zhuhuList" id="zhuhu">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.fangwuno"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuIdcard"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuTel"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuFangxing"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuMianji"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuRuzhushijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuhu.zhuhuCheliangxinxi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuhu.userName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuhu.userPw"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="zhuhuDel(<s:property value="#zhuhu.zhuhuId"/>)">删除</a>
					    <a href="#" onclick="zhuhuEditPre(<s:property value="#zhuhu.zhuhuId"/>)">编辑</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="zhuhuAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
