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
If Instr(1,Session("Web_Power"),"143") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/educate_Register2.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加培训机构</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=submit" name="reg" method="POST" onSubmit="return check_reg();">
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
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>会员帐号</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                          用户名称：</td>
                        <td width="220" height="30" bgcolor="#fff7f0"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font><font color="#435049"> </font><font color="#999999"> 
                          </font></font></font></font></font><font color="#999999">(英文字母、数字或下划线，4~20个字符)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font></font></font></font></font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          用户密码：</td>
                        <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#999999">(英文字母、数字或下划线，6位以上的字符</font></font>)</td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          电子邮件：</td>
                        <td height="30"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font><font color="#435049"> </font><font color="#999999"> 
                          </font></font></font></font><font color="#999999">(请准确填写您的E-MAIL地址)</font></td>
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
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 机构名称：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="schoolname" type="text" id="schoolname2" size="50" maxlength="50" style="width:200px;">
                          如：<%= Cls_WebName&"培训中心" %></td>
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
                  color=#ff6600>*</FONT></STRONG> 培训领域：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="properity" type="checkbox" id="properity2" value="企业内训">
                          企业内训 
                          <input name="properity" type="checkbox" id="properity2" value="资格认证">
                          资格认证 
                          <input name="properity" type="checkbox" id="properity2" value="IT培训">
                          IT培训 
                          <input name="properity" type="checkbox" id="properity2" value="语言培训">
                          语言培训 
                          <input name="properity" type="checkbox" id="properity2" value="学历招生">
                          学历招生 
                          <input name="properity" type="checkbox" id="properity2" value="公开课">
                          公开课 </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 所在地区：</td>
                        <td height="30"> 
                          <!--#include file="../Include/Class_Locus.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 培训机构简介：</td>
                        <td height="30" bgcolor="#fff7f0"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="school_memo" cols="50" rows="10" id="textarea"></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请尽可能详细填写资料，以确保贵机构资料顺利通过本网审核！包括：机构基本资料+课程情况等;</font></td>
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
                          <font color="#50463d">请输入正确联系人，以方便可以及时联系，如：王小姐或张先生</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="30" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
                          <font color="#50463d"> [固定电话号码，如：010-82615888] </font> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">传真号码：</td>
                        <td height="30"><input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电子邮件：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">网站地址：</td>
                        <td height="30"> <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮政编码：</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="30"> <input name="address" type="text" size="100" style="width:260px;">
                          如：北京市海淀区成府路××号 </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"> 
              <input type="submit" name="Submit" value=" 添 加 " style="height:30px;"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Submit() '保存企业基本数据
UserName                     = Replace_Text(Request.Form("username"))
Password                     = Replace_Text(Request.Form("password"))
Password                     = Md5(Password)
Email                        = Replace_Text(Request.Form("email"))

Randomize timer
Znum = Cint(8999*Rnd+1000)
Schid = Cls_WebKey&gen_key(10)&Znum  '//会员ID

LastIp = Request.Servervariables("Remote_Addr")

Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,Schid From [pH_Educate_Base] Where username='"&username&"' or Email='"&Email&"' or Schid='"&Schid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("Schid")=Schid then
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 


'//提交数据
SchoolName                 = Replace_Text(Request.Form("SchoolName"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_Year                   = Replace_Text(Request.Form("Set_Year"))
Set_Month                  = Replace_Text(Request.Form("Set_Month"))
Set_Day                    = Replace_Text(Request.Form("Set_Day"))
School_Memo                = Replace_Text(Request.Form("School_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
Fax                        = Replace_Text(Request.Form("Fax"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))


If School_Memo <> "" Then School_Memo = Replace(School_Memo,Chr(13),"<br>")

'//保存数据到数据库[pH_Educate_Base]表
SQL = "Insert Into [pH_Educate_Base] (Schid,Username,Password,SchoolName,Properity,Set_Year,Set_Month,Set_Day,School_Memo,ContactPerson,Phone,Fax,WebHome,ZipCode,Email,Address,Locus_Area,Locus_City,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Flag,VipFlag,VipLevel,ViewClicks,Lessons,Teachers,Websub) Values ('"&Schid&"','"&Username&"','"&Password&"','"&SchoolName&"','"&Properity&"',"&Set_Year&","&Set_Month&","&Set_Day&",'"&School_Memo&"','"&ContactPerson&"','"&Phone&"','"&Fax&"','"&WebHome&"','"&ZipCode&"','"&Email&"','"&Address&"','"&Locus_Area&"','"&Locus_City&"',getdate(),'"&LastIp&"',getdate(),getdate(),1,1,0,0,0,0,0,'www')"
Conn.Execute(SQL)  '//[pH_School_Base]表


 Response.Write "<script>alert('操作完成');location.href='Web_Educate_All.asp';</script>"
 Response.End()
End Sub


'//关闭数据库连接
CloseDB

 %>

