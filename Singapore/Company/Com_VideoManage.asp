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
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��Ƶ����</font></b></td>
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
                              <td width="23%" height="25">���Է�������</td>
                              <td width="15%" height="25">��������</td>
                              <td width="6%" height="25" align="center">����</td>
                              <td width="21%" height="25">��ʼʱ��</td>
                              <td width="21%" height="25">����ʱ��</td>
                              <td height="25">����</td>
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
                              <td height="25"><a onclick='{if(confirm("ȷʵҪɾ�������Է�����")){return true;}return false;}' href="?action=delroom&id=<%= Re("RoomId") %>"><u>ɾ��</u></a> 
                                <a href="Com_VideoEdit.asp?Roomid=<%= Re("RoomId") %>"><u>�༭</u></a></td>
                            </tr>
                            <% 
 Re.Movenext
Wend
Re.Close
 %>
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
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="4"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;�������Է���</font></b></td>
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
                              <td height="25"><input name="roomname" type="text" id="roomname"> 
                                <font color="#666666">����������ҵ����Ƹְλ���ַ����</font></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">�������룺</td>
                              <td height="25"> 
                                <input name="roompwd" type="password" id="roompwd" size="12"> 
                                <font color="#666666">Ĭ������ְ�߿���ֱ�ӽ��뷿��</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">���������</td>
                              <td height="25"> <select name="maxmembernum" id="maxmembernum">
                                  <% 
									 For i=2 to 10
									  Response.write "<option value="&i&">"&i&"</option>"
									 Next
									  %>
                                </select> </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td width="80" height="25" align="right">����ʱ�䣺</td>
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
                              <td width="80" height="25" align="right">����ʱ�䣺</td>
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
                                <input type="submit" name="Submit" value=" �������Է��� "></td>
                            </tr>
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
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left"> | <%= Cls_WebName %>��ʾ��<br> &middot;�����ҵ��Ա�߱���Ƶ��Ƹ����Ƶ����Ȩ�� ;<br> 
                  &middot;���������ҵ��Ҫ����ְ�߽�����Ƶ���� ��<a href="Com_AccountVip.asp"><font color="#FF0000">�������������Ա</font></a>���ߺ�<a href="../Public/Conact.asp"><font color="#FF0000">�ͷ���Ա��ϵ</font></a> ;</td>
              </tr>
</table>
<% 
End Sub

Sub OverVip() '����VIP����
 %>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="text01">
              <tr> 
                <td align="left">| <%= Cls_WebName %>��ʾ��<br> &middot;�Բ���������ҵVIP��Ա�Ѿ����ڣ���ʱ���߱���Ȩ�� ;<br> 
                  &middot;���������ҵ��Ҫ����ְ�߽�����Ƶ���� ���<a href="../Public/Conact.asp"><font color="#FF0000">�ͷ���Ա��ϵ</font></a>�Ա㼰ʱ��ͨ ;</td>
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
 '//������ʱ���Ƿ���ڿ�ʼʱ��
 If DateDiff("n",BeginTime,EndTime) <= 0 Then
  Response.write "<script>alert('-����ʱ�������ڿ�ʼʱ�䣬�������������-');history.back(-1);</script>"
  Response.End()  
 End if
 '//��ⷿ���Ƿ����
 Set Rs = Conn.Execute("Select Roomid From [RoomTable] Where RoomName='"&RoomName&"' And RoomRenName='"&RoomRenName&"'")
 If Not Rs.Eof Then
  Rs.Close
  Response.write "<script>alert('-�÷����Ѿ����ڣ���ʹ�����������Ƽ�����������-');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '// ��Ӽ�¼
 SQL = "Insert Into RoomTable(RoomName,Type,Typeid,RoomPWD,MemberNum,MaxMemberNum,Mode,Mode_2,Perm,ServerTime,RoomRenName,CreateTime,BeginTime,EndTime) Values ('" & RoomName & "',0,0,'" & RoomPWD & "',0,"&MaxMemberNum&",3,0,1,"&StrTimeToIntTime(GetTime())&",'"&RoomRenName&"',getdate(),'"&BeginTime&"','"&EndTime&"')"
 Conn.Execute(SQL)
 Response.write "<script>alert('-���䴴���ɹ�-');location.href='Com_VideoManage.asp';</script>"

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
