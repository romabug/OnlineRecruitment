<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"125") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request.QueryString("action"))
Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
      function checkaccount(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("请输入用户名！");
        return false;
      }
      else
      {
        window.open("../Person/Accountcheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkuseremail(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("请邮箱地址！");
        return false;
      }
      else
      {
        window.open("../Person/Accountcheck.asp?action=cuseremail&value="+username,"")
      }
    }

   function is_zw(str)
  {
	exp=/[0-9a-zA-Z_]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
  }
function is_number(str)
{
	exp=/[^0-9()-]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

 function check_reg(){
 if (document.reg.username.value==""){
 alert("用户名不能为空！请继续注册...");
 document.reg.username.focus();
 return false;
 }
  if (document.reg.username.value.length<4 || document.reg.username.value.length>20){
 alert("用户名必须是4-20位的字符！请继续注册...");
 document.reg.username.focus();
 return false;
 }
 if (is_zw(document.reg.username.value)){
  alert("用户名不能是中文文字！请继续注册...");
  document.reg.username.focus();
  return false;
 }
 if (document.reg.password.value==""){
 alert("密码不能是空值！请继续注册...");
 document.reg.password.focus();
 return false;
 }
 if (document.reg.password.value==document.reg.username.value ){
 alert("密码不能与用户名相同！请继续注册...");
 document.reg.password.focus();
 return false;
 } 
 if (document.reg.password.value.length<6 ){
 alert("密码不能低于6位的符号！请继续注册...");
 document.reg.password.focus();
 return false;
 }
 if (document.reg.password2.value==""){
 alert("确认密码不能是空值！请继续注册...");
 document.reg.password2.focus();
 return false;
 }
 if (document.reg.password2.value!=document.reg.password.value){
 alert("确认密码与密码不相同！请继续注册...");
 document.reg.password2.focus();
 return false;
 }
 
  if (document.reg.question.value==""){
  alert("密码提示问题必须输入！请继续注册...");
  document.reg.question.focus();
  return false;
 }
  if (document.reg.answer.value==""){
  alert("提示答案必须输入！请继续注册...");
  document.reg.answer.focus();
  return false;
 }
 
 if (document.reg.useremail.value==""){
 alert("用户的邮箱必须输入！请继续注册...");
 document.reg.useremail.focus();
 return false;
 }
 if(document.reg.useremail.value.indexOf("@")==-1 || document.reg.useremail.value.indexOf(".")==-1){ 
 alert("用户的邮箱格式不正确！请继续注册...");
 document.reg.useremail.focus();
 return false;
	}
	
 if (document.reg.realname.value==""){
 alert("用户真实姓名不能为空值！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
 if (!is_zw(document.reg.realname.value)){
 alert("用户真实姓名必须是中文文字！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
  if (document.reg.realname.value.length<2 || document.reg.realname.value.length>10){
 alert("用户真实姓名必须是2-10个中文文字组成！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
 
 if (document.reg.birthyear.value==""){
 alert("出生年份不能为空值！请继续注册...");
 document.reg.birthyear.focus();
 return false;
 }
 if (document.reg.birthyear.value.match(/\D/)){
 alert("出生年份必须是合法的数字！请继续注册...");
 document.reg.birthyear.focus();
 return false;
 }
 
  if (document.reg.stature.value==""){
 alert("您的身高不能为空值！请继续注册...");
 document.reg.stature.focus();
 return false;
 }
 if (document.reg.stature.value.match(/\D/)){
 alert("您的身高必须是合法的数字！请继续注册...");
 document.reg.stature.focus();
 return false;
 }

  if (document.reg.tizhong.value==""){
 alert("您的体重不能为空值！请继续注册...");
 document.reg.tizhong.focus();
 return false;
 }
 if (document.reg.tizhong.value.match(/\D/)){
 alert("您的体重必须是合法的数字！请继续注册...");
 document.reg.tizhong.focus();
 return false;
 }
 
 if (document.reg.codeid.value==""){
 alert("您的证件号码不能为空值！请继续注册...");
 document.reg.codeid.focus();
 return false;
 }
 if (document.reg.codeid.value.length<15){
 alert("您的证件号码格式不正确！请继续注册...");
 document.reg.codeid.focus();
 return false;
 }
 
 if (document.reg.lastschool.value==""){
 alert("请填写您的毕业院校！请继续注册...");
 document.reg.lastschool.focus();
 return false;
 }
    if (document.reg.byear.value==""){
 alert("请填写您的毕业年份！请继续注册...");
 document.reg.byear.focus();
 return false;
 }
  if (document.reg.byear.value.match(/\D/)){
 alert("毕业年份必须是合法的数字！请继续注册...");
 document.reg.byear.focus();
 return false;
 }
   if (document.reg.speciality.value==""){
 alert("请填写您的专业名称！请继续注册...");
 document.reg.speciality.focus();
 return false;
 } 
    if (document.reg.personphone.value==""){
 alert("您的联系电话不能为空值！请继续注册...");
 document.reg.personphone.focus();
 return false;
 }
 if (!is_number(document.reg.personphone.value)){
 alert("联系电话只能含有0-9和-！请继续注册...");
 document.reg.personphone.focus();
 return false;
 } 
  if (!is_number(document.reg.mt.value)){
 alert("移动电话只能含有0-9和-！请继续注册...");
 document.reg.mt.focus();
 return false;
 } 
 if (document.reg.zipcode.value==""){
 alert("邮政编码不能为空！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.zipcode.value.match(/\D/)){
 alert("邮政编码必须是合法的数字！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("通讯地址不能为空！请继续注册...");
 document.reg.address.focus();
 return false;
 }

	
 }

</script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>新增个人会员</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="Web_Person_RegSave.asp" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>帐号信息</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          用户类型：</td>
                        <td width="220" height="30"> <SELECT name="jobtype" style="width:120px;">
                                  <OPTION value=1 selected>在职人员</OPTION>
                                  <OPTION value=2>待业人员</OPTION>
								  <OPTION value=3>应届毕业生</OPTION>
								  <OPTION value=4>在校学生</OPTION>
                                </SELECT></td>
                        <td height="30">&nbsp;</td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                          用户名称：</td>
                        <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          <input type="button" name="Submit22" value="检测帐号"  onClick="checkaccount(document.reg.username.value)">
                          </font></font></font></font></font><font color="#999999">(英文字母、数字或下划线，4~20个字符)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font></font></font></font></font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          用户密码：</td>
                        <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#999999">(英文字母、数字或下划线，6位以上的字符</font></font>)</td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          确认密码：</td>
                        <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#999999">(请重新输入密码)</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          密码提示：</td>
                        <td width="220" height="30"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                          <input name="question" class="fieldtext" id="question2" size="26" maxLength="50">
                          </font></span></td>
                        <td height="30"><font color="#999999">(如：您最喜欢什么颜色？)</font> 
                        </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          问题答案：</td>
                        <td height="30"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                          <input name="answer" class="fieldtext" id="answer2" size="26" maxLength="50">
                          </font></span></td>
                        <td height="30"><font color="#999999">(如：蓝色)</font> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          电子邮件：</td>
                        <td height="30"> <input name="useremail" type="text" size="26"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          <input name="Submit2" type="button" id="Submit22" value="检测邮箱"  onClick="checkuseremail(document.reg.useremail.value)">
                          </font></font></font></font><font color="#999999">(请准确填写您的E-MAIL地址)</font></td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>基本资料</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 姓 名：</td>
                        <td height="25"><input name="realname" type="text" id="realname" size="20" maxlength="20" style="width:120px;"></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 性 别：</td>
                        <td height="25" bgcolor="#fff7f0"> <input type="radio" name="sex" value="1" checked>
                          男 
                          <input type="radio" name="sex" value="0">
                          女</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">民 族：</td>
                        <td height="25"> <select id=nation name=nation style="width:120px;">
                            <option value=汉族 selected>汉族</option>
                            <option value=蒙古族>蒙古族</option>
                            <option value=满族>满族</option>
                            <option value=回族>回族</option>
                            <option value=藏族>藏族</option>
                            <option value=维吾尔族>维吾尔族</option>
                            <option value=壮族>壮族</option>
                            <option value=苗族>苗族</option>
                            <option value=彝族>彝族</option>
                            <option value=朝鲜族>朝鲜族</option>
                            <option value=布依族>布依族</option>
                            <option value=侗族>侗族</option>
                            <option value=瑶族>瑶族</option>
                            <option value=白族>白族</option>
                            <option value=土家族>土家族</option>
                            <option value=哈尼族>哈尼族</option>
                            <option value=哈萨克族>哈萨克族</option>
                            <option value=傣族>傣族</option>
                            <option value=黎族>黎族</option>
                            <option value=傈僳族>傈僳族</option>
                            <option value=佤族>佤族</option>
                            <option value=畲族>畲族</option>
                            <option value=高山族>高山族</option>
                            <option value=拉祜族>拉祜族</option>
                            <option value=水族>水族</option>
                            <option value=东乡族>东乡族</option>
                            <option value=纳西族>纳西族</option>
                            <option value=景颇族>景颇族</option>
                            <option value=柯尔克孜族>柯尔克孜族</option>
                            <option value=土族>土族</option>
                            <option value=达斡尔族>达斡尔族</option>
                            <option value=仫佬族>仫佬族</option>
                            <option value=羌族>羌族</option>
                            <option value=布朗族>布朗族</option>
                            <option value=撒拉族>撒拉族</option>
                            <option value=毛南族>毛南族</option>
                            <option value=仡佬族>仡佬族</option>
                            <option value=锡伯族>锡伯族</option>
                            <option value=阿昌族>阿昌族</option>
                            <option value=普米族>普米族</option>
                            <option value=塔吉克族>塔吉克族</option>
                            <option value=怒族>怒族</option>
                            <option value=乌兹别克族>乌兹别克族</option>
                            <option value=俄罗斯族>俄罗斯族</option>
                            <option value=鄂温克族>鄂温克族</option>
                            <option value=德昂族>德昂族</option>
                            <option value=保安族>保安族</option>
                            <option value=裕固族>裕固族</option>
                            <option value=京族>京族</option>
                            <option value=塔塔尔族>塔塔尔族</option>
                            <option value=独龙族>独龙族</option>
                            <option value=鄂伦春族>鄂伦春族</option>
                            <option value=赫哲族>赫哲族</option>
                            <option value=门巴族>门巴族</option>
                            <option value=珞巴族>珞巴族</option>
                            <option value=基诺族>基诺族</option>
                            <option value=其它>其它</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 出生日期：</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="birthyear" type="text" id="birthyear" size="4" maxlength="4">
                          年 
                          <select name=birthmonth>
                            <%for i=1 to 12%>
                            <option <%if i=1 then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          月 
                          <select name=birthday>
                            <%for i=1 to 31%>
                            <option <%if i=1 then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          日</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 婚姻状况：</td>
                        <td height="25"> <select name="marry" size="1" id="marry" style="width:60px;">
                            <option value="0">保密</option>
                            <option value="1" selected>未婚</option>
                            <option value="2">已婚</option>
                            <option value="3">离异</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 身 高：</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="stature" type="text" size="4" maxlength="4" style="width:60px;">
                          CM<font color="#50463d">[如：172CM]</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 体 重：</td>
                        <td height="25"> <input name="tizhong" type="text" size="4" maxlength="4" style="width:60px;">
                          KG</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 证件号码：</td>
                        <td height="25" bgcolor="#fff7f0"><select name="codetype" id="codetype" style="width:60px;">
                            <option  value="0">身份证</option>
                            <option  value="1">护照</option>
                            <option  value="2">军官证</option>
                            <option  value="3">学生证</option>
                            <option  value="4">其他</option>
                          </select> <input name="codeid" type="text"  size="25" maxlength="25" style="width:150px;"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 户口所在地：</td>
                        <td height="25"> 
                          <!--#include file="../include/Class_Door.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 现工作地点：</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <!--#include file="../include/Class_Locus.asp" -->
                        </td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>教育背景</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 毕业院校：</td>
                        <td height="25"><input name="lastschool" type="text" id="lastschool" size="30" maxlength="30" style="width:160px;"> 
                          <font color="#50463d">如：北京大学</font> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 最高学历：</td>
                        <td height="25" bgcolor="#fff7f0"> <select name="edus" id="edus" style="width:60px;">
                            <option value="10">小学</option>
                            <option value="20">初中</option>
                            <option value="30">高中</option>
                            <option value="40">中专</option>
                            <option value="50">专科</option>
                            <option value="60" selected>本科</option>
                            <option value="70">硕士</option>
                            <option value="80">博士</option>
                            <option value="90">博士后</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 毕业年份：</td>
                        <td height="25"><input name="byear" type="text"  size="4" maxlength="4" style="width:60px;">
                          年</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 专业类别：</td>
                        <td height="25" bgcolor="#fff7f0"> <select name=zyclass id="zyclass" style="width:120px;">
                            <option value=计算机类 selected >计算机类 
                            <option value=管理类 >管理类 
                            <option value=行政管理 >行政管理 
                            <option value=党政管理 >党政管理 
                            <option value=管理工程类 >管理工程类 
                            <option value=工科>工科 
                            <option value=机械制造类 >机械制造类 
                            <option value=仪器仪表类 >仪器仪表类 
                            <option value=热工类 >热工类 
                            <option value=电气自动化 >电气自动化 
                            <option value=电子技术>电子技术 
                            <option value=工业自动化 >工业自动化 
                            <option value=通信类 >通信类 
                            <option value=土建类>土建类 
                            <option value=化工类 >化工类 
                            <option value=轻工/粮食/食品类 >轻工/粮食/食品类 
                            <option value=纺织类 >纺织类 
                            <option value=运输类 >运输类 
                            <option value=水利类>水利类 
                            <option value=测绘类>测绘类 
                            <option value=环境类>环境类 
                            <option value=原子能类>原子能类 
                            <option value=应用理科及力学类 >应用理科及力学类 
                            <option value=地质类 >地质类 
                            <option value=矿业类 >矿业类 
                            <option value=冶金类>冶金类 
                            <option value=材料类 >材料类 
                            <option value=军工类>军工类 
                            <option value=财经类>财经类 
                            <option value=政法类>政法类 
                            <option value=文科类 >文科类 
                            <option value=中国语言文学 >中国语言文学 
                            <option value=外语类 >外语类 
                            <option value=历史类 >历史类 
                            <option value=政治类>政治类 
                            <option value=哲学类 >哲学类 
                            <option value=图书馆学 >图书馆学 
                            <option value=文科类其他专业>文科类其他专业 
                            <option value=理科类>理科类 
                            <option value=数学类 >数学类 
                            <option value=物理学类 >物理学类 
                            <option value=化学类 >化学类 
                            <option value=力学类>力学类 
                            <option value=地学类 >地学类 
                            <option value=天文学类>天文学类 
                            <option value=海洋学类 >海洋学类 
                            <option value=生物学类>生物学类 
                            <option value=理科类其他专业>理科类其他专业 
                            <option value=医药类 >医药类 
                            <option value=师范>师范 
                            <option value=农科类>农科类 
                            <option value=林科类 >林科类 
                            <option value=体育类 >体育类 
                            <option value=艺术>艺术 
                            <option value=音乐类>音乐类 
                            <option value=工艺美术类>工艺美术类 
                            <option value=工业美术类 >工业美术类 
                            <option value=戏剧舞蹈类>戏剧舞蹈类 
                            <option value=电影电视>电影电视 
                            <option value=技工类>技工类</option>
                            <option value=其他>其他</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 专业名称：</td>
                        <td height="25"><input name="speciality" type="text" size="30" maxlength="30" style="width:120px;"></td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>联系方式</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 电 话：</td>
                        <td height="25"><input name="personphone" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">固定电话号码[如：010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0">手 
                          机：</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="mt" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">移动</font><font color="#50463d">电话号码[如：139-88888888] 
                          </font> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">聊天号码：</td>
                        <td height="25"> <input name="msnqq" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">MSN/QQ/OICQ号码</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">个人网站：</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <input name="webhome" type="text" id="webhome" style="width:200px;" value="http://" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 邮政编码：</td>
                        <td height="25"> 
                          <input name="zipcode" type="text" id="zipcode" style="width:120px;" size="6" maxlength="6"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> 通讯地址：</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <input name="address" type="text" id="address" style="width:260px;" size="100">
                          如：北京市海淀区成府路××号 </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"> 
              <input type="submit" name="Submit" value=" 新 增 会 员 " style="height:30px;"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() 
Username = Replace_text(Request.Form("username")) '//用户名
Password = Replace_text(Request.Form("password")) '//密码
Password = Md5(Password)
Randomize timer
Znum = Cint(8999*Rnd+1000)
Perid = Cls_WebKey&gen_key(10)&Znum               '//会员ID
Useremail=replace_text(request.form("useremail")) '//邮件
Question = replace_text(request.form("question")) '//问题提示
Answer = replace_text(request.form("answer"))     '//提示答案
JobType = replace_text(request.form("jobtype"))     '//会员类型

Set Rs = Server.Createobject("ADODB.recordset")
'//检测是否含有同名帐号
Rs.Open "Select UserName,UserEmail,Perid From [pH_Person_Base] Where Username='"&username&"' or Useremail='"&useremail&"'  or Perid='"&Perid&"'",Conn,1,1

If Not Rs.Eof Then
    '//同名的帐号
	If Rs("Username") = UserName or Rs("Perid") = Perid Then
	    CloseRs
		CloseDB
		Response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		Response.end
    End if
	'//同名的邮件
    If Rs("Useremail") = Useremail Then
	    CloseRs
	    CloseDB
		Response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	    Response.end
    End if

End if 
Rs.Close

'//检测论坛的会员表
rs.open "select id,User_name,Email from [User] where user_name='"&username&"' or email='"&useremail&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("user_name")=username then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("email")=useremail then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//保存数据到数据库[pH_Person_Base]和[pH_Person_Info]表
SQL = "Insert Into [pH_Person_Base] (Perid,Username,Password,UserEmail,Journal,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Question,Answer,Websub) Values ('"&Perid&"','"&Username&"','"&Password&"','"&UserEmail&"',1,getdate(),'"&LastIp&"',getdate(),getdate(),1,'"&Question&"','"&Answer&"','"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Base]表

SQL = "Insert Into [pH_Person_Info] (Perid,UserName,RealName,Sex,Nation,Edus,Marry,Age,LastSchool,ZyClass,Speciality,Door_Area,Door_City,Locus_Area,Locus_City,Stature,Tizhong,Byear,BirthYear,BirthMonth,BirthDay,PersonPhone,MsnQQ,WebHome,InterView,ProvideHouse,Post,ViewClicks,ContactKeep,ResumeKeep,PhotoKeep,ResumeMode,Codeid,CodeType,Mt,ZipCode,Address,PerType,JobType,TopAll,Nc_Video,Video_Flag,Video_BestFlag,Websub) Values ('"&Perid&"','"&Username&"','"&Realname&"',"&Sex&",'"&Nation&"',"&Edus&","&Marry&","&Age&",'"&LastSchool&"','"&ZyClass&"','"&Speciality&"','"&Door_Area&"','"&Door_City&"','"&Locus_Area&"','"&Locus_City&"',"&Stature&","&TiZhong&","&Byear&","&BirthYear&","&BirthMonth&","&BirthDay&",'"&PersonPhone&"','"&MsnQQ&"','"&WebHome&"',0,0,0,0,0,0,0,1,'"&Codeid&"',"&CodeType&",'"&Mt&"','"&ZipCode&"','"&Address&"',1,"&JobType&",0,0,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Info]表

'//在论坛会员表中添加记录
SQL = "Insert Into [User] (User_name,User_Pass,Login_Last_Date,Login_Last_Ip,Login_Count,Creat_Date,Up_Date,Pass_Matter,Pass_Key,Email,MsnQQ,Address,myWeb,TelPhone,RelName) Values ('"&Username&"','"&Replace_text(request.form("password"))&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),'"&Question&"','"&Answer&"','"&UserEmail&"','"&MsnQQ&"','"&Address&"','"&WebHome&"','"&PersonPhone&"','"&Realname&"')"
Conn.Execute(SQL)

 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Person_All.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

