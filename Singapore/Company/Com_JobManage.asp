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
'Flag           = Tmp(1,0)
'If Flag = False Then
 'Response.redirect "../Public/Error.asp?param=2003"
 'Response.End()
'End if

'//ְλ�б�
Set Comm = Server.Createobject("ADODB.Command")
Set Rs = Server.Createobject("ADODB.Recordset")
Comm.ActiveConnection = Conn
Comm.CommandText = "Com_JobManage_JobList"
Comm.CommandType = 4
Comm.Parameters.Append Comm.CreateParameter("@Comid",200,1,30)
Comm.Parameters("@Comid") = Comid
Rs.open Comm,,1,1

Set Comm    = Nothing '//�ر�Command����

Rs.Pagesize = 10
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
            <!--#include file="../Lefter/Company_Job.asp" -->
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;ְλ����</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td><%= Cls_Page("Com_JobManage.asp",PageNo,PCount,RCount) %></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
                            <tr align="center" bgcolor="f5f5f5"> 
                              <td width="7%" height="23">���</td>
                              <td width="23%" height="23" bgcolor="f5f5f5">��Ƹְλ</td>
                              <td width="10%" height="23" bgcolor="f5f5f5">״ ̬</td>
                              <td width="12%" height="23" bgcolor="f5f5f5">���/ӦƸ</td>
                              <td width="25%" height="23" bgcolor="f5f5f5">��Ƹ��ֹ����</td>
                              <td height="23">�������</td>
                              <td width="6%" height="23">ѡ��</td>
                            </tr>
                            <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Jobid               = Rs("Jobid")
 JobName             = Rs("JobName")
 JobFlag             = Cls_JobFlag(Rs("JobFlag"))
 ViewClicks          = Rs("ViewClicks")
 SendClicks          = Rs("SendClicks")
 LastUpdate_Time     = Rs("LastUpdate_Time")
 BeginAndEndDate     = FormatDateTime(LastUpdate_Time,2)&"��"&Rs("End_Date")				  
%>
                            <tr align="center"> 
                              <td height="23" bgcolor="#FFFFFF"><%= TheRecord+i %></td>
                              <td height="23" align="left" bgcolor="#FFFFFF"><a href="Info/Com_JobView.asp?Param=<%= Jobid %>" target="_blank"><%= JobName %></a></td>
                              <td height="23" bgcolor="#FFFFFF"><%= JobFlag %></td>
                              <td height="23" bgcolor="#FFFFFF"><%= ViewClicks&"/"&SendClicks %></td>
                              <td height="23" bgcolor="#FFFFFF"><%= BeginAndEndDate %></td>
                              <td height="23" bgcolor="#FFFFFF"><a href="Com_JobEdit.asp?Param=<%= Jobid %>">�༭</a>|<a href="Com_JobCopy.asp?Param=<%= Jobid %>">����</a>|<a href="../Person/Per_Search_Jobauto.asp?Param=<%= Jobid %>" target="_blank">ƥ��</a></td>
                              <td height="23" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= JobId %> name=param></td>
                            </tr>
                            <% 
 Rs.Movenext
Next
Rs.Close
 %>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td align="right"> <INPUT onclick=SelectAllItem(this.form.param) type=checkbox value=all name=chk_all>
                                ѡ��������Ƹְλ </td>
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
                  <td height="40" align="center"> <input type="button" name="refresh" value="ˢ��ְλ" onClick="javascript:theForm_Submit(2001)"> 
                    <input type="button" name="publish" value="���·���" onClick="javascript:theForm_Submit(2005)"> 
                    <input type="button" name="open" value="����ְλ" onClick="javascript:theForm_Submit(2002)"> 
                    <input type="button" name="close" value="����ְλ" onClick="javascript:theForm_Submit(2003)"> 
                    <input type="button" name="delete" value="ɾ��ְλ" onClick="javascript:theForm_Submit(2004)"> 
                  </td>
                </tr>
              </form>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><hr size="1" color="#CCCCCC"></td>
              </tr>
              <tr> 
                <td><font color="#666666">����˵���� </font></td>
              </tr>
              <tr> 
                <td> <font color="#666666">ˢ��ְλ �� ����ְλ�ķ�������,�ܽ�ְλ�ŵ���վ���������ǰ��,�����ƸЧ�� 
                  ;<br>
                  ���·��� �� ��ְλ�Ե���Ϊ��ʼ����,��ֹʱ���Զ���Ϊ3���������·���ְλ ;<br>
                  ����ְλ �� �ԡ������Ρ���ְλ���½�����Ƹ ;<br>
                  ����ְλ �� �ԡ���ʱ����Ҫ��Ƹ����ְλ��������,�Ժ������Ҫ��Ƹʱ�ټ����ְλ���� ;<br>
                  ɾ��ְλ �� �ԡ��Ѿ���Ƹ��ɡ�,�Ժ�����Ҫ��Ƹ��ְλ���׽���ɾ�� ;<br>
                  �༭ �� �Ե�ǰ��ְλ����Ϣ���������������޸� ;<br>
                  ���� �� �Ե�ǰ��ְλ����һ����ͬ�ģ�Ȼ�������Ҫ���ʵ��������޸ķ���һ����ְλ ;<br>
                  ƥ�� �� ���Ե�ǰ��ְλ�����Զ���������3���·��ϸ�ְλ�����ĸ��˼��� .</font></td>
              </tr>
            </table></td>
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
Set Rs  = Nothing
CloseDB
 %>
