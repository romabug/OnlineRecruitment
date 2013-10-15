<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim Locid,Sortid,CompanyName,JobName,Require,Place,Valid,InviteDate
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"171") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Param  = Replace_text(request("Param"))

Set Rs = Conn.Execute("Select * From [pH_Locale_Action] Where Ncid="&Cstr(Param))
 Realname	= Rs("Realname")
 Mt			= Rs("Mt")
 Phone		= Rs("Phone")
 Email		= Rs("Email")
 Address	= Rs("Address")
 Zipcode	= Rs("Zipcode")
 Content	= Rs("Content")

Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加招聘企业的招聘职位</strong></font></td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="500" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=submit" name="edit" method="post" onSubmit="return check_edit();">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;在线应聘</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right">姓 名：</td>
                        <td height="25"><%= Realname %>
                        </td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG></STRONG>联系电话：</td>
                        <td height="25" bgcolor="f9f9f9"><%= phone %>
                          <font color="#50463d">&nbsp; </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">手机号码：</td>
                        <td height="25"><%= mt %></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">电子邮件：</td>
                        <td height="25" bgcolor="f9f9f9"><%= email %></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">邮政编码：</td>
                        <td height="25"><%= zipcode %></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">通讯地址：</td>
                        <td height="25" bgcolor="f9f9f9"><%= address %></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">求职信：</td>
                        <td height="25"><%= content %> 
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
            <td height="40" align="center"><input type="button" name="Submit" value="返回" onClick="history.back(-1);"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Call CloseDB()
 %>

