<%@ page language="java" pageEncoding="utf-8"%>
<%
	/*
	  request.getScheme();可以返回当前页面所使用的协议，就是"http"
	  request.getServerName();返回当前页面所在服务器的名字，就是上面例子中的"localhost"
	  request.getServerPort();返回当前页面所在服务器的端口号，就是上面例子中的"8085"
	  request.getContextPath();返回当前页面所在的应用的名字，wuye
	*/
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title>login.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">
	<style type="text/css">
	    body 
	    {
		   margin-left: 0px;
		   background-image: url(<%=path%>/images/bhj.jpg);
	    }
	    .style2 {color: #990000}
	    .input2 
	    {
	 	   font-size: 12px;
		   border: 3px double #A8D0EE;
		   color: #344898;
	    }
	    .submit1 
	    {
		   border: 3px double #416C9C;
		   height: 22px;
		   width: 45px;
		   background-color: #F2F2F2;
		   font-size: 12px;
		   padding-top: 1px;
		   background-image: url(bt.gif);
		   cursor: hand;
	    }
	    .STYLE12 {font-family: Georgia, "Times New Roman", Times, serif}
	    .STYLE13 {color: #316BD6; }
	    .STYLE15 {color: #fdsere; font-size: 9pt; }
	 </style>

	<script language="JavaScript" src="<%=path%>/js/public.js"
		type="text/javascript"></script>
		
	<!-- 这三行是dwr框架的引入，第一个loginService.js是根据dwr.xml自动生成的
		  是dwr框架的配置 -->
	<script type='text/javascript' src='<%=path%>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>

	<script language="javascript">
	
		 function check1()
		 {                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
			 	//将输入光标定位到这个文本框里
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 if(document.ThisForm.userType.value=="-1")
			 {
			 	alert("请选择登陆身份");
				document.ThisForm.userType.focus();
				return false;
			 }
			 if(document.ThisForm.checkCode.value=="")
			 {
			 	alert("请输入验证码");
				document.ThisForm.checkCode.focus();
				return false;
			 }
			  //style.display="block"此元素将显示为块级元素，此元素前后会带有换行符。
			 document.getElementById("indicator").style.display="block";
			 //因为在dwr.xml中配置了，所以这里可以直接使用后台方法，最后一个参数是回调函数，存的是login方法的返回值
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,document.ThisForm.checkCode.value, callback);
		 }
		
		//data是loginService.login的返回值，后台传输过来的数据
		 function callback(data)
		 {
			 //设置为none值表示该图标将会被隐藏
		    document.getElementById("indicator").style.display="none";
		    if(data=="checkcodeerror")
		    {
		        alert("验证码错误!");
		    } else if(data=="no")
		    {
		        alert("用户名或密码错误");
		    } else if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        //向指定url调转并提交数据
		        window.location.href="<%=path%>/loginSuccess.jsp";
		    }
		 }		 
	</script>
</head>
<body>
<body>
	<br>
	<br>
	<br>
	<br>
	<table width="559" height="423" border="0" align="center"
		cellpadding="0" cellspacing="0"
		background="<%=path%>/images/dfff.jpg">
		<tr>
			<td>
				<div align="center" style="FONT-WEIGHT: bold; FONT-SIZE: 40pt;">
					致馨白领公寓管理系统
				</div>
			</td>
		</tr>
		<tr>
			<td width="559">
			<!-- action不写值代表提交到本页面 -->
				<form name="ThisForm" method="POST" action="">
					<table width="410" height="198" border="0" align="right"
						cellpadding="0" cellspacing="0">
						
						<tr>
							<td height="31" colspan="2" valign="top" class="STYLE15">
								用户名：
								<input name="userName" type="text" class="input2"
									onMouseOver="this.style.background='#F0DAF3';"
									onMouseOut="this.style.background='#FFFFFF'">
							</td>
						</tr>
						
						
						<tr>
							<td height="10" colspan="2" valign="bottom"></td>
						</tr>
						<tr>
							<td height="31" colspan="2" valign="top" class="STYLE15">
								密&nbsp;&nbsp;&nbsp;&nbsp;码：
								<input name="userPw" type="password" size="21" class="input2"
									align="bottom" onMouseOver="this.style.background='#F0DAF3';"
									onMouseOut="this.style.background='#FFFFFF'">
							</td>
						</tr>
						<tr>
							<td height="10" colspan="2" valign="bottom"></td>
						</tr>
						<!-- 这个多选框是内嵌在这个单元格里的 -->
						<tr style="display: block">
							<td height="31" colspan="2" valign="top" class="STYLE15">
								身&nbsp;&nbsp;&nbsp;&nbsp;份：
								<select class="INPUT_text" name="userType">
								<!-- selected属性规定选项（在首次显示在列表中时）表现为选中状态 -->
									<option value="-1" selected="selected">
										请选择登陆身份
									</option>
									<option value="0">
										管理员
									</option>
									<option value="1">
										住&nbsp;&nbsp;&nbsp;户
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td height="10" colspan="2" valign="bottom"></td>
						</tr>
						<tr>
							<td height="31" colspan="2" valign="top" class="STYLE15">
								<br/><br/><br/>
								
								
								验证码：
								<!-- getcaptcha.sl在web.xml中配置了servlet -->
								<input id="checkCode" class="input2"/><img src="getcaptcha.sl" alt="验证码" name="checkImg" id="checkImg" style="position:relative; top:5px; left:20px; " onClick="document.getElementById('checkImg').src='getcaptcha.sl?temp='+ (new Date().getTime().toString(36)); return false"/> 
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top">							
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
								<input name="button" type="button" class="submit1" value="登录"
									onclick="check1()">
								&nbsp;
								<input name="Submit2" type="reset" class="submit1" value="重置">
								&nbsp;
								&nbsp;
								<img id="indicator" src="<%=path%>/images/loading.gif"
									style="display:none" />
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
