<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Industry,Properity,Locus_Area,Locus_City,Company_Memo,PhoneKeep,EmailKeep

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���
'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����,1Ӫҵִ��,2��ҵ,3��ҵ����,4�������,5��,6��,7Ա������,8ע���ʽ�,9�ʽ�����,10��ҵ���,11��ϵ��,12�绰,13�绰����,14����,15�ʼ�,16�ʼ�����,17��ҵ����ʡ,18����,19��ַ,20��������,21��ҵ��ַ
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ�����
CloseRs
Set Cmd = Nothing

'//���ܴ���
CompanyName  = Tmp(0,0)
Industry     = Tmp(2,0)
Properity    = Tmp(3,0)
Locus_Area   = Tmp(17,0)
Locus_City   = Tmp(18,0)
Company_Memo = Tmp(10,0)
PhoneKeep    = Tmp(13,0)
EmailKeep    = Tmp(16,0)


If Company_Memo <> "" Then Company_Memo = Replace(Company_Memo,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Basicinfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��������</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_manage.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="edit" method="post" onSubmit="return form_check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��������</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ƣ� </td>
                              <td height="25"><input name="companyname" type="text" id="companyname" size="50" maxlength="50" style="width:200px;" value="<%= Tmp(0,0) %>">
                                �磺<%= Cls_WebName %></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">֤�����룺</td>
                              <td height="25" bgcolor="f9f9f9"><input name="licence" type="text" size="25" maxlength="25" style="width:200px;" value="<%= Tmp(1,0) %>"> 
                                <font color="#50463d">��ҵ��Ӫҵִ�յ�</font> </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ������ҵ��</td>
                              <td height="25">
                                <!--#include file="../Include/Class_Industry.asp" -->
                              </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ʣ�</td>
                              <td height="25" bgcolor="f9f9f9">
                                <!--#include file="../Include/Class_Properity.asp" -->
                              </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ڣ�</td>
                              <td height="25"><input name="set_year" type="text" size="4" maxlength="4" value="<%= Tmp(4,0) %>">
                                �� 
                                <select name="set_month">
                                  <%for i=1 to 12%>
                                  <option  value="<%=i%>" <% If i= Tmp(5,0) Then Response.write "Selected" %>><%=i%></option>
                                  <%next%>
                                </select>
                                �� 
                                <select name="set_day">
                                  <%for i=1 to 31%>
                                  <option value="<%=i%>" <% If i= Tmp(6,0) Then Response.write "Selected" %>><%=i%></option>
                                  <%next%>
                                </select>
                                �� </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ע���ʽ�</td>
                              <td height="25" bgcolor="f9f9f9"><input name="reg_currency" type="text" size="25" maxlength="25" style="width:100px;"  value="<%= Tmp(8,0) %>">
                                ��Ԫ 
                                <select name="currencytype" id="currencytype" style="width:80px;">
                                  <option value="1" <% If Tmp(9,0) = 1 Then Response.write "Selected" %>>�����</option>
                                  <option value="2" <% If Tmp(9,0) = 2 Then Response.write "Selected" %>>��Ԫ</option>
                                  <option value="3" <% If Tmp(9,0) = 3 Then Response.write "Selected" %>>ŷԪ</option>
                                  <option value="4" <% If Tmp(9,0) = 4 Then Response.write "Selected" %>>Ӣ��</option>
                                  <option value="5" <% If Tmp(9,0) = 5 Then Response.write "Selected" %>>�۱�</option>
                                  <option value="6" <% If Tmp(9,0) = 6 Then Response.write "Selected" %>>̨��</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> Ա��������</td>
                              <td height="25"><select name="workers" id="workers" style="width:100px;">
                                  <OPTION value=9 <% If Tmp(7,0) = 9 Then Response.write "Selected" %>>10������</OPTION>
                                  <OPTION value=49 <% If Tmp(7,0) = 49 Then Response.write "Selected" %>>10��50��</OPTION>
                                  <OPTION value=199 <% If Tmp(7,0) = 199 Then Response.write "Selected" %>>50��200��</OPTION>
                                  <OPTION value=499 <% If Tmp(7,0) = 499 Then Response.write "Selected" %>>200��500��</OPTION>
                                  <OPTION value=999 <% If Tmp(7,0) = 999 Then Response.write "Selected" %>>500��1000��</OPTION>
                                  <OPTION value=1000 <% If Tmp(7,0) = 1000 Then Response.write "Selected" %>>1000������</OPTION>
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ڵأ�</td>
                              <td height="25" bgcolor="f9f9f9">
                                <!--#include file="../Include/Class_Locus2.asp" -->
                              </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ��飺</td>
                              <td height="25"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="75%"> <textarea name="company_memo" cols="45" rows="8" id="company_memo"><%= Company_Memo %></textarea></td>
                                    <td><font color="#50463d">����ַ���5000,�뾡������ϸ��д���ϣ���ȷ����˾����˳��ͨ��������ˣ���������˾��������+��Ʒ�����+��Ӫҵ����</font></td>
                                  </tr>
                                </table></td>
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
                              <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Tmp(11,0) %>"> 
                                <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ</font></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                              <td height="25" bgcolor="f9f9f9"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(12,0) %>"> 
                                <input name="phonekeep" type="checkbox" id="phonekeep" value="1" <% If PhoneKeep = True Then Response.write "Checked" %>> 
                                <font color="#333333">���ε绰</font><font color="#50463d"> 
                                [�̶��绰���룬�磺010-82615888] </font></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">������룺</td>
                              <td height="25"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(14,0) %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����ʼ���</td>
                              <td height="25" bgcolor="f9f9f9"><input name="email" type="text" id="email"  style="width:200px;"  value="<%= Tmp(15,0) %>" size="50"> 
                                <input name="emailkeep" type="checkbox" id="emailkeep" value="1" <% If EmailKeep = True Then Response.write "Checked" %>>
                                �����ʼ���ַ </td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">��ҵ��վ��</td>
                              <td height="25"><input name="webhome" type="text" size="50" style="width:200px;" value="<%= Tmp(21,0) %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������룺</td>
                              <td height="25" bgcolor="f9f9f9"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;" value="<%= Tmp(20,0) %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                              <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Tmp(19,0) %>">
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
                  <td height="40" align="center"> <input type="submit" name="Submit" value=" ��������������� " style="height:35px;"> 
                  </td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>

	  </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Submit() '������ҵ��������
 Check_Url() '//��վ�ύ���ݼ��
 Comid                  = Session("Company")(2)
 CompanyName            = Replace_Text(Request.Form("CompanyName"))
 Licence                = Replace_Text(Request.Form("Licence"))
 Industry               = Replace_Text(Request.Form("Industry"))
 Properity              = Replace_Text(Request.Form("Properity"))
 Set_Year               = Replace_Text(Request.Form("Set_Year"))
 Set_Month              = Replace_Text(Request.Form("Set_Month"))
 Set_Day                = Replace_Text(Request.Form("Set_Day"))
 Workers                = Replace_Text(Request.Form("Workers"))
 Reg_Currency           = Replace_Text(Request.Form("Reg_Currency"))
 CurrencyType           = Replace_Text(Request.Form("CurrencyType"))
 Company_Memo           = Replace_Text(Request.Form("Company_Memo"))
 ContactPerson          = Replace_Text(Request.Form("ContactPerson"))
 Phone                  = Replace_Text(Request.Form("Phone"))
 PhoneKeep              = Replace_Text(Request.Form("PhoneKeep"))
 CompanyFax             = Replace_Text(Request.Form("CompanyFax"))
 Email                  = Replace_Text(Request.Form("Email"))
 EmailKeep              = Replace_Text(Request.Form("EmailKeep"))
 Locus_Area             = Replace_Text(Request.Form("x_suozaidi"))
 Locus_City             = Replace_Text(Request.Form("x_suozaidi1"))
 Address                = Replace_Text(Request.Form("Address"))
 ZipCode                = Replace_Text(Request.Form("ZipCode"))
 WebHome                = Replace_Text(Request.Form("WebHome"))
 
 If PhoneKeep = "" Then PhoneKeep = 0
 If EmailKeep = "" Then EmailKeep = 0
 If Company_Memo <> "" Then Company_Memo = Replace(Company_Memo,Chr(13),"<br>")
 
 SQL = "Update [pH_Company_Base] Set CompanyName='"&CompanyName&"',Licence='"&Licence&"',Industry="&Industry&",Properity="&Properity&",Set_Year="&Set_Year&",Set_Month="&Set_Month&",Set_Day="&Set_Day&",Workers="&Workers&",Reg_Currency="&Reg_Currency&",CurrencyType="&CurrencyType&",Company_Memo='"&Company_Memo&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',PhoneKeep="&PhoneKeep&",CompanyFax='"&CompanyFax&"',Email='"&Email&"',EmailKeep="&EmailKeep&",Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Address='"&Address&"',ZipCode='"&ZipCode&"',WebHome='"&WebHome&"',LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_BasicInfo.asp"
End Sub
 %>
