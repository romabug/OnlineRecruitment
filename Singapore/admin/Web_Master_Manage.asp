<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action

'//����Ƿ��վ
'Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"190") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript">
<!--
function CheckForm()
{
	document.form1.content.value=document.form1.doc_html.value;
	return true
}
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="1" background="Images/top11_bg.jpg" style="padding-top:3px;">
  <tr> 
    <td height="25">&nbsp;<font color="#FFFFFF"><strong>����Ա���� <a href="?Action=Add"><font color="#FFFFFF">���</font></a></strong></font></td>
  </tr>
</table>
<table width="99%" border="0" cellspacing="0">
  <tr> 
    <td height="4"></td>
  </tr>
</table>
<%
Action=Request.QueryString("Action")
Select Case Action 
 Case "Add"
  Call AddSupper()
 Case "AddSubmit"
  Call AddSubmit()  
 Case "Mod"
  Call Modadmin()
 Case "ModSubmit"
  Call ModSubmit()  
 Case "Del"
  Call Del() 
 Case "Edit"
  Call Edit()  
 Case "EditSubmit"
  Call EditSubmit()      
 Case Else
  Call Main()
End Select
Sub Main()

SQL="Select su_ID,su_SupperName,su_Lastime,su_LastIp,su_Iflag  From [pH_Web_Supper]"
Set Rs=Conn.Execute(SQL)

 %>
<SCRIPT>
function cm(nn){
qus=confirm("���Ҫɾ��������")
if(qus!=0){
window.location='?Action=del&id='+nn;
}
}
</SCRIPT>
<% 
If Rs.Eof Then
 Response.write "ϵͳ��û�й���Ա"
Else

 %>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1">
        <tr bgcolor="f5f5f5"> 
          <td width="5%" height="25"> &nbsp;�� ��</td>
          <td width="20%" height="25">&nbsp;��½��</td>
          <td width="20%" height="25">&nbsp;&nbsp;����½ʱ��</td>
          <td width="20%" height="25"> &nbsp;&nbsp;����½IP</td>
          <td width="8%" height="25"> &nbsp;״ ̬</td>
          <td width="12%">&nbsp;�� ��</td>
        </tr>
        <% 
Tmp = Rs.GetRows()
Rs.Close:Set Rs = Nothing

For i=0 to UBound(Tmp,2)
 %>
        <tr bgcolor="f5f5f5"> 
          <td width="20" height="25">&nbsp;<%= i+1 %></td>
          <td height="25">&nbsp;<a href="?Action=Mod&id=<%= Tmp(0,i) %>"><%= Tmp(1,i) %></a></td>
          <td height="25">&nbsp;<%= Tmp(2,i) %></td>
          <td height="25">&nbsp;<%= Tmp(3,i) %></td>
          <td height="25">&nbsp;
            <%
			
			If Tmp(4,i)=True  Then
			 Response.write "����"
			Else
			 Response.write "<Font Color=#ff0000>��ֹ</Font>"
			End if%>
          </td>
          <td height="25">&nbsp;<a href="?Action=Del&id=<%= Tmp(0,i) %>" onClick="{if(confirm('ȷ��ɾ����?')){return true;}return false;}">ɾ��</a> 
            <a href="?Action=Edit&id=<%= Tmp(0,i) %>">�༭Ȩ��</a></td>
        </tr>
        <% 
Next
%>
      </table></td>
  </tr>
</table>
<% End if %>
<table width="99%" border="0" align="center" cellspacing="1">
  <tr> 
    <td height="4"></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1">
        <tr> 
          <td bgcolor="f5f5f5">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<% 
Set Rs=Nothing
CloseDB
End Sub 

Sub AddSupper()
%>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="60%" border="0" cellspacing="1">
        <Form action="?Action=AddSubmit" method="post" name="theForm" >
          <tr align="left"> 
            <td height="25" colspan="2" bgcolor="f5f5f5">&nbsp;-��ӹ���Ա-</td>
          </tr>
          <tr> 
            <td width="100" height="25" align="right" bgcolor="f5f5f5">��̨��½����</td>
            <td bgcolor="f5f5f5"><input name="username" type="text" id="username2"></td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">��½���룺</td>
            <td bgcolor="f5f5f5"><input name="password" type="password" id="password"></td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">��½״̬��</td>
            <td bgcolor="f5f5f5"><input type="radio" name="flag" value="1">
              ���� 
              <input name="flag" type="radio" value="0" checked>
              ��ֹ</td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">&nbsp;</td>
            <td bgcolor="f5f5f5"><input type="submit" name="Submit" value=" �� �� "></td>
          </tr>
        </Form>
      </table></td>
  </tr>
