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
If Instr(1,Session("Web_Power"),"145") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Lessonid = Replace_Text(Request.QueryString("Param"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Submit() '//���ñ������ݵĺ���


'��ȡ�ü�¼
Set Rs = Conn.Execute("Select * From [pH_Educate_Lesson] Where Ncid="&Cstr(Lessonid))
If Rs.Eof Then
 Response.write "û���ҵ�ָ���ļ�¼��"
 Response.End()
Else
 LessonName			= Rs("LessonName")
 Properity			= Rs("Properity")
 BeginDate			= Rs("BeginDate")
 EndDate			= Rs("EndDate")
 Locus_Area			= Rs("Locus_Area")
 Locus_City			= Rs("Locus_City")
 Address			= Rs("Address")
 Price				= Rs("Price")
 WebPrice			= Rs("WebPrice")
 EducateName		= Rs("EducateName")
 Objs				= Rs("Objs")
 Teacher			= Rs("Teacher")
 Mudi				= Rs("Mudi")
 Content			= Rs("Content")
 Number1			= Rs("Number")
 Languages			= Rs("Languages")
 Other				= Rs("Other")
 Phone				= Rs("Phone")
 Fax				= Rs("Fax")
 Person				= Rs("Person")
 Best			    = Rs("Best")
 
 If Objs <> "" Then Objs = Replace(Objs,"<br>",chr(13))
 If Mudi <> "" Then Mudi = Replace(Mudi,"<br>",chr(13))
 If Content <> "" Then Content = Replace(Content,"<br>",chr(13))
 If Other <> "" Then Other = Replace(Other,"<br>",chr(13))

End if
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/Educate_Lessonedit.js"></script>
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�༭�γ�</strong></font></td>
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
        <form action="?action=edit" name="edit" method="post" onSubmit="return edit_check()">
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
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������ѵ�γ�</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �γ����ƣ�</td>
                        <td height="25"> <input name="lessonname" type="text" id="lessonname" size="30" maxlength="50" value="<%= lessonname %>"> 
                          <font color="#666666">(������γ�����</font>)</td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �γ����ͣ�</td>
                        <td height="25" bgcolor="f9f9f9"> <SELECT name=properity class=txtfield id="properity">
                            <OPTION value="" >--��ѡ��--</OPTION>
                            <OPTION value="��ҵ��ѵ" <% If properity = "��ҵ��ѵ" Then Response.write "Selected" %>>��ҵ��ѵ</OPTION>
                            <OPTION value="�ʸ���֤" <% If properity = "�ʸ���֤" Then Response.write "Selected" %>>�ʸ���֤</OPTION>
                            <OPTION value="IT��ѵ" <% If properity = "IT��ѵ" Then Response.write "Selected" %>>IT��ѵ</OPTION>
                            <OPTION value="������ѵ" <% If properity = "������ѵ" Then Response.write "Selected" %>>������ѵ</OPTION>
                            <OPTION value="ѧ������" <% If properity = "ѧ������" Then Response.write "Selected" %>>ѧ������</OPTION>
                            <OPTION value="������" <% If properity = "������" Then Response.write "Selected" %>>������</OPTION>
                          </SELECT> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����ʱ�䣺</td>
                        <td height="25"> <input name="begindate" type="text" id="begindate" size="16" onclick="SD(this,'document.all.begindate')"  value="<%= begindate %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ֹʱ�䣺</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="enddate" type="text" id="enddate" size="16" onclick="SD(this,'document.all.enddate')" value="<%= enddate %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ε�����</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���εص㣺</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="address" type="text" id="address" size="30" maxlength="100" value="<%= address %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �γ�ԭ�ۣ�</td>
                        <td height="25"> <input name="price" type="text" id="price" size="16" value="<%= price %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ϼ۸�</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="webprice" type="text" id="webprice" size="16" value="<%= webprice %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">���쵥λ��</td>
                        <td height="25"> <input name="educatename" type="text" id="educatename" size="30" maxlength="50" value="<%= educatename %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ѵ����</td>
                        <td height="25" bgcolor="f9f9f9"> <textarea name="objs" cols="55" rows="5" id="objs"><%= objs %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �γ�Ŀ�ģ�</td>
                        <td height="25"> <textarea name="mudi" cols="55" rows="5" id="mudi"><%= mudi %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �γ����ݣ�</td>
                        <td height="25" bgcolor="f9f9f9"> <textarea name="content" cols="55" rows="5" id="content"><%= content %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"> ����˵����</td>
                        <td height="25"> <textarea name="other" cols="55" rows="5" id="other"><%= other %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> <STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ÿ��������</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="number" type="text" id="number" size="6" value="<%= number1 %>">
                          �� <font color="#666666">(��,50��)</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"> �ڿ����ԣ�</td>
                        <td height="25"> <input name="languages" type="text" id="languages" size="16" value="<%= languages %>"> 
                          <font color="#666666">(��,����)</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> �ڿν�ʦ��</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="teacher" type="text" id="languages" size="16" value="<%= teacher %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�ˣ�</td>
                        <td height="25"> <input name="person" type="text" id="person" size="16" value="<%= person %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="phone" type="text" id="currcy3" size="16"  value="<%= phone  %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">�� �棺</td>
                        <td height="25"> <input name="fax" type="text" id="currcy4" size="16" value="<%= fax %>"></td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">�ػݿγ̣�</td>
                        <td height="25"> <input name="best" type="checkbox" id="best" value="1" <% If Best = True Then Response.write "Checked" %>>
                          ����Ϊ�ػݿγ�</td>
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
              <input name="lessonid" type="hidden" id="lessonid" value="<%= Lessonid %>"> 
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

'LessonName,Properity,BeginDate,EndDate,Locus_Area,Locus_City,Address,Price,WebPrice,EducateName,Objs,Teacher,Mudi,Content,Number,Languages,Other,Phone,Fax,Person
 PageNo	   			= Replace_Text(Request.Form("PageNo"))
 Lessonid			= Replace_Text(Request.Form("Lessonid"))
 LessonName			= Replace_Text(Request.Form("LessonName"))
 Properity			= Replace_Text(Request.Form("Properity"))
 BeginDate			= Replace_Text(Request.Form("BeginDate"))
 EndDate			= Replace_Text(Request.Form("EndDate"))
 Locus_Area			= Replace_Text(Request.Form("x_suozaidi"))
 Locus_City			= Replace_Text(Request.Form("x_suozaidi1"))
 Address			= Replace_Text(Request.Form("Address"))
 Price				= Replace_Text(Request.Form("Price"))
 WebPrice			= Replace_Text(Request.Form("WebPrice"))
 EducateName		= Replace_Text(Request.Form("EducateName"))
 Objs				= Replace_Text(Request.Form("Objs"))
 Teacher			= Replace_Text(Request.Form("Teacher"))
 Mudi				= Replace_Text(Request.Form("Mudi"))
 Content			= Replace_Text(Request.Form("Content"))
 Number1			= Replace_Text(Request.Form("Number"))
 Languages			= Replace_Text(Request.Form("Languages"))
 Other				= Replace_Text(Request.Form("Other"))
 Phone				= Replace_Text(Request.Form("Phone"))
 Fax				= Replace_Text(Request.Form("Fax"))
 Person				= Replace_Text(Request.Form("Person"))
 Best				= Replace_Text(Request.Form("Best"))
 
 If Objs <> "" Then Objs = Replace(Objs,chr(13),"<br>")
 If Mudi <> "" Then Mudi = Replace(Mudi,chr(13),"<br>")
 If Content <> "" Then Content = Replace(Content,chr(13),"<br>")
 If Other <> "" Then Other = Replace(Other,chr(13),"<br>")
 If Best = "" Then Best = 0
 
 SQL = "Update [pH_Educate_Lesson] Set LessonName='"&LessonName&"',Properity='"&Properity&"',BeginDate='"&BeginDate&"',EndDate='"&EndDate&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Address='"&Address&"',Price="&Price&",WebPrice="&WebPrice&",EducateName='"&EducateName&"',Objs='"&Objs&"',Teacher='"&Teacher&"',Mudi='"&Mudi&"',Content='"&Content&"',Number="&Number1&",Languages='"&Languages&"',Other='"&Other&"',Phone='"&Phone&"',Fax='"&Fax&"',Person='"&Person&"',Best="&Best&" Where Ncid="&Cstr(Lessonid)
 Conn.Execute(SQL)

 
 Response.Write "<script>alert('�༭���');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

