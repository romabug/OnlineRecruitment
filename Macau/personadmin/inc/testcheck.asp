<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>̨����ͨ��֤</title>
<script type="text/javascript" src="index.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>

<div align="center">

	<table border="0" width="780" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
		<tr>
			<td width="298" height="60" valign="top">
			<img border="0" src="../images/logo_1.gif" width="210" height="45"></td>
			<td width="462" height="60" align="right" valign="bottom"><b>һ�ε�½��ͨ��̨��</b></td>
		</tr>
		<tr style="background-image: url('../images/login_top_bg_1.jpg'); background-repeat: repeat-x">
			<td width="298" height="32">&nbsp;<img border="0" src="../images/home.gif" align="absmiddle"> <a href="http://www.taizhou.com" hidefocus="true" class="line">��ҳ</a> 
			<img border="0" src="../images/bullet.gif" width="13" height="9"> <a href="./" hidefocus="true" class="line">ͨ��֤</a> 
			<img border="0" src="../images/bullet.gif" width="13" height="9"> ע��ͨ��֤</td>
			<td width="462" height="32" align="right">
			<img border="0" src="../images/help.gif" width="12" height="13" align="absmiddle">
			<u><a href="./help1.asp" hidefocus="true" class="line">��������</a></u></td>
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
			alert("����ȷ��д�ʺţ�\n�û�������Ϊ4-20λ��");
			_obj[0].focus();
			return false;
		}
		else if(!checkUsername(_obj[0].value)) {
			alert("����ȷ��д�ʺţ�\n�������»��߻������߽�β��");
			_obj[0].focus();
			return false;
		}
		else if(_obj[4].value.length<6||_obj[4].value.length>20) {
			alert("����ȷ��д���룡");
			_obj[4].focus();
			return false;
		}
		else if(_obj[5].value.length<6||_obj[5].value.length>20||_obj[4].value!=_obj[5].value) {
			_obj[5].value = '';
			alert("����ȷ��д�ظ����룡");
			_obj[5].focus();
			return false;
		}
		else if(_obj[6].value.length<3||_obj[6].value.length>30) {
			alert("����ȷ��д������ʾ���⣡");
			_obj[6].focus();
			return false;
		}
		else if(_obj[8].value.length<3||_obj[8].value.length>30) {
			alert("����ȷ��д��ʾ����𰸣�");
			_obj[8].focus();
			return false;
		}
		else if(_obj[9].value.length<6||_obj[9].value.length>20) {
			alert("����ȷ��д��ȫ�룡");
			_obj[9].focus();
			return false;
		}
		else if(_obj[10].value.length<6||_obj[10].value.length>20||_obj[9].value!=_obj[10].value) {
			_obj[10].value = '';
			alert("����ȷ��д�ظ���ȫ�룡");
			_obj[10].focus();
			return false;
		}
		else if(_obj[11].value.length==0) {
			alert("�ʼ���ַ������д��");
			_obj[11].focus();
			return false;
		}
		else if(!_obj[11].value.strEmail()) {
			alert("���������ַ��д����ȷ��");
			_obj[11].focus();
			return false;
		}
		else if(_obj[12].value.length==0) {
			alert("�ǳƱ�����д��");
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
			<td width="298" height="28"><img border="0" src="../images/ico_1.gif" align="absmiddle"> ѡ���ʻ�������</td>
			<td width="462" height="28" align="right"><script type="text/javascript">loadStep("ͨ��֤ע��",2);</script></td>
		</tr>
		<tr>
			<td width="780" height="1" colspan="2" bgcolor="#C0C0C0"></td>
		</tr>
		<tr>
			<td width="780" colspan="2" style="padding-left:10px; padding-right:10px; padding-top:10px; padding-bottom:30px;" id="content" align="center">
			<table border="0" width="740" cellpadding="0" style="border-collapse: collapse" height="234">
				<tr>
					<td height="27">����������д�������ϣ���(<img border="0" src="../images/must.gif" align="absmiddle">)����Ŀ������д��</td>
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
							����¼̨����ʹ�õı�ʶ(Ӣ��/����/�»���/�����ߣ�4-20���ַ�)</td>
							<td width="323" height="72" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							������Ӣ�ĺ����ֵ���ϣ���ʹ�����߼��»���(&quot;-&quot;��&quot;_&quot;)��4���ַ��� �˺ų��� ��20���ַ���������Ӣ����ĸ��Сд����ʹ���»��ߺ������߿�ͷ��β�� <br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="133" align="right" bgcolor="#F5F5F5" height="13">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>ͨ��֤�ʺ�</b>��</td>
							<td width="281" bgcolor="#F5F5F5" height="13">
							<input type="text" name="frmUsername" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'username',5);" onpaste="return regInput(this,'username',true);" value=""></td>
						</tr>
						<tr>
							<td width="133" align="right" bgcolor="#F5F5F5" height="22">
							</td>
							<td width="281" bgcolor="#F5F5F5" height="22">
							<button onfocus="blur();" onclick="chooseUsername();" style="width:170px;"><img border="0" src="../images/check2.gif" align="absmiddle"> ����ʺ��Ƿ��Ѿ�������</button></td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">��ѡ��ͨ��֤�˻�����</td>
							<td width="323" bgcolor="#FAFAFA">��</td>
						</tr>
						<tr style="display:none;">
							<td width="117" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>�˻�����</b>��</td>
							<td width="275" bgcolor="#F5F5F5">
							<input type="radio" value="0" name="frmUsercate" checked id="frmUsercate_0" checked><label for="frmUsercate_0">�����ʻ�</label>��<input type="radio" value="1" name="frmUsercate" id="frmUsercate_1"><label for="frmUsercate_1">��ҵ�ʻ�</label></td>
							<td width="323" bgcolor="#FAFAFA">��</td>
						</tr>
						<tr style="display:none;">
							<td width="117" bgcolor="#F5F5F5">��</td>
							<td width="275" bgcolor="#F5F5F5">
							<font color="#FF3300">ע�⣺������Ŀ��ע��ɹ��������޸�</font></td>
							<td width="323" bgcolor="#FAFAFA">��</td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">����½����(����Ӣ�Ĵ�Сд��6-20���ַ�)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							��ʹ���κ�Ӣ����ĸ(���������ַ�)��������������ϣ�6���ַ� �� ���볤�� �� 20���ַ�������Ӣ����ĸ��Сд������ʹ�ÿո�<br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>�����¼����</b>��</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmPassword" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>�ظ���������</b>��</td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">�������ѯ����(��ĸ/����/����)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							��������ʱ�����һ���������ƾ֤��������μǣ�<br>
							6���ַ� �� ����/�𰸳��� �� 30���ַ�������Ӣ����ĸ��Сд��<br><br><span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>������ʾ����</b> ��</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmQuestion" class="reg" maxlength="30" size="34" onkeypress="return checkInput();" value="" style="width:218px;border-right:0px;"><span style="z-index:-1;border:1px solid #A5A5A5;border-left: 0px;width:17px;"><select onchange="if(this.options[this.selectedIndex].text!='��ѡ��...')this.parentNode.parentNode.childNodes[0].value=this.options[this.selectedIndex].text" style="width:234px;margin:-2px -2px -2px -216px;z-index:-1;"><option>��ѡ��...</option><option>ĸ�׵�����</option><option>���׵�����</option><option>���׳����ĳ���</option><option>������һλ��ʦ������</option><option>�����˼�������ͺ�</option><option>����ϲ���Ĳ͹ݵ�����</option><option>���֤��������6λ����</option><option>��ʻִ�յ����6λ����</option></select></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>��ʾ�����</b> ��</td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">����ȫ���ѯ����(��ĸ/����)</td>
							<td width="323" rowspan="3" valign="top" class="note" bgcolor="#FAFAFA">
							��������ʱ��Ϊ���������ƾ֤����ʹ���κ�Ӣ����ĸ(���������ַ�)��������������ϣ�6���ַ� �� ���볤�� �� 20���ַ�������Ӣ����ĸ��Сд������ʹ�ÿո�</td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>���밲ȫ��</b>��</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="password" name="frmVcode" class="reg" maxlength="20" style="ime-mode:Disabled" onkeypress="return regInput(this,'password');" onpaste="return regInput(this,'password',true);" value=""></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>��ȫ��ȷ��</b>��</td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">����ȫ�ʼ���ַ</td>
							<td width="323" rowspan="2" valign="top" class="note" bgcolor="#FAFAFA">
							��ʧ������ʹ�ø��ʼ���ַȡ������<br>
							�磺<span class="eng_link">username@taizhou.com</span><br>
							<span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>���������ַ</b> ��</td>
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
							<td width="415" bgcolor="#F5F5F5" colspan="2">���ǳ�</td>
							<td width="323" rowspan="2" valign="top" class="note" bgcolor="#FAFAFA">
							�ǳ�һ�����ò����޸ģ������ؿ��Ǻ���д��<font color="#FF3300">����ʾ����̳�����������Ŀ��</font>��</span><br>
							<span class="error"></span></td>
						</tr>
						<tr>
							<td width="123" bgcolor="#F5F5F5" align="right">
							<img border="0" src="../images/must.gif" align="absmiddle"> 
							<b>�û��ǳ�</b> ��</td>
							<td width="277" bgcolor="#F5F5F5">
							<input type="text" name="frmBbsname" id="frmBbsname" class="reg" maxlength="12" value=""></td>
						</tr>
						<tr>
							<td width="415" bgcolor="#F5F5F5" colspan="2"><input type="submit" value="�ύ" name="frmSubmit" id="frmSubmit" style="display:none;"></td>
							<td width="323" height="10" bgcolor="#FAFAFA"></td>
						</tr>
					</table>
					</td>
				</tr></form>
			</table>
			<br>
			<br>
			<button onfocus="blur();" onclick="if(checkSubmit())document.forms[0].submit();"><img border="0" src="../images/ok.gif" align="absmiddle"> �ύע��</button>
			��<button onfocus="blur();" onclick="window.location.href='./Service.asp';"><img border="0" src="../images/check.gif" align="absmiddle"> ������һ��</button></td>
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
		̨������� | ������ | ��Ƹ��Ϣ | ��վ��ʦ | ��ϵ��ʽ | ��Ʒ����<br>
		̨������Ȩ���� since 2005</td>
	</tr>
</table>
</div>
<span style="display:none;"><script src="http://count6.51yes.com/click.aspx?id=69264747&logo=1"></script></span>
</body>

</html>