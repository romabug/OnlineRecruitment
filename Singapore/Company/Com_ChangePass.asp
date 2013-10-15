<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp,Temp(3)
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "edit" Then Call Edit_Submit() '跳转到保存函数

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称
'//如 Tmp(0,0) 表示企业名称
'//关闭记录集对象
Rs.Close
Set Cmd = Nothing

'//功能代码

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 更改密码</title>
</head>
<script language="JavaScript" >
function theForm_check()
{
if (document.theForm.oldpass.value=="")
{
 alert("请输入原密码！");
 document.theForm.oldpass.focus();
 return false;
}

if (document.theForm.newpass.value=="")
{
 alert("请输入新密码！");
 document.theForm.newpass.focus();
 return false;
}

if (document.theForm.newpass2.value=="")
{
 alert("请先确认新密码！");
 document.theForm.newpass2.focus();
 return false;
}
if (document.theForm.newpass2.value!=document.theForm.newpass.value)
{
 alert("确认密码与新密码不相同！");
 document.theForm.newpass2.focus();
 return false;
}

}
</script>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Base.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=edit" name="theForm" method="post" onSubmit="return theForm_check()">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;更改密码</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr bgcolor="f9f9f9"> 
                              <td width="22%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 原密码：</td>
                              <td height="25"> <input name="oldpass" type="password" id="oldpass" size="15" maxlength="30"></td>
                            </tr>
                            <tr> 
                              <td width="22%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 新密码：</td>
                              <td height="25"><input name="newpass" type="password" id="newpass" size="15" maxlength="30"> 
                              </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 确认密码：</td>
                              <td height="25"><input name="newpass2" type="password" id="newpass2" size="15" maxlength="30"></td>
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" 提 交 " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table>
            
          </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Edit_Submit()
 '//接收参数
 UserName          = Session("Company")(0)
 Comid             = Session("Company")(2)

 OldPass           = Replace_Text(Request.Form("OldPass"))
 NewPass           = Replace_Text(Request.Form("NewPass"))
 
 OldPass           = Md5(OldPass)
 NewPass           = Md5(NewPass)
 '查找有没有该用户存在
 SQL = "Select UserName From [pH_Company_Base] Where Comid='"&Comid&"' And Password='"&OldPass&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs.Eof Then
  Response.write "<script>alert('对不起！请提供正确的原密码...');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '更新密码
 Conn.Execute("Update [pH_Company_Base] Set Password='"&NewPass&"' Where Comid='"&Comid&"'")
 '更改Session值
 Temp(0) = UserName
 Temp(1) = NewPass
 Temp(2) = Comid
 Session("Company") = Temp
 
 Response.write "<script>alert('修改成功！');location.href='Com_ChangePass.asp';</script>"
 
End Sub


'//关闭数据库连接
CloseDB
 %>
