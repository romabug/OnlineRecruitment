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
If Instr(1,Session("Web_Power"),"226") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Jobid = Replace_Text(Request("Param"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Submit() '//���ñ������ݵĺ���


'��ȡ����
SQL = "select * From [pH_Intro_Job] Where Ncid="&Cstr(Jobid)
Set Rs = Conn.Execute(SQL)
If Rs.eof Then
 Response.write "û���ҵ�ָ�������ݣ�"
 Response.End()
Else
 Com_Property		= Rs("Com_Property")
 Com_Name			= Rs("Com_Name")
 JobName			= Rs("JobName")
 Valids				= Rs("Valids")
 Number				= Rs("Number")
 Com_Memo			= Rs("Com_Memo")
 Require			= Rs("Require")
 Deal				= Rs("Deal")
 Life				= Rs("Life")
 Other				= Rs("Other")

 If Com_Memo <> "" Then Com_Memo = Replace(Com_Memo,"<br>",chr(13))
 If Require <> "" Then Require = Replace(Require,"<br>",chr(13))
 
End if
Rs.Close 

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/intro_jobpublish.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">�� <strong>�༭��Ƹְλ</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="600" border="0" cellspacing="0" cellpadding="0">
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
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;����ְλ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1">
                      <tr bgcolor="f9f9f9"> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��λ���ƣ�</td>
                        <td height="25"> <input name="com_name" type="text" id="com_name" size="30" maxlength="50" value="<%= com_name %>"> 
                          <font color="#666666">(��������Ƹ��λ������</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��λ���ʣ�</td>
                        <td height="25"> <select name="com_property" id="com_property" style="width:120px;">
                            <option value="">-��ѡ��-</option>
                            <option value="1" <% If com_property = 1 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="2" <% If com_property = 2 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="3" <% If com_property = 3 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="4" <% If com_property = 4 Then Response.write "Selected" %>>˽Ӫ��ҵ</option>
                            <option value="5" <% If com_property = 5 Then Response.write "Selected" %>>��Ӫ��ҵ</option>
                            <option value="6" <% If com_property = 6 Then Response.write "Selected" %>>�ɷ�����ҵ</option>
                            <option value="7" <% If com_property = 7 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="8" <% If com_property = 8 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="9" <% If com_property = 9 Then Response.write "Selected" %>>������ҵ</option>
                            <option value="10" <% If com_property = 10 Then Response.write "Selected" %>>��������</option>
                            <option value="11" <% If com_property = 11 Then Response.write "Selected" %>>�������</option>
                            <option value="12" <% If com_property = 12 Then Response.write "Selected" %>>��ҵ��λ</option>
                            <option value="13" <% If com_property = 13 Then Response.write "Selected" %>>�����ҵ</option>
                            <option value="14" <% If com_property = 14 Then Response.write "Selected" %>>����</option>
                          </select> <font color="#666666">(��ѡ��λ������</font>) </td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���ƣ�</td>
                        <td height="25"> <input name="jobname" type="text" id="jobname" size="30" maxlength="50" value="<%= jobname %>"> 
                          <font color="#666666">(��������Ƹְλ������</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">��Ƹ������</td>
                        <td height="25"> <input name="number" type="text" id="number"  value="<%= number %>" size="4" maxlength="6">
                          �� <font color="#666666">(Ĭ��Ϊ0,��ʾ������</font>)</td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">��Ч�ڣ�</td>
                        <td height="25"> <select name="valids" id="valids">
                            <option value="3" <% If valids = 3 Then Response.write "Selected" %>>3��</option>
                            <option value="7" <% If valids = 7 Then Response.write "Selected" %>>һ��</option>
                            <option value="14" <% If valids = 14 Then Response.write "Selected" %>>����</option>
                            <option value="30" <% If valids = 30 Then Response.write "Selected" %>>һ����</option>
                            <option value="60" <% If valids = 60 Then Response.write "Selected" %>>������</option>
                            <option value="90" <% If valids = 90 Then Response.write "Selected" %>>������</option>
                            <option value="180" <% If valids = 180 Then Response.write "Selected" %>>����</option>
                            <option value="365" <% If valids = 365 Then Response.write "Selected" %>>һ��</option>
                            <option value="0" <% If valids = 0 Then Response.write "Selected" %>>������Ч</option>
                          </SELECT> </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">��λ���ܣ�</td>
                        <td height="25"> <textarea name="com_memo" cols="45" rows="5" id="com_memo"><%= com_memo %></textarea></td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����Ҫ��</td>
                        <td height="25"> <textarea name="require" cols="45" rows="5" id="require"><%= require %></textarea> 
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">н�ʴ�����</td>
                        <td height="25"> <input name="deal" type="text" id="deal" size="20" maxlength="25" value="<%= deal %>"> 
                          <font color="#666666">(������ְλ�Ĵ���,Ĭ��Ϊ����</font>)</td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">��ס˵����</td>
                        <td height="25"> <input name="life" type="text" id="life" size="20" maxlength="25" value="<%= life %>"> 
                          <font color="#666666">(��ְλ�ĳ�ס����ı�ע</font>)</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="25" align="right">����˵����</td>
                        <td height="25"> <input name="other" type="text" id="other" size="30" maxlength="50" value="<%= other %>"> 
                        </td>
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
            <td height="40" align="center"><input type="hidden" name="pageno" value="<%= PageNo %>">
              <input type="hidden" name="Jobid" value="<%= Jobid %>"> 
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

 PageNo    = Replace_Text(Request.Form("PageNo"))
 'Corid,Com_Property,Com_Name,JobName,Valids,Number,Com_Memo,Require,Deal,Life,Other
 Ncid				= Replace_Text(Request.Form("Jobid"))
 Com_Property		= Replace_Text(Request.Form("Com_Property"))
 Com_Name			= Replace_Text(Request.Form("Com_Name"))
 JobName			= Replace_Text(Request.Form("JobName"))
 Valids				= Replace_Text(Request.Form("Valids"))
 Number				= Replace_Text(Request.Form("Number"))
 Com_Memo			= Replace_Text(Request.Form("Com_Memo"))
 Require			= Replace_Text(Request.Form("Require"))
 Deal				= Replace_Text(Request.Form("Deal"))
 Life				= Replace_Text(Request.Form("Life"))
 Other				= Replace_Text(Request.Form("Other"))
  
 If Com_Memo <> "" Then Com_Memo = Replace(Com_Memo,chr(13),"<br>")
 If Require <> "" Then Require = Replace(Require,chr(13),"<br>")

 SQL = "Update [pH_Intro_Job] Set Com_Property="&Com_Property&",Com_Name='"&Com_Name&"',JobName='"&JobName&"',Valids="&Valids&",Number="&Number&",Com_Memo='"&Com_Memo&"',Require='"&Require&"',Deal='"&Deal&"',Life='"&Life&"',Other='"&Other&"' Where Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)

 Response.Write "<script>alert('�༭���');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