</table>
<%
End Sub


Sub ModAdmin()
 
 ID = Request.QueryString("ID")
 Check_ID(ID)
 Set Rs = Conn.Execute("Select su_SupperName,su_Iflag From [pH_Web_Supper] Where su_ID="&Cstr(ID))
 Tmp = Rs.GetRows()
 Rs.Close : Set Rs = Nothing
%>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="60%" border="0" cellspacing="1">
        <Form action="?Action=ModSubmit" method="post" name="theForm" >
          <tr align="left"> 
            <td height="25" colspan="2" bgcolor="f5f5f5">&nbsp;-�޸Ĺ���Ա����-</td>
          </tr>
          <tr> 
            <td width="100" height="25" align="right" bgcolor="f5f5f5">��̨��½����</td>
            <td bgcolor="f5f5f5"><input name="username" type="text" id="username" value="<%= Tmp(0,0) %>"> 
              <input name="id" type="hidden" id="id" value="<%= ID %>"></td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">��½���룺</td>
            <td bgcolor="f5f5f5"><input name="password" type="password" id="password">
              [���޸�����ʱ�뱣��Ϊ��]</td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">��½״̬��</td>
            <td bgcolor="f5f5f5"> <input type="radio" name="flag" value="1" <% If Tmp(1,0)=True Then Response.write "Checked" %>>
              ���� 
              <input name="flag" type="radio" value="0" <% If Tmp(1,0)=False Then Response.write "Checked" %>>
              ��ֹ</td>
          </tr>
          <tr> 
            <td height="25" align="right" bgcolor="f5f5f5">&nbsp;</td>
            <td bgcolor="f5f5f5"><input type="submit" name="Submit" value=" �� �� "></td>
          </tr>
        </Form>
      </table></td>
  </tr>
</table>
<% 
End sub

Sub Edit()
 Dim id
 id= Request.QueryString("id")
 Check_id(id)
 Set Rs = Conn.Execute("Select su_Setting From [pH_Web_Supper] Where su_ID="&Cstr(ID))
 Powers = Rs(0)
 %>
<script language="JavaScript">
<!--

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall')
       e.checked = form.chkall.checked;
    }
  }
