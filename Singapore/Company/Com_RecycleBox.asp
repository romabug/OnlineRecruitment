<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

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

'//������ҵ�ռ��б�
SQL = "Select Ncid,Perid,Jobid,AddDate,Title,Flag From [pH_Company_RecycleBox] Where Comid='"&Comid&"' And Item_Source=1 Order By AddDate Desc"
Rs.open SQL,Conn,1,1
Rs.Pagesize = 15
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
<script language="JavaScript">
<!--
function SelectAllItem(item)
{
    if( typeof(item.length) == "undefined" )
    {
        item.checked = !item.checked
    }
    else
    {
        for(i=0;i<item.length;i++)
        {
            item[i].checked=!item[i].checked
        }
    }
}

function theForm_Submit(id)
{
		
		if (id=="del")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ�����ż�'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=del";
			openwin();
			form.submit();	   
		   }

		}
		
		if (id=="undel")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=undel";
			openwin();
			form.submit();	   
		}		
		
}
function openwin()
  {
    disp=window.open("","rslt","width=500,height=320,resizable=yes");
	disp.focus();
  }

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ����վ</title>
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
            <!--#include file="../Lefter/Company_Inbox.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <Form action="" method="post" name="form">
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="eeeeee">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                          <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td width="50%"><b><font color="#000000">����վ</font></b></td>
                                                <td width="50%" align="right">�鿴
                                                  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
                                                    <option value="Com_RecycleBox.asp" selected>�ռ���</option>
													<option value="Com_PersonDbRecBox.asp">�˲ſ�</option>
                                                  </select>
                                                  ��ɾ����¼</td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_RecycleBox.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="eeeeee">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="6%" height="25">״̬</td>
                                          <td width="32%" height="25" bgcolor="f5f5f5">�ż�����</td>
                                          <td width="26%" height="25" bgcolor="f5f5f5">����ְλ</td>
                                          <td width="13%" bgcolor="f5f5f5">������</td>
                                          <td width="15%" height="25">�ռ�ʱ��</td>
                                          <td width="8%" height="25">ѡ��</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid        = Rs("Ncid")
 Perid       = Rs("Perid")
 Jobid       = Rs("Jobid") 
 AddDate     = FormatDateTime(Rs("AddDate"),2)
 Title       = Rs("Title")
 Flag	     = Rs("Flag")
 '��ȡ��������
 Set Re = Conn.Execute("Select RealName From [pH_Person_Info] Where Perid='"&Perid&"'")
 If Not Re.Eof Then RealName = Re(0)
 Re.Close
 '��ȡְλ����
 Set Re = Conn.Execute("Select JobName From [pH_Job_Base] Where Jobid='"&Jobid&"'")
 If Not Re.Eof Then JobName = Re(0)
 Re.Close 
 '�ж��Ƿ��Ķ���
 If Flag = True Then
  Flag_Str = "<img src=../Images/Person/Read.gif border=0>"
 Else
  Flag_Str = "<img src=../Images/Person/UnRead.gif border=0>"
 End if 			  
%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><%= Flag_Str %></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><a href="Javascript:" onClick="Javascript:window.open('Com_ReadBox.asp?param=<%= Ncid %>','rslt','width=540,height=350,resizable=yes,scrollbars=yes');"><font color="#000099"><u><%= Title %></u></font></a></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= JobName %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF">
										  <a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a>
										  </td>
                                          <td height="25" bgcolor="#FFFFFF"><%= AddDate %></td>
                                          <td height="25" bgcolor="#FFFFFF"> <INPUT type=checkbox value=<%= Ncid %> name=perid></td>
                                        </tr>
                                        <% 
 Rs.Movenext
Next
Rs.Close
 %>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td align="right"> <INPUT onclick=SelectAllItem(this.form.perid) type=checkbox value=all name=chk_all>
                                            ѡ�������ż� </td>
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
                              <td height="30" align="right"> <input type="button" name="delete" value="����ɾ��" onClick="javascript:theForm_Submit('del')"> 
                                <input type="button" name="delete" value="��ԭ" onClick="javascript:theForm_Submit('undel')"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
              </Form>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><hr size="1" color="#CCCCCC"></td>
              </tr>
              <tr> 
                <td><font color="#666666">����˵���� </font></td>
              </tr>
              <tr> 
                <td> <font color="#666666">����վ���������ռ��л����ղؼ�ɾ������Ϣ ;<br>
                  ��ԭ ���Խ�����վ����Ϣ��ԭ���ռ��л����ղؼ� ;<br>
                  ����ɾ�� ������վ����Ϣ���׵�ɾ�� ;</font></td>
              </tr>
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

'//�ر����ݿ�����
CloseDB
 %>
