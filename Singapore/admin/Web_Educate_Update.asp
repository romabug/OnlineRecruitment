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
If Instr(1,Session("Web_Power"),"140") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数

Schid     = Replace_Text(Request.QueryString("Schid"))
PageNo    = Request.QueryString("PageNo")

'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Edu_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Schid",200,1,30)
Cmd.Parameters("@Schid") = Schid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组

'//如 Tmp(0,0) 表示院校名称
CloseRs
Set Cmd = Nothing

'//功能代码
SchoolName              = Tmp(0,0)
Properity               = Tmp(1,0)
BannerFile              = Tmp(2,0)
Set_Year                = Tmp(3,0)
Set_Month				= Tmp(4,0)
Set_Day					= Tmp(5,0)
School_Memo             = Tmp(6,0)
ContactPerson           = Tmp(7,0)
Phone                   = Tmp(8,0)
Fax                     = Tmp(9,0)
WebHome                 = Tmp(10,0)
ZipCode                 = Tmp(11,0)
Email                   = Tmp(12,0)
Address                 = Tmp(13,0)
Locus_Area              = Tmp(14,0)
Locus_City              = Tmp(15,0)
Lesson_Memo				= Tmp(16,0)
Action_Memo				= Tmp(17,0)
Client_Memo				= Tmp(18,0)
Other_Memo				= Tmp(19,0)

