<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL
Dim Perid,UserName
Dim Comid,Jobid,AddDate,Title,Memo

'//获取个人用户的登陆标记
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-登录后才能进行该操作！-');window.close();</script>"
 Response.End()
End if
'//获取和判断参数
Ncid     = Replace_Text(Request("param"))
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');window.close();</script>"
 Response.End()
End if
'//查找信件
SQL = "Select * From [pH_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Response.write "<script language=JavaScript>alert('没有找到该信件！');window.close();</script>"
 Response.End()
End if
Perid     = Rs("Perid")
Jobid     = Rs("Jobid")
AddDate   = Rs("AddDate")
Title     = Rs("Title")
Memo      = Rs("Memo") 
Rs.Close
'//将信件设置为已经阅读状态
Conn.Execute("Update [pH_Company_InBox] Set Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid))
'//获取职位名称
SQL = "Select JobName From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then JobName = Rs(0)
Rs.Close
'//获取个人姓名
SQL = "Select RealName From [pH_Person_Info] Where Perid='"&Perid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then RealName = Rs(0)
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 阅读信件</title>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="470" border="0" align="center" cellpadding="0" cellspacing="0">
 
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr>
                  <td height="25" bgcolor="f9f9f9"> &nbsp;<img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                    <strong>阅读信件</strong> </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              
            <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">发件人：</td>
                  <td height="25" bgcolor="f9f9f9"><%= RealName %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">收件时间：</td>
                  <td height="25"><%= AddDate %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">职位名称：</td>
                  <td height="25" bgcolor="f9f9f9"><%= JobName %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">信件标题：</td>
                  <td height="25"><%= Title %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">内 容：</td>
                  <td height="25" bgcolor="f9f9f9">
				  <%= Memo %>
				  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="40" align="center"> 
        <input type="button" name="Submit2" value="关 闭" style="height:30px;" onClick="window.close();">
      </td>
    </tr>
  
</table>
</body>
</html>
<% 

'//关闭数据库连接
CloseDB
 %>
