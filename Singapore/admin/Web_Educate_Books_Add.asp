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
If Instr(1,Session("Web_Power"),"147") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/Educate_Bookadd.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�����ѵ�鼮</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=submit" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="A5B6CC">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> 
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr bgcolor="#f5f5f5"> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �� ����</td>
                        <td height="30"> <input name="bookname" type="text" id="bookname" size="50" maxlength="50" style="width:200px;"> 
                        </td>
                      </tr>
                      <tr>
                        <td height="30" align="right"> <STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��������</td>
                        <td height="30"><SELECT name=properity class=txtfield id="properity">
                            <OPTION value=""  selected>--��ѡ��--</OPTION>
                            <OPTION value="��ҵ��ѵ">��ҵ��ѵ</OPTION>
                            <OPTION value="�ʸ���֤">�ʸ���֤</OPTION>
                            <OPTION value="IT��ѵ">IT��ѵ</OPTION>
                            <OPTION value="������ѵ">������ѵ</OPTION>
                            <OPTION value="ѧ������">ѧ������</OPTION>
                            <OPTION value="������">������</OPTION>
                          </SELECT></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �� ��</td>
                        <td height="30"> <input name="price" type="text" id="price" size="12">
                          Ԫ</td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���������ƣ�</td>
                        <td height="30" bgcolor="#f5f5f5"><input name="pubname" type="text" id="pubname" size="50" maxlength="50" style="width:200px;"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ڣ�</td>
                        <td height="30"><input name="pubdate" type="text" id="pubdate" size="12" onclick="SD(this,'document.all.pubdate')" readonly> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϸ��Ϣ��</td>
                        <td height="30" bgcolor="#f5f5f5"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="content" cols="50" rows="8" id="content"></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ݼ�飺</td>
                        <td height="30"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="memo" cols="50" rows="8" id="memo"></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���߼�飺</td>
                        <td height="30" bgcolor="#f5f5f5"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="auther" cols="50" rows="8" id="auther"></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right">��Ҫ�½ڣ�</td>
                        <td height="30"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="chapter" cols="50" rows="8" id="chapter"></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#f5f5f5">�鼮ͼƬ��</td>
                        <td height="30" bgcolor="#f5f5f5">
						<input name="photourl" type="text" id="languages" size="16"> 
                          <input type="button" name="bnt1" value="�ϴ�ͼƬ" onClick="window.open('Upload_flash.asp?formname=reg&editname=photourl&uppath=../UpLoadFiles/BookFile&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2">
                          (�뽫ͼƬ����Ϊ75*100����) </td>
                      </tr>
                      <tr> 
                        <td height="32" align="right">ͨ����ˣ�</td>
                        <td height="32"><input name="flag" type="checkbox" id="flag" value="1" checked>
                          ֱ��ͨ�����</td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5">��Ϊ�Ƽ���</td>
                        <td height="30" bgcolor="#f5f5f5"><input name="best" type="checkbox" id="best" value="1">
                          ����Ϊ�Ƽ��鼮</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"><input name="cityid" type="hidden" id="cityid" value="0"> 
              <input type="submit" name="Submit" value=" �� �� " style="height:30px;"> 
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
 '//�ύ����
 'BookName,Photourl,Price,PubName,PubDate,Content,Memo,Auther,Chapter,Best,Flag
 BookName		= Replace_Text(Request.Form("BookName"))
 Photourl		= Replace_Text(Request.Form("Photourl"))
 Price			= Replace_Text(Request.Form("Price"))
 PubName		= Replace_Text(Request.Form("PubName"))
 PubDate		= Replace_Text(Request.Form("PubDate"))
 Content		= Replace_Text(Request.Form("Content"))
 Memo			= Replace_Text(Request.Form("Memo"))
 Auther			= Replace_Text(Request.Form("Auther"))
 Chapter		= Replace_Text(Request.Form("Chapter"))
 Best			= Replace_Text(Request.Form("Best"))
 Flag			= Replace_Text(Request.Form("Flag"))
 Properity		= Replace_Text(Request.Form("Properity")) 
 Cityid			= Replace_Text(Request.Form("Cityid"))
 
 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 If Memo <> "" Then Memo = Replace(Memo,Chr(13),"<br>")
 If Auther <> "" Then Auther = Replace(Auther,Chr(13),"<br>")
 If Chapter <> "" Then Chapter = Replace(Chapter,Chr(13),"<br>")
 If Best = "" Then Best = 0 
 If Flag = "" Then Flag = 0
 If Photourl <> "" Then Photourl = Replace(Photourl,"../UpLoadFiles/BookFile/","")
 
 SQL = "Insert Into [pH_Educate_Book] (BookName,Properity,Photourl,Price,PubName,PubDate,Content,Memo,Auther,Chapter,Best,Flag,AddDate,Cityid) Values ('"&BookName&"','"&Properity&"','"&Photourl&"',"&Price&",'"&PubName&"','"&PubDate&"','"&Content&"','"&Memo&"','"&Auther&"','"&Chapter&"',"&Best&","&Flag&",GetDate(),"&Cityid&")"
 Conn.Execute(SQL)

 Response.Write "<script>alert('�������');location.href='Web_Educate_Books.asp';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

