<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim PhoneKeep,EmailKeep,PublishCount,Publish_Flag,EndDate

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing

Ncid = SafeRequest("Id")
Set Rs = Conn.Execute("Select Province,City,Address,Typeid,SaveTime,Content,Contact,Users From [pH_Company_Part] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid))
If Rs.eof Then
 Rs.Close
 CloseDB
 Response.write "û���ҵ���Ϣ��"
 Response.End()
End if
Tmp = Rs.GetRows()
Rs.Close 
Typeid = Tmp(3,0)
SaveTime = Tmp(4,0)
Content = Tmp(5,0)
Contact = Tmp(6,0)
If Content<>"" Then Content = Replace(Content,"<br>",Chr(13))
If Contact<>"" Then Contact = Replace(Contact,"<br>",Chr(13))

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<script language="JavaScript">
function check(){

if (document.theForm.slt_selectedplaces.options.length<1){
alert("-��ѡ�����ص㣡-");
document.theForm.slt_selectedplaces.focus();
return false;
}

if (document.theForm.users.value==""){
alert("-�����������룬������������������0��-");
document.theForm.users.focus();
return false;
}

if (document.theForm.users.value.match(/\D/)){
alert("-���������ǺϷ����֣�-");
document.theForm.users.focus();
return false;
}



if (document.theForm.content.value==""){
alert("-��ְְλ�������룡-");
document.theForm.content.focus();
return false;
}

if (document.theForm.contact.value==""){
alert("-��ϵ��ʽ�������룡-");
document.theForm.contact.focus();
return false;
}

}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- �༭��ְ��Ϣ</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Part.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="theForm" method="post" onSubmit="return check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ְ��Ϣ</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����������</td>
                              <td height="25" bgcolor="f9f9f9">��ѡ�����ŵ�ʡ������������ѡ����Ӧ�ĳ��У�Ȼ�����<br>
                                �����Ҫɾ��ѡ�õĹ����ص㣬����ѡ�и��Ȼ���Ƴ�</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="25%"><FONT 
                              color=#333333>ѡ��������</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td><FONT 
                              color=#333333>�Ѿ�ѡ��ĵ���</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:110px"  name=slt_workplacearea>
                                      </select> <select name=slt_workplacecity size="1" style="width:110px">
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit22" value="���&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;�Ƴ�" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select style="width:120px">
                                        <option value="<%= Tmp(0,0)&"-"&Tmp(1,0) %>" selected><%= Tmp(0,0)&Tmp(1,0) %></option>
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right">��ϸ��ַ��</td>
                              <td height="25"> <input name="address" type="text" id="address2" maxlength="40" style="width:260px" value="<%= Tmp(2,0) %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">�������</td>
                              <td height="25"> <select name="typeid" id="select2">
                                  <option value="1" <% If Typeid = 1 Then Response.Write "Selected" %>>�ҽ�</option>
                                  <option value="2" <% If Typeid = 2 Then Response.Write "Selected" %>>����������Ʒ������</option>
                                  <option value="3" <% If Typeid = 3 Then Response.Write "Selected" %>>ҵ��ֱ��������</option>
                                  <option value="4" <% If Typeid = 4 Then Response.Write "Selected" %>>У��</option>
                                  <option value="5" <% If Typeid = 5 Then Response.Write "Selected" %>>����</option>
                                  <option value="6" <% If Typeid = 6 Then Response.Write "Selected" %>>��Ա��¼��</option>
                                  <option value="7" <% If Typeid = 7 Then Response.Write "Selected" %>>��������</option>
                                  <option value="8" <% If Typeid = 8 Then Response.Write "Selected" %>>�������㻤</option>
                                  <option value="9" <% If Typeid = 9 Then Response.Write "Selected" %>>��˾���ڡ�����</option>
                                  <option value="10" <% If Typeid = 10 Then Response.Write "Selected" %>>����</option>
                                  <option value="11" <% If Typeid = 11 Then Response.Write "Selected" %>>���̡�����������</option>
                                  <option value="12" <% If Typeid = 12 Then Response.Write "Selected" %>>��ҳ����</option>
                                  <option value="13" <% If Typeid = 13 Then Response.Write "Selected" %>>�������</option>
                                  <option value="14" <% If Typeid = 14 Then Response.Write "Selected" %>>�߻����İ�</option>
                                  <option value="15" <% If Typeid = 15 Then Response.Write "Selected" %>>׫�塢�ɱ�</option>
                                  <option value="16" <% If Typeid = 16 Then Response.Write "Selected" %>>�ƻᡢ����</option>
                                  <option value="99" <% If Typeid = 99 Then Response.Write "Selected" %>>����</option>
                                </select> </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �� ����</td>
                              <td height="25"> <input name="users" type="text" id="users2" style="width:100px"  maxlength="4" value="<%= Tmp(7,0) %>">
                                �� ( Ĭ��Ϊ0,��ʾ������ )</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��Ч���ޣ�</td>
                              <td height="25"><select name="savetime" size=1 id="select3" >
                                  <option value="0" <% If SaveTime = 0 Then Response.Write "Selected" %>>������Ч 
                                  <option value="7" <% If SaveTime = 7 Then Response.Write "Selected" %>>һ���� 
                                  <option value="15" <% If SaveTime = 15 Then Response.Write "Selected" %>>����� 
                                  <option value="30" <% If SaveTime = 30 Then Response.Write "Selected" %>>һ���� 
                                  <option value="120" <% If SaveTime = 120 Then Response.Write "Selected" %>>������ 
                                  <option value="180" <% If SaveTime = 180 Then Response.Write "Selected" %>>���� 
                                  <option value="365" <% If SaveTime = 365 Then Response.Write "Selected" %>>һ�� 
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ְְλ��</td>
                              <td height="25" bgcolor="f9f9f9">������xxxxx��˾��Ƹ��ְ�г�����Ա��Ҫ��6�·��г�ԣ��ҵ��ʱ�䣻�ܹ��Կ����͡����渺����Ů���ޣ���У��ѧ�����ȿ��ǣ���ͨ�������Ա����г���</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><textarea name="content" cols="50" rows="6" id="textarea" ><%= Content %></textarea></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ��ʽ��</td>
                              <td height="25">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><textarea name="contact" cols="50" rows="4" id="textarea2" ><%= Contact %></textarea></td>
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
                  <td height="40" align="center"><SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%������"
  objCitySelector.init();


  </SCRIPT> <input type="submit" name="Submit" value=" �� �� �� Ϣ " style="height:35px;"> 
                    <input name="ncid" type="hidden"  value="<%= Ncid %>"> </td>
                </tr>
              </form>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td align="center"> 
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 
Sub Submit() '��������
Check_Url() '//��վ�ύ���ݼ��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)


'//��ʼ�����ύ������
Ncid = SafeRequest("Ncid")

Places = Split(Replace_text(Request.Form("slt_selectedplaces")),"-")
Province = Places(0)
City = Places(1)

Address = SafeRequest("address")
Typeid = SafeRequest("typeid")
Users = SafeRequest("users")
SaveTime = SafeRequest("savetime")

Content = SafeRequest("Content")
Contact = SafeRequest("Contact")
If Content<>"" Then Content = Replace(Content,Chr(13),"<br>")
If Contact<>"" Then Contact = Replace(Contact,Chr(13),"<br>")


SQL = "Update [pH_Company_Part] Set Province='"&Province&"',City='"&City&"',Address='"&Address&"',Typeid="&Typeid&",SaveTime="&SaveTime&",Content='"&Content&"',Contact='"&Contact&"',Users="&Users&" Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)

Conn.Execute(SQL)

 '//�ر����ݿ�����
 CloseDB
 Response.redirect "Com_PartManage.asp"
 
End Sub

'//�ر����ݿ�����
CloseDB
 %>
