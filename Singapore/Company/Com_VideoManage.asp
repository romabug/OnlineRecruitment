<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Video/WebVT_Codes_2/VT_Page/VT_F_S.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action,LogoUrl,LogoKeep

Action = Request.QueryString("action")

Select Case Action
 Case "save":Call Saves()
 Case "delroom":Call delroom()
End Select

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_VideoManage"
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
'//0企业名称,1VIP标记,2开通时间,3截止时间
'//如 Tmp(0,0) 表示企业名称
'//关闭数据库连接
CloseRs
Set Cmd = Nothing

'//功能代码
Nc_Vip_Flag        = Tmp(1,0)
Nc_Vip_Date        = Tmp(2,0)
Nc_Vip_EndDate     = Tmp(3,0)


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 视频面试管理</title>
</head>
<SCRIPT language=JavaScript src="../js/jsdate.js"></SCRIPT>
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
              <Form action="?action=save" method="post" name="theForm" onSubmit="return theForm_Check();">                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;视频面试</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="2"></td>
                      </tr>
                    </table>
					
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="25" align="left">
<% 
If Nc_Vip_Flag = True Then
 If DateDiff("d",Nc_Vip_Date,Date()) >= 0 And DateDiff("d",Nc_Vip_EndDate,Date()) <= 0 Then
 %>
						<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
                            <tr> 
                              <td width="23%" height="25">面试房间名称</td>
                              <td width="15%" height="25">房间密码</td>
                              <td width="6%" height="25" align="center">人数</td>
                              <td width="21%" height="25">开始时间</td>
                              <td width="21%" height="25">结束时间</td>
                              <td height="25">操作</td>
                            </tr>
                            <% 
Dim Re
SQL = "Select * From [RoomTable] Where RoomRenName='"&Username&"' Order By Roomid Desc"
Set Re = Conn.Execute(SQL)
While Not Re.Eof
 %>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25"><%= Re("RoomName") %></td>
                              <td height="25"><%= Re("RoomPwd") %></td>
                              <td height="25" align="center"><%= Re("MaxMemberNum") %></td>
                              <td height="25"><%= Re("BeginTime") %></td>
                              <td height="25"><%= Re("EndTime") %></td>
                              <td height="25"><a onclick='{if(confirm("确实要删除该面试房间吗？")){return true;}return false;}' href="?action=delroom&id=<%= Re("RoomId") %>"><u>删除</u></a> 
                                <a href="Com_VideoEdit.asp?Roomid=<%= Re("RoomId") %>"><u>编辑</u></a></td>
                            </tr>
                            <% 
 Re.Movenext
Wend
Re.Close
 %>
                          </table>
<% 
 Else
  Call OverVip() '过期的VIP会员
 End if
Else
 Call NoVip() '不是VIP会员
End if
 %>
						  </td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="4"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;创建面试房间</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                          <% 
If Nc_Vip_Flag = True Then
 If DateDiff("d",Nc_Vip_Date,Date()) >= 0 And DateDiff("d",Nc_Vip_EndDate,Date()) <= 0 Then
 %>
                          <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF">
                            <script language="JavaScript">
								 function theForm_Check()
								 {
								  if (document.theForm.roomname.value==""){
								   alert("-请输入面试房间的名称-");
								   document.theForm.roomname.focus();
								   return false;
								  }
								   if (document.theForm.begintime.value==""){
								   alert("-请输入面试开始时间-");
								   document.theForm.begintime.focus();
								   return false;
								  }
								  if (document.theForm.endtime.value==""){
								   alert("-请输入面试结束时间-");
								   document.theForm.endtime.focus();
								   return false;
								  }
								 }
								</script>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">房间名称：</td>
                              <td height="25"><input name="roomname" type="text" id="roomname"> 
                                <font color="#666666">尽量输入企业和招聘职位的字符组合</font></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">房间密码：</td>
                              <td height="25"> 
                                <input name="roompwd" type="password" id="roompwd" size="12"> 
                                <font color="#666666">默认则求职者可以直接进入房间</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">最大人数：</td>
                              <td height="25"> <select name="maxmembernum" id="maxmembernum">
                                  <% 
									 For i=2 to 10
									  Response.write "<option value="&i&">"&i&"</option>"
									 Next
									  %>
                                </select> </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">面试时间：</td>
                              <td height="25"> 
                                <input name="begintime" type="text" id="begintime" size="12" maxlength="16"  onclick="SD(this,'document.all.begintime')"> 
                                <select name="begintime1">
                                  <% For i=0 to 23 %>
                                  <option value="<%= i %>" <% If i=9 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select> <select name="begintime2">
                                  <% For i=0 to 59 %>
                                  <option value="<%= i %>"><%= i %></option>
                                  <% Next%>
                                </select></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">结束时间：</td>
                              <td height="25"> <input name="endtime" type="text" id="endtime" size="12" maxlength="16"  onclick="SD(this,'document.all.endtime')"> 
                                <select name="endtime1">
                                  <% For i=0 to 23 %>
                                  <option value="<%= i %>" <% If i=17 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select> <select name="endtime2">
                                  <% For i=0 to 59 %>
                                  <option value="<%= i %>"><%= i %></option>
                                  <% Next%>
                                </select></td>
                            </tr>
                            <tr align="center" bgcolor="#FFFFFF"> 
                              <td height="25" colspan="2">
                                <input type="submit" name="Submit" value=" 创建面试房间 "></td>
                            </tr>
                          </table>
                          <% 
 Else
  Call OverVip() '过期的VIP会员
 End if
