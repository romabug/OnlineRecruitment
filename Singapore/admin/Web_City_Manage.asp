<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"231") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Select Case Action
 Case "flag"
  Call Flag_Submit()
 Case "del"
  Call Del_Submit()
End Select
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>地区管理</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="4">
              <tr align="center" bgcolor="#f5f5f5"> 
                <td width="6%" height="25" bgcolor="#f5f5f5"><u>编 号</u></td>
                <td height="25" bgcolor="#f5f5f5"><u>地区名称</u></td>
                <td width="10%" bgcolor="#f5f5f5"><u>地区代码</u></td>
                <td width="10%" bgcolor="#f5f5f5"><u>英文名称</u></td>
                <td width="6%" bgcolor="#f5f5f5">状态</td>
                <td width="15%" bgcolor="#f5f5f5"><u>地区管理员名称</u></td>
                <td width="6%" bgcolor="#f5f5f5">顺序</td>
                <td width="12%" height="25" bgcolor="#f5f5f5"><u>管理操作</u></td>
              </tr>
              <% 
Set Rs = Server.CreateObject("ADODB.recordset")
SQL = "Select * From [pH_Web_City] Order by c_level Asc"
Rs.Open SQL,Conn,1,1

Rs.Pagesize = 15
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
Thepage = (PageNo-1)*Psize
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

For i = 1 to Psize
 If Rs.Eof Then Exit For
 Cityid     = Rs("Cityid")
 c_Name   = Rs("c_Name")
 e_Name   = Rs("e_Name")
 Suppername = Rs("Suppername")
 c_Level = Rs("c_Level")
 Flag = Rs("Flag")
 If Flag = True Then
  Flag_Str = "<a href=?action=flag&param="&Cityid&"&State=0>开通</a>"
 Else
  Flag_Str = "<a href=?action=flag&param="&Cityid&"&State=1><font color=#999999>关闭</font></a>"
 End if
%>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td width="6%" height="25" bgcolor="#f5f5f5"><%= Thepage+i %></td>
                <td height="25" align="left"><%= c_Name %></td>
                <td height="25"><%= Cityid %></td>
                <td height="25"><%= e_Name %></td>
                <td height="25"><%= Flag_Str %></td>
                <td height="25"><%= SupperName %></td>
                <td height="25"><%= c_Level %></td>
                <td height="25"><a href="?action=del&param=<%= Cityid %>" onClick="return confirm('是否删除该记录');"><u>删除</u></a> 
                  <a href="Web_City_Edit.asp?param=<%= Cityid %>"><u>编辑</u></a> 
                </td>
              </tr>
              <% 
 Rs.Movenext
Next

				  
%>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" bgcolor="#f5f5f5"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 
                  分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
                <td width="30%" align="right"> 
                  <%
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&ParamName="&ParamName&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&ParamName="&ParamName&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&ParamName="&ParamName&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&ParamName="&ParamName&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% 
Rs.Close
Set Rs = Nothing

'//更改状态
Sub Flag_Submit()
 Dim Param
 Param = Replace_Text(Request.QueryString("param"))
 State1 = Replace_Text(Request.QueryString("State"))
 Conn.Execute("Update [pH_Web_City] Set Flag="&State1&" Where Cityid="&Cstr(Param))
 Call CloseDB
 Response.write "设置成功！"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub


'//删除记录
Sub Del_Submit()
 Dim Param
 Param = Replace_Text(Request.QueryString("param"))
 Conn.Execute("Delete From [pH_Web_City] Where Cityid="&Cstr(Param))
 '删除相关数据
 Conn.Execute("Delete From [pH_Web_Parameter] Where Cityid="&Cstr(Param))
 Call CloseDB
 Response.write "删除成功！"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub

Call CloseDB()
 %>

