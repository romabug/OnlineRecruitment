<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Video/WebVT_Codes_2/VT_Page/VT_F_S.asp" -->
<% 
Dim Comid,Username,Tmp,RoomId
Dim Cmd,Rs,Action,LogoUrl,LogoKeep

Action = Request.QueryString("action")
RoomId = Replace_Text(Request.QueryString("RoomId"))

Select Case Action
 Case "save":Call Saves()
 Case "delroom":Call delroom()
End Select

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
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
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����,1VIP���,2��ͨʱ��,3��ֹʱ��
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ�����
CloseRs
Set Cmd = Nothing

'//���ܴ���
Nc_Vip_Flag        = Tmp(1,0)
Nc_Vip_Date        = Tmp(2,0)
Nc_Vip_EndDate     = Tmp(3,0)


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��Ƶ���Թ���</title>
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
                  <td bgcolor="#FFFFFF"> 
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;�༭���Է���</font></b></td>
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
                          <table width="100%" border="0" cellpadding="2" cellspacing="1">
                            <% 

Dim BeginTime,BeginTime1,BeginTime2,EndTime,EndTime1,EndTime2

SQL = "Select * From [RoomTable] Where RoomRenName='"&Username&"' And Roomid="&Cstr(RoomId)
Set Re = Conn.Execute(SQL)
If Re.Eof Then
 Response.write "<tr bgcolor=""#FFFFFF""><td width=""80"" height=""25""></td><td height=""25"">û���ҵ��÷���</td></tr>"
Else
 BeginTime = Year(Re("BeginTime"))&"-"&Month(Re("BeginTime"))&"-"&Day(Re("BeginTime"))
 BeginTime1 = Hour(Re("BeginTime"))
 BeginTime2 = Minute(Re("BeginTime"))
 
 EndTime = Year(Re("EndTime"))&"-"&Month(Re("EndTime"))&"-"&Day(Re("EndTime"))
 EndTime1 = Hour(Re("EndTime"))
 EndTime2 = Minute(Re("EndTime"))
 %>
                            <script language="JavaScript">
								 function theForm_Check()
								 {
								  if (document.theForm.roomname.value==""){
								   alert("-���������Է��������-");
								   document.theForm.roomname.focus();
								   return false;
								  }
								   if (document.theForm.begintime.value==""){
								   alert("-���������Կ�ʼʱ��-");
								   document.theForm.begintime.focus();
								   return false;
								  }
								  if (document.theForm.endtime.value==""){
								   alert("-���������Խ���ʱ��-");
								   document.theForm.endtime.focus();
								   return false;
								  }
								 }
								</script>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">�������ƣ�</td>
                              <td height="25"><input name="roomname" type="text" id="roomname" value="<%= Re("RoomName") %>"> 
                                <font color="#666666">����������ҵ����Ƹְλ���ַ����</font></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">�������룺</td>
                              <td height="25"> 
                                <input name="roompwd" type="text" id="roompwd" size="12" value="<%= Re("RoomPwd") %>"> 
                                <font color="#666666">Ĭ������ְ�߿���ֱ�ӽ��뷿��</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">���������</td>
                              <td height="25"> <select name="maxmembernum" id="maxmembernum">
                                  <%For i=2 to 10%>
                                  <option value="<%= i %>" <% If i=Re("MaxMemberNum") Then Response.write "Selected" %>><%= i %></option>
                                  <%Next%>
                                </select> </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">����ʱ�䣺</td>
                              <td height="25"> 
                                <input name="begintime" type="text" id="begintime" size="12" maxlength="16"  onclick="SD(this,'document.all.begintime')" value="<%= BeginTime %>"> 
                                <select name="begintime1">
                                  <% For i=0 to 23 %>
                                  <option value="<%= i %>" <% If i = BeginTime1 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select> <select name="begintime2">
                                  <% For i=0 to 59 %>
                                  <option value="<%= i %>" <% If i = BeginTime2 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">����ʱ�䣺</td>
                              <td height="25"> <input name="endtime" type="text" id="endtime" size="12" maxlength="16"  onclick="SD(this,'document.all.endtime')" value="<%= EndTime %>"> 
                                <select name="endtime1">
                                  <% For i=0 to 23 %>
                                  <option value="<%= i %>" <% If i=EndTime1 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select> <select name="endtime2">
                                  <% For i=0 to 59 %>
                                  <option value="<%= i %>" <% If i=EndTime2 Then Response.write "Selected" %>><%= i %></option>
                                  <% Next%>
                                </select></td>
                            </tr>
                            <tr align="center" bgcolor="#FFFFFF"> 
                              <td height="25" colspan="2"><input type="hidden" name="roomid" value="<%= Roomid %>">
                                <input type="submit" name="Submit" value=" �������Է��� "></td>
                            </tr>
                            <% End if %>
                          </table>
                          <% 
 Else
  Call OverVip() '���ڵ�VIP��Ա
 End if
