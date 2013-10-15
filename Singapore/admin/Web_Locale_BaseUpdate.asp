<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim CompanyName,Content,Property1,Products,ContactPerson,Phone,Address,InfoFrom,Licence,AddDate,Operation,InviteDate,Memo,Fax,Bus,Owner
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"170") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Param  = Replace_text(request("Param"))
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select

Set Rs = Conn.Execute("Select * From [pH_Locale_Base] Where Ncid="&Cstr(Param))
 CompanyName			= Rs("CompanyName")
 Content                = Rs("Content")
 Properity				= Rs("Property")
 Industry    			= Rs("Industry")
 ContactPerson			= Rs("ContactPerson")
 Phone					= Rs("Phone")
 Address				= Rs("Address")
 Fax					= Rs("Fax")
 Bus					= Rs("Bus")
 Locus_Area				= Rs("Locus_Area")
 Locus_City				= Rs("Locus_City")
 
 If Content <> "" Then Content = Replace(Content,"<br>",Chr(13))
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>修改企业</strong></font></td>
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
    <td align="left"> <table width="70%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="edit">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">企业名称：</td>
                  <td bgcolor="f5f5f5"><input name="companyname" type="text" id="companyname" size="30" value="<%= companyname %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">企业性质：</td>
                  <td bgcolor="f5f5f5"><!--#include file="../Include/Class_Properity.asp" --></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">行业类别：</td>
                  <td bgcolor="f5f5f5"><!--#include file="../Include/Class_Industry.asp" --></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">工作地区：</td>
                  <td> 
                    <!--#include file="../Include/Class_Locus2.asp" -->
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">企业简介：</td>
                  <td bgcolor="f5f5f5"><textarea name="content" cols="45" rows="6" id="content"><%= content %></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">联系人：</td>
                  <td bgcolor="f5f5f5"><input name="contactperson" type="text"  size="16" value="<%= contactperson %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">联系电话：</td>
                  <td bgcolor="f5f5f5"><input name="phone" type="text" id="contactperson" size="16" value="<%= phone %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">传真号码：</td>
                  <td bgcolor="f5f5f5"><input name="fax" type="text" id="fax" size="16"  value="<%= fax %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">通讯地址：</td>
                  <td bgcolor="f5f5f5"><input name="address" type="text" id="address" size="30" value="<%= address %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">行车路线：</td>
                  <td bgcolor="f5f5f5"><input name="bus" type="text" id="bus" size="30" value="<%= bus %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="保 存"> 
                    <input name="ncid" type="hidden" id="ncid" value="<%= Param %>"> 
                  </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '修改密码]
 Ncid                   = Replace_text(Request.form("Ncid"))
 CompanyName			= Replace_text(Request.form("CompanyName"))
 Content                = Replace_text(Request.form("Content"))
 Property1				= Replace_text(Request.form("Properity"))
 Industry    			= Replace_text(Request.form("Industry"))
 ContactPerson			= Replace_text(Request.form("ContactPerson"))
 Phone					= Replace_text(Request.form("Phone"))
 Address				= Replace_text(Request.form("Address"))
 Fax					= Replace_text(Request.form("Fax"))
 Bus					= Replace_text(Request.form("Bus"))
 Locus_Area				= Replace_text(Request.form("x_suozaidi"))
 Locus_City				= Replace_text(Request.form("x_suozaidi1"))
 
 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 
 '保存数据
 SQL = "Update [pH_Locale_Base] Set CompanyName='"&CompanyName&"',Content='"&Content&"',Property='"&Property1&"',Industry="&Industry&",ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',Address='"&Address&"',Fax='"&Fax&"',Bus='"&Bus&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"' Where Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('编辑完成！');location.href='Web_Locale_Base.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

