<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,Tmp
Comid = Replace_Text(Request.QueryString("Comid"))

SQL = "Select CompanyName,Nc_Video,Video_Date,Video_EndDate,Video_Flag,Video_File From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)

If Rs.Eof Then
 Response.Write("没有找到指定的企业！")
 Response.End()
End if

Tmp = Rs.GetRows()
Rs.Close:Set Rs = Nothing

CompanyName        = Tmp(0,0)
Nc_Video           = Tmp(1,0)
Video_Date         = Tmp(2,0)
Video_EndDate      = Tmp(3,0)
Video_Flag         = Tmp(4,0)
Video_File         = Tmp(5,0) 

If Nc_Video <> True Then
 Response.Write("该企业暂时没有制作视频！")
 Response.End()
End if

If DateDiff("d",Video_EndDate,Date()) > 0 Then
 Response.Write("该用户的视频已经过期！暂时不能显示...")
 Response.End()
End if

If Video_Flag = 2 Then
 Response.Write("该用户已经完全屏蔽视频！暂时不能显示...")
 Response.End()
Elseif Video_Flag = 1 Then
 If Not IsArray(Session("Company")) And Not IsArray(Session("Person")) Then
   Response.Write("该用户将视频设置成对会员开放！登录系统后才能被显示...")
   Response.End()
 End if
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css_offices.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - <%= CompanyName %> - 视频展示</title>
</head>
<body>
<br>
<br>
<table width="450" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr> 
    <td height="25" bgcolor="eeeeee">&nbsp;<b><%= CompanyName %></b> -- 视频展示</td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td><TABLE borderColor=#e8e8e8 
                                align=center border=10>
        <TBODY>
          <TR> 
            <TD bgColor=#999999><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="400" height="280">
                <param name="movie" value="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
                <param name="quality" value="high">
                <embed src="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="400" height="280"></embed></object></TD>
          </TR>
        </TBODY>
      </TABLE></td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td height="25" align="center" bgcolor="f2f2f2"><a href="<%= Cls_WebUrl %>" target="_blank"><%= Cls_WebName %></a> 
      <font color="#333333">版权所有</font></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB
 %>
