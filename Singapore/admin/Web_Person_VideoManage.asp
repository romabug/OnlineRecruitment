<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"12") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Perid  = Replace_text(request("Perid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit()
 Case "del"
  Call Del_Submit()
 
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript">

function theForm_Submit(id)
{
		
		if (id=="video")
		{
		    up.target='_self';
			up.action="Web_Person_Option.asp?param=video&perid=<%= perid %>&pageno=Web_Person_VideoManage.asp?perid=<%= perid %>"
			up.submit();	   
		}			
		
}

</script>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>审核视频简历</strong></font></td>
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
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'查找会员的数据  
 Set Rs = Conn.Execute("Select Username,Realname,Video_File From [pH_Person_Info] Where Perid='"&Perid&"'")
 If Not Rs.Eof Then
  Username        = Rs(0) 
  RealName        = Rs(1)
  Video_File      = Rs(2)
 
%>
              <form action="?action=edit" method="post" name="up">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">姓 
                    名：</td>
                  <td bgcolor="f5f5f5"><%= RealName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">帐 
                    号：</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">简历播放：</td>
                  <td bgcolor="f5f5f5"><TABLE borderColor=#e8e8e8 border=10>
                      <TBODY>
                        <TR> 
                          <TD bgColor=#999999><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="200">
                              <param name="movie" value="../Include/Class_flvplayer.swf?file=../UpLoadFiles/VideoFile/<%= Video_File %>">
                              <param name="quality" value="high">
                              <embed src="../Include/Class_flvplayer.swf?file=../UpLoadFiles/VideoFile/<%= Video_File %>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="240" height="200"></embed></object></TD>
                        </TR>
                      </TBODY>
                    </TABLE></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">开始时间：</td>
                  <td bgcolor="f5f5f5"><input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">截止时间：</td>
                  <td bgcolor="f5f5f5"><input name="enddate" type="text" id="enddate" size="16" maxlength="30" onclick="SD(this,'document.all.enddate')" value="<%= DateAdd("m",12,Date()) %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="通过审核">
                    <input type="button" name="Submit2" value="返回前页" onClick="history.back(-1);">
                    <input type="button" name="Submit22" value="删除视频" onClick="location.href='?action=del&perid=<%= Perid %>'">
                    <input name="Perid" type="hidden" id="Perid" value="<%= Perid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    
                  </td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该会员!</td>
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
Sub Edit_Submit() '通过审核
 Perid       = Replace_text(request("Perid"))
 UserName    = Replace_text(request("UserName"))
 PageNo      = Replace_text(request("PageNo"))
 BeginDate   = Replace_text(request("BeginDate"))
 EndDate     = Replace_text(request("EndDate"))

 '保存数据
 SQL = "UPdate [pH_Person_Info] Set Nc_Video=1,Video_Date='"&BeginDate&"',Video_EndDate='"&EndDate&"' Where Perid='"&Trim(Perid)&"'"
 Conn.Execute(SQL)

 Response.write "<script language=JavaScript>alert('设置成功！');location.href='Web_Person_Video.asp';</script>"
End Sub

Sub Del_Submit() '删除视频
 Perid       = Replace_text(request("Perid"))
 Set Rs = Conn.Execute("Select Video_File From [pH_Person_Info] Where Perid='"&Perid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Web_Person_WaitVideo.asp"
	Response.End()
 Else
     '//删除文件
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Person_Info] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Perid='"&Perid&"'"
    Conn.Execute(SQL)
 End if

 Response.write "<script language=JavaScript>alert('删除成功！');location.href='Web_Person_WaitVideo.asp';</script>"
End Sub


Call CloseDB()
 %>

