<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<% 
Dim Param,ErroStr
If Request("Action")="save"  Then Call Saves()

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- �û�����</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Include/Header.asp" -->
      
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="160" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>��վ����</strong></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="About.asp">��������</a> </td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Statement.asp">��վ����</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Service.asp">����ר��</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Feedback.asp">�û�����</a> </td>
                          </tr>
                          <tr>
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Friend.asp">�������</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Link.asp">��������</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Contact.asp">��ϵ����</a> </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  
                </td>
                <td width="10">&nbsp;</td>
                <td align="center" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../Images/mid_left_public.gif" width="31" height="33"></td>
                      <td background="../Images/mid_bg.gif" class="font-14"><strong><font color="#333333">�û�����</font></strong></td>
                      <td width="30"><img src="../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#efefef" class="text01">
                          <Form action="?Action=save" method="post" name="the"  onSubmit="return the_check();">
                            <script language="JavaScript">
 function the_check(){
 if (document.the.name.value==""){
  alert("-���������ĳƺ���ʽ-");
  document.the.name.focus();
  return false;
 }
 if (document.the.phone.value==""){
  alert("-���������ĵ绰-");
  document.the.phone.focus();
  return false;
 } 
 if (document.the.mail.value==""){
  alert("-���������ĵ����ʼ�-");
  document.the.mail.focus();
  return false;
 } 
  if (document.the.memo.value==""){
  alert("-����������������߽�������-");
  document.the.memo.focus();
  return false;
 }  
}
</script>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">�� ����</td>
                              <td height="25"><input name="name" type="text" id="name" style="width:160px;"> 
                                <font color="#666666">���������ĳƺ���ʽ</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">�� ����</td>
                              <td height="25"><input name="phone" type="text" id="phone" style="width:160px;"> 
                                <font color="#666666">������������ϵ�绰</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">�����ʼ���</td>
                              <td height="25"><input name="mail" type="text" id="mail" style="width:160px;"> 
                                <font color="#666666">���������ĵ����ʼ�</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">QQ/MSN��</td>
                              <td height="25"><input name="qq" type="text" id="name4" style="width:160px;"> 
                                <font color="#666666">�������������칤�ߺ���</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                              <td height="25" align="right">�������ͣ�</td>
                              <td height="25">
							  <select name="type" id="type" style="width:160px;">
                                  <option value="�������" selected>�������</option>
                                  <option value="����Ͷ��">����Ͷ��</option>
                                  <option value="��������">��������</option>
                                  <option value="��������">��������</option>
                                  <option value="������Ϣ">������Ϣ</option>
                                </select>
								</td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">������飺</td>
                              <td height="25"><textarea name="memo" cols="50" rows="8" id="memo"></textarea> 
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25" align="left"> <input type="submit" name="Submit4" value=" �� �� �� Ϣ "> 
                              </td>
                            </tr>
                          </Form>
                        </table></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!--#include file="../Include/Footer.asp" -->
          </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</body>
</html>
<% Sub Saves()
 Dim Name,Phone,Mail,QQ,Dates
 Name = SafeRequest("Name")
 Phone = SafeRequest("Phone")
 Mail = SafeRequest("Mail")
 QQ = SafeRequest("qq")
 Memo = SafeRequest("Memo")
 ac_Type = SafeRequest("Type")
 
 Conn.Execute("Insert Into [pH_Web_Feedback] (ac_Name,ac_Phone,ac_Mail,ac_QQ,ac_Type,ac_Memo,ac_Adddate,ac_Flag,Cityid) Values ('"&Name&"','"&Phone&"','"&Mail&"','"&QQ&"','"&ac_Type&"','"&Memo&"','"&Now()&"',0,0)")
 Conn.Close
 Set Conn = Nothing
 Response.write "<script>alert('-������Ϣ�Ѿ��ɹ����ύ��-');location.href='Feedback.asp';</script>"
 Response.End()
End Sub
%>
