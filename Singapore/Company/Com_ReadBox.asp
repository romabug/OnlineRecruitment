<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL
Dim Perid,UserName
Dim Comid,Jobid,AddDate,Title,Memo

'//��ȡ�����û��ĵ�½���
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-��¼����ܽ��иò�����-');window.close();</script>"
 Response.End()
End if
'//��ȡ���жϲ���
Ncid     = Replace_Text(Request("param"))
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');window.close();</script>"
 Response.End()
End if
'//�����ż�
SQL = "Select * From [pH_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Response.write "<script language=JavaScript>alert('û���ҵ����ż���');window.close();</script>"
 Response.End()
End if
Perid     = Rs("Perid")
Jobid     = Rs("Jobid")
AddDate   = Rs("AddDate")
Title     = Rs("Title")
Memo      = Rs("Memo") 
Rs.Close
'//���ż�����Ϊ�Ѿ��Ķ�״̬
Conn.Execute("Update [pH_Company_InBox] Set Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid))
'//��ȡְλ����
SQL = "Select JobName From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then JobName = Rs(0)
Rs.Close
'//��ȡ��������
SQL = "Select RealName From [pH_Person_Info] Where Perid='"&Perid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then RealName = Rs(0)
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- �Ķ��ż�</title>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="470" border="0" align="center" cellpadding="0" cellspacing="0">
 
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr>
                  <td height="25" bgcolor="f9f9f9"> &nbsp;<img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                    <strong>�Ķ��ż�</strong> </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              
            <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">�����ˣ�</td>
                  <td height="25" bgcolor="f9f9f9"><%= RealName %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">�ռ�ʱ�䣺</td>
                  <td height="25"><%= AddDate %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">ְλ���ƣ�</td>
                  <td height="25" bgcolor="f9f9f9"><%= JobName %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">�ż����⣺</td>
                  <td height="25"><%= Title %></td>
                </tr>
                <tr> 
                  
                <td width="80" height="25" align="right" bgcolor="f9f9f9">�� �ݣ�</td>
                  <td height="25" bgcolor="f9f9f9">
				  <%= Memo %>
				  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="40" align="center"> 
        <input type="button" name="Submit2" value="�� ��" style="height:30px;" onClick="window.close();">
      </td>
    </tr>
  
</table>
</body>
</html>
<% 

'//�ر����ݿ�����
CloseDB
 %>
