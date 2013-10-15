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
If Instr(1,Session("Web_Power"),"22") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数

Corid     = Replace_Text(Request.QueryString("Corid"))
PageNo    = Request.QueryString("PageNo")
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Inr_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Corid",200,1,30)
Cmd.Parameters("@Corid") = Corid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组

'//CorpName,Content,ContactPerson,Phone,Mt,Fax,WebHome,ZipCode,Email,Address,Locus_Area,Locus_City
'//如 Tmp(0,0) 表示名称
CloseRs
Set Cmd = Nothing

'//功能代码
CorpName                = Tmp(0,0)
Content                 = Tmp(1,0)
ContactPerson           = Tmp(2,0)
Phone                   = Tmp(3,0)
Mt						= Tmp(4,0)
Fax                     = Tmp(5,0)
WebHome                 = Tmp(6,0)
ZipCode                 = Tmp(7,0)
Email                   = Tmp(8,0)
Address                 = Tmp(9,0)
Locus_Area              = Tmp(10,0)
Locus_City              = Tmp(11,0)
CorpType				= Tmp(12,0)
Phone2					= Tmp(13,0)
QQ						= Tmp(14,0)
Msn						= Tmp(15,0)

If Content <> "" Then Content = Replace(Content,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/Intro_Basicinfo.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">■ <strong>编辑信息</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=submit" name="edit" method="post" onSubmit="return form_check();">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;基本信息</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 中介名称：</td>
                        <td height="25"><input name="corpname" type="text" id="corpname" size="50" maxlength="50" style="width:200px;" value="<%= Corpname %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">中介性质：</td>
                        <td height="25"><select name="corptype" id="corptype">
                            <option value="职业性质" <% If CorpType = "职业性质" Then Response.Write "Selected" %>>职业性质</option>
                            <option value="公益性质" <% If CorpType = "公益性质" Then Response.Write "Selected" %>>公益性质</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 所在地区：</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 中介简介：</td>
                        <td height="25" bgcolor="f9f9f9"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="content" cols="45" rows="8" id="content"><%= content %></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请尽可能详细填写资料，以确保贵资料顺利通过本网审核！</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;联系方式</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系人：</td>
                        <td height="25"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Contactperson %>"> 
                          <font color="#50463d">请输入正确联系人，以方便可以及时联系</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">移动电话：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="mt" type="text" id="mt" style="width:120px;" size="30" maxlength="30" value="<%= Mt %>"></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="25"> <input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Phone %>"> 
                          <font color="#50463d"> [固定电话号码，如：010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">传真号码：</td>
                        <td height="25"> <input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30" value="<%= Fax %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">QQ号码：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="qq" type="text" id="qq" style="width:120px;" size="30" maxlength="30" value="<%= QQ %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">MSN地址：</td>
                        <td height="25"> <input name="msn" type="text" id="msn" style="width:120px;" size="30" maxlength="30" value="<%= MSN %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电子邮件：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">网站地址：</td>
                        <td height="25"> <input name="webhome" type="text" size="50" style="width:200px;" value="<%= Webhome %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮政编码：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"  value="<%= Zipcode %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="25"> <input name="address" type="text" size="100" style="width:260px;" value="<%= Address %>">
                          如：北京市海淀区成府路××号 </td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"><input type="hidden" name="corid" value="<%= Corid %>"> 
			<input type="hidden" name="pageno" value="<%= PageNo %>"> 
              <input type="submit" name="Submit" value=" 保存信息 " style="height:35px;"> 
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
 
 Corid					 = Replace_Text(Request.Form("Corid"))
 PageNo					 = Replace_Text(Request.Form("PageNo"))
 CorpName                = Replace_Text(Request.Form("CorpName"))
 Content	             = Replace_Text(Request.Form("Content"))
 ContactPerson           = Replace_Text(Request.Form("ContactPerson"))
 Phone                   = Replace_Text(Request.Form("Phone"))
 Mt						 = Replace_Text(Request.Form("mt"))
 Fax                     = Replace_Text(Request.Form("Fax"))
 WebHome                 = Replace_Text(Request.Form("WebHome"))
 ZipCode                 = Replace_Text(Request.Form("ZipCode"))
 Email                   = Replace_Text(Request.Form("Email"))
 Address                 = Replace_Text(Request.Form("Address"))
 Locus_Area              = Replace_Text(Request.Form("x_suozaidi"))
 Locus_City              = Replace_Text(Request.Form("x_suozaidi1"))
 CorpType				 = Replace_Text(Request.Form("CorpType"))
 Phone2					 = Replace_Text(Request.Form("phone2")) 
 QQ						 = Replace_Text(Request.Form("qq"))
 MSN					 = Replace_Text(Request.Form("msn"))

 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 
 SQL = "Update [pH_Intro_Base] Set CorpName='"&CorpName&"',CorpType='"&CorpType&"',Content='"&Content&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',Phone2='"&Phone2&"',Mt='"&Mt&"',Fax='"&Fax&"',QQ='"&QQ&"',MSN='"&Msn&"',WebHome='"&WebHome&"',ZipCode='"&ZipCode&"',Email='"&Email&"',Address='"&Address&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',LastUpdate_Time='"&Now()&"' Where Corid='"&Corid&"'"
 Conn.Execute(SQL)
 
 Response.Write "<script>alert('编辑完成');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

