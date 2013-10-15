<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL,Vip_Flag,Tmp
Dim Comid,UserName,Jobid,JobName,RealName

Action = Request.QueryString("action")
If Action = "save" Then Call Save_Submit() '保存数据 

'//获取用户的登陆标记
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-登录后才能进行该操作！-');window.close();</script>"
 Response.End()
End if

'//判断企业会员的类型，免费会员不能发送面试邀请
If Session("Nc_Vip") <> 1 Then
  Response.write "<script>alert('免费会员不能进行该操作！请升级会员...');window.close();</script>"
  Response.End()
End if

'//获取企业发布的职位，没有发布职位则不能邀请面试...
SQL = "Select Jobid,JobName From [pH_Job_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
  Tmp = Rs.GetRows()
Else
  Response.write "<script>alert('发布职位后才能邀请求职者参加视频面试...');window.close();</script>"
  Response.End()
End if
Rs.Close

'//获取企业面试房间，没有房间则不能邀请面试...
SQL = "Select RoomId,RoomName From [RoomTable] Where RoomRenName='"&UserName&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
  VideoTmp = Rs.GetRows()
Else
  Response.write "<script>alert('创建视频面试房间后才能邀请求职者参加视频面试...');window.close();</script>"
  Response.End()
End if
Rs.Close

'//获取和判断参数
Ncid     = Replace_Text(Request("perid")) '个人会员ID
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');window.close();</script>"
 Response.End()
Elseif Instr(Ncid,",") <> 0 Then
 Response.write "<script language=JavaScript>alert('对不起！每次只能选择一条记录，请勿多选...');window.close();</script>"
 Response.End()
End if

'获取Perid
If Request.QueryString("Param") = "video" Then
 Set Rs = Conn.Execute("Select Perid From [pH_Company_VideoOutBox] Where Ncid="&Cstr(Ncid))
 If Not Rs.Eof Then Ncid = Rs(0)
 Rs.Close
End if

'//从数据库中获取个人用户的资料
SQL = "Select RealName From [pH_Person_Info] Where Perid='"&Ncid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then RealName = Rs(0)
Rs.Close
'//获取企业名称
SQL = "Select CompanyName,ContactPerson,Phone,Email,Address From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then 
 CompanyName     = Rs(0) '企业名称
 ContactPerson   = Rs(1)
 Phone           = Rs(2)
 Email           = Rs(3)
 Address         = Rs(4)
End if
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 发送视频面试邀请</title>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="470" border="0" align="center" cellpadding="0" cellspacing="0">
  <Form action="?action=save" method="post" name="theForm">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr>
                  <td height="25" bgcolor="f9f9f9"> &nbsp;<img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                    <strong>发送视频面试邀请</strong></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td width="100" height="25" align="right">收件人姓名：</td>
                  <td height="25"><%= RealName %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">面试职位：</td>
                  <td height="25">
				  <select name="jobid" id="jobid">
				  <% 
				  For i = 0 To UBound(Tmp,2)
				   Response.write "<option value="&Tmp(0,i)&">"&Tmp(1,i)&"</option>"
				  Next
				   %>
                    </select>
					</td>
                </tr>
                <tr>
                  <td width="100" height="25" align="right">面试房间：</td>
                  <td height="25"><select name="room" id="room">
                      <% 
				  For i = 0 To UBound(VideoTmp,2)
				   Response.write "<option value="&VideoTmp(0,i)&">"&VideoTmp(1,i)&"</option>"
				  Next
				   %>
                    </select></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">内 容：</td>
                  <td height="25"><textarea name="memo" cols="40" rows="8" id="textarea">尊敬的先生/女士：

    您好！
我们是<%= CompanyName %>，我们在<%= Cls_WebName %>上搜索到您的简历，您的条件基本符合我公司的招聘岗位要求，如果方便的话请您参加本公司在<%= Cls_WebName %>上组织的统一视频面试.

--<%= CompanyName %>
<%= Date() %></textarea> 
                    <br>
                  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="40" align="center"> 
        <input type="submit" name="Submit" value="发 送" style="height:30px;">
        <input type="button" name="Submit2" value="取消" style="height:30px;" onClick="window.close();">
        
        <input type="hidden" name="perid" value="<%= Ncid %>">

		</td>
    </tr>
  </Form>
</table>
</body>
</html>
<% 
Sub Save_Submit() '保存数据 
 
 Comid         = Session("Company")(2)
 Jobid         = Replace_Text(Request.Form("Jobid"))
 Perid         = Replace_Text(Request.Form("perid"))
 Room          = Replace_Text(Request.Form("Room"))
 Memo          = Replace_Text(Request.Form("Memo"))
 'Response.write Perid
 'Response.End()
 If Memo <> "" Then Memo = Replace(Memo,Chr(13),"<br>")

 '//获取企业面试房间信息
 SQL = "Select RoomId,RoomName,RoomPwd,BeginTime,EndTime From [RoomTable] Where RoomId="&Cstr(Room)
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
  RoomName        = Rs(1)
  RoomPwd         = Rs(2)
  BeginDate       = Rs(3)
  EndDate         = Rs(4)
 End if
 Rs.Close

 '//判断在24小时内有否发送到同意个人
SQL = "Select Ncid From [pH_Person_VideoInBox] Where Perid='"&Perid&"' And Jobid="&Jobid&" And Comid='"&Comid&"' And DateDiff(n,AddDate,GetDate())<1440"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 Rs.Close
 Response.write "对不起！在24小时内不能向同一人重复发送视频面试邀请..."
 Response.End()
End if
Rs.Close
 
 '//保存数据到个人收件夹表
 SQL = "Insert Into [pH_Person_VideoInBox] (Perid,Jobid,Comid,AddDate,RoomName,Password,BeginDate,EndDate,Content,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"',GetDate(),'"&RoomName&"','"&RoomPwd&"','"&BeginDate&"','"&EndDate&"','"&Memo&"',0)"
 Conn.Execute(SQL)
 
 '//保存数据到企业发件夹表
 SQL = "Insert Into [pH_Company_VideoOutBox] (Perid,Jobid,Comid,AddDate,RoomName,Password,BeginDate,EndDate,Content,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"',GetDate(),'"&RoomName&"','"&RoomPwd&"','"&BeginDate&"','"&EndDate&"','"&Memo&"',0)"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('发送成功！');window.close();</script>"

End Sub

'//关闭数据库连接
CloseDB
 %>
