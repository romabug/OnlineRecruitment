<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL,Vip_Flag,Tmp
Dim Comid,UserName,Jobid,JobName,RealName

Action = Request.QueryString("action")
If Action = "save" Then Call Save_Submit() '�������� 

'//��ȡ�û��ĵ�½���
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-��¼����ܽ��иò�����-');window.close();</script>"
 Response.End()
End if

'//�ж���ҵ��Ա�����ͣ���ѻ�Ա���ܷ�����������
If Session("Nc_Vip") <> 1 Then
  Response.write "<script>alert('��ѻ�Ա���ܽ��иò�������������Ա...');window.close();</script>"
  Response.End()
End if

'//��ȡ��ҵ������ְλ��û�з���ְλ������������...
SQL = "Select Jobid,JobName From [pH_Job_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
  Tmp = Rs.GetRows()
Else
  Response.write "<script>alert('����ְλ�����������ְ�߲μ���Ƶ����...');window.close();</script>"
  Response.End()
End if
Rs.Close

'//��ȡ��ҵ���Է��䣬û�з���������������...
SQL = "Select RoomId,RoomName From [RoomTable] Where RoomRenName='"&UserName&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
  VideoTmp = Rs.GetRows()
Else
  Response.write "<script>alert('������Ƶ���Է�������������ְ�߲μ���Ƶ����...');window.close();</script>"
  Response.End()
End if
Rs.Close

'//��ȡ���жϲ���
Ncid     = Replace_Text(Request("perid")) '���˻�ԱID
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');window.close();</script>"
 Response.End()
Elseif Instr(Ncid,",") <> 0 Then
 Response.write "<script language=JavaScript>alert('�Բ���ÿ��ֻ��ѡ��һ����¼�������ѡ...');window.close();</script>"
 Response.End()
End if

'��ȡPerid
If Request.QueryString("Param") = "video" Then
 Set Rs = Conn.Execute("Select Perid From [pH_Company_VideoOutBox] Where Ncid="&Cstr(Ncid))
 If Not Rs.Eof Then Ncid = Rs(0)
 Rs.Close
End if

'//�����ݿ��л�ȡ�����û�������
SQL = "Select RealName From [pH_Person_Info] Where Perid='"&Ncid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then RealName = Rs(0)
Rs.Close
'//��ȡ��ҵ����
SQL = "Select CompanyName,ContactPerson,Phone,Email,Address From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then 
 CompanyName     = Rs(0) '��ҵ����
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
<title><%= Cls_WebName %> -- ��Ƹ���� -- ������Ƶ��������</title>
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
                    <strong>������Ƶ��������</strong></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td width="100" height="25" align="right">�ռ���������</td>
                  <td height="25"><%= RealName %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">����ְλ��</td>
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
                  <td width="100" height="25" align="right">���Է��䣺</td>
                  <td height="25"><select name="room" id="room">
                      <% 
				  For i = 0 To UBound(VideoTmp,2)
				   Response.write "<option value="&VideoTmp(0,i)&">"&VideoTmp(1,i)&"</option>"
				  Next
				   %>
                    </select></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">�� �ݣ�</td>
                  <td height="25"><textarea name="memo" cols="40" rows="8" id="textarea">�𾴵�����/Ůʿ��

    ���ã�
������<%= CompanyName %>��������<%= Cls_WebName %>�����������ļ����������������������ҹ�˾����Ƹ��λҪ���������Ļ������μӱ���˾��<%= Cls_WebName %>����֯��ͳһ��Ƶ����.

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
        <input type="submit" name="Submit" value="�� ��" style="height:30px;">
        <input type="button" name="Submit2" value="ȡ��" style="height:30px;" onClick="window.close();">
        
        <input type="hidden" name="perid" value="<%= Ncid %>">

		</td>
    </tr>
  </Form>
</table>
</body>
</html>
<% 
Sub Save_Submit() '�������� 
 
 Comid         = Session("Company")(2)
 Jobid         = Replace_Text(Request.Form("Jobid"))
 Perid         = Replace_Text(Request.Form("perid"))
 Room          = Replace_Text(Request.Form("Room"))
 Memo          = Replace_Text(Request.Form("Memo"))
 'Response.write Perid
 'Response.End()
 If Memo <> "" Then Memo = Replace(Memo,Chr(13),"<br>")

 '//��ȡ��ҵ���Է�����Ϣ
 SQL = "Select RoomId,RoomName,RoomPwd,BeginTime,EndTime From [RoomTable] Where RoomId="&Cstr(Room)
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
  RoomName        = Rs(1)
  RoomPwd         = Rs(2)
  BeginDate       = Rs(3)
  EndDate         = Rs(4)
 End if
 Rs.Close

 '//�ж���24Сʱ���з��͵�ͬ�����
SQL = "Select Ncid From [pH_Person_VideoInBox] Where Perid='"&Perid&"' And Jobid="&Jobid&" And Comid='"&Comid&"' And DateDiff(n,AddDate,GetDate())<1440"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 Rs.Close
 Response.write "�Բ�����24Сʱ�ڲ�����ͬһ���ظ�������Ƶ��������..."
 Response.End()
End if
Rs.Close
 
 '//�������ݵ������ռ��б�
 SQL = "Insert Into [pH_Person_VideoInBox] (Perid,Jobid,Comid,AddDate,RoomName,Password,BeginDate,EndDate,Content,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"',GetDate(),'"&RoomName&"','"&RoomPwd&"','"&BeginDate&"','"&EndDate&"','"&Memo&"',0)"
 Conn.Execute(SQL)
 
 '//�������ݵ���ҵ�����б�
 SQL = "Insert Into [pH_Company_VideoOutBox] (Perid,Jobid,Comid,AddDate,RoomName,Password,BeginDate,EndDate,Content,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"',GetDate(),'"&RoomName&"','"&RoomPwd&"','"&BeginDate&"','"&EndDate&"','"&Memo&"',0)"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('���ͳɹ���');window.close();</script>"

End Sub

'//�ر����ݿ�����
CloseDB
 %>
