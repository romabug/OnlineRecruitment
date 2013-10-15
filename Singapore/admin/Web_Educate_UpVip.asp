<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Schid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"14") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Schid  = Replace_text(request("Schid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻类别</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>设置收费(VIP)会员</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'查找会员的数据  
 Set Rs = Conn.Execute("Select Username,SchoolName,Email From [pH_Educate_Base] Where Schid='"&Schid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  SchoolName   = Rs(1)
  Email         = Rs(2)
%>
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">机构名称：</td>
                  <td bgcolor="f5f5f5"><%= SchoolName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">机构帐号：</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">收费类型：</td>
                  <td bgcolor="f5f5f5">
				  <select name="level" id="level">
             		<% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Educate_VipLevel]")
		 			While Not Re.Eof 
		 			  Response.write "<option value="&Re(0)&">"&Re(1)&"</option>"
		  			  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select>
				   </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">开始时间：</td>
                  <td bgcolor="f5f5f5">
				  <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>"> 
                    <input name="Schid" type="hidden" id="Schid" value="<%= Schid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    <input name="email" type="hidden" id="email" value="<%= Email %>"> 
                    <input name="SchoolName" type="hidden" id="SchoolName" value="<%= SchoolName %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="设 置"></td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该用户!</td>
              </tr>
              <% 
 End if
 Rs.Close
 Set Rs = Nothing
 %>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '修改密码
 Schid       = Replace_text(request("Schid"))
 PageNo      = Replace_text(request("PageNo"))
 Level       = Replace_text(request("Level"))
 BeginDate   = Replace_text(request("BeginDate"))
 Email       = Replace_text(request("Email"))
 SchoolName = Replace_text(request("SchoolName"))
 '判断会员是否被审核过
 Set Rs = Conn.Execute("Select Flag From [pH_Educate_Base] Where Schid='"&Trim(Schid)&"'")
 If Rs(0) = False Then
   Response.write "<script language=JavaScript>alert('操作错误！请先通过对该会员的审核');location.href='"&PageNo&"';</script>"
   Response.End()
 End if
 Rs.Close
 '查找高级会员的级别的参数
 'Set Rs = Conn.Execute("Select * From [pH_Educate_VipLevel] Where i_Levelid="&Cstr(Level))
 'VipClicks = Rs("i_VipClick")
 'VipJobs = Rs("i_VipJob")
 'Rs.Close
 '设置
 SQL = "UPdate [pH_Educate_Base] Set VipFlag=1,VipLevel="&Level&",VipDate='"&BeginDate&"',VipEndDate=DateAdd(m,"&Level&",'"&BeginDate&"'),VipApplyDate=null Where Schid='"&Trim(Schid)&"'"
 Conn.Execute(SQL)
 '发送邮件
 'HtmlStr = "您好，您的培训机构["&SchoolName&"]在"&Cls_WebName&"已经与"&BeginDate&"成功设置成高级VIP会员，截止日期是"&DateAdd("m",Level,BeginDate)&"<br><hr><br>"&Cls_WebName
 'Call SendEmail(Email,HtmlStr,"您的培训机构是VIP会员")
 
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

