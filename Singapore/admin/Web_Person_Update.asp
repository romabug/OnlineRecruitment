<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit()  '//跳转到保存数据的函数

Perid  = Replace_Text(Request.QueryString("Perid"))

'//调用存储过程
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Per_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Perid",200,1,30)
Cmd.Parameters("@Perid") = Perid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if
Tmp = Rs.GetRows() '//将数据填充到数组
'//0邮件,1姓名,2性别,3民族,4婚姻,5户口省份,6城市,7所在地省份,8城市,9身高,10体重,11生日年,12月,13日,14电话,15QQ,16网站地址,17自我评价,18证件号码,19证件类型,20手机,21邮政编码,22地址,23会员类型
'//如：Tmp(1,0)表示 用户的姓名
CloseRs
Set Cmd = Nothing
'//功能代码
If Tmp(23,0) = 1 Then
 UserType = "社会人士"
Elseif Tmp(23,0) = 2 Then
 UserType = "应届毕业生"
End if 
Nation = Tmp(3,0)
Marry = Tmp(4,0)
CodeType = Tmp(19,0)
Door_Area = Tmp(5,0)
Door_City = Tmp(6,0)
Locus_Area = Tmp(7,0)
Locus_City = Tmp(8,0)
Appraise = Tmp(17,0)
If Appraise<>"" Then Appraise = Replace(Appraise,"<br>",Chr(13))

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/Person_Basicinfo.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>编辑个人会员</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" cellspacing="0" cellpadding="0">
        <form action="Web_Person_UpSave.asp" name="edit" method="post" onSubmit="return form_check();">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
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
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 姓 名：</td>
                        <td height="25"><input name="realname" type="text" id="realname" size="20" maxlength="20" style="width:120px;" value="<%= Tmp(1,0) %>"></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 性 别：</td>
                        <td height="25" bgcolor="#fff7f0"> <input type="radio" name="sex" value="1" <% If Tmp(2,0) = True Then Response.write "Checked" %>>
                          男 
                          <input type="radio" name="sex" value="0" <% If Tmp(2,0) = False Then Response.write "Checked" %>>
                          女</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">民 族：</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Nation.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 出生日期：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="birthyear" type="text" id="birthyear" size="4" maxlength="4" value="<%= Tmp(11,0) %>">
                          年 
                          <select name=birthmonth>
                            <%for i=1 to 12%>
                            <option <%if i=Tmp(12,0) then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          月 
                          <select name=birthday>
                            <%for i=1 to 31%>
                            <option <%if i=Tmp(13,0) then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          日</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 婚姻状况：</td>
                        <td height="25"><select name="marry" size="1" id="marry" style="width:60px;">
                            <option value="0" <% If Marry = 0 Then Response.write "Selected" %>>保密</option>
                            <option value="1" <% If Marry = 1 Then Response.write "Selected" %>>未婚</option>
                            <option value="2" <% If Marry = 2 Then Response.write "Selected" %>>已婚</option>
                            <option value="3" <% If Marry = 3 Then Response.write "Selected" %>>离异</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 身 高：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="stature" type="text" size="4" maxlength="4" style="width:60px;" value="<%= Tmp(9,0) %>">
                          CM<font color="#50463d">[如：172CM]</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 体 重：</td>
                        <td height="25"><input name="tizhong" type="text" size="4" maxlength="4" style="width:60px;" value="<%= Tmp(10,0) %>">
                          KG</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 证件号码：</td>
                        <td height="25" bgcolor="#fff7f0"><select name="codetype" id="codetype" style="width:60px;">
                            <option  value="0"  <% If CodeType = 0 Then Response.write "Selected" %>>身份证</option>
                            <option  value="1"  <% If CodeType = 1 Then Response.write "Selected" %>>护照</option>
                            <option  value="2"  <% If CodeType = 2 Then Response.write "Selected" %>>军官证</option>
                            <option  value="3"  <% If CodeType = 3 Then Response.write "Selected" %>>学生证</option>
                            <option  value="4"  <% If CodeType = 4 Then Response.write "Selected" %>>其他</option>
                          </select> <input name="codeid" type="text"  size="25" maxlength="25" style="width:150px;" value="<%= Tmp(18,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 户口所在地：</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Door2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 现工作地区：</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
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
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电 话：</td>
                        <td height="25"><input name="personphone" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Tmp(14,0) %>"> 
                          <font color="#50463d">固定电话号码[如：010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG></STRONG> 
                          手 机：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="mt" type="text" size="30" maxlength="30" style="width:120px;"  value="<%= Tmp(20,0) %>"> 
                          <font color="#50463d">移动</font><font color="#50463d">电话号码[如：139-88888888] 
                          </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">聊天号码：</td>
                        <td height="25"><input name="msnqq" type="text" size="30" maxlength="30" style="width:120px;"  value="<%= Tmp(15,0) %>"> 
                          <font color="#50463d">MSN/QQ/OICQ号码</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电子邮件：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="useremail" type="text" size="50"  style="width:200px;" value="<%= Tmp(0,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">个人网站：</td>
                        <td height="25"><input name="webhome" type="text" size="50" style="width:200px;"  value="<%= Tmp(16,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮政编码：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;" value="<%= Tmp(21,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Tmp(22,0) %>">
                          如：北京市海淀区成府路××号 </td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>自我评价</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right">自我评价：</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="appraise" cols="45" rows="8" id="appraise"><%= Appraise %></textarea></td>
                              <td><font color="#666666">请用简洁的词语描述自己的综合能力,字数请控制在500字以内 
                                ; </font></td>
                            </tr>
                          </table></td>
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
            <td height="40" align="center"><input name="perid" type="hidden" id="perid" value="<%= Perid %>"> 
              <input type="submit" name="Submit" value=" 保存基本信息数据 " style="height:35px;"> 
            </td>
          </tr>
        </form>
      </table> </td>
</tr>
</table>
</body>
</html>
<% 
Sub Submit()
 'Call Check_url()    '防止外部站点提交数据
 '//提交数据
 'Response.Write("11")
 'Response.End()
 Perid                = Replace_Text(Request.Form("Perid"))
 UserEmail            = Replace_Text(Request.Form("UserEmail"))
 RealName             = Replace_Text(Request.Form("RealName"))
 Sex                  = Replace_Text(Request.Form("Sex"))
 Nation               = Replace_Text(Request.Form("Nation")) 
 Marry                = Replace_Text(Request.Form("Marry")) 
 Door_Area            = Replace_Text(Request.Form("huji")) 
 Door_City            = Replace_Text(Request.Form("huji1")) 
 Locus_Area           = Replace_Text(Request.Form("x_suozaidi")) 
 Locus_City           = Replace_Text(Request.Form("x_suozaidi1")) 
 Stature              = Replace_Text(Request.Form("Stature")) 
 Tizhong              = Replace_Text(Request.Form("Tizhong")) 
 BirthYear            = Replace_Text(Request.Form("BirthYear")) 
 Age                  = Cint(Year(Date))-Cint(BirthYear)
 BirthMonth           = Replace_Text(Request.Form("BirthMonth"))
 BirthDay             = Replace_Text(Request.Form("BirthDay")) 
 PersonPhone          = Replace_Text(Request.Form("PersonPhone")) 
 MsnQQ                = Replace_Text(Request.Form("MsnQQ")) 
 WebHome              = Replace_Text(Request.Form("WebHome")) 
 Appraise             = Replace_Text(Request.Form("Appraise")) 
 CodeId               = Replace_Text(Request.Form("CodeId")) 
 CodeType             = Replace_Text(Request.Form("CodeType")) 
 Mt                   = Replace_Text(Request.Form("Mt")) 
 ZipCode              = Replace_Text(Request.Form("ZipCode")) 
 Address              = Replace_Text(Request.Form("Address")) 
 
 If Appraise<>"" Then Appraise = Replace(Appraise,Chr(13),"<br>")
 
 SQL = "Update [pH_Person_Info] Set RealName='"&RealName&"',Sex="&Sex&",Nation='"&Nation&"',Marry="&Marry&",Age="&Age&",Door_Area='"&Door_Area&"',Door_City='"&Door_City&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Stature="&Stature&",Tizhong="&Tizhong&",BirthYear="&BirthYear&",BirthMonth="&BirthMonth&",BirthDay="&BirthDay&",PerāsonPhone='"&PersonPhone&"',MsnQQ='"&MsnQQ&"',WebHome='"&WebHome&"',Appraise='"&Appraise&"',CodeId='"&CodeId&"',CodeType="&CodeType&",Mt='"&Mt&"',ZipCode='"&ZipCode&"',Address='"&Address&"' Where Perid='"&Perid&"'"
 Conn.Execute(SQL)
 
 SQL = "Update [pH_Person_Base] Set UserEmail='"&UserEmail&"',LastUpdate_Time=getdate() Where Perid='"&Perid&"'"
 Conn.Execute(SQL)
 
 CloseDB
 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Person_All.asp';</script>"
 Response.End()
End Sub

 %>

