<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Comid = Replace_Text(Request.QueryString("Comid"))

SQL = "Select CompanyName,Nc_Video,Video_Date,Video_EndDate,Video_Flag,Video_File From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)

If Rs.Eof Then
 Response.Write("没有找到指定的企业！")
 Response.End()
End if

Tmp = Rs.GetRows()
Rs.Close:Set Rs = Nothing

CompanyName        = left(Tmp(0,0),12)
Nc_Video           = Tmp(1,0)
Video_Date         = Tmp(2,0)
Video_EndDate      = Tmp(3,0)
Video_Flag         = Tmp(4,0)
Video_File         = Tmp(5,0) 

If Nc_Video <> True Then
 Response.Write("该企业暂时没有制作视频！")
 Response.End()
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title></title>
</head>
<body>
<table  border="0" align="center" cellpadding="4" cellspacing="0">
  <tr>
    <td align="center" bgcolor="#dddddd"> 
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="210" height="165">
        <param name="movie" value="../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
        <param name="quality" value="high">
        <embed src="../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" width="210" height="165" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></object>
    </td>
  </tr>
</table>
<table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="24" align="left"><font color="#FF0000">正在播放: </font><a href="../Company/Info/Com_View.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB
 %>