//-->
</script>
<table width="99%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <Form name="theForm" action="?Action=EditSubmit" method="post">
    <tr> 
      <td bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="1">
	            <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">ϵͳ����</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%">
				  <input name="Set" type="checkbox" id="Set" value="192" <% If Instr(Powers,"192")>0 Then Response.write "Checked" %>>
                    Ⱥ���ʼ�
				 </td>
                  <td width="15%">
				  <input name="Set" type="checkbox" id="Set" value="193" <% If Instr(Powers,"193")>0 Then Response.write "Checked" %>>
                    ��վ���� 
				  </td>
                  <td width="15%">
				  <input name="Set" type="checkbox" id="Set" value="194" <% If Instr(Powers,"194")>0 Then Response.write "Checked" %>>
                    ְλ����
				  </td>
                  <td width="15%">
				  <input name="Set" type="checkbox" id="Set" value="191" <% If Instr(Powers,"191")>0 Then Response.write "Checked" %>>
                    ��½��־ 
				   
				  </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="190" <% If Instr(Powers,"190")>0 Then Response.write "Checked" %>>
                    ����Ա���� </td>
                  <td width="15%">&nbsp;</td>
                </tr>
              </table></td>
          </tr>

          <tr> 
            <td height="24" bgcolor="f5f5f5">&nbsp;<font color="#990000">��ҵ��Ա 
              <input name="id" type="hidden" id="id" value="<%= id %>">
              </font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="110" <% If Instr(Powers,"110")>0 Then Response.write "Checked" %>>
                    ȫ����ҵ </td>
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="111" <% If Instr(Powers,"111")>0 Then Response.write "Checked" %>>
                    �շ���ҵ </td>
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="112" <% If Instr(Powers,"112")>0 Then Response.write "Checked" %>>
                    ��ҵ��Ƶ</td>
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="113" <% If Instr(Powers,"113")>0 Then Response.write "Checked" %>>
                    �����ҵ</td>
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="114" <% If Instr(Powers,"114")>0 Then Response.write "Checked" %>>
                    �����շ���ҵ</td>
                  <td width="15%" height="25"> <input name="Set" type="checkbox" id="Set" value="115" <% If Instr(Powers,"115")>0 Then Response.write "Checked" %>>
                    �ȴ������ҵ</td>
                </tr>
                <tr> 
                  <td height="25"> <input name="Set" type="checkbox" id="Set" value="116" <% If Instr(Powers,"116")>0 Then Response.write "Checked" %>>
                    �ȴ�������ҵ</td>
                  <td height="25"> <input name="Set" type="checkbox" id="Set" value="117" <% If Instr(Powers,"117")>0 Then Response.write "Checked" %>>
                    ��ҵȨ�޹��� </td>
                  <td height="25"><input name="Set" type="checkbox" id="Set" value="119" <% If Instr(Powers,"119")>0 Then Response.write "Checked" %>>
                    �����ҵ��Ƶ </td>
                  <td height="25"></td>
                  <td height="25">&nbsp;</td>
                  <td height="25">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">���˻�Ա</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="120" <% If Instr(Powers,"120")>0 Then Response.write "Checked" %>>
                    ȫ����Ա </td>
                  <td width="15%"> <input name="Set" type="checkbox" id="Set" value="123" <% If Instr(Powers,"123")>0 Then Response.write "Checked" %>>
                    �Լ���Ա </td>
                  <td width="15%"> <input name="Set" type="checkbox" id="Set" value="121" <% If Instr(Powers,"121")>0 Then Response.write "Checked" %>>
                    ȫְ��Ա </td>
                  <td width="15%"> <input name="Set" type="checkbox" id="Set" value="122" <% If Instr(Powers,"122")>0 Then Response.write "Checked" %>>
                    ��ְ��Ա </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="126" <% If Instr(Powers,"126")>0 Then Response.write "Checked" %>>
                    �ȴ���˻�Ա</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="128" <% If Instr(Powers,"128")>0 Then Response.write "Checked" %>>
                    ��Ƶ����</td>
                </tr>
                <tr> 
                  <td><input name="Set" type="checkbox" id="Set" value="124" <% If Instr(Powers,"124")>0 Then Response.write "Checked" %>>
                    �ȴ��Լ���Ա</td>
                  <td><input name="Set" type="checkbox" id="Set" value="127" <% If Instr(Powers,"127")>0 Then Response.write "Checked" %>>
                    �̶���Ա </td>
                  <td>
				  <input name="Set" type="checkbox" id="Set" value="129" <% If Instr(Powers,"129")>0 Then Response.write "Checked" %>>
                    �����Ƶ����
				  </td>
                  <td>
				  
				  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><font color="#990000">&nbsp;��ѵ��չ</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="140" <% If Instr(Powers,"140")>0 Then Response.write "Checked" %>>
                    ȫ����ѵ����</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="141" <% If Instr(Powers,"141")>0 Then Response.write "Checked" %>>
                    �շ���ѵ����</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="142" <% If Instr(Powers,"142")>0 Then Response.write "Checked" %>>
                    �����ѵ����</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="143" <% If Instr(Powers,"143")>0 Then Response.write "Checked" %>>
                    ����������</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="144" <% If Instr(Powers,"144")>0 Then Response.write "Checked" %>>
                    ����˻��� </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="145" <% If Instr(Powers,"145")>0 Then Response.write "Checked" %>>
                    ��ѵ�γ̹��� </td>
                </tr>
                <tr> 
                  <td><input name="Set" type="checkbox" id="Set" value="146" <% If Instr(Powers,"146")>0 Then Response.write "Checked" %>>
                    ��ѵ��ʦ���� </td>
                  <td><input name="Set" type="checkbox" id="Set" value="147" <% If Instr(Powers,"147")>0 Then Response.write "Checked" %>>
                    ��ѵ��ܹ��� </td>
                  <td><input name="Set" type="checkbox" id="Set" value="148" <% If Instr(Powers,"148")>0 Then Response.write "Checked" %>>
                    ��ѵ������� </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
		            <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">ԺУ��Ա</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="130" <% If Instr(Powers,"130")>0 Then Response.write "Checked" %>>
                    ȫ����Ա </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="131" <% If Instr(Powers,"131")>0 Then Response.write "Checked" %>>
                    �շѻ�Ա </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="132" <% If Instr(Powers,"132")>0 Then Response.write "Checked" %>>
                    ��ѻ�Ա </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="133" <% If Instr(Powers,"133")>0 Then Response.write "Checked" %>>
                    �����շѻ�Ա </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="134" <% If Instr(Powers,"134")>0 Then Response.write "Checked" %>>
                    �ȴ���˻�Ա</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="135" <% If Instr(Powers,"135")>0 Then Response.write "Checked" %>>
                    �ȴ�������Ա</td>
                </tr>
              </table></td>
          </tr>

          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">ְλ����</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="150" <% If Instr(Powers,"150")>0 Then Response.write "Checked" %>>
                    ȫ��ְλ </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="151" <% If Instr(Powers,"151")>0 Then Response.write "Checked" %>>
                    �̶�ְλ </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="152" <% If Instr(Powers,"152")>0 Then Response.write "Checked" %>>
                    ��Ƹְλ </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="155" <% If Instr(Powers,"155")>0 Then Response.write "Checked" %>>
                    ����ְλ </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="153" <% If Instr(Powers,"153")>0 Then Response.write "Checked" %>>
                    ȫְְλ </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="154" <% If Instr(Powers,"154")>0 Then Response.write "Checked" %>>
                    ��ְְλ
                     </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">�˲��н�</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="220" <% If Instr(Powers,"220")>0 Then Response.write "Checked" %>>
                    ȫ���н鹫˾</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="221" <% If Instr(Powers,"221")>0 Then Response.write "Checked" %>>
                    �շ��н鹫˾</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="222" <% If Instr(Powers,"222")>0 Then Response.write "Checked" %>>
                    ����н鹫˾</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="223" <% If Instr(Powers,"223")>0 Then Response.write "Checked" %>>
                    �ȴ�������˾</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="224" <% If Instr(Powers,"224")>0 Then Response.write "Checked" %>>
                    �ȴ���˹�˾</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="225" <% If Instr(Powers,"225")>0 Then Response.write "Checked" %>>
                    ��ѹ�˾Ȩ��</td>
                </tr>
                <tr>
                  <td><input name="Set" type="checkbox" id="Set" value="226" <% If Instr(Powers,"226")>0 Then Response.write "Checked" %>>
                    ��Ƹ��Ϣ����</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
		   <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">��Ƶ��Ƹ</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="160" <% If Instr(Powers,"160")>0 Then Response.write "Checked" %>>
                    ��Ƶ��Ƹ�� </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="161" <% If Instr(Powers,"161")>0 Then Response.write "Checked" %>>
                    �����Ƹ�� </td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                </tr>
              </table></td>
          </tr>

          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">��Ѷ����</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"> <table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="180" <% If Instr(Powers,"180")>0 Then Response.write "Checked" %>>
                    ������� </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="181" <% If Instr(Powers,"181")>0 Then Response.write "Checked" %>>
                    ���Ź��� </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="182" <% If Instr(Powers,"182")>0 Then Response.write "Checked" %>>
                    ������ </td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#f5f5f5">&nbsp;<font color="#990000">��վ����</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="230" <% If Instr(Powers,"230")>0 Then Response.write "Checked" %>>
                    ��ӵ��� </td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="231" <% If Instr(Powers,"231")>0 Then Response.write "Checked" %>>
                    �������� </td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                  <td width="15%">&nbsp;</td>
                </tr>
              </table></td>
          </tr>

          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp;<font color="#990000">��������</font></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellspacing="0">
                <tr> 
                  <td><input name="Set" type="checkbox" id="Set" value="170" <% If Instr(Powers,"170")>0 Then Response.write "Checked" %>>
                    ��ͷ��ҵ </td>
                  <td><input name="Set" type="checkbox" id="Set" value="171" <% If Instr(Powers,"171")>0 Then Response.write "Checked" %>>
                    ��ͷְλ </td>
                  <td><input name="Set" type="checkbox" id="Set" value="172" <% If Instr(Powers,"172")>0 Then Response.write "Checked" %>>
                    ��ҵ����</td>
                  <td><input name="Set" type="checkbox" id="Set" value="210" <% If Instr(Powers,"210")>0 Then Response.write "Checked" %>>
                    ��ְ��Ƹ</td>
                  <td><input name="Set" type="checkbox" id="Set" value="211" <% If Instr(Powers,"211")>0 Then Response.write "Checked" %>>
                    ��ְ��ְ</td>
                  <td><input name="Set" type="checkbox" id="Set" value="200" <% If Instr(Powers,"200")>0 Then Response.write "Checked" %>>
                    ������</td>
                </tr>
                <tr> 
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="201" <% If Instr(Powers,"201")>0 Then Response.write "Checked" %>>
                    ��������</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="203" <% If Instr(Powers,"203")>0 Then Response.write "Checked" %>>
                    �������</td>
                  <td width="15%"><input name="Set" type="checkbox" id="Set" value="204" <% If Instr(Powers,"204")>0 Then Response.write "Checked" %>>
                    �û�����</td>
                  <td width="15%"></td>
                  <td width="15%"></td>
                  <td width="15%">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="f5f5f5">&nbsp; <input type="submit" name="Submit2" value="�� ��"> 
              <input name=chkall type=checkbox value=on onclick=CheckAll(this.form)>
              ѡ������Ȩ��</td>
          </tr>
        </table></td>
    </tr>
  </Form>