Else
 Call NoVip() '不是VIP会员
End if
 %>
                        </td>
                      </tr>
                    </table> </td>
                </tr>
              </form>
            </table>
            
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
Sub NoVip()  '不是VIP会员

%>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left"> | <%= Cls_WebName %>提示：<br> &middot;免费企业会员具备视频招聘和视频面试权限 ;<br> 
                  &middot;如果您的企业需要和求职者进行视频面试 请<a href="Com_AccountVip.asp"><font color="#FF0000">点击这里升级会员</font></a>或者和<a href="../Public/Conact.asp"><font color="#FF0000">客服人员联系</font></a> ;</td>
              </tr>
</table>
<% 
End Sub

Sub OverVip() '超过VIP期限
 %>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left">| <%= Cls_WebName %>提示：<br> &middot;对不起！您的企业VIP会员已经过期，暂时不具备该权限 ;<br> 
                  &middot;如果您的企业需要和求职者进行视频面试 请和<a href="../Public/Conact.asp"><font color="#FF0000">客服人员联系</font></a>以便及时开通 ;</td>
              </tr>
</table>

<%
End Sub
 
Sub Saves()
 Dim RoomName,RoomPwd,MaxMemberNum,RoomRenName
 Dim BeginTime,EndTime
 RoomName = SafeRequest("RoomName")
 RoomPwd = SafeRequest("RoomPwd")
 MaxMemberNum = Cint(SafeRequest("MaxMemberNum"))
 RoomRenName = Session("Company")(0)
 
 BeginTime = SafeRequest("begintime")&" "&SafeRequest("begintime1")&":"&SafeRequest("begintime2")&":00"
 EndTime = SafeRequest("endtime")&" "&SafeRequest("endtime1")&":"&SafeRequest("endtime2")&":00"
 '//检测结束时间是否大于开始时间
 If DateDiff("n",BeginTime,EndTime) <= 0 Then
  Response.write "<script>alert('-结束时间必须大于开始时间，请继续创建房间-');history.back(-1);</script>"
  Response.End()  
 End if
 '//检测房间是否存在
 Set Rs = Conn.Execute("Select Roomid From [RoomTable] Where RoomName='"&RoomName&"' And RoomRenName='"&RoomRenName&"'")
 If Not Rs.Eof Then
  Rs.Close
  Response.write "<script>alert('-该房间已经存在，请使用其他的名称继续创建房间-');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '// 添加记录
 SQL = "Insert Into RoomTable(RoomName,Type,Typeid,RoomPWD,MemberNum,MaxMemberNum,Mode,Mode_2,Perm,ServerTime,RoomRenName,CreateTime,BeginTime,EndTime) Values ('" & RoomName & "',0,0,'" & RoomPWD & "',0,"&MaxMemberNum&",3,0,1,"&StrTimeToIntTime(GetTime())&",'"&RoomRenName&"',getdate(),'"&BeginTime&"','"&EndTime&"')"
 Conn.Execute(SQL)
 Response.write "<script>alert('-房间创建成功-');location.href='Com_VideoManage.asp';</script>"

End sub

Sub delroom()
 Dim RoomId 
 Roomid = SafeRequest("id")
 UserName = Session("Company")(0)
 Conn.Execute("Delete From [RoomTable] Where Roomid="&Cstr(RoomId))&" And RoomRenName='"&Username&"'"
 Response.redirect "Com_VideoManage.asp"
End Sub


CloseDB
 %>
