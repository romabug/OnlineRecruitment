<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if request.Form("situation")="" then
Call ShowError("��ѡ����λ�ã�")
end if
Session("situ")=request.Form("situation")
Select Case Session("situ")
Case 1
Session("situation")="�������"
Case 2
Session("situation")="�м������"
Case 3
Session("situation")="�Ҳ�������Ƹ"
Case 4
Session("situation")="ְλ�б��Ϸ�"
End Select
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<script language="JavaScript" src="inc/check.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="Adver_Add_Save.asp" enctype="multipart/form-data" onSubmit="checkFileUpload(this,'GIF,JPG,JPEG,BMP,SWF');return document.MM_returnValue">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">���� 
          ��վ��ҳ���</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="30%" height="26"><div align="right">���λ�ã�</div></td>
      <td width="70%"><font color="#FF0000"><strong><%=Session("situation")%></strong></font></td>
    </tr>
	<%if session("situ")=1 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">������λ�ã�</div></td>
      <td height="26"><input name="adsitu" type="radio" value="1">
        ������ҳ <input name="adsitu" type="radio" value="2">
        ������ҳ</td>
    </tr>
	<%end if%>
	<%if session("situ")=2 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">������λ�ã�</div></td>
      <td height="26"><input name="adsitu" type="radio" value="1">
        ����ϲ� 
        <input name="adsitu" type="radio" value="2">
        ����в� 
        <input name="adsitu" type="radio" value="3">
        ����²�</td>
    </tr>
	<%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">������ͣ�</div></td>
      <td height="26"><select name="mytype" class="input" id="mytype">
          <option>��ѡ��</option>
          <option value="1">ͼƬ</option>
          <option value="2">Flash����</option>
        </select> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">����ȣ�</div></td>
      <td height="26"><input name="width" type="text" class="input" id="width" size="5" maxlength="10"> 
        <strong><font face="Verdana, Arial, Helvetica, sans-serif">Px</font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">���߶ȣ�</div></td>
      <td height="26"><input name="height" type="text" class="input" id="height" size="5" maxlength="10"> 
        <strong><font face="Verdana, Arial, Helvetica, sans-serif">Px</font></strong></td>
    </tr>
    <%if session("situ")=4 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">ͼƬ�������ƣ�</div></td>
      <td height="26"><input name="picname" type="text" class="input" id="picname" size="30" maxlength="50"></td>
    </tr>
    <%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">���ӵ�ַ��</div></td>
      <td height="26"><input name="url" type="text" class="input" id="url" value="AdRedirect.asp?Url=" size="60">
        (���ں����������ӵľ��Ե�ַ) </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">�ϴ��ļ���</div></td>
      <td height="26"><input name="file1" type="file" class="input" id="file1" size="36"></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="filepath" type="hidden" value="../ad">
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="ȷ �� �� ��" onclick="return check()">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseConn()
%>
</body>
</html>