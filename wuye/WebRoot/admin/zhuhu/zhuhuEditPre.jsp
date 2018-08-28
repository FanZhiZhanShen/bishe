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
        function check()
			{
				if(document.formAdd.zhuhuName.value == "" )
				{
					alert("请输入姓名!");
					document.formAdd.zhuhuName.focus();
					return false;
				}
				else if (document.formAdd.zhuhuTel.value == "" ) 
				{
					alert("请输入联系方式!");
					document.formAdd.zhuhuTel.focus();
					return false;
				}
				else if (document.formAdd.zhuhuIdcard.value == "" ) 
				{
					alert("请输入身份证号码!");
					document.formAdd.zhuhuIdcard.focus();
					return false;
				}
				else
				{
					// /^和$/表示开头和结尾
					var tel = /^(1[3578][0-9]{9})$/;
					var sfz = /^[1-9]([0-9]{16})[X0-9]$/;
					//test()方法用于检测一个字符串是否匹配某个模式
					if (!tel.test(document.formAdd.zhuhuTel.value))
					{
						alert("联系方式格式不正确!");
						return false;
					}
					else if (!sfz.test(document.formAdd.zhuhuIdcard.value))
					{
						alert("身份证号码格式不正确!");
						return false;
					}
					else
					{
						this.formAdd.submit();
					}
				}
			}
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/zhuhuEdit.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>住户修改</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						                  姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhuhuName" size="20" value="${request.zhuhu.zhuhuName}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          身份证号码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhuhuIdcard" size="20" value="${request.zhuhu.zhuhuIdcard}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          联系方式：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhuhuTel" size="20" value="${request.zhuhu.zhuhuTel}"/>
						    </td>
						</tr>
						
						
						<tr align='center' bgcolor="#FFFFFF"
							onMouseMove="javascript:this.bgColor='red';"
							onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						<td width="25%" bgcolor="#FFFFFF" align="right">
							房屋选择：
						</td>
						<td width="75%" bgcolor="#FFFFFF" align="left">
							<table border="0">
								<tr>
									<td>
									<!-- onchange()事件当域的内容改变时发生 -->
										<select name="fangwuno" id="fangwuno" onchange="fangwuSelect()"></select>
									</td>
									<td>
										<img id="indicator" src="<%=path %>/images/loading.gif"
											style="display: none" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          房型：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input readonly="readonly" id="zhuhuFangxing" type="text" name="zhuhuFangxing" size="20" value="${request.zhuhu.zhuhuFangxing}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          建筑面积：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input readonly="readonly" type="text" id="zhuhuMianji" name="zhuhuMianji" size="20" value="${request.zhuhu.zhuhuMianji}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          入住时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhuhuRuzhushijian" size="20" value="${request.zhuhu.zhuhuRuzhushijian}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          车辆信息：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhuhuCheliangxinxi" size="20" value="${request.zhuhu.zhuhuCheliangxinxi}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         登录帐号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="userName" size="20" value="${request.zhuhu.userName}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         登录密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="userPw" size="20" value="${request.zhuhu.userPw}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="zhuhuId" value="${request.zhuhu.zhuhuId }"/>
						       <input type="submit" value="提交" onclick="return check();"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
   
   <script language="JavaScript" src="<%=path %>/js/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script language='javascript'>
		//jquery中的$(document).ready(function())函数表示当页面（DOM）加载完之后，自动执行代码
				$(document).ready(function(){
					var selected = "${request.zhuhu.fangwuno}";
					$.ajax({ 
					   type: "POST", 
					   url: "fangwuQuery.action", 
					   //data是response.getWriter().print(fangwuJson);
					   success: function(data){ 
					   		var fangwuList = eval(data);
					   		$("#fangwuno").html('<option value="0">请选择房号</option>');
					   		for(var i in fangwuList) {
					   			var fangwuItem = fangwuList[i];
					   			if(fangwuList[i].fangwuno == selected) {
						   			$("#fangwuno").append('<option selected="selected" value="'+fangwuList[i].fangwuno+'">'+fangwuList[i].fangwuno+'</option>');
					   			} else {
						   			$("#fangwuno").append('<option value="'+fangwuList[i].fangwuno+'">'+fangwuList[i].fangwuno+'</option>');
					   			}
					   		}
					   } ,
			           error : function(){
			               alert("error");
			           }
					});
				});
	           function fangwuSelect()
	           {
					$.ajax({ 
					   type: "POST", 
					   url: "fangwuQuery.action", 
					   //val() 方法返回或设置被选元素的值
					   data:{fangwuno:$("#fangwuno").val()},
					   success: function(data){ 
					   		var fangwu = eval(data)[0];
					   		//与上面input标签的id相对应，使之直接显示
					   		$("#zhuhuFangxing").val(fangwu.fangxing);
					   		$("#zhuhuMianji").val(fangwu.mianji);
					   } ,
			           error : function(){
			               alert("error");
			           }
					});               
	           }
	</script>
</html>
