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
If Instr(1,Session("Web_Power"),"140") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

Schid     = Replace_Text(Request.QueryString("Schid"))
PageNo    = Request.QueryString("PageNo")

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Edu_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Schid",200,1,30)
Cmd.Parameters("@Schid") = Schid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����

'//�� Tmp(0,0) ��ʾԺУ����
CloseRs
Set Cmd = Nothing

'//���ܴ���
SchoolName              = Tmp(0,0)
Properity               = Tmp(1,0)
BannerFile              = Tmp(2,0)
Set_Year                = Tmp(3,0)
Set_Month				= Tmp(4,0)
Set_Day					= Tmp(5,0)
School_Memo             = Tmp(6,0)
ContactPerson           = Tmp(7,0)
Phone                   = Tmp(8,0)
Fax                     = Tmp(9,0)
WebHome                 = Tmp(10,0)
ZipCode                 = Tmp(11,0)
Email                   = Tmp(12,0)
Address                 = Tmp(13,0)
Locus_Area              = Tmp(14,0)
Locus_City              = Tmp(15,0)
Lesson_Memo				= Tmp(16,0)
Action_Memo				= Tmp(17,0)
Client_Memo				= Tmp(18,0)
Other_Memo				= Tmp(19,0)

If School_Memo <> "" Then School_Memo = Replace(School_Memo,"<br>",Chr(13))
If Lesson_Memo <> "" Then Lesson_Memo = Replace(Lesson_Memo,"<br>",Chr(13))
If Action_Memo <> "" Then Action_Memo = Replace(Action_Memo,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Educate_Basicinfo.js"></script>
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�༭��Ϣ</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=submit" name="edit" method="post" onSubmit="return check_edit();">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������Ϣ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ƣ�</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="schoolname" type="text" id="schoolname" size="50" maxlength="50" style="width:200px;" value="<%= Schoolname %>">
                          �磺������ѧ</td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ڣ�</td>
                        <td height="25"> <input name="set_year" type="text" size="4" maxlength="4" value="<%= Set_Year %>">
                          �� 
                          <select name="set_month">
                            <%for i=1 to 12%>
                            <option  value="<%=i%>" <% If Set_Month = i Then Response.write "Selected" %>><%=i%></option>
                            <%next%>
                          </select>
                          �� 
                          <select name="set_day">
                            <%for i=1 to 31%>
                            <option value="<%=i%>" <% If Set_Day = i Then Response.write "Selected" %>><%=i%></option>
                            <%next%>
                          </select>
                          �� </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> ��ѵ����</td>
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
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ڵ�����</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ������飺</td>
                        <td height="25" bgcolor="f9f9f9"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="school_memo" cols="45" rows="8" id="school_memo"><%= school_memo %></textarea></td>
                              <td><font color="#50463d">����ַ���5000,�뾡������ϸ��д���ϣ���ȷ�����������˳��ͨ��������ˣ�������������������+�γ������;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">�γ̼�飺</td>
                        <td height="25"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="lesson_memo" cols="45" rows="8" id="lesson_memo"><%= Lesson_memo %></textarea></td>
                              <td><font color="#50463d">����ַ���5000,��������������Ҫ��ѵ�γ�;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">���ڻ��</td>
                        <td height="25" bgcolor="f9f9f9"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="action_memo" cols="45" rows="8" id="textarea2"><%=Action_memo %></textarea></td>
                              <td><font color="#50463d">����ַ���5000,�������������ڵ���Ҫ��Ͳ���ķ�ʽ;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">���Ϳͻ���</td>
                        <td height="25"> <input name="client_memo" type="text" id="client_memo" size="45" maxlength="100" value="<%= client_memo %>"> 
                          <font color="#50463d">������Ŀͻ�,���ŷָ�</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">������Ϣ��</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="other_memo" type="text" id="other_memo" size="45" maxlength="100" value="<%= other_memo %>"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ϵ��ʽ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�ˣ�</td>
                        <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Contactperson %>"> 
                          <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����Լ�ʱ��ϵ</font></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="25" bgcolor="f9f9f9"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Phone %>"> 
                          <font color="#50463d"> [�̶��绰���룬�磺010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">������룺</td>
                        <td height="25"><input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30" value="<%= Fax %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����ʼ���</td>
                        <td height="25" bgcolor="f9f9f9"><input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">��վ��ַ��</td>
                        <td height="25"><input name="webhome" type="text" size="50" style="width:200px;" value="<%= Webhome %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������룺</td>
                        <td height="25" bgcolor="f9f9f9"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"  value="<%= Zipcode %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                        <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Address %>">
                          �磺�����к������ɸ�·������ </td>
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
            <td height="40" align="center"><input type="hidden" name="Schid" value="<%= Schid %>"> 
			<input type="hidden" name="PageNo" value="<%= PageNo %>"> 
              <input type="submit" name="Submit" value=" ������Ϣ " style="height:35px;"> 
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

 Schid                   = Replace_Text(Request.Form("Schid"))
 PageNo                  = Replace_Text(Request.Form("PageNo"))
 SchoolName              = Replace_Text(Request.Form("SchoolName"))
 Properity				 = Replace_Text(Request.Form("Properity"))
 Set_Year                = Replace_Text(Request.Form("Set_Year"))
 Set_Month				 = Replace_Text(Request.Form("Set_Month"))
 Set_Day			     = Replace_Text(Request.Form("Set_Day"))
 School_Memo             = Replace_Text(Request.Form("School_Memo"))
 ContactPerson           = Replace_Text(Request.Form("ContactPerson"))
 Phone                   = Replace_Text(Request.Form("Phone"))
 Fax                     = Replace_Text(Request.Form("Fax"))
 WebHome                 = Replace_Text(Request.Form("WebHome"))
 ZipCode                 = Replace_Text(Request.Form("ZipCode"))
 Email                   = Replace_Text(Request.Form("Email"))
 Address                 = Replace_Text(Request.Form("Address"))
 Locus_Area              = Replace_Text(Request.Form("x_suozaidi"))
 Locus_City              = Replace_Text(Request.Form("x_suozaidi1"))
 Lesson_Memo			 = Replace_Text(Request.Form("Lesson_Memo"))
 Action_Memo		     = Replace_Text(Request.Form("Action_Memo"))
 Client_Memo			 = Replace_Text(Request.Form("Client_Memo"))
 Other_Memo				 = Replace_Text(Request.Form("Other_Memo"))

 If School_Memo <> "" Then School_Memo = Replace(School_Memo,Chr(13),"<br>")
 If Lesson_Memo <> "" Then Lesson_Memo = Replace(Lesson_Memo,Chr(13),"<br>")
 If Action_Memo <> "" Then Action_Memo = Replace(Action_Memo,Chr(13),"<br>")
 
 SQL = "Update [pH_Educate_Base] Set SchoolName='"&SchoolName&"',Properity='"&Properity&"',Set_Year="&Set_Year&",Set_Month="&Set_Month&",Set_Day="&Set_Day&",School_Memo='"&School_Memo&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',Fax='"&Fax&"',WebHome='"&WebHome&"',ZipCode='"&ZipCode&"',Email='"&Email&"',Address='"&Address&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Lesson_Memo='"&Lesson_Memo&"',Action_Memo='"&Action_Memo&"',Client_Memo='"&Client_Memo&"',Other_Memo='"&Other_Memo&"',LastUpdate_Time=getdate() Where Schid='"&Schid&"'"
 Conn.Execute(SQL)

 
 Response.Write "<script>alert('�༭���');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

