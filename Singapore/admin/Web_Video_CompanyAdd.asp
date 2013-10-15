<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Video/WebVT_Codes_2/VT_Page/VT_F_S.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"160") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Title  = Replace_text(request("Title"))
Ncid   = Replace_text(request("Ncid"))
Action = request("action")
If Action = "edit" Then Call Edit_Submit()

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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加<%= Title %>的企业</strong></font></td>
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
        <form action="?action=edit" method="post" name="theForm" onSubmit="return theForm_Check()">
		<tr> 
            <td bgcolor="#FFFFFF"> <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF">
                <script language="JavaScript">
								 function theForm_Check()
								 {
								 if (document.theForm.roomrenname.value==""){
								   alert("-请输入要参加本次招聘会的企业用户名-");
								   document.theForm.roomrenname.focus();
								   return false;
								  }
								  if (document.theForm.roomname.value==""){
								   alert("-请输入面试房间的名称-");
								   document.theForm.roomname.focus();
								   return false;
								  }
								  
								 }
								</script>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">企业用户名：</td>
                  <td height="25" bgcolor="f5f5f5">
<input name="roomrenname" type="text" id="roomrenname">
                    <a href="Web_Company_All.asp" target="_blank">查询企业</a></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right" bgcolor="f5f5f5">房间名称：</td>
                  <td height="25"> <input name="roomname" type="text" id="roomname"> 
                    <font color="#666666">尽量输入企业和招聘职位的字符组合</font></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">房间密码：</td>
                  <td height="25"> <input name="roompwd" type="password" id="roompwd" size="12"> 
                    <font color="#666666">默认则求职者可以直接进入房间</font></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">最大人数：</td>
                  <td height="25"> <select name="maxmembernum" id="maxmembernum">
                      <% 
									 For i=2 to 10
									  Response.write "<option value="&i&">"&i&"</option>"
									 Next
									  %>
                    </select> </td>
                </tr>
                <tr align="center" bgcolor="f5f5f5"> 
                  <td height="25">&nbsp; </td>
                  <td height="25" align="left" bgcolor="f5f5f5"> 
                    <input type="submit" name="Submit2" value=" 添加企业 ">
                    <input type="hidden" name="ncid" value="<%= Ncid %>"></td>
                </tr>
              </table></td>
</tr></form>
</table>
      
    </td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit()

 RoomrenName = SafeRequest("RoomrenName")
 RoomName = SafeRequest("RoomName")
 RoomPwd = SafeRequest("RoomPwd")
 MaxMemberNum = Cint(SafeRequest("MaxMemberNum"))
 '判断企业是否存在
 Set Rs = Conn.Execute("Select Ncid From [pH_Company_Base] Where Username='"&RoomrenName&"'")
 If Rs.Eof Then
  Response.write "<script language=JavaScript>alert('该企业不存在！');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '获取开始时间和结束时间
 Set Rs = Conn.Execute("Select * From [pH_Video_Type] Where Ncid="&Cstr(Ncid))
 BeginTime = Rs("BeginTime")
 EndTime = Rs("EndTime")
 Rs.Close
 
 '// 添加记录
 SQL = "Insert Into RoomTable(RoomName,Type,Typeid,RoomPWD,MemberNum,MaxMemberNum,Mode,Mode_2,Perm,ServerTime,RoomRenName,CreateTime,BeginTime,EndTime) Values ('" & RoomName & "',1,"&Ncid&",'" & RoomPWD & "',0,"&MaxMemberNum&",3,0,1,"&StrTimeToIntTime(GetTime())&",'"&RoomRenName&"',getdate(),'"&BeginTime&"','"&EndTime&"')"
 Conn.Execute(SQL)
 '更新招聘会的企业数目
 Conn.Execute("Update [pH_Video_Type] Set Coms=Coms+1 Where Ncid="&Cstr(Ncid))
 
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='Web_Video_All.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

