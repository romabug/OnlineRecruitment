<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"146") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Teacherid = Replace_Text(Request.QueryString("Param"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Submit() '//���ñ������ݵĺ���


'��ȡ�ü�¼
Set Rs = Conn.Execute("Select * From [pH_Educate_Teacher] Where Ncid="&Cstr(Teacherid))
If Rs.Eof Then
 Response.write "û���ҵ�ָ���ļ�¼��"
 Response.End()
Else

 Name				= Rs("Name")
 Phone				= Rs("Phone")
 Email				= Rs("Email")
 Photourl			= Rs("Photourl")
 Content			= Rs("Content")
 Properity			= Rs("Properity")
 LessonName			= Rs("LessonName")
 ClientMemo			= Rs("ClientMemo")
 OtherMemo 			= Rs("OtherMemo")
 
 If Content <> "" Then Content = Replace(Content,"<br>",chr(13))
 If LessonName <> "" Then LessonName = Replace(LessonName,"<br>",chr(13)) 

End if
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/Educate_Teacheradd.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�༭��ʦ</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="650" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=edit" name="reg" method="post" onSubmit="return reg_check()">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="dddddd">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������ѵ��ʦ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �� ����</td>
                        <td height="25"> <input name="name" type="text" id="name" size="20" maxlength="20" value="<%= name %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9">��ѵ���ࣺ</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="properity" type="checkbox" id="properity" value="��ҵ��ѵ" <% If Instr(Properity,"��ҵ��ѵ") <> 0 Then Response.write "Checked" %>>
                          ��ҵ��ѵ 
                          <input name="properity" type="checkbox" id="properity" value="�ʸ���֤" <% If Instr(Properity,"�ʸ���֤") <> 0 Then Response.write "Checked" %>>
                          �ʸ���֤ 
                          <input name="properity" type="checkbox" id="properity" value="IT��ѵ" <% If Instr(Properity,"IT��ѵ") <> 0 Then Response.write "Checked" %>>
                          IT��ѵ 
                          <input name="properity" type="checkbox" id="properity" value="������ѵ" <% If Instr(Properity,"������ѵ") <> 0 Then Response.write "Checked" %>>
                          ������ѵ 
                          <input name="properity" type="checkbox" id="properity" value="ѧ������" <% If Instr(Properity,"ѧ������") <> 0 Then Response.write "Checked" %>>
                          ѧ������ 
                          <input name="properity" type="checkbox" id="properity" value="������" <% If Instr(Properity,"������") <> 0 Then Response.write "Checked" %>>
                          ������ </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ʦ��飺</td>
                        <td height="25" bgcolor="f9f9f9"> <textarea name="content" cols="55" rows="5" id="content"><%= content %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����γ̣�</td>
                        <td height="25"> <textarea name="lessonname" cols="55" rows="5" id="lessonname"><%= lessonname %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> ���Ϳͻ���</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="clientmemo" type="text" id="clientmemo" size="45" maxlength="100" value="<%= clientmemo %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"> ������Ϣ��</td>
                        <td height="25"> <input name="othermemo" type="text" id="person3" size="45" maxlength="100" value="<%= othermemo %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> ��ʦ��Ƭ��</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="photourl" type="text" id="languages" size="16" value="<%= photourl %>"> 
                          <input type="button" name="bnt1" value="�ϴ�ͼƬ" onClick="window.open('../Include/Upload_flash.asp?formname=reg&editname=photourl&uppath=../UpLoadFiles/TeacherFile&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">�绰���룺</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="phone" type="text" id="currcy3" size="16"  value="<%= phone %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �ʼ���ַ��</td>
                        <td height="25"> <input name="email" type="text" id="currcy4" size="25" value="<%= email %>"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"><input type="hidden" name="PageNo" value="<%= PageNo %>">
              <input name="teacherid" type="hidden" id="teacherid" value="<%=teacherid  %>"> 
              <input type="submit" name="submit" value=" ȷ �� �� �� " style="height:30px;"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 

Sub Submit() '������ҵ��������

 'Name,Phone,Email,Photourl,Content,Properity,LessonName,ClientMemo,OtherMemo
 PageNo				= Replace_Text(Request.Form("PageNo")) 
 teacherid			= Replace_Text(Request.Form("teacherid")) 
 Name				= Replace_Text(Request.Form("Name"))
 Phone				= Replace_Text(Request.Form("Phone"))
 Email				= Replace_Text(Request.Form("Email"))
 Photourl			= Replace_Text(Request.Form("Photourl"))
 Content			= Replace_Text(Request.Form("Content"))
 Properity			= Replace_Text(Request.Form("Properity"))
 LessonName			= Replace_Text(Request.Form("LessonName"))
 ClientMemo			= Replace_Text(Request.Form("ClientMemo"))
 OtherMemo 			= Replace_Text(Request.Form("OtherMemo"))
 
 If Content <> "" Then Content = Replace(Content,chr(13),"<br>")
 If LessonName <> "" Then LessonName = Replace(LessonName,chr(13),"<br>") 
 If Photourl <> "" Then Photourl = Replace(Photourl,"../UpLoadFiles/TeacherFile/","")

 
 SQL = "Update [pH_Educate_Teacher] Set Name='"&Name&"',Phone='"&Phone&"',Email='"&Email&"',Photourl='"&Photourl&"',Content='"&Content&"',Properity='"&Properity&"',LessonName='"&LessonName&"',ClientMemo='"&ClientMemo&"',OtherMemo='"&OtherMemo&"' Where Ncid="&Cstr(Teacherid)
 Conn.Execute(SQL)
 

 
 Response.Write "<script>alert('�༭���');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

