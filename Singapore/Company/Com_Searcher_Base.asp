<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim SQL,Rs
Dim JobId,Comid,JobName,Work_Area,Work_City,Edus,Deal,LastUpdate_Time

If IsArray(Session("Company")) Then
 Companyid = Session("Company")(2)
End if

'//��ȡ����
Comid            = Session("Company")(2)
Param            = Replace_Text(Request("Param"))
'//��ѯ������������ ��Ϊ��������
SQL = "Select * From [pH_Company_Searcher] Where Comid='"&Comid&"' And Ncid="&Cstr(Param)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Response.write "û���ҵ�����������..."
 Response.End()
Else
 WorkWillClass   = Rs("WorkWillClass") '��ְ����ְλ���
 AreaWill        = Rs("AreaWill") '����������
 PublishDate     = Rs("PublishDate") 
 Edus            = Rs("Edus")
 Works           = Rs("Works")
 Sex             = Rs("Sex")
 MinAge          = Rs("MinAge")
 MaxAge          = Rs("MaxAge")
 Industry		 = Rs("Industry")
 txtKey			 = Rs("txtKey")
End if
Rs.Close

'//��֯��ѯ����
SQL = "Select I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode,I.WorkWill1,B.LastUpdate_Time,i.Photourl,i.ResumeKeep From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And (I.ResumeKeep=0 or (i.ResumeKeep=2 And i.Perid Not in (Select Perid From [pH_Person_Keeps] Where Perid=i.Perid And Comid='"&Companyid&"'))) And B.Flag=1 And (I.WorkWill1 Like '%"&Key&"%' or I.WorkWill2 Like '%"&Key&"%' or I.WorkWill3 Like '%"&Key&"%' or I.RealName Like '%"&Key&"%')"

'//����ְλ���
If WorkWillClass <> "0-0" Then
 SQL = SQL&" And (I.WorkWillClass1 Like '%"&WorkWillClass&"%' or I.WorkWillClass2 Like '%"&WorkWillClass&"%' or I.WorkWillClass3 Like '%"&WorkWillClass&"%')"
End if
'//����������
If AreaWill <> "���޲���" Then
 SQL = SQL&" And (I.AreaWill1 Like '%"&AreaWill&"%' or I.AreaWill2 Like '%"&AreaWill&"%' or I.AreaWill3 Like '%"&AreaWill&"%')"
End if
'��ҵ���
If Industry <> "0" Then
 SQL = SQL& " And i.Industry="&Industry
End if
'//ѧ��
If Edus <> 0 Then
 SQL = SQL&" And I.Edus>="&Cstr(Edus)
End if
'//��������
If Works <> 0 Then
 SQL = SQL&" And I.Works>="&Cstr(Works)
End if
'//�Ա�
If Sex <> 2 Then
 SQL = SQL&" And I.Sex="&Cstr(Sex)
End if
'//����
If MinAge <> 0 And MaxAge <> 0 Then
 SQL = SQL&" And I.Age<="&Cstr(MinAge)&" And I.Age>="&Cstr(MaxAge)
Elseif MinAge <> 0 And MaxAge = 0 Then
 SQL = SQL&" And I.Age<="&Cstr(MinAge)
Elseif MinAge = 0 And MaxAge <> 0 Then
 SQL = SQL&" And I.Age>="&Cstr(MaxAge)
End if
'//��������
If PublishDate <> 0 Then
 SQL = SQL&" And DateDiff(d,B.LastUpdate_Time,Getdate())<"&PublishDate
End if
'//��������ķ�ʽ
SQL = SQL&" Order By B.LastUpdate_Time Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open SQL,Conn,1,1
Rs.Pagesize = 20
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Basicinfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - ְλ���� - ������</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<SCRIPT language=JavaScript>
<!--
function showoperatealert(id)
{
		if (id==2)
        {

		{
		  	thisForm.target='_blank';
			thisForm.action="../Person/Resume/Resume_List.asp";
			thisForm.submit();
		}
		}
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
//-->

</SCRIPT>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_manage.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<form name=thisForm action="" method=POST>
  <tr>
    <td align="center">
<table width="950" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
          <td width="50%" align="right">
		  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Param&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Param&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Param=<%= Param %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Param&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Param&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>

		  
		  </td>
        </tr>
      </table>
        <table width="950" border="0" align="center" cellpadding="2" cellspacing="1">
          <tr align="center" bgcolor="#4273B2"> 
            <td width="11%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>�� 
              ��</strong></font></td>
            <td width="6%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>�Ա�</strong></font></td>
            <td width="7%" bgcolor="#4273B2"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
            <td width="20%" height="25"><font color="#FFFFFF"><strong>��ҵѧУ</strong></font></td>
            <td width="20%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>��ѧרҵ</strong></font></td>
            <td width="20%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>��ְ����</strong></font></td>
            <td height="25"><font color="#FFFFFF"><strong>��������</strong></font></td>
            <td width="5%"><font color="#FFFFFF"><strong>ѡ��</strong></font></td>
          </tr>
          <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Perid = Rs("Perid")
 ResumeKeep = Rs("ResumeKeep")
 RealName = Rs("RealName")
 Sex = Rs("Sex")
 Edus = Rs("Edus")
 LastSchool = Rs("LastSchool")
 Speciality = Rs("Speciality")
 WorkWill1 = "--"
 If Rs("WorkWill1") <> "" Then WorkWill1 =  Rs("WorkWill1")
 LastUpdate_Time = FormatDateTime(Rs("LastUpdate_Time"),2)
 Photourl = Rs("Photourl")
 
 Img_str = ""
 If Photourl <> "" Then Img_Str = "<img src=../Images/img.gif width=13 height=13 align=absmiddle>"
 %>
          <tr <% if i mod 2 = 0 Then %>bgcolor="#f1f1f1"<% End if %>> 
            <td height="25" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a> 
              <%= Img_str %></td>
            <td height="25" align="center"><%= Cls_Sex(Sex) %></td>
            <td height="25" align="center"><%= Cls_Edus(Edus) %></td>
            <td height="25" align="left"><%= LastSchool %></td>
            <td height="25" align="left"><%= Speciality %></td>
            <td height="25" align="left"><%= WorkWill1 %></td>
            <td height="25" align="center"><%= LastUpdate_Time %></td>
            <td height="25" align="center"><input type=checkbox value="<%=Perid%>" name=perid></td>
          </tr>
          <% 
 Rs.Movenext 
Next
 %>
        </table>
        <table width="950" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="40%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
            <td width="60%" align="right"> <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Param&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Param&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   %> <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
                <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Param=<%= Param %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
                <% Next %>
              </select> <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Param&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Param&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>
            </td>
          </tr>
          <tr>
            <td height="25"><input onClick=CheckAll(this.form) type=checkbox value=on name=chkall>
              ȫѡ</td>
            <td align="right"><input type="button" name="Submit2" value=" �鿴���� " onClick=javascript:showoperatealert(2)></td>
          </tr>
        </table>
</td>
  </tr>
</form>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>

</body>
</html>
<% 
Rs.Close
Set Rs = Nothing
Call CloseDB
 %>
