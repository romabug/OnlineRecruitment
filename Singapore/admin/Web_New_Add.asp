<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"180") <= 0 Then 
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
<title>�������</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�������</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <form method="post" action="Web_New_AddSave.asp"onsubmit="return CheckForm()" name="form1">
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">���ű��⣺</td>
                  <td><input name="title" type="text" id="title" size="50"> <select name="t_color" id="t_color">
                      <option value="#333333" selected>��ɫ����</option>
                      <option value="#ff0000" >��ɫ����</option>
                      <option value="#0000ff" >��ɫ����</option>
                      <option value="#009900" >��ɫ����</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�������ݣ�</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_content&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="350"></iframe> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�������</td>
                  <td><select name="typeid" size="1" id="typeid">
                      <% 
                      Set Rs = Conn.Execute("Select * From [pH_New_Type]")
					  While Not Rs.Eof
					    Response.write "<option value="&rs("typeid")&">"&rs("type")&"</option>"
					    Rs.Movenext
					  Wend
					  Rs.close
					  
					  
%>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�� �ߣ�</td>
                  <td><input name="author" type="text" id="author" size="20" maxlength="50"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�� Դ��</td>
                  <td><input name="newfrom" type="text" id="newfrom" size="20" maxlength="50" value="<%= Cls_WebName %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�������ţ�</td>
                  <td><input name="hotnew" type="checkbox" id="hotnew" value="1">
                    ���ó���������</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�Ƽ����ţ�</td>
                  <td><input name="bestnew" type="checkbox" id="bestnew" value="1">
                    ���ó��Ƽ�����</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">�� �ˣ�</td>
                  <td><input name="flag" type="checkbox" id="flag" value="1" checked>
                    ֱ��ͨ�����</td>
                </tr>
                <tr align="center" bgcolor="f5f5f5"> 
                  <td height="25" colspan="2"> <input type="submit" name="Submit" value="�������"> 
                    <input name="n_content" type="hidden" id="n_content">
                    <input name="cityid" type="hidden" id="cityid" value="0"></td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB()
%>

