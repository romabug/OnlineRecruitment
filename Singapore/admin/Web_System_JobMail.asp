<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
'Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"194") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Replace_text(request("action"))
Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת������
End Select

'��ȡ�ϴζ��ķ���ʱ��
Set Rs = Conn.Execute("Select Top 1 JobEmailSendDate From [pH_Web_Parameter]")
If Not Rs.eof Then 
 SendDate = FormatDateTime(Rs(0),2)
End if
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>ְλ����</strong></font></td>
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
    <td align="left"> <table width="55%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">�ϴη��ͣ�</td>
                  <td bgcolor="f5f5f5"><%= SendDate %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">�ʼ����⣺</td>
                  <td bgcolor="f5f5f5"><input name="title" type="text" id="title" size="40" maxlength="50" value="<%= Cls_WebName&"Ϊ���Ƽ���Ƹְλ" %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">�� 
                    �ݣ�</td>
                  <td bgcolor="f5f5f5"><textarea name="memo" cols="40" rows="8" id="memo">�𾴵�����/Ůʿ������
				  ������<%= Cls_Webname %>,������վ����ְλ���ģ��ֽ�<%= SendDate %>�Ժ󷢲���ְλ���͸������Թ�ɸѡ��ӦƸ��
				  
				  </textarea>
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">&nbsp; </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="�����ʼ�">
                    <input type="hidden" name="SendDate" value="<%= SendDate %>"> </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>

</body>
</html>
<% 
Sub Edit_Submit() '�����ʼ�
 Dim Person_Str
 SendDate    = Replace_text(request("SendDate"))
 Title       = Replace_text(request("Title"))
 Memo        = Replace_text(request("Memo"))
 Job_Str     = ""
 
 Memo = Memo & "<style type=""text/css"">td{font-size: 12px;line-height: 1.6em;}</style>" 
 Memo = Memo & "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC"">"
 Memo = Memo & "<tr align=""center"" bgcolor=""#efefef"">"
 Memo = Memo & "<td width=""35%"">ְλ����</td>"
 Memo = Memo & "<td width=""35%"">��ҵ����</td>"
 Memo = Memo & "<td width=""15%"">��������</td>"
 Memo = Memo & "<td>��������</td></tr>" 
'//��ѯ������������
SQL = "Select * From [pH_Person_Searcher] Where EmailFlag=1 And Email<>'' Order by Ncid Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof
 Job_Str         = Memo
 JobClass        = Rs("WorkWillClass")
 Work_Area       = Rs("Area")
 Work_City       = Rs("City")
 PublishDate     = Rs("PublishDate")
 Edus            = Rs("Edus")
 Works           = Rs("Works")
 Sex             = Rs("Sex")
 MinAge          = Rs("MinAge")
 MaxAge          = Rs("MaxAge")
 Locus_Area      = Rs("Locus_Area")
 Locus_City      = Rs("Locus_City")
 Email			 = Rs("Email")
'//��֯��ѯ���
 SQL = "Select j.JobId,j.Comid,j.JobName,j.Work_Area,j.Work_City,j.Edus,j.Deal,j.Number,j.Require,j.LastUpdate_Time,c.CompanyName,c.Properity,c.Workers From [pH_Job_Base] As j Inner Join [pH_Company_Base] As c On j.Comid=c.Comid Where c.Flag=1 And Len(j.JobName)>0 And j.JobFlag=1 And DateDiff(d,j.End_Date,GetDate())<=0 And DateDiff(d,'"&SendDate&"',j.LastUpdate_Time)>=0"

'ϣ���Ĺ�����λ
If JobClass <> "0-0" Then
 SQL = SQL&" And j.JobClass Like '%"&JobClass&"%'"
End if
'ϣ���Ĺ���ʡ��
If Work_Area <> "����" Then
 SQL = SQL&" And j.Work_Area='"&Work_Area&"'"
End if
'ϣ���Ĺ�������
If Work_City <> "����" Then
 SQL = SQL&" And j.Work_City='"&Work_City&"'"
End if

'ѧ��Ҫ��
If Edus <> 0 Then
 SQL = SQL&" And j.Edus>="&Cstr(Edus)
End if
'��������
If Works <> 0 Then
 SQL = SQL&" And j.Works>="&Cstr(Works)
End if
'�Ա�
If Sex <> 2 Then
 SQL = SQL&" And j.Sex="&Cstr(Sex)
End if
'����
If MinAge <> 0 And MaxAge <> 0 Then
 SQL = SQL&" And j.Min_Age<="&Cstr(MinAge)&" And j.Max_Age>="&Cstr(MaxAge)
Elseif MinAge <> 0 And MaxAge = 0 Then
 SQL = SQL&" And j.Min_Age<="&Cstr(MinAge)
Elseif MinAge = 0 And MaxAge <> 0 Then
 SQL = SQL&" And j.Max_Age>="&Cstr(MaxAge)
End if

'������ʡ��
If Locus_Area <> "����" Then
 SQL = SQL&" And j.Area='"&Locus_Area&"'"
End if
'�����ڳ���
If Locus_City <> "����" Then
 SQL = SQL&" And j.City='"&Locus_City&"'"
End if
SQL = SQL&" Order By j.LastUpdate_Time Desc"

Set Re = Conn.Execute(SQL)
While Not Re.Eof

 Job_Str = Job_Str & "<tr align=""center"" bgcolor=""#ffffff"">"
 Job_Str = Job_Str & "<td width=""35%""><a href="""&Cls_WebUrl&"Company/Info/Com_Job.asp?Comid="&Re("Comid")&"&Param="&Re("Jobid")&""" target=_blank>"&Re("JobName")&"</a></td>"
 Job_Str = Job_Str & "<td width=""35%""><a href="""&Cls_WebUrl&"Company/Info/Com_View.asp?Param="&Re("Comid")&""" target=_blank>"&Re("CompanyName")&"</a></td>"
 Job_Str = Job_Str & "<td width=""15%"">"&Re("Work_Area")&Re("Work_City")&"</td>"
 Job_Str = Job_Str & "<td>"&FormatDateTime(Re("LastUpdate_Time"),2)&"</td></tr>"
 
 Re.Movenext
Wend
Re.Close

Job_Str = Job_Str & "</table>"
Job_Str = Job_Str & "<hr size=""1"" color=""#cccccc""><br>"
Job_Str = Job_Str & Cls_WebName&" "&Cls_Domain
If Job_Str <> "" Then Job_Str = Replace(Job_Str,Chr(13),"<br>")
'�����ʼ�
Call SendEmail(Email,Job_Str,Title)


 Rs.Movenext
Wend
Rs.Close
 
 '���·�������
 Conn.Execute("UpDate [pH_Web_Parameter] Set JobEmailSendDate=getdate()")

 Response.write "<script language=JavaScript>alert('�ʼ����ͳɹ���');location.href='Web_System_JobMail.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

