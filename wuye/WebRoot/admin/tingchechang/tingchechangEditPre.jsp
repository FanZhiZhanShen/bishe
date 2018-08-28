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
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/tingchechangEdit.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>停车场修改</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						                  所属停车场：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    <!-- 这里设置value使得点编辑的时候直接显示的就是要编辑的那个停车场名 -->
						        <select name="tingchechangname" value="${request.tingchechang.tingchechangname}">
						        	<!-- 选择了一个后提交了   回到本页后显示之前选中的值 -->
						        	<option value="南门停车场" <c:if test="${request.tingchechang.tingchechangname=='南门停车场'}">selected</c:if>>南门停车场</option>
						        	<option value="东门停车场" <c:if test="${request.tingchechang.tingchechangname=='东门停车场'}">selected</c:if>>东门停车场</option>
						        	<option value="西门停车场" <c:if test="${request.tingchechang.tingchechangname=='西门停车场'}">selected</c:if>>西门停车场</option>
						        	<option value="北门停车场" <c:if test="${request.tingchechang.tingchechangname=='北门停车场'}">selected</c:if>>北门停车场</option>
						        	<option value="地下停车场一层" <c:if test="${request.tingchechang.tingchechangname=='地下停车场一层'}">selected</c:if>>地下停车场一层</option>
						        	<option value="地下停车场二层" <c:if test="${request.tingchechang.tingchechangname=='地下停车场二层'}">selected</c:if>>地下停车场二层</option>
						        </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          价格(元/小时)：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="danjia" size="20" value="${request.tingchechang.danjia}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          状态：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select name="cheweizhuangtai">
						        	<option value="">=请选择=</option>
						        	<option value="闲置中" <c:if test="${request.tingchechang.cheweizhuangtai=='闲置中'}">selected</c:if>>闲置中</option>
						        	<option value="使用中" <c:if test="${request.tingchechang.cheweizhuangtai=='使用中'}">selected</c:if>>使用中</option>
						        </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="id" value="${request.tingchechang.id }"/>
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
