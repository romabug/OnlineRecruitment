<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"select cid,companyname,power,closed,closed_reason,closed_time,closed_overtime,dealstatus from [01387company] where overtime<'"&date()&"' order by id desc",3,3)
  do while not rs.eof
 	 if cint(rs(2))=1 then
	 	rs(3)=1
		rs(4)="��Ա�Ѿ����ڣ���������ֱ����ϵ��лл������"
		rs(5)=now()
		rs(6)="2010-1-1 00:00:00"
		rs(7)="�����Զ��ر�"
	end if
	if Cint(rs(2))=2 then
		rs(2)=1
		conn.execute("insert into [companyover] values ('"&rs(0)&"','','','')")
	end if
  rs.movenext
  loop
Call CloseRs()
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<%
	Dim theInstalledObjects(21)
    theInstalledObjects(0) = "MSWC.AdRotator"
    theInstalledObjects(1) = "MSWC.BrowserType"
    theInstalledObjects(2) = "MSWC.NextLink"
    theInstalledObjects(3) = "MSWC.Tools"
    theInstalledObjects(4) = "MSWC.Status"
    theInstalledObjects(5) = "MSWC.Counters"
    theInstalledObjects(6) = "IISSample.ContentRotator"
    theInstalledObjects(7) = "IISSample.PageCounter"
    theInstalledObjects(8) = "MSWC.PermissionChecker"
    theInstalledObjects(9) = "Scripting.FileSystemObject"
    theInstalledObjects(10) = "adodb.connection"
    
    theInstalledObjects(11) = "SoftArtisans.FileUp"
    theInstalledObjects(12) = "SoftArtisans.FileManager"
    theInstalledObjects(13) = "JMail.SMTPMail"	'Jamil 4.2
    theInstalledObjects(14) = "CDONTS.NewMail"
    theInstalledObjects(15) = "Persits.MailSender"
    theInstalledObjects(16) = "LyfUpload.UploadFile"
    theInstalledObjects(17) = "Persits.Upload.1"
	theInstalledObjects(18) = "JMail.Message"	'Jamil 4.3
	theInstalledObjects(19) = "Persits.Upload"
	theInstalledObjects(20) = "SoftArtisans.FileUp"

Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
%>
<table width="99%" border="0" align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <th height=25 colspan=2 background="image/admin_bg_1.gif"><font color="#FFFFFF">MACAU69ϵͳ��Ϣͳ��</font></th>
  <tr> 
  <tr bgcolor="#C6D9F2"> 
    <td  height=26 colspan=2>�װ���&nbsp;<strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=request.cookies("01387job")("superlogin")%></font></strong>&nbsp;��ӭ���ĵ�¼��&nbsp;���Ĺ���ȼ�Ϊ��
      <%
select case request.cookies("01387job")("userpower")
case 2
response.Write("<font color=#009900><b>����Ա</b></font>")
case 1
response.Write("<font color=#009900><b>����Ա</b></font>")
case 3
response.Write("<font color=red><b>��������Ա</b></font>")
end select
%>
      &nbsp; ��¼IP��<font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><b><%=request.ServerVariables("REMOTE_ADDR")%></b></font>&nbsp;��¼ʱ�䣺<font color="#996600" face="Geneva, Arial, Helvetica, sans-serif"><b><%=session("logintime")%></b></font></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td width="50%" height=28  class="forumRow">���������ͣ�<%=Request.ServerVariables("OS")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
    <td width="50%" class="forumRow">�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td width="50%" height=28 class="forumRow">վ������·����<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
    <td width="50%" class="forumRow">���ݿ��ַ��</td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td width="50%" height=28 class="forumRow">FSO�ı���д�� 
      <%If Not IsObjInstalled(theInstalledObjects(9)) Then%> <font color=red><b>��</b></font> <%else%> <b>��</b> <%end if%></td>
    <td width="50%" class="forumRow">���ݿ�ʹ�ã� 
      <%If Not IsObjInstalled(theInstalledObjects(10)) Then%> <font color=red><b>��</b></font> <%else%> <b>��</b> <%end if%></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td width="50%" height=28 bgcolor="#f1f3f5" class="forumRow"> <%If IsObjInstalled(theInstalledObjects(18)) Then%>
      Jmail4.3�������֧�֣� <%else%>
      Jmail4.2���֧�֣� 
      <%end if%> <%If IsObjInstalled(theInstalledObjects(18)) or IsObjInstalled(theInstalledObjects(13)) Then%> <b>��</b> <%else%> <font color=red><b>��</b></font> <%end if%> </td>
    <td width="50%" class="forumRow">CDONTS�������֧�֣� 
      <%If Not IsObjInstalled(theInstalledObjects(14)) Then%> <font color=red><b>��</b></font> <%else%> <b>��</b> <%end if%></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="20"> </td>
  </tr>
</table>
<%call footer()%>
</body>
</html>
<%
conn.close
set conn=nothing
%>
