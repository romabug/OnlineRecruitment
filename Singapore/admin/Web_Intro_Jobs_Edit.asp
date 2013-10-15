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
If Instr(1,Session("Web_Power"),"226") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Jobid = Replace_Text(Request("Param"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Submit() '//调用保存数据的函数


'获取数据
SQL = "select * From [pH_Intro_Job] Where Ncid="&Cstr(Jobid)
Set Rs = Conn.Execute(SQL)
If Rs.eof Then
 Response.write "没有找到指定的数据！"
 Response.End()
Else
 Com_Property		= Rs("Com_Property")
 Com_Name			= Rs("Com_Name")
 JobName			= Rs("JobName")
 Valids				= Rs("Valids")
 Number				= Rs("Number")
 Com_Memo			= Rs("Com_Memo")
 Require			= Rs("Require")
 Deal				= Rs("Deal")
 Life				= Rs("Life")
 Other				= Rs("Other")

 If Com_Memo <> "" Then Com_Memo = Replace(Com_Memo,"<br>",chr(13))
 If Require <> "" Then Require = Replace(Require,"<br>",chr(13))
 
End if
Rs.Close 

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/intro_jobpublish.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">■ <strong>编辑招聘职位</strong></font></td>
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
        <form action="?action=edit" name="reg" method="post" onSubmit="return reg_check()">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="dddddd">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;更新职位</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1">
                      <tr bgcolor="f9f9f9"> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 单位名称：</td>
                        <td height="25"> <input name="com_name" type="text" id="com_name" size="30" maxlength="50" value="<%= com_name %>"> 
                          <font color="#666666">(请输入招聘单位的名称</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 单位性质：</td>
                        <td height="25"> <select name="com_property" id="com_property" style="width:120px;">
                            <option value="">-请选择-</option>
                            <option value="1" <% If com_property = 1 Then Response.write "Selected" %>>国有企业</option>
                            <option value="2" <% If com_property = 2 Then Response.write "Selected" %>>外资企业</option>
                            <option value="3" <% If com_property = 3 Then Response.write "Selected" %>>合资企业</option>
                            <option value="4" <% If com_property = 4 Then Response.write "Selected" %>>私营企业</option>
                            <option value="5" <% If com_property = 5 Then Response.write "Selected" %>>民营企业</option>
                            <option value="6" <% If com_property = 6 Then Response.write "Selected" %>>股份制企业</option>
                            <option value="7" <% If com_property = 7 Then Response.write "Selected" %>>集体企业</option>
                            <option value="8" <% If com_property = 8 Then Response.write "Selected" %>>集体事业</option>
                            <option value="9" <% If com_property = 9 Then Response.write "Selected" %>>乡镇企业</option>
                            <option value="10" <% If com_property = 10 Then Response.write "Selected" %>>行政机关</option>
                            <option value="11" <% If com_property = 11 Then Response.write "Selected" %>>社会团体</option>
                            <option value="12" <% If com_property = 12 Then Response.write "Selected" %>>事业单位</option>
                            <option value="13" <% If com_property = 13 Then Response.write "Selected" %>>跨国企业</option>
                            <option value="14" <% If com_property = 14 Then Response.write "Selected" %>>其他</option>
                          </select> <font color="#666666">(请选择单位的性质</font>) </td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 职位名称：</td>
                        <td height="25"> <input name="jobname" type="text" id="jobname" size="30" maxlength="50" value="<%= jobname %>"> 
                          <font color="#666666">(请输入招聘职位的名称</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">招聘人数：</td>
                        <td height="25"> <input name="number" type="text" id="number"  value="<%= number %>" size="4" maxlength="6">
                          人 <font color="#666666">(默认为0,表示若干人</font>)</td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">有效期：</td>
                        <td height="25"> <select name="valids" id="valids">
                            <option value="3" <% If valids = 3 Then Response.write "Selected" %>>3天</option>
                            <option value="7" <% If valids = 7 Then Response.write "Selected" %>>一周</option>
                            <option value="14" <% If valids = 14 Then Response.write "Selected" %>>两周</option>
                            <option value="30" <% If valids = 30 Then Response.write "Selected" %>>一个月</option>
                            <option value="60" <% If valids = 60 Then Response.write "Selected" %>>两个月</option>
                            <option value="90" <% If valids = 90 Then Response.write "Selected" %>>三个月</option>
                            <option value="180" <% If valids = 180 Then Response.write "Selected" %>>半年</option>
                            <option value="365" <% If valids = 365 Then Response.write "Selected" %>>一年</option>
                            <option value="0" <% If valids = 0 Then Response.write "Selected" %>>长期有效</option>
                          </SELECT> </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">单位介绍：</td>
                        <td height="25"> <textarea name="com_memo" cols="45" rows="5" id="com_memo"><%= com_memo %></textarea></td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 具体要求：</td>
                        <td height="25"> <textarea name="require" cols="45" rows="5" id="require"><%= require %></textarea> 
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">薪资待遇：</td>
                        <td height="25"> <input name="deal" type="text" id="deal" size="20" maxlength="25" value="<%= deal %>"> 
                          <font color="#666666">(请输入职位的待遇,默认为面议</font>)</td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">吃住说明：</td>
                        <td height="25"> <input name="life" type="text" id="life" size="20" maxlength="25" value="<%= life %>"> 
                          <font color="#666666">(请职位的吃住方面的备注</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">其他说明：</td>
                        <td height="25"> <input name="other" type="text" id="other" size="30" maxlength="50" value="<%= other %>"> 
                        </td>
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
            <td height="40" align="center"><input type="hidden" name="pageno" value="<%= PageNo %>">
              <input type="hidden" name="Jobid" value="<%= Jobid %>"> 
              <input type="submit" name="submit" value=" 确 认 保 存 " style="height:30px;"> 
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

 PageNo    = Replace_Text(Request.Form("PageNo"))
 'Corid,Com_Property,Com_Name,JobName,Valids,Number,Com_Memo,Require,Deal,Life,Other
 Ncid				= Replace_Text(Request.Form("Jobid"))
 Com_Property		= Replace_Text(Request.Form("Com_Property"))
 Com_Name			= Replace_Text(Request.Form("Com_Name"))
 JobName			= Replace_Text(Request.Form("JobName"))
 Valids				= Replace_Text(Request.Form("Valids"))
 Number				= Replace_Text(Request.Form("Number"))
 Com_Memo			= Replace_Text(Request.Form("Com_Memo"))
 Require			= Replace_Text(Request.Form("Require"))
 Deal				= Replace_Text(Request.Form("Deal"))
 Life				= Replace_Text(Request.Form("Life"))
 Other				= Replace_Text(Request.Form("Other"))
  
 If Com_Memo <> "" Then Com_Memo = Replace(Com_Memo,chr(13),"<br>")
 If Require <> "" Then Require = Replace(Require,chr(13),"<br>")

 SQL = "Update [pH_Intro_Job] Set Com_Property="&Com_Property&",Com_Name='"&Com_Name&"',JobName='"&JobName&"',Valids="&Valids&",Number="&Number&",Com_Memo='"&Com_Memo&"',Require='"&Require&"',Deal='"&Deal&"',Life='"&Life&"',Other='"&Other&"' Where Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)

 Response.Write "<script>alert('编辑完成');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//关闭数据库连接
CloseDB

 %>

