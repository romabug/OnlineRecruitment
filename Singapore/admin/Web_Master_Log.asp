<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../CSS/css_offices.css" type=text/css rel=stylesheet>
<% 
Dim Action

'//����Ƿ��վ
'Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"191") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Dim ac_ID,Actions

Action=Request.QueryString("Action")
Select Case Action  
 Case "Del"
  Call Del()     
 Case Else
  Call Main()
End Select

Sub Main()
Dim FieldName(3),FieldValue(3)
Dim Wstr,Name,Date1,Date2
Wstr = SafeRequest("w")
Name = SafeRequest("name")
Date1 = SafeRequest("date1")
Date2 = SafeRequest("date2")

FieldName(0) = "w"
FieldName(1) = "name"
FieldName(2) = "date1"
FieldName(3) = "date2"

FieldValue(0) = Wstr
FieldValue(1) = Name
FieldValue(2) = Date1
FieldValue(3) = Date2

If Wstr = "Search" Then
 Wstr = " Where sl_User like '%"&Name&"%' "
 If Date1<>"" and Date2<>"" Then
  Wstr=Wstr&" and (sl_LoginDate Between '"&Date1&" 00:00:00' and '"&Date2&" 23:59:59')"
 Elseif Date1<>"" and Date2="" Then
  Wstr=Wstr&" and sl_LoginDate >= '"&Date1&" 00:00:00' "
 Elseif Date1="" and Date2<>"" Then
  Wstr=Wstr&" and sl_LoginDate <= '"&Date2&" 23:59:59' "
 End if  
End if

%>
<SCRIPT>
function cm(nn,n2){
qus=confirm("������ϣ�")
if(qus!=0){
	window.location='?Action=over&order_id='+nn+'&username='+n2;
}
}
function dm(nn,n2){
qus=confirm("ȷʵҪ�˶���")
if(qus!=0){
	window.location='?Action=del&order_id='+nn+'&username='+n2;
}
}
</SCRIPT>

 <script src="../i_include/jsdate.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="1" background="Images/top11_bg.jpg" style="padding-top:3px;">
  <tr>
    <td>&nbsp;<font color="#FFFFFF"><strong>�����½��־</strong></font></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC" class="text02">
 <% 
 
 SQL = "Select sl_ID,sl_User,sl_Ostype,sl_LoginDate,sl_LoginIp,sl_Result,sl_ErrorPas  From [pH_Web_Login] "&Wstr&"  Order by sl_ID Desc"
 Set Rs = Server.CreateObject("ADODB.recordset")
 Rs.open SQL,Conn,1,1
Rs.pagesize=15
Pagesizes = Rs.Pagesize
PCount = Rs.PageCount
RCount = Rs.RecordCount
Page=cint(request.querystring("page"))
If Page<1 Then
 Page=1 
Elseif Page>Rs.pagecount then
 Page=Rs.pagecount
End if
If Rs.eof Then
 Response.write "<tr><td>&nbsp;<Font color=#FF0000>û�е�½��־��</Font></td></tr>"
Else
 Rs.Absolutepage=Page
 thePage = (Page-1)*Pagesizes+1
 Tmp = Rs.GetRows(Pagesizes)
 Rs.Close:Set Rs = Nothing
 
 %>
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" class="text02">
        <tr align="center" bgcolor="f5f5f5"> 
          <td width="6%" height="25" bgcolor="f5f5f5">&nbsp;�� ��</td>
          <td width="15%" height="25" bgcolor="f5f5f5">&nbsp;�û���&nbsp;</td>
          <td width="13%" bgcolor="f5f5f5">&nbsp;����ϵͳ</td>
          <td width="18%" height="25" bgcolor="f5f5f5">&nbsp;����½ʱ��</td>
          <td width="15%" height="25" bgcolor="f5f5f5">&nbsp;����½IP</td>
          <td width="10%" height="25" bgcolor="f5f5f5">&nbsp;״ ̬</td>
          <td width="13%" height="25">&nbsp;���������</td>
          <td width="10%" height="25" bgcolor="f5f5f5">&nbsp;&nbsp;�� ��</td>
        </tr>
<% 
 For i=0 to UBound(Tmp,2)
  Name = Tmp(1,i)
  If Trim(Tmp(5,i))="Errorname" or Trim(Tmp(5,i))="Errorpass" Then Name = "<Font Color=#FF0000>"&Name&"</Font>"
 %>
        <tr bgcolor="f5f5f5"> 
          <td height="25" align="center"><%= thePage+i %></td>
          <td height="25" bgcolor="f5f5f5">&nbsp;<%= Name %></td>
          <td height="25" bgcolor="f5f5f5">&nbsp;<%= Tmp(2,i) %></td>
          <td height="25">&nbsp;<%= Tmp(3,i) %></td>
          <td height="25">&nbsp;<%= Tmp(4,i) %></td>
          <td height="25">&nbsp;<%
		  Select Case Trim(Tmp(5,i)) 
		   Case "Errorname"
		    Logs = "�û�������"
		   Case "Errorpass"
		    Logs = "�������"
		   Case Else
		    Logs = "����"
		  End select
		  Response.write Logs
		  %></td>
          <td height="25">&nbsp;<%= Tmp(6,i) %></td>
          <td height="25" bgcolor="f5f5f5">&nbsp;<a href="?Action=Del&id=<%= Tmp(0,i) %>">ɾ��</a> </td>
        </tr>
        <% Next %>
      </table>
      <table width="100%" border="0" cellspacing="0">
        <tr> 
          <td height="10"></td>
        </tr>
      </table>
      <table width="100%" height="25" border="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr> 
          <td bgcolor="f5f5f5">
<table width="99%" border="0" align="center" cellspacing="1" class="text02">
              <Form name="pageForm" action="" method="post">
                <tr> 
                  <td width="40%">�� <Font Color=#FF0000><%= Rcount %></Font> ����¼ 
                  </td>
                  <td align="right">&nbsp; 
                    <%Response.Write PageList(Pagesizes,RCount,Page,FieldName,FieldValue)%>
                  </td>
                </tr>
              </Form>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <% End if %>
</table>
<table width="99%" border="0" align="center" cellspacing="1">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="f5f5f5"><table width="100%" border="0" align="center" cellspacing="1">
              <Form action="?w=Search" method="post" name="theForm">
                <tr> 
                  <td>����Ա��½���� 
                    <input name="name" type="text" id="name" size="16">
                    ��½ʱ�� �� 
                    <input name="date1" type="text" id="date1" size="10" onclick="SD(this,'document.theForm.date1')">
                    �� 
                    <input name="date2" type="text" id="date2" size="10" onclick="SD(this,'document.theForm.date2')"> 
                    <input type="submit" name="Submit" value="����"></td>
                </tr>
              </Form>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<% 
End sub

Sub Del()
 Dim id
 If Not ChkPost Then 
  Response.write "�Բ����벻Ҫ���ⲿ�ύ���ݣ�"
  Response.End()
 End If
 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Delete From [pH_Web_Login]  Where sl_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 CloseDB
 Response.Redirect "Web_Master_Log.asp"
End sub
 %>