Else
 Call NoVip() '����VIP��Ա
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
Sub NoVip()  '����VIP��Ա

%>
<table width="80%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left"> | <%= Cls_WebName %>��ʾ��<br> &middot;�����ҵ��Ա�߱���Ƶ��Ƹ����Ƶ����Ȩ�ޣ�<br> 
                  &middot;���������ҵ��Ҫ����ְ�߽�����Ƶ���� ��<a href="Com_AccountVip.asp"><font color="#FF0000">�������������Ա</font></a>���ߺ�<a href="../Conact.asp"><font color="#FF0000">�ͷ���Ա��ϵ</font></a>��</td>
              </tr>
</table>
<% 
End Sub

Sub OverVip() '����VIP����
 %>
<table width="80%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left">| <%= Cls_WebName %>��ʾ��<br> &middot;�Բ���������ҵVIP��Ա�Ѿ����ڣ���ʱ���߱���Ȩ�ޣ�<br> 
                  &middot;���������ҵ��Ҫ����ְ�߽�����Ƶ���� ���<a href="../Conact.asp"><font color="#FF0000">�ͷ���Ա��ϵ</font></a>�Ա㼰ʱ��ͨ��</td>
              </tr>
</table>

<%
End Sub
 
Sub Saves()
 Dim RoomName,RoomPwd,MaxMemberNum,RoomRenName
 Dim BeginTime,EndTime
 RoomId = SafeRequest("RoomId")
 RoomName = SafeRequest("RoomName")
 RoomPwd = SafeRequest("RoomPwd")
 MaxMemberNum = Cint(SafeRequest("MaxMemberNum"))
 RoomRenName = Session("Company")(0)
 
 BeginTime = SafeRequest("begintime")&" "&SafeRequest("begintime1")&":"&SafeRequest("begintime2")&":00"
 EndTime = SafeRequest("endtime")&" "&SafeRequest("endtime1")&":"&SafeRequest("endtime2")&":00"
 '//������ʱ���Ƿ���ڿ�ʼʱ��
 If DateDiff("n",BeginTime,EndTime) <= 0 Then
  Response.write "<script>alert('-����ʱ�������ڿ�ʼʱ�䣬�������������-');history.back(-1);</script>"
  Response.End()  
 End if
 '//��ⷿ���Ƿ����
 Set Rs = Conn.Execute("Select Roomid From [RoomTable] Where RoomName='"&RoomName&"' And RoomRenName='"&RoomRenName&"' And RoomId<>"&Cstr(RoomId))
 If Not Rs.Eof Then
  Rs.Close
  Response.write "<script>alert('-�÷����Ѿ����ڣ���ʹ������������-');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close

 '// �޸ļ�¼
 SQL = "Update [RoomTable] Set RoomName='" & RoomName & "',RoomPWD='" & RoomPWD & "',MaxMemberNum="&MaxMemberNum&",ServerTime="&StrTimeToIntTime(GetTime())&",RoomRenName='"&RoomRenName&"',BeginTime='"&BeginTime&"',EndTime='"&EndTime&"' Where RoomId="&Cstr(RoomId)&" And RoomRenName='"&RoomRenName&"'"
 Conn.Execute(SQL)
 Response.write "<script>alert('-����༭�ɹ�-');location.href='Com_VideoManage.asp';</script>"

End sub


CloseDB
 %>
