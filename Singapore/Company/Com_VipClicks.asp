<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim PageNo,PCount,RCount,Psize,TheRecord,i
Dim Jobid,JobName,JobFlag,ViewClicks,SendClicks,LastUpdate_Time,BeginAndEndDate
'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobManage"
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
'//0��ҵ����,1��Ա�з�ͨ�����
'//�� Tmp(0,0) ��ʾ��ҵ����
Rs.Close
Set Cmd = Nothing
'//�жϻ�Ա��û��ͨ�����
Flag           = Tmp(1,0)
If Flag = False Then
 Response.redirect "../Public/Error.asp?param=2003"
 Response.End()
End if

'//�鿴��ϵ��ʽ�ļ�¼
SQL = "Select * From [pH_Company_VipClick] where Comid='"&Comid&"' Order by Vip_id Desc"
Rs.open SQL,Conn,1,1
Rs.Pagesize = 20
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
TheRecord = (PageNo-1)*Psize '//�����¼��ŵĻ���
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_JobManage.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ְλ����</title>
</head>
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
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form name="form" method="post">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ϵ��ʽ�鿴��¼</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td><%= Cls_Page("Com_VipClicks.asp",PageNo,PCount,RCount) %></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#eeeeee" class="text01">
                            <tr align="center" valign="bottom" bgcolor="f5f5f5" > 
                              <td width="8%" height="22">�� ��</td>
                              <td width="14%" bgcolor="f5f5f5">��&nbsp;&nbsp;��</td>
                              <td width="6%">��&nbsp;��</td>
                              <td width="9%" bgcolor="f5f5f5">ѧ&nbsp;��</td>
                              <td width="25%">��ҵѧУ</td>
                              <td width="25%">��ѧרҵ</td>
                              <td width="10%">�� ��</td>
                            </tr>
                            <%
For i=1 to Psize
 If Rs.Eof Then Exit For
 Perid = Rs("Perid") 									
 SQL = "Select RealName,Sex,Edus,LastSchool,Speciality From [pH_Person_Info] Where Perid='"&Perid&"'"
 Set Re = Conn.Execute(SQL)		
 RealName       = Re("RealName")
 Sex			= Re("Sex")
 Edus			= Re("Edus")
 LastSchool		= Re("LastSchool")
 Speciality		= Re("Speciality")
 Sex_Str = Cls_Sex(Sex)
 Edus_Str = Cls_Edus(Edus)
 Re.Close
		%>
                            <tr align="center" valign="middle" bgcolor="#FFFFFF" class="text01"> 
                              <td width="80" height="22"><%= TheRecord+i %></td>
                              <td width="50" align="left" bgcolor="#FFFFFF"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                              <td width="45"><%= Sex_Str %></td>
                              <td width="55"><%= Edus_Str %></td>
                              <td width="150" align="left"><%= LastSchool %></td>
                              <td align="left"><%= Speciality %></td>
                              <td align="center" bgcolor="#FFFFFF"><%= Rs("Clicks") %></td>
                            </tr>
                            <% 
 
 Rs.movenext
Next 
%>
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
                  <td height="40" align="center">&nbsp; </td>
                </tr>
              </form>
            </table>
            
          </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 


'//�ر����ݿ�����
Rs.Close
Set Rs  = Nothing
CloseDB
 %>
