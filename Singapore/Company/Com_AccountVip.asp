<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit()

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
'//�رռ�¼������
Rs.Close
Set Cmd = Nothing

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ����������ҵ�ʺ�</title>
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
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
            <!--#include file="../Lefter/Company_Base.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="edit" method="post">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ҵ�ʺ���������</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �û����� </td>
                              <td height="25"><input name="username" type="text" id="username" size="20" maxlength="30"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �� �룺</td>
                              <td height="25" bgcolor="f9f9f9"><input name="password" type="password" id="password" size="20" maxlength="20"></td>
                            </tr>
                            <tr>
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ͨ���ڣ�</td>
                              <td height="25">
							  <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>">
							  </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �ɷ����ͣ�</td>
                              <td height="25"> 
                               <select name="level" id="level">
             		<% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Company_VipLevel]")
		 			While Not Re.Eof 
		 			  Response.write "<option value="&Re(0)&">"&Re(1)&"</option>"
		  			  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select></td>
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" �������� " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table> </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Submit() '�����Ա���������ļ�¼
 'Comid         = Session("Company")(2)
 Username      = Replace_Text(Request.Form("Username"))
 Password      = Replace_Text(Request.Form("Password"))
 Password      = Md5(Password)
 Level         = Replace_Text(Request.Form("Level"))
 BeginDate     = Replace_Text(Request.Form("BeginDate"))
 '�����û��ṩ���û��������������Ҹ��û�
 SQL = "Select Nc_Vip_Flag,Nc_Vip_ApplyDate From [pH_Company_Base] Where Username='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs.Eof Then
  Response.Write "<script>alert('�Բ������ṩ���û����������벻��ȷ...');history.back(-1);</script>"
  Response.End()
 Elseif Rs(0) = True Then
  Response.Write "<script>alert('���Ѿ��Ǳ�վ�ĸ߼���Ա...');history.back(-1);</script>"
  Response.End()
 Elseif Rs(1) <> "" Then
  Response.Write "<script>alert('���Ѿ�������վ������룬�ͷ���Ա�ᾡ����ϵ��!\n�벻Ҫ�ٴ��������...');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '��������
 SQL = "Update [pH_Company_Base] Set Nc_Vip_Date='"&BeginDate&"',Nc_Vip_Level="&Level&",Nc_Vip_ApplyDate='"&Date()&"' Where Username='"&Username&"' And Password='"&Password&"'"
 Conn.Execute(SQL)
 
  Response.Write "<script>alert('����ɹ������ǻᾡ����ϵ��...');history.back(-1);</script>"
  
End Sub
'//�ر����ݿ�����
CloseDB
 %>
