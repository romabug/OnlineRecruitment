<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action,LogoUrl,LogoKeep

Action = Request.QueryString("action")
If Action = "submit" Then 
 Call Submit() 
Elseif Action = "del" Then
 Call Del_Submit() 
Elseif Action = "delphoto" Then
 Call DelPhoto_Submit() '//跳转到删除的函数  
End if

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Video"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称,1有无视频,2视频状态,3开通时间,4截止时间,5视频文件,6图片文件
'//如 Tmp(0,0) 表示企业名称
'//关闭数据库连接
CloseRs
Set Cmd = Nothing

'//功能代码
Nc_Video        = Tmp(1,0)
Video_Flag      = Tmp(2,0)
Video_Date      = Tmp(3,0)
Video_EndDate   = Tmp(4,0)
Video_File      = Tmp(5,0)
Video_PhotoUrl  = Tmp(6,0)

Video_Str = ""
If Nc_Video = True Then
 Video_FlagStr = "" '视频展示的属性
 Select Case Video_Flag
  Case 0:Video_FlagStr = "公开中"
  Case 1:Video_FlagStr = "<font color=#666666>对会员公开</font>"
  Case 2:Video_FlagStr = "<font color=#ff0000>屏蔽中</font>"
 End Select
 If DateDiff("d",Video_Date,Date()) >= 0 And DateDiff("d",Video_EndDate,Date()) <= 0 Then
  Video_Str = "您的视频展示开通时间："&Formatdatetime(Video_Date,2)&"截止时间："&Formatdatetime(Video_EndDate,2)&" <a href=?action=del>删除视频展示</a>"
 Elseif DateDiff("d",Video_EndDate,Date()) > 0  Then
  Video_Str = "您的视频展示截止，截止时间："&Formatdatetime(Video_EndDate,2)&" <a href=?action=del>删除视频展示</a>"
 End if

ElseIf Nc_Video = False And Video_File <> "" Then
 Video_Str = "您录制的视频展示暂时没有通过网站审核，<a href=?action=del>点击这里删除文件重新录制视频</a>"
