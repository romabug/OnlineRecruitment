<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action
Dim AdUrl,AdName,WebName,Width,Height,AdClass,AdFile,BeginDate,EndDate,Sort1

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"203") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param = Replace_Text(Request("Param"))

Action = Request.QueryString("action")
If Action = "add" Then
 LinkName = Replace_Text(Request.Form("LinkName"))
 LinkUrl = Replace_Text(Request.Form("LinkUrl"))
 LinkImgPath = Replace_Text(Request.Form("LinkImgPath"))
 LinkInfo = Replace_Text(Request.Form("LinkInfo"))
 OrderNum = Replace_Text(Request.Form("OrderNum"))
 State = Replace_Text(Request.Form("State"))
 Style = Replace_Text(Request.Form("Style"))
 Param = Replace_Text(Request.Form("param")) 
 
 If LinkImgPath <> "" Then LinkImgPath = Replace(LinkImgPath,"../Uploadfiles/Link/","")

 SQL = "Update [pH_FriendLink] Set LinkName='"&LinkName&"',LinkUrl='"&LinkUrl&"',LinkImgPath='"&LinkImgPath&"',LinkInfo='"&LinkInfo&"',OrderNum="&OrderNum&",State="&State&",Style="&Style&" Where Id="&Param
 Conn.Execute(SQL)

 Response.write "<script language=JavaScript>alert('�����ɹ���');location.href='Web_Friend.asp';</script>"
 Response.End()
End if

Set Rs = Conn.Execute("Select * From [pH_FriendLink] Where Id="&Param)
If Not Rs.Eof Then
 LinkName = Rs("LinkName")
 LinkUrl = Rs("LinkUrl")
 LinkImgPath = Rs("LinkImgPath")
 LinkInfo = Rs("LinkInfo")
 OrderNum = Rs("OrderNum")
 State = Rs("State")
 Style = Rs("Style")
End if
Rs.Close
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
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript">
 function theForm_check()
 {
  if (document.add.linkname.value=="")
  {
    alert("��������վ����");
	document.add.linkname.focus();
	return false;
  }
  
  if (document.add.linkurl.value=="http://" || document.add.linkurl.value=="")
  {
    alert("���������ӵ�ַ");
	document.add.linkurl.focus();
	return false;
  }
  
  if (document.add.ordernum.value=="")
  {
    alert("����������λ��");
	document.add.ordernum.focus();
	return false;
  }
 }
</script>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="24" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� 
      <strong>�༭�������</strong></font></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"> <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="text01">
              <form name="add" action="?action=add" method="post" onSubmit="return theForm_check()">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">��վ���ƣ�</td>
                  <td height="25"> <input name="linkname" type="text" style="width:160px;" value="<%= linkname %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">ͼƬ�ļ���</td>
                  <td height="25"><input name="linkimgpath" type="text"  style="width:160px;" value="<%= linkimgpath %>"> 
                    <input type="button" name="bnt1" value="�ϴ�ͼƬ" onClick="window.open('upload_flash.asp?formname=add&editname=linkimgpath&uppath=../Uploadfiles/Link&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">���ӵ�ַ��</td>
                  <td height="25"><input name="linkurl" type="text" id="linkurl" style="width:240px;"  value="<%= linkurl %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">��վ������</td>
                  <td height="25"><textarea name="linkinfo" cols="35" id="linkinfo"><%= linkinfo %></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">��ʽ��</td>
                  <td height="25">
				    <select name="style" id="style">
                      <option value="0"  <% If style = 0 Then Response.write "Selected" %>>����</option>
                      <option value="1"  <% If style = 1 Then Response.write "Selected" %>>ͼƬ</option>
                    </select> 
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">״̬��</td>
                  <td height="25">
				    <select name="state" id="state">
                      <option value="1" <% If State = True Then Response.write "Selected" %>>ͨ��</option>
                      <option value="0" <% If State = False Then Response.write "Selected" %>>����</option>
                    </select>
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">����˳��</td>
                  <td height="25"> <input name="ordernum" type="text" id="sort2"  value="<%= ordernum %>" size="6" maxlength="6">
                    λ</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">&nbsp;</td>
                  <td height="25"> <input type="submit" name="Submit" value="�� ��">
                    <input name="param" type="hidden" id="param" value="<%= Param %>"></td>
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

Call CloseDB()
 %>

