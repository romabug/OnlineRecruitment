<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>台州网通行证</title>
<script type="text/javascript" src="index.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>

<div align="center">

	<table border="0" width="780" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
		<tr>
			<td width="298" height="60" valign="top">
			<img border="0" src="../images/logo_1.gif" width="210" height="45"></td>
			<td width="462" height="60" align="right" valign="bottom"><b>一次登陆　通行台州</b></td>
		</tr>
		<tr style="background-image: url('../images/login_top_bg_1.jpg'); background-repeat: repeat-x">
			<td width="298" height="32">&nbsp;<img border="0" src="../images/home.gif" align="absmiddle"> <a href="http://www.taizhou.com" hidefocus="true" class="line">首页</a> 
			<img border="0" src="../images/bullet.gif" width="13" height="9"> <a href="./" hidefocus="true" class="line">通行证</a> 
			<img border="0" src="../images/bullet.gif" width="13" height="9"> 注册通行证</td>
			<td width="462" height="32" align="right">
			<img border="0" src="../images/help.gif" width="12" height="13" align="absmiddle">
			<u><a href="./help1.asp" hidefocus="true" class="line">帮助中心</a></u></td>
		</tr>
	</table>

	<script type="text/javascript" src="script/index.js?x"></script>
	<script type="text/javascript" src="script/string.js?1"></script>
	<script language="javascript">
	window.onload = function() {
		document.forms[0].elements[0].focus();
	}
	function chooseUsername() {
		var _value = document.forms[0].elements[0].value.toLowerCase();
		if (_value.length>3&&checkUsername(_value)){
			var open_url = "checkuser.asp?username=" + _value;
			var _return = showDialog(open_url, 350, 240, _value);
			document.forms[0].elements[0].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
		}
		else
			document.forms[0].elements[0].focus();
	}
	function checkSubmit() {
		var _obj = [];
		for(_i=0;_i<13;_i++) {
			_obj[_i] = document.forms[0].elements[_i];
		}
		if(_obj[0].value.length<4||_obj[0].value.length>20) {
			alert("请正确填写帐号！\n用户名长度为4-20位。");
			_obj[0].focus();
			return false;
		}
		else if(!checkUsername(_obj[0].value)) {
			alert("请正确填写帐号！\n不能以下划线或连接线结尾！");
			_obj[0].focus();
			return false;
		}
		else if(_obj[4].value.length<6||_obj[4].value.length>20) {
			alert("请正确填写密码！");
			_obj[4].focus();
			return false;
		}
		else if(_obj[5].value.length<6||_obj[5].value.length>20||_obj[4].value!=_obj[5].value) {
			_obj[5].value = '';
			alert("请正确填写重复密码！");
			_obj[5].focus();
			return false;
		}
		else if(_obj[6].value.length<3||_obj[6].value.length>30) {
			alert("请正确填写密码提示问题！");
			_obj[6].focus();
			return false;
		}
		else if(_obj[8].value.length<3||_obj[8].value.length>30) {
			alert("请正确填写提示问题答案！");
			_obj[8].focus();
			return false;
		}
		else if(_obj[9].value.length<6||_obj[9].value.length>20) {
			alert("请正确填写安全码！");
			_obj[9].focus();
			return false;
		}
		else if(_obj[10].value.length<6||_obj[10].value.length>20||_obj[9].value!=_obj[10].value) {
			_obj[10].value = '';
			alert("请正确填写重复安全码！");
			_obj[10].focus();
			return false;
		}
		else if(_obj[11].value.length==0) {
			alert("邮件地址必须填写！");
			_obj[11].focus();
			return false;
		}
		else if(!_obj[11].value.strEmail()) {
			alert("保密邮箱地址填写不正确！");
			_obj[11].focus();
			return false;
		}
		else if(_obj[12].value.length==0) {
			alert("昵称必须填写！");
			_obj[12].focus();
			return false;
		}
		else {
			return true;
		}
	}
	</script>
	<table border="0" width="780" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
		<tr>
			<td width="298" height="28"><img border="0" src="../images/ico_1.gif" align="absmiddle"> 选择帐户及类型</td>
			<td width="462" height="28" align="right"><script type="text/javascript">loadStep("通行证注册",2);</script></td>
		</tr>
		<tr>
			<td width="780" height="1" colspan="2" bgcolor="#C0C0C0"></td>
		</tr>
		<tr>
			<td width="780" colspan="2" style="padding-left:10px; padding-right:10px; padding-top:10px; padding-bottom:30px;" id="content" align="center">
			<table border="0" width="740" cellpadding="0" style="border-collapse: collapse" height="234">
				<tr>
					<td height="27">·请认真填写以下资料，带(<img border="0" src="../images/must.gif" align="absmiddle">)的项目必须填写。</td>
				</tr>
				<tr>
					<td style="border:1px solid #999999;" align="center">
					<table border="0" cellpadding="5" style="border-collapse: collapse" width="738" height="550" id="reg">
						<form method="post" action="Register.asp" onsubmit="return checkSubmit();"><tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="15">
							</td>
							<td width="323" height="15" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" height="22" colspan="2">
							　登录台州网使用的标识(英文/数字/下划线/连接线，4-20个字符)</td>
							<td width="323" height="72" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							可以是英文和数字的组合，可使用连线及下划线(&quot;-&quot;和&quot;_&quot;)，4个字符≤ 账号长度 ≤20个字符，不区分英文字母大小写，勿使用下划线和连接线开头结尾。 <br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="133" align="right" bgcolor="#F5F5F5" height="13">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>通行证帐号</b>：</td>
							<td width="281" bgcolor="#F5F5F5" height="13">
							<input type="text" name="frmUsername" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'username',5);" onpaste="return regInput(this,'username',true);" value=""></td>
						</tr>
						<tr>
							<td width="133" align="right" bgcolor="#F5F5F5" height="22">
							</td>
							<td width="281" bgcolor="#F5F5F5" height="22">
							<button onfocus="blur();" onclick="chooseUsername();" style="width:170px;"><img border="0" src="../images/check2.gif" align="absmiddle"> 检查帐号是否已经被申请</button></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr style="display:none;">
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr style="display:none;">
							<td width="415" bgcolor="#F5F5F5" colspan="2">　选择通行证账户类型</td>
							<td width="323" bgcolor="#FAFAFA">　</td>
						</tr>
						<tr style="display:none;">
							<td width="117" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>账户类型</b>：</td>
							<td width="275" bgcolor="#F5F5F5">
							<input type="radio" value="0" name="frmUsercate" checked id="frmUsercate_0" checked><label for="frmUsercate_0">个人帐户</label>　<input type="radio" value="1" name="frmUsercate" id="frmUsercate_1"><label for="frmUsercate_1">企业帐户</label></td>
							<td width="323" bgcolor="#FAFAFA">　</td>
						</tr>
						<tr style="display:none;">
							<td width="117" bgcolor="#F5F5F5">　</td>
							<td width="275" bgcolor="#F5F5F5">
							<font color="#FF3300">注意：以上项目在注册成功后不允许修改</font></td>
							<td width="323" bgcolor="#FAFAFA">　</td>
						</tr>
						<tr style="display:none;">
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2">　登陆密码(区分英文大小写，6-20个字符)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							可使用任何英文字母(包括特殊字符)及阿拉伯数字组合，6个字符 ≤ 密码长度 ≤ 20个字符，区分英文字母大小写，请勿使用空格。<br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>输入登录密码</b>：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmPassword" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>重复输入密码</b>：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmRepassword" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2">　密码查询设置(字母/数字/汉字)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							忘记密码时，您找回密码的身份凭证，请务必牢记！<br>
							6个字符 ≤ 问题/答案长度 ≤ 30个字符，区分英文字母大小写。<br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>密码提示问题</b> ：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmQuestion" class="reg" maxlength="30" size="34" onkeypress="return checkInput();" value="" style="width:218px;border-right:0px;"><span style="z-index:-1;border:1px solid #A5A5A5;border-left: 0px;width:17px;"><select onchange="if(this.options[this.selectedIndex].text!='请选择...')this.parentNode.parentNode.childNodes[0].value=this.options[this.selectedIndex].text" style="width:234px;margin:-2px -2px -2px -216px;z-index:-1;"><option>请选择...</option><option>母亲的名字</option><option>父亲的名字</option><option>父亲出生的城市</option><option>您其中一位老师的名字</option><option>您个人计算机的型号</option><option>您最喜欢的餐馆的名称</option><option>身份证号码的最后6位数字</option><option>驾驶执照的最后6位数字</option></select></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>提示问题答案</b> ：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmAnswer" class="reg" maxlength="30" size="34" onkeypress="return checkInput();" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2">　安全码查询设置(字母/数字)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							忘记密码时做为重置密码的凭证，可使用任何英文字母(包括特殊字符)及阿拉伯数字组合，6个字符 ≤ 密码长度 ≤ 20个字符，区分英文字母大小写，请勿使用空格。</td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>输入安全码</b>：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmVcode" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>安全码确认</b>：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmRevcode" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2">　安全邮件地址</td>
							<td width="323" rowspan="2" valign="top" class="note" bgcolor="#FAFAFA">
							丢失密码后可使用该邮件地址取回密码<br>
							如：<span class="eng_link">username@taizhou.com</span><br>
							<span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>保密邮箱地址</b> ：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmMail" id="frmMail" class="reg" maxlength="30" style="ime-mode:Disabled" onkeypress="return regInput(this,'mail');" onpaste="return regInput(this,'mail',true);" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" style="border-bottom:1px solid #DADADA;">
							</td>
							<td width="323" height="5" style="border-bottom:1px solid #DADADA;" bgcolor="#FAFAFA">
							</td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2" height="10">
							</td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2">　昵称</td>
							<td width="323" rowspan="2" valign="top" class="note" bgcolor="#FAFAFA">
							昵称一经设置不可修改，请慎重考虑后填写，<font color="#FF3300">将显示在论坛和相关其他栏目中</font>。</span><br>
							<span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>用户昵称</b> ：</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmBbsname" id="frmBbsname" class="reg" maxlength="12" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2"><input type="submit" value="提交" name="frmSubmit" id="frmSubmit" style="display:none;"></td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
					</table>
					</td>
				</tr></form>
			</table>
			<br>
			<br>
			<button onfocus="blur();" onclick="if(checkSubmit())document.forms[0].submit();"><img border="0" src="../images/ok.gif" align="absmiddle"> 提交注册</button>
			　<button onfocus="blur();" onclick="window.location.href='./Service.asp';"><img border="0" src="../images/check.gif" align="absmiddle"> 返回上一步</button></td>
		</tr>
	</table>
<table border="0" width="780" cellspacing="0" cellpadding="0" style="border-collapse: collapse" height="62">
	<tr>
		<td width="780" height="3" bgcolor="#FFE600"></td>
	</tr>
	<tr>
		<td width="780" height="1" bgcolor="#C0C0C0"></td>
	</tr>
	<tr>
		<td width="780" height="58" align="center" style="line-height: 180%" valign="bottom">
		台州网简介 | 广告服务 | 招聘信息 | 网站律师 | 联系方式 | 产品答疑<br>
		台州网版权所有 since 2005</td>
	</tr>
</table>
</div>
<span style="display:none;"><script src="http://count6.51yes.com/click.aspx?id=69264747&logo=1"></script></span>
</body>

</html>