If School_Memo <> "" Then School_Memo = Replace(School_Memo,"<br>",Chr(13))
If Lesson_Memo <> "" Then Lesson_Memo = Replace(Lesson_Memo,"<br>",Chr(13))
If Action_Memo <> "" Then Action_Memo = Replace(Action_Memo,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Educate_Basicinfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>编辑信息</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=submit" name="edit" method="post" onSubmit="return check_edit();">
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
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 机构名称：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="schoolname" type="text" id="schoolname" size="50" maxlength="50" style="width:200px;" value="<%= Schoolname %>">
                          如：北京大学</td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 成立日期：</td>
                        <td height="25"> <input name="set_year" type="text" size="4" maxlength="4" value="<%= Set_Year %>">
                          年 
                          <select name="set_month">
                            <%for i=1 to 12%>
                            <option  value="<%=i%>" <% If Set_Month = i Then Response.write "Selected" %>><%=i%></option>
                            <%next%>
                          </select>
                          月 
                          <select name="set_day">
                            <%for i=1 to 31%>
                            <option value="<%=i%>" <% If Set_Day = i Then Response.write "Selected" %>><%=i%></option>
                            <%next%>
                          </select>
                          日 </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> 培训领域：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="properity" type="checkbox" id="properity" value="企业内训" <% If Instr(Properity,"企业内训") <> 0 Then Response.write "Checked" %>>
                          企业内训 
                          <input name="properity" type="checkbox" id="properity" value="资格认证" <% If Instr(Properity,"资格认证") <> 0 Then Response.write "Checked" %>>
                          资格认证 
                          <input name="properity" type="checkbox" id="properity" value="IT培训" <% If Instr(Properity,"IT培训") <> 0 Then Response.write "Checked" %>>
                          IT培训 
                          <input name="properity" type="checkbox" id="properity" value="语言培训" <% If Instr(Properity,"语言培训") <> 0 Then Response.write "Checked" %>>
                          语言培训 
                          <input name="properity" type="checkbox" id="properity" value="学历招生" <% If Instr(Properity,"学历招生") <> 0 Then Response.write "Checked" %>>
                          学历招生 
                          <input name="properity" type="checkbox" id="properity" value="公开课" <% If Instr(Properity,"公开课") <> 0 Then Response.write "Checked" %>>
                          公开课 </td>
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
                  color=#ff6600>*</FONT></STRONG> 机构简介：</td>
                        <td height="25" bgcolor="f9f9f9"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="school_memo" cols="45" rows="8" id="school_memo"><%= school_memo %></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请尽可能详细填写资料，以确保贵机构资料顺利通过本网审核！包括：机构基本资料+课程情况等;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">课程简介：</td>
                        <td height="25"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="lesson_memo" cols="45" rows="8" id="lesson_memo"><%= Lesson_memo %></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请输入贵机构的主要培训课程;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">近期活动：</td>
                        <td height="25" bgcolor="f9f9f9"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="action_memo" cols="45" rows="8" id="textarea2"><%=Action_memo %></textarea></td>
                              <td><font color="#50463d">最大字符数5000,请输入贵机构近期的主要活动和参与的方式;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">典型客户：</td>
                        <td height="25"> <input name="client_memo" type="text" id="client_memo" size="45" maxlength="100" value="<%= client_memo %>"> 
                          <font color="#50463d">服务过的客户,逗号分隔</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">其他信息：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="other_memo" type="text" id="other_memo" size="45" maxlength="100" value="<%= other_memo %>"></td>
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
                        <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Contactperson %>"> 
                          <font color="#50463d">请输入正确联系人，以方便可以及时联系</font></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="25" bgcolor="f9f9f9"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Phone %>"> 
                          <font color="#50463d"> [固定电话号码，如：010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">传真号码：</td>
                        <td height="25"><input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30" value="<%= Fax %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电子邮件：</td>
                        <td height="25" bgcolor="f9f9f9"><input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">网站地址：</td>
                        <td height="25"><input name="webhome" type="text" size="50" style="width:200px;" value="<%= Webhome %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮政编码：</td>
                        <td height="25" bgcolor="f9f9f9"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"  value="<%= Zipcode %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Address %>">
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
            <td height="40" align="center"><input type="hidden" name="Schid" value="<%= Schid %>"> 
			<input type="hidden" name="PageNo" value="<%= PageNo %>"> 
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

 Schid                   = Replace_Text(Request.Form("Schid"))
 PageNo                  = Replace_Text(Request.Form("PageNo"))
 SchoolName              = Replace_Text(Request.Form("SchoolName"))
 Properity				 = Replace_Text(Request.Form("Properity"))
 Set_Year                = Replace_Text(Request.Form("Set_Year"))
 Set_Month				 = Replace_Text(Request.Form("Set_Month"))
 Set_Day			     = Replace_Text(Request.Form("Set_Day"))
 School_Memo             = Replace_Text(Request.Form("School_Memo"))
 ContactPerson           = Replace_Text(Request.Form("ContactPerson"))
 Phone                   = Replace_Text(Request.Form("Phone"))
 Fax                     = Replace_Text(Request.Form("Fax"))
 WebHome                 = Replace_Text(Request.Form("WebHome"))
 ZipCode                 = Replace_Text(Request.Form("ZipCode"))
 Email                   = Replace_Text(Request.Form("Email"))
 Address                 = Replace_Text(Request.Form("Address"))
 Locus_Area              = Replace_Text(Request.Form("x_suozaidi"))
 Locus_City              = Replace_Text(Request.Form("x_suozaidi1"))
 Lesson_Memo			 = Replace_Text(Request.Form("Lesson_Memo"))
 Action_Memo		     = Replace_Text(Request.Form("Action_Memo"))
 Client_Memo			 = Replace_Text(Request.Form("Client_Memo"))
 Other_Memo				 = Replace_Text(Request.Form("Other_Memo"))

 If School_Memo <> "" Then School_Memo = Replace(School_Memo,Chr(13),"<br>")
 If Lesson_Memo <> "" Then Lesson_Memo = Replace(Lesson_Memo,Chr(13),"<br>")
 If Action_Memo <> "" Then Action_Memo = Replace(Action_Memo,Chr(13),"<br>")
 
 SQL = "Update [pH_Educate_Base] Set SchoolName='"&SchoolName&"',Properity='"&Properity&"',Set_Year="&Set_Year&",Set_Month="&Set_Month&",Set_Day="&Set_Day&",School_Memo='"&School_Memo&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',Fax='"&Fax&"',WebHome='"&WebHome&"',ZipCode='"&ZipCode&"',Email='"&Email&"',Address='"&Address&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Lesson_Memo='"&Lesson_Memo&"',Action_Memo='"&Action_Memo&"',Client_Memo='"&Client_Memo&"',Other_Memo='"&Other_Memo&"',LastUpdate_Time=getdate() Where Schid='"&Schid&"'"
 Conn.Execute(SQL)

 
 Response.Write "<script>alert('编辑完成');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//关闭数据库连接
CloseDB

 %>

