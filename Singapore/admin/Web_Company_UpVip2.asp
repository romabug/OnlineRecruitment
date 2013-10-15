<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>设置VIP会员</strong></font></td>
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
    <td align="left"> <table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'查找会员的数据  
 Set Rs = Conn.Execute("Select Username,CompanyName,Email,Nc_Vip_Level,Nc_Vip_Date,Nc_Vip_Logo From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  CompanyName   = Rs(1)
  Email         = Rs(2)
  Level         = Rs(3)
  Nc_Vip_Date   = Rs(4)
  Nc_Vip_Logo	= Rs(5)
%>
              <form action="?action=edit" method="post" name="up">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">企业名称：</td>
                  <td bgcolor="f5f5f5"><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">企业帐号：</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">收费类型：</td>
                  <td bgcolor="f5f5f5"> <select name="level" id="level">
                      <% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Company_VipLevel]")
		 			While Not Re.Eof
					%>
                      <option value="<%=Re(0)%>" <% If Level = Re(0) Then Response.write "Selected" %>><%=Re(1)%></option>
                      <%			
					  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">开始时间：</td>
                  <td bgcolor="f5f5f5"> <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Nc_Vip_Date %>"> 
                    <input name="comid" type="hidden" id="comid" value="<%= Comid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    <input name="email" type="hidden" id="email" value="<%= Email %>"> 
                    <input name="companyname" type="hidden" id="companyname" value="<%= Companyname %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">首页图片：</td>
                  <td> <input name="logo" type="text" size="20" maxlength="80" value="<%= Nc_Vip_Logo %>"> 
                    <input type="button" name="bnt1" value="上传文件" onClick="window.open('Upload_flash.asp?formname=up&editname=logo&uppath=../UpLoadFiles/CompanyIndex&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2">
                    (100*31像素)</td>
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
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该企业!</td>
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
 Comid       = Replace_text(request("Comid"))
 PageNo      = Replace_text(request("PageNo"))
 Level       = Replace_text(request("Level"))
 BeginDate   = Replace_text(request("BeginDate"))
 Email       = Replace_text(request("Email"))
 CompanyName = Replace_text(request("CompanyName"))
 Logo		 = Replace_text(request("Logo"))
 
 If Logo <> "" Then Logo = Replace(Logo,"../UpLoadFiles/CompanyIndex/","")
 '判断会员是否被审核过
 Set Rs = Conn.Execute("Select Flag From [pH_Company_Base] Where Comid='"&Trim(Comid)&"'")
 If Rs(0) = False Then
   Response.write "<script language=JavaScript>alert('操作错误！请先通过对该会员的审核');location.href='"&PageNo&"';</script>"
   Response.End()
 End if
 Rs.Close
 '查找高级会员的级别的参数
 Set Rs = Conn.Execute("Select * From [pH_Company_VipLevel] Where i_Levelid="&Cstr(Level))
 VipClicks = Rs("i_VipClick")
 VipJobs = Rs("i_VipJob")
 Rs.Close
 '设置
 SQL = "UPdate [pH_Company_Base] Set Nc_Vip_Flag=1,Nc_Vip_Level="&Level&",Nc_Vip_Date='"&BeginDate&"',Nc_Vip_EndDate=DateAdd(m,"&Level&",'"&BeginDate&"'),Nc_Vip_Clicks="&VipClicks&",Nc_Vip_Jobs="&VipJobs&",Nc_Vip_Logo='"&Logo&"' Where Comid='"&Trim(Comid)&"'"
 Conn.Execute(SQL)
 '发送邮件
 HtmlStr = "您好，您的企业["&CompanyName&"]在"&Cls_WebName&"已经与"&BeginDate&"成功设置成高级VIP会员，截止日期是"&DateAdd("m",Level,BeginDate)&"<br><hr><br>"&Cls_WebName
 'Call SendEmail(Email,HtmlStr,"您的企业是VIP会员")
 
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

