<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"11") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
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
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�ϴ���ҵ��Ƶ</strong></font></td>
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
    <td align="left"> <table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'���һ�Ա������  
 Set Rs = Conn.Execute("Select Username,CompanyName,Video_File From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Not Rs.Eof Then
  Username        = Rs(0) 
  CompanyName     = Rs(1)
  Video_File      = Rs(2)
 
%>
              <form action="?action=edit" method="post" name="up">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ҵ���ƣ�</td>
                  <td bgcolor="f5f5f5"><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�� 
                    �ţ�</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">��Ƶ�ļ���</td>
                  <td bgcolor="f5f5f5"><input name="videofile" type="text" id="videofile">
                    <input type="button" name="bnt12" value="�ϴ���Ƶ" onClick="window.open('upload_flash.asp?formname=up&editname=videofile&uppath=../Uploadfiles/Com_VideoFile&filelx=swf','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2">
                    (����.flv�ļ�) </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">�� �� ͼ��</td>
                  <td bgcolor="f5f5f5"><input name="photourl" type="text" id="photourl">
                    <input type="button" name="bnt1" value="�ϴ�ͼƬ" onClick="window.open('upload_flash.asp?formname=up&editname=photourl&uppath=../Uploadfiles/CompanyVideoPhoto&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">��ʼʱ�䣺</td>
                  <td bgcolor="f5f5f5"><input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ֹʱ�䣺</td>
                  <td bgcolor="f5f5f5"><input name="enddate" type="text" id="enddate" size="16" maxlength="30" onclick="SD(this,'document.all.enddate')" value="<%= DateAdd("m",12,Date()) %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"> <input type="submit" name="Submit" value="�ύ"> 
                    <input name="comid" type="hidden" id="comid" value="<%= comid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                  </td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">û���ҵ��û�Ա!</td>
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
Sub Edit_Submit() 'ͨ�����
 Comid       = Replace_text(request("Comid"))
 UserName    = Replace_text(request("UserName"))
 PageNo      = Replace_text(request("PageNo"))
 BeginDate   = Replace_text(request("BeginDate"))
 EndDate     = Replace_text(request("EndDate"))
 Videofile	 = Replace_text(request("Videofile"))
 PhotoUrl	 = Replace_text(request("PhotoUrl"))

 If Videofile <> "" Then Videofile = Replace(Videofile,"../Uploadfiles/Com_VideoFile/","")
 If PhotoUrl <> "" Then PhotoUrl = Replace(PhotoUrl,"../Uploadfiles/CompanyVideoPhoto/","")
 
 '��������
 SQL = "UPdate [pH_Company_Base] Set Nc_Video=1,Video_Date='"&BeginDate&"',Video_EndDate='"&EndDate&"',Video_File='"&VideoFile&"',Video_Photourl='"&Photourl&"' Where Comid='"&Trim(Comid)&"'"
 Conn.Execute(SQL)

 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub



Call CloseDB()

 %>

