<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit()

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

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 申请升级企业帐号</title>
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
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
              <form action="?action=submit" name="edit" method="post">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;企业帐号升级申请</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 用户名： </td>
                              <td height="25"><input name="username" type="text" id="username" size="20" maxlength="30"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 密 码：</td>
                              <td height="25" bgcolor="f9f9f9"><input name="password" type="password" id="password" size="20" maxlength="20"></td>
                            </tr>
                            <tr>
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 开通日期：</td>
                              <td height="25">
							  <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>">
							  </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 缴费类型：</td>
                              <td height="25"> 
                               <select name="level" id="level">
             		<% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Company_VipLevel]")
		 			While Not Re.Eof 
		 			  Response.write "<option value="&Re(0)&">"&Re(1)&"</option>"
		  			  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select></td>
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" 申请升级 " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table> </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Submit() '保存会员申请升级的记录
 'Comid         = Session("Company")(2)
 Username      = Replace_Text(Request.Form("Username"))
 Password      = Replace_Text(Request.Form("Password"))
 Password      = Md5(Password)
 Level         = Replace_Text(Request.Form("Level"))
 BeginDate     = Replace_Text(Request.Form("BeginDate"))
 '根据用户提供的用户名和密码来查找该用户
 SQL = "Select Nc_Vip_Flag,Nc_Vip_ApplyDate From [pH_Company_Base] Where Username='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs.Eof Then
  Response.Write "<script>alert('对不起！您提供的用户名或者密码不正确...');history.back(-1);</script>"
  Response.End()
 Elseif Rs(0) = True Then
  Response.Write "<script>alert('您已经是本站的高级会员...');history.back(-1);</script>"
  Response.End()
 Elseif Rs(1) <> "" Then
  Response.Write "<script>alert('您已经在想网站提出申请，客服人员会尽快联系您!\n请不要再次提出申请...');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '更新申请
 SQL = "Update [pH_Company_Base] Set Nc_Vip_Date='"&BeginDate&"',Nc_Vip_Level="&Level&",Nc_Vip_ApplyDate='"&Date()&"' Where Username='"&Username&"' And Password='"&Password&"'"
 Conn.Execute(SQL)
 
  Response.Write "<script>alert('申请成功！我们会尽快联系您...');history.back(-1);</script>"
  
End Sub
'//关闭数据库连接
CloseDB
 %>