Else
 Video_Str = "您还没有制作视频展示，<a href=Com_Rec_Record.asp target=_blank>点击这里在线录制视频</a>"
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 企业视频展示</title>
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
            <!--#include file="../Lefter/Company_Video.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
              <tr> 
                <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="50%"><b><font color="#000000">&nbsp;企业视频展示</font></b></td>
                            <td width="50%" align="right"> <a href="Com_Rec_Record.asp" target="_blank"><u><font color="#FF0000">在线视频录制</font></u></a> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="25" align="left">&nbsp;<%= Video_Str %></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% If Video_File <> "" Then %>
                    <tr align="left"> 
                      <td height="25" colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td align="center"> <TABLE borderColor=#e8e8e8 
                                align=center border=10>
                                <TBODY>
                                  <TR> 
                                    <TD bgColor=#999999><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="200">
                                        <param name="movie" value="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
                                        <param name="quality" value="high">
                                        <embed src="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="240" height="200"></embed></object></TD>
                                  </TR>
                                </TBODY>
                              </TABLE></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <% Else %>
                    <tr align="left"> 
                      <td height="25" colspan="2">&nbsp;您还没有制作视频展示，<a href=Com_Rec_Record.asp target=_blank>点击这里在线录制视频</a></td>
                    </tr>
                    <% End if %>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"><b><font color="#000000">视频设置</font></b></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <% If Nc_Video = True Then %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="top"><table width="98%" border="0" align="center" cellspacing="0" class="text01">
                          <form name="form" method="post" action="Com_Rec_PhotoUp.asp" enctype="multipart/form-data" >
                            <tr> 
                              <td>请上传缩略图片：</td>
                            </tr>
                            <tr> 
                              <td> <input type="hidden" name="filepath" value="../Uploadfiles/CompanyVideoPhoto"> 
                                <input type="hidden" name="back" value="1"> <input type="hidden" name="act" value="upload"> 
                                <input name="filename" style="font-family: 宋体; font-size: 12px" type="file" size="38"> 
                              </td>
                            </tr>
                            <tr> 
                              <td> <input type="button" name="Submit22" value="删除图片"  onClick="location.href='?action=delphoto';"> 
                                <input name="Send2" style="font-family: 宋体; font-size: 12px" type="submit" value="上传图片"></td>
                            </tr>
                          </form>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>上传说明<font color="#666666">：</font></td>
                          </tr>
                          <tr> 
                            <td>所传图片一律为<font face="Verdana">JPG</font>、<font face="Verdana">JPEG</font>、或<font face="Verdana">GIF</font>格式 
                              ;</td>
                          </tr>
                          <tr> 
                            <td><span style="font-family: 宋体; font-size: 12px">图片大小不能超过100K 
                              ; </span></td>
                          </tr>
                          <tr> 
                            <td><span style="font-family: 宋体; font-size: 12px">图片应该处理成大小为80 
                              x 75 像素 .</span></td>
                          </tr>
                        </table></td>
                      <td width="35%" height="170" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="4"></td>
                          </tr>
                          <tr> 
                            <td align="center"> 
                              <% 

 If Video_PhotoUrl <> Null or Video_PhotoUrl <> "" Then
  Response.write "<img src=""../UpLoadFiles/CompanyVideoPhoto/"&Video_PhotoUrl&""" width=""80"" height=""75"" class=photoborder>"
 End if

 %>
                            </td>
                          </tr>
                          <tr> 
                            <td height="4"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="25" align="left" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> <font color="#000000">视频</font>属性：当前属性为<u><%= Video_FlagStr %></u>;</td>
                    </tr>
                    <tr> 
                      <td height="25" align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <form action="?action=submit" name="theForm" method="post">
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="0" <% If Video_Flag = 0 Then Response.write "Checked" %>>
                                完全公开 ;</td>
                            </tr>
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="1" <% If Video_Flag = 1 Then Response.write "Checked" %>>
                                只对企业会员公开 ;</td>
                            </tr>
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="2" <% If Video_Flag = 2 Then Response.write "Checked" %>>
                                完全屏蔽 ;</td>
                            </tr>
                            <tr> 
                              <td height="25"><input type="submit" name="Submit" value=" 保 存 设 置 " ></td>
                            </tr>
                          </form>
                        </table></td>
                    </tr>
                  </table>
                  <% ElseIf Nc_Video = False And Video_File <> "" Then %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td>&nbsp;您录制的视频展示暂时没有通过网站审核，<a href=?action=del>点击这里删除展示重新录制</a></td>
                    </tr>
                  </table>
                  <% Else %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td>&nbsp;您还没有制作视频展示，<a href=Com_Rec_Record.asp target=_blank>点击这里在线录制视频</a></td>
                    </tr>
                  </table>
                  <% End if %>
                </td>
              </tr>
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
Sub Submit() '更改视频状态
 Comid = Session("Company")(2) 
 Flag = Replace_Text(Request.Form("flag"))
 
 SQL = "Update [pH_Company_Base] Set Video_Flag="&Flag&",LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 CloseDB
 Response.redirect "Com_Video.asp"
End Sub


Sub Del_Submit()'删除视频文件

 Comid = Session("Company")(2)
 Set Rs = Conn.Execute("Select Video_File From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
	Response.End()
 Else
     '//删除文件
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null,Video_PhotoUrl=Null Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
	CloseDB
    Response.write "<script>alert('-已经成功的删除您的视频文件！-');location.href='Com_Video.asp';</script>"
	Response.End()
 End if

End Sub


Sub DelPhoto_Submit()      '//删除照片
 '//提交数据
 Comid = Session("Company")(2)
 Set Rs = Conn.Execute("Select Video_PhotoUrl From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
 Else
     '//删除图片文件
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyVideoPhoto/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyVideoPhoto/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Video_PhotoUrl=Null Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
 
	CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
 End if
End Sub

 %>