</table>
<%
End Sub
 ''///��ʼ
Sub AddSubmit()
 Dim Username,Password,Flag
 If Not ChkPost Then 
  Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
  Response.End()
 End If 
 Username = SafeRequest("username")
 Password = SafeRequest("password")
 Flag = SafeRequest("flag") 
 IF Username="" or Password=""  Then
  Response.Write "�뽫������д������"
  Response.End() 
 End if
 Password = Enpas(md5(mistake(Password)))
   
 SQL="Insert Into [pH_Web_Supper] (su_SupperName,su_Password,su_Addtim,su_Iflag,su_Setting) Values ('"&Username&"','"&Password&"',getdate(),"&Flag&",',')"
 Conn.Execute(SQL)
 Set Rs=Nothing
 CloseDB
 Response.Redirect "Web_Master_Manage.asp"
End Sub 
 ''///����
 
 ''///��ʼ�޸�
Sub ModSubmit()
 Dim Username,Password,Flag,ID
 If Not ChkPost Then 
  Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
  Response.End()
 End If 
 ID = SafeRequest("id")
 Username = SafeRequest("username")
 Password = SafeRequest("password")
 Flag = SafeRequest("flag") 
 Check_ID(ID)
 IF Username=""  Then
  Response.Write "�뽫������д������"
  Response.End() 
 End if
 If Password<>"" Then
  Password = Enpas(md5(mistake(Password)))
  SQL="Update [pH_Web_Supper] Set su_SupperName='"&Username&"',su_Password='"&Password&"',su_Iflag="&Flag&" Where su_ID="&Cstr(id)
 Else
  SQL="Update [pH_Web_Supper] Set su_SupperName='"&Username&"',su_Iflag="&Flag&" Where su_ID="&Cstr(id)
 End if
 Conn.Execute(SQL)
 Set Rs=Nothing
 CloseDB
 Response.Redirect "Web_Master_Manage.asp"
End Sub 
 ''///����

 ''///��ʼ
Sub EditSubmit()
 Dim id,Setting
 If Not ChkPost Then 
  Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
  Response.End()
 End If
 id = SafeRequest("id") 
 Setting = SafeRequest("set")
 Check_ID(id)

 SQL="Update [pH_Web_Supper]  Set su_Setting='"&Setting&"' Where su_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 CloseDB
 Response.Redirect "Web_Master_Manage.asp"
End Sub 
 ''///����


 ''///��ʼɾ��
Sub Del()
 Dim id
 If Not ChkPost Then 
  Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
  Response.End()
 End If
 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Delete From [pH_Web_Supper]  Where su_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 CloseDB
 Response.Redirect "Web_Master_Manage.asp"
End Sub 
 ''///����

%>
 
</body>
</html>

