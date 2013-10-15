<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "submit" Then
  Call Submit() '//调用保存数据的函数
Elseif Action = "del" Then
  Call DelSubmit() '//调用删除数据的函数
 Elseif Action = "editsubmit" Then
  Call EditSubmit() '//调用修改数据的函数 
End if

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
<script language="JavaScript" src="../js/Company_Dept.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 企业部门</title>
</head>
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
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <% 
	  If Action = "add" Then
	    Call AddForm()
	  Elseif Action = "edit" Then
	    Call EditForm()
	  Else
	   Call Main()
	  End if
	  Sub Main()
	   %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                            <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;企业部门</font></b></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                          <tr align="center" bgcolor="f5f5f5"> 
                            <td width="25%" height="25">部门名称</td>
                            <td width="20%" height="25">部门主管</td>
                            <td width="35%" height="25">邮件地址</td>
                            <td width="20%" height="25">&nbsp;</td>
                          </tr>
                          <% 
'//查找企业的部门
SQL = "Select Ncid,DeptName,Burden,Email From [pH_Company_Dept] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 While Not Rs.Eof
  Ncid      = Rs("Ncid")
  DeptName  = Rs("DeptName")
  Burden    = Rs("Burden")
  Email     = Rs("Email")
 %>
                          <tr bgcolor="f9f9f9"> 
                            <td height="25"><%= DeptName %></td>
                            <td height="25"><%= Burden %></td>
                            <td height="25"><%= Email %></td>
                            <td height="25" align="center"><a href="?action=del&param=<%= Ncid %>" onClick="return confirm('确定删除该部门?');">删除</a> 
                              <a href="?action=edit&param=<%= Ncid %>">编辑</a></td>
                          </tr>
                          <%  
  Rs.Movenext
 Wend
End if
Rs.Close
 %>
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
                <td height="40" align="center"><input type="button" name="Submit" value="添加企业部门" style="height:30px;" onClick="location.href='?action=add';"> 
                </td>
              </tr>
            </table>
            <% 
	  End Sub
	  
	  '//添加部门的表单
	  Sub AddForm()
	   %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;企业部门</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 部门名称： </td>
                              <td height="25"><input name="deptname" type="text" id="deptname" size="20" maxlength="30"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 部门主管：</td>
                              <td height="25" bgcolor="f9f9f9"><input name="burden" type="text" id="burden" size="20" maxlength="20"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮件地址：</td>
                              <td height="25"><input name="email" type="text" id="deptname3" size="30" maxlength="50"> 
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" 添加企业部门 " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table>
            <% 
End Sub
	  
Sub EditForm() '//编辑企业部门

 Ncid                   = Replace_Text(Request("param"))
 Check_Id(Ncid)        '//检测是否是数值
 SQL = "Select Ncid,DeptName,Burden,Email From [pH_Company_Dept] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
 Set Rs = Conn.Execute(SQL)
 Ncid      = Rs("Ncid")
 DeptName  = Rs("DeptName")
 Burden    = Rs("Burden")
 Email     = Rs("Email")
 Rs.Close
	   %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=editsubmit" name="edit" method="post" onSubmit="return form_check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;企业部门</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 部门名称： </td>
                              <td height="25"><input name="deptname" type="text" id="deptname" size="20" maxlength="30" value="<%= DeptName %>"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 部门主管：</td>
                              <td height="25" bgcolor="f9f9f9"><input name="burden" type="text" id="burden" size="20" maxlength="20" value="<%= Burden %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 邮件地址：</td>
                              <td height="25"><input name="email" type="text" size="30" maxlength="50" value="<%= Email %>"> 
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
                  <td height="40" align="center"><input type="hidden" name="param" value="<%= Ncid %>"> 
                    <input type="submit" name="submit" value=" 添加企业部门 " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table>
            <% End Sub %>
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
Sub Submit() '保存企业部门数据
 Check_Url() '//跨站提交数据检测
 Username               = Session("Company")(0)
 Comid                  = Session("Company")(2)
 DeptName               = Replace_Text(Request.Form("DeptName"))
 Burden                 = Replace_Text(Request.Form("Burden"))
 Email                  = Replace_Text(Request.Form("Email"))
 
 SQL = "Insert Into [pH_Company_Dept] (Comid,Username,DeptName,Burden,Email) Values ('"&Comid&"','"&Username&"','"&DeptName&"','"&Burden&"','"&Email&"')"
 Conn.Execute(SQL) 
 '//更新最后更新时间
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//关闭数据库连接
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub

Sub DelSubmit() '删除企业部门
 Check_Url() '//跨站提交数据检测
 Comid                  = Session("Company")(2)
 Ncid                   = Replace_Text(Request("param"))
 Check_Id(Ncid)        '//检测是否是数值
 
 SQL = "Delete From [pH_Company_Dept] Where Ncid="&Ncid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL)
  
 '//更新最后更新时间
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//关闭数据库连接
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub

Sub EditSubmit() '保存企业部门数据[修改]
 Check_Url() '//跨站提交数据检测
 Comid                  = Session("Company")(2)
 Ncid                   = Replace_Text(Request.Form("param"))
 DeptName               = Replace_Text(Request.Form("DeptName"))
 Burden                 = Replace_Text(Request.Form("Burden"))
 Email                  = Replace_Text(Request.Form("Email"))
 
 SQL = "Update [pH_Company_Dept] Set DeptName='"&DeptName&"',Burden='"&Burden&"',Email='"&Email&"' Where Ncid="&Ncid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL) 
 '//更新最后更新时间
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//关闭数据库连接
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub


'//关闭数据库连接
CloseDB
 %>
