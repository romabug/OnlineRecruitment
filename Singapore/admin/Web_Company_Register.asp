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
If Instr(1,Session("Web_Power"),"118") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
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
	 function checkAccount(username)
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
        window.open("../Company/AccountCheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkmailbox(username)
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
        window.open("../Company/AccountCheck.asp?action=cmailbox&value="+username,"")
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
 alert("用于找回密码的提示问题不能为空！请继续注册...");
 document.reg.question.focus();
 return false;
 }
 if (document.reg.answer.value==""){
 alert("用于找回密码的问题答案不能为空！请继续注册...");
 document.reg.answer.focus();
 return false;
 }
  
 if (document.reg.mailbox.value==""){
 alert("用户的邮箱必须输入！请继续注册...");
 document.reg.mailbox.focus();
 return false;
 }
 if(document.reg.mailbox.value.indexOf("@")==-1 || document.reg.mailbox.value.indexOf(".")==-1){ 
 alert("用户的邮箱格式不正确！请继续注册...");
 document.reg.mailbox.focus();
 return false;
	}
	
  if (document.reg.companyname.value==""){
 alert("企业名称不能是空值！请继续注册...");
 document.reg.companyname.focus();
 return false;
 }

   if (document.reg.set_year.value==""){
 alert("企业成立时间不能是空值！请继续注册...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.set_year.value.match(/\D/)){
 alert("企业成立年份必须是数字！请继续注册...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.reg_currency.value==""){
 alert("企业注册资金不能是空值！请继续注册...");
 document.reg.reg_currency.focus();
 return false;
 }
  if (document.reg.reg_currency.value.match(/\D/)){
 alert("企业注册资金必须是数字！请继续注册...");
 document.reg.reg_currency.focus();
 return false;
 }

 if (document.reg.company_memo.value==""){
 alert("企业简介不能是空值！请继续注册...");
 document.reg.company_memo.focus();
 return false;
 }
  if (document.reg.contactperson.value==""){
 alert("联系人不能是空值！请继续注册...");
 document.reg.contactperson.focus();
 return false;
 }
 if (document.reg.phone.value==""){
 alert("联系电话不能是空值！请继续注册...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.phone.value)){
 alert("联系电话只能是数字0-9和-！请继续注册...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.companyfax.value)){
 alert("传真只能是数字0-9和-！请继续注册...");
 document.reg.companyfax.focus();
 return false;
 }
 if (document.reg.email.value==""){
 alert("邮箱必须输入！请继续注册...");
 document.reg.email.focus();
 return false;
 }

 if(document.reg.email.value.indexOf("@")==-1 || document.reg.email.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！请继续注册...");
 document.reg.email.focus();
 return false;
	}

 if (document.reg.zipcode.value==""){
 alert("邮政编码必须输入！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 } 
 if (document.reg.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 
 if (document.reg.address.value==""){
 alert("通讯地址必须输入！请继续注册...");
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>新增企业会员</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="90%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=edit" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>帐号信息</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                用户名称：</td>
                              <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input type="button" name="Submit22" value="检测帐号"  onClick="checkAccount(document.reg.username.value)">
                                </font><font color="#999999"> </font></font></font></font></font><font color="#999999">(英文字母、数字或下划线，4~20个字符)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font></font></font></font></font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                用户密码：</td>
                              <td width="220" height="30" bgcolor="#fff7f0"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#999999">(英文字母、数字或下划线，6位以上的字符</font></font>)</td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                确认密码：</td>
                              <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#999999">(请重新输入密码)</font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                密码提示：</td>
                              <td width="220" height="30" bgcolor="#fff7f0"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                                <input name="question" class="fieldtext" id="question" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#999999">(如：您最喜欢什么颜色？)</font> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                问题答案：</td>
                              <td height="30"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                                <input name="answer" class="fieldtext" id="answer" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30"><font color="#999999">(如：蓝色)</font> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                电子邮件：</td>
                              <td height="30" bgcolor="#fff7f0"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input name="Submit3" type="button" id="Submit3" value="检测邮箱" onClick="checkmailbox(document.reg.mailbox.value)">
                                </font><font color="#999999"> </font></font></font></font><font color="#999999">(请准确填写您的E-MAIL地址)</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>基本资料</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 企业名称：</td>
                        <td height="30"> <input name="companyname" type="text" id="companyname" size="50" maxlength="50" style="width:200px;">
                          如：<%= Cls_WebName %></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0">证件号码：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="licence" type="text" size="25" maxlength="25" style="width:200px;"> 
                          <font color="#50463d">企业的营业执照等</font> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 所属行业：</td>
                        <td height="30"> <select name="industry" id="industry" style="width:200px;">
                            <option value="1">互联网、电子商务</option>
                            <option value="2">计算机业（软件、数据库、系统集成）</option>
                            <option value="3">计算机业（硬件、网络设备）</option>
                            <option value="4">电子、微电子技术</option>
                            <option value="5">通讯、电信业</option>
                            <option value="6">家电业</option>
                            <option value="7">批发零售(百货、超市、专卖店)</option>
                            <option value="8">贸易、商务、进出口</option>
                            <option value="9">电气</option>
                            <option value="10">电力、能源、矿产业</option>
                            <option value="11">石油、化工业</option>
                            <option value="12">生物工程、制药、环保</option>
                            <option value="13">机械制造、机电设备、重工业</option>
                            <option value="14">汽车、摩托车</option>
                            <option value="15">仪器仪表、电工设备</option>
                            <option value="16">广告、公关、设计</option>
                            <option value="17">媒体、影视制作、新闻出版</option>
                            <option value="18">艺术、文化传播</option>
                            <option value="19">快速消费品（食品、饮料、粮油、化妆品、烟酒）</option>
                            <option value="20">纺织品业（服饰、鞋类、家纺用品、皮具）</option>
                            <option value="21">咨询业（顾问、会计师、审计师、法律）</option>
                            <option value="22">金融业（投资、保险、证券、银行、基金）</option>
                            <option value="23">建筑、房地产、物业管理、装潢</option>
                            <option value="24">餐饮、娱乐、酒店</option>
                            <option value="25">运输、物流、快递</option>
                            <option value="26">旅游业</option>
                            <option value="27">办公设备、文化体育休闲用品、家居用品</option>
                            <option value="28">印刷、包装、造纸</option>
                            <option value="29">生产、制造、加工</option>
                            <option value="30">教育、培训、科研院所</option>
                            <option value="31">医疗、保健、卫生服务</option>
                            <option value="32">人才交流、中介</option>
                            <option value="33">协会、社团、政府公用事业、社区服务</option>
                            <option value="34">农、林、牧、副、渔业</option>
                            <option value="35">其他</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 企业性质：</td>
                        <td height="30" bgcolor="#fff7f0"> <select name="properity" style="width:120px;">
                            <option value="1">国有企业</option>
                            <option value="2">外资企业</option>
                            <option value="3">合资企业</option>
                            <option value="4">私营企业</option>
                            <option value="5">民营企业</option>
                            <option value="6">股份制企业</option>
                            <option value="7">集体企业</option>
                            <option value="8">集体事业</option>
                            <option value="9">乡镇企业</option>
                            <option value="10">行政机关</option>
                            <option value="11">社会团体</option>
                            <option value="12">事业单位</option>
                            <option value="13">跨国企业</option>
                            <option value="14">其他</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 成立日期：</td>
                        <td height="30"> <input name="set_year" type="text" size="4" maxlength="4">
                          年 
                          <select name="set_month">
                            <%for i=1 to 12%>
                            <option  value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          月 
                          <select name="set_day">
                            <%for i=1 to 31%>
                            <option value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          日 </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 注册资金：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="reg_currency" type="text" size="25" maxlength="25" style="width:100px;">
                          万元 
                          <select name="currencytype" id="currencytype" style="width:80px;">
                            <option value="1">人民币</option>
                            <option value="2">美元</option>
                            <option value="3">欧元</option>
                            <option value="4">英镑</option>
                            <option value="5">港币</option>
                            <option value="6">台币</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 员工人数：</td>
                        <td height="30"> <select name="workers" id="workers" style="width:100px;">
                            <OPTION value=9>10人以下</OPTION>
                            <OPTION value=49>10～50人</OPTION>
                            <OPTION value=199>50～200人</OPTION>
                            <OPTION value=499>200～500人</OPTION>
                            <OPTION value=999>500～1000人</OPTION>
                            <OPTION value=1000>1000人以上</OPTION>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 企业所在地区：</td>
                        <td height="30" bgcolor="#fff7f0"> 
                          <!--#include file="../Include/Class_Locus.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 企业简介：</td>
                        <td height="30"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="company_memo" cols="50" rows="8" id="company_memo"></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请尽可能详细填写资料，以确保贵公司资料顺利通过本网审核！包括：公司基本资料+产品或服务+经营业绩等</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>联系方式</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系人：</td>
                        <td height="30"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">请输入正确联系人，以方便求职者与贵公司联系，如：王小姐或张先生</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="30" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
                          <input name="phonekeep" type="checkbox" id="phonekeep" value="1"> 
                          <font color="#333333">屏蔽电话</font><font color="#50463d"> 
                          [固定电话号码，如：010-82615888] </font> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">传真号码：</td>
                        <td height="30"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0">企业网站：</td>
                        <td height="30" bgcolor="#fff7f0"> 
                          <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮政编码：</td>
                        <td height="30"> 
                          <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                        </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="30"> 
                          <input name="address" type="text" size="100" style="width:260px;">
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
      </table> </td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() 
Dim Username,Password,Comid,Question,Answer,Email
Username = Replace_text(Request.Form("username")) '//用户名
Password = Replace_text(Request.Form("password")) '//密码
Password = Md5(Password)
Randomize timer
znum = cint(8999*Rnd+1000)
Comid = "VR"&gen_key(10)&znum                     '//会员ID
Question = Replace_text(Request.Form("question")) '//问题提示
Answer = Replace_text(Request.Form("answer"))     '//提示答案
Email = Replace_text(Request.Form("mailbox"))       '//电子邮件



Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,comid From [pH_Company_Base] Where username='"&username&"' or Email='"&Email&"' or comid='"&comid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("comid")=comid then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//提交数据
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
CompanyName                = Replace_Text(Request.Form("CompanyName"))
Licence                    = Replace_Text(Request.Form("Licence"))
Industry                   = Replace_Text(Request.Form("Industry"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_year                   = Replace_Text(Request.Form("Set_year"))
Set_month                  = Replace_Text(Request.Form("Set_month"))
Set_day                    = Replace_Text(Request.Form("Set_day"))
Workers                    = Replace_Text(Request.Form("Workers"))
Reg_Currency               = Replace_Text(Request.Form("Reg_Currency"))
CurrencyType               = Replace_Text(Request.Form("CurrencyType"))
Company_Memo               = Replace_Text(Request.Form("Company_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
PhoneKeep                  = Replace_Text(Request.Form("PhoneKeep"))
CompanyFax                 = Replace_Text(Request.Form("CompanyFax"))
EmailKeep                  = Replace_Text(Request.Form("EmailKeep"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))

If PhoneKeep = "" Then PhoneKeep = 0
If EmailKeep = "" Then EmailKeep = 0
If Comnpany_Memo <> "" Then Comnpany_Memo = Replace(Comnpany_Memo,Chr(13),"<br>")
'//保存数据到数据库[pH_Company_Base]表
SQL = "Insert Into [pH_Company_Base] (Comid,Username,Password,CompanyName,Question,Answer,Licence,Industry,Properity,Set_Year,Set_Month,Set_Day,Workers,Reg_Currency,CurrencyType,Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,Email,EmailKeep,Locus_Area,Locus_City,Address,ZipCode,WebHome,RegDate,LastIp,LoginCount,LastDate,LastUpdate_Time,LogoKeep,Nc_Vip_Flag,ViewClicks,PublishCount,Flag,Nc_Video,Video_Flag,Websub) Values ('"&Comid&"','"&Username&"','"&Password&"','"&CompanyName&"','"&Question&"','"&Answer&"','"&Licence&"',"&Industry&","&Properity&","&Set_year&","&Set_month&","&Set_day&","&Workers&","&Reg_Currency&","&CurrencyType&",'"&Company_Memo&"','"&ContactPerson&"','"&Phone&"',"&	PhoneKeep&",'"&CompanyFax&"','"&Email&"',"&EmailKeep&",'"&Locus_Area&"','"&Locus_City&"','"&Address&"','"&ZipCode&"','"&WebHome&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),0,0,0,0,1,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Company_Base]表

 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Company_All.asp';</script>"
End Sub

Call CloseDB()
 %>

