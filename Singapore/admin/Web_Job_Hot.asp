<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"155") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

'//��ȡ����
ParamName = Replace_Text(Request("ParamName"))

'//������ҵ�����м�¼
Set Rs = Server.Createobject("ADODB.recordset")
'//��֯��ѯ���
If ParamName = "" Then
 SQL = "Select Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time From [pH_Job_Base] Where HotFlag=1"
Else
 SQL = "Select Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time From [pH_Job_Base] Where (JobName Like '%"&ParamName&"%' or JobClass Like '%"&ParamName&"%') And HotFlag=1"
End if
SQL = SQL&" Order By Jobid Desc"
Rs.Open SQL,Conn,1,1

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
Thepage = (PageNo-1)*Psize
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ƹְλ</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<script language="JavaScript">
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
		
		if (id=="deljob")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=deljob&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhe")
		{
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=shenhe&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="nohot")
		{
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=nohot&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
			
		if (id=="noshenhe")
		{
		 if(confirm('�Ƿ�ȡ����ѡ��ְλ�����'))
		  {
			form.target='_self';
			form.action="Web_Job_Option.asp?param=noshenhe&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();
		   }	   
		}		
		
		
}

</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� 
      <strong>����ְλ</strong></font></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<Form action="" name="form" method="post">
  <tr>
    <td align="center">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">

        <tr> 
          <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
                      <td width="30%" align="right"> 
                        <%
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&ParamName="&ParamName&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&ParamName="&ParamName&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   %>
          <select name="menu2" onChange="MM_jumpMenu('self',this,0)" style="width:40px;">
               <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&ParamName=<%=ParamName%>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
                        
         <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&ParamName="&ParamName&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&ParamName="&ParamName&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>

		  
		  </td>
        </tr>
      
      </table>
				</td>
              </tr>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="5"></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="5%" height="25"><u>���</u></td>
                        <td width="18%" height="25" bgcolor="f5f5f5"><u>ְλ����</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>��Ƹ��ҵ</u></td>
                        <td width="7%" height="25"><u>״̬</u></td>
                        <td width="8%" height="25"><u>��ϵ��</u></td>
                        <td width="12%" height="25"><u>��ϵ�绰</u></td>
                        <td height="25"><u>�̶�</u></td>
                        <td width="9%" height="25"><u>����ʱ��</u></td>
                        <td><u>�������</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.jobid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Jobid              = Rs("Jobid")
 Comid              = Rs("Comid")
 JobName            = Rs("JobName")
 JobFlag            = Rs("JobFlag")
 ContactPerson      = Rs("ContactPerson")
 Phone              = Rs("Phone")
 BestFlag           = Rs("BestFlag")
 TopAll             = Rs("TopAll")
 LastUpdate_Time    = Rs("LastUpdate_Time")
 
 '//��ȡ��������
 If LastUpdate_Time <> "" Then
  LastUpdate_Time = FormatDateTime(LastUpdate_Time,2)
 End if
 '//�ж��Ƿ��Ǽ�Ƹְλ
 Best_Str = ""
 If BestFlag = True Then
  Best_Str = "<font color=#009900>��</font>"
 End if
 '//�ж��Ƿ��ǹ̶�ְλ
 Top_Str = ""
 If TopAll = True Then
  Top_Str = "<font color=#009900>��</font>"
 End if
 '��ȡ��ҵ����
 CompanyName = ""
 Set Re = Conn.Execute("Select CompanyName From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Not Re.Eof Then CompanyName = Re(0)
 Re.Close
 '��ȡְλ��״̬
 Job_Str = ""
 Select Case JobFlag 
  Case 0:Job_Str = "<font color=#ff0000>δ���</font>"
  Case 1:Job_Str = "��Ƹ��"
  Case 2:Job_Str = "<font color=#666666>������</font>"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_JobView.asp?Param=<%= Jobid %>&Comid=<%= Comid %>" target="_blank"><%= Jobname %></a></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
                        <td height="25"><%= Job_Str %></td>
                        <td height="25"><%= ContactPerson %></td>
                        <td height="25" align="left"><%= Phone %></td>
                        <td height="25"><%= Top_Str %></td>
                        <td height="25"><%= LastUpdate_Time %></td>
                        <td height="25" align="center"> <a href="Web_Job_TopManage.asp?Jobid=<%= Jobid %>&PageNo=<%= "Web_Job_Hot.asp?PageNo="&PageNo %>"><u>�̶�</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Jobid %> name="jobid"></td>
                      </tr>
                      <% 
 Rs.Movenext 
Next
 %>
                    </table> </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="30%" height="25">�������� 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="����">
                              </td>
                              <td align="right"> 
                                <input type="button" name="deljob" value="ɾ��ְλ" onClick="javascript:theForm_Submit('deljob')">
                                <input type="button" name="noshenhe" value="ȡ�����" onClick="javascript:theForm_Submit('noshenhe')">
							 <input type="button" name="shenhe" value="ͨ�����" onClick="javascript:theForm_Submit('shenhe')">
                                <input type="button" name="nobest" value="ȡ������" onClick="javascript:theForm_Submit('nohot')"> 
                              </td>
        </tr>
      
      </table>
				</td>
              </tr>
            </table> </td>
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
  </tr>
 </Form>
</table>

</body>
</html>
<%
Rs.Close
Set Rs = Nothing

Call CloseDB()
%>

