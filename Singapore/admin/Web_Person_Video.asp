<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"123") <= 0 Then 
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
 SQL = "Select B.Perid,B.Username,B.RegDate,I.RealName,I.Sex,I.PersonPhone,I.TopAll,I.Video_Flag,I.Video_Date,I.Video_EndDate,I.Video_BestFlag From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid And Nc_Video=1 "
Else
 SQL = "Select B.Perid,B.Username,B.RegDate,I.RealName,I.Sex,I.PersonPhone,I.TopAll,I.Video_Flag,I.Video_Date,I.Video_EndDate,I.Video_BestFlag From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid And (B.Username Like '%"&ParamName&"%' or I.RealName Like '%"&ParamName&"%') And Nc_Video=1 "
End if
SQL = SQL&" Order By B.Ncid Desc"
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
<title>��Ƶ����</title>
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
		
		if (id=="delperson")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=delperson&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="novideo")
		{
		  if(confirm('ȷ��ȡ��ѡ����û���Ƶ������'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=novideo&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		if (id=="delvideo")
		{
		  if(confirm('ȷ��ɾ��ѡ����û���Ƶ������'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=delvideo&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}					
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Person_SendMail.asp?pageno=Web_Person_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="notop")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=notop&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>"
			form.submit();	   
		}
		if (id=="bestvideo")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=bestvideo&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>"
			form.submit();	   
		}			
		if (id=="nobestvideo")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=nobestvideo&pageno=Web_Person_Video.asp?pageno=<%= PageNo %>"
			form.submit();	   
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>��Ƶ����</strong></font></td>
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
                        <td width="12%" height="25" bgcolor="f5f5f5"><u>�û���</u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>�� ��</u></td>
                        <td width="5%" height="25"><u>�Ա�</u></td>
                        <td width="12%" height="25"><u>��ϵ�绰</u></td>
                        <td width="9%" height="25"><u>��ͨ����</u></td>
                        <td width="9%"><u>��ֹ����</u></td>
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>����״̬</u></td>
                        <td width="5%" bgcolor="f5f5f5"><u>�Ƽ�</u></td>
                        <td width="9%" height="25"><u>ע��ʱ��</u></td>
                        <td><u>�������</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.perid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Perid               = Rs("Perid")
 Username            = Rs("Username")
 RegDate             = Rs("RegDate")
 RealName            = Rs("RealName")
 Sex                 = Rs("Sex")
 PersonPhone         = Rs("PersonPhone")
 BestFlag            = Rs("Video_BestFlag")
 Video_Flag          = Rs("Video_Flag")
 Video_Date          = Rs("Video_Date")
 Video_EndDate       = Rs("Video_EndDate")
 
 '//��ȡע������
 If RegDate <> "" Then
  RegDate = FormatDateTime(RegDate,2)
 End if
 '//��ȡ��ͨ����
 If Video_Date <> "" Then
  Video_Date = FormatDateTime(Video_Date,2)
 End if
 '//��ȡ��ֹ����
 If Video_EndDate <> "" Then
  If DateDiff("d",Video_EndDate,Date()) > 0 Then
    Video_EndDate = "<font color=#ff0000>"&FormatDateTime(Video_EndDate,2)&"</font>"
  Else
    Video_EndDate = FormatDateTime(Video_EndDate,2)
  End if
 End if 
 
 '��ȡ��Ƶ�����Ƿ��Ƽ�
 Best_Str = ""
 If BestFlag = True Then
  Best_Str = "<font color=#009900>��</font>"
 End if
 '����״̬
 Flag_Str = ""
 Select Case Video_Flag
  Case 0:Flag_Str = "������"
  Case 1:Flag_Str = "<font color=#666666>�Ի�Ա����</font>"
  Case 2:Flag_Str = "<font color=#ff0000>������</font>"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Person/Resume/Resume_Master_Preview.asp?Param=<%= Perid %>" target="_blank"><%= Username %></a></td>
                        <td height="25" align="center"><a href="../Person/Resume/Resume_Master_Preview.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                        <td height="25"><%= Sex_Str %></td>
                        <td height="25"><%= PersonPhone %></td>
                        <td height="25" align="center"><%= Video_Date %></td>
                        <td height="25" align="center"><%= Video_EndDate %></td>
                        <td height="25" bgcolor="f5f5f5"><%= Flag_Str %></td>
                        <td height="25" bgcolor="f5f5f5"><%= Best_Str %></td>
                        <td height="25"><%= RegDate %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"> <a href="Web_Person_EditPass.asp?Perid=<%= Perid %>&PageNo=<%= "Web_Person_Video.asp?PageNo="&PageNo %>"><u>����</u></a> 
                          <a href="Web_Person_TopManage.asp?Perid=<%= Perid %>&PageNo=<%= "Web_Person_Video.asp?PageNo="&PageNo %>"><u>�̶�</u></a> 
                          <a href="Web_Person_VideoManage.asp?Param=rar&Perid=<%= Perid %>&PageNo=<%= "Web_Person_Video.asp?PageNo="&PageNo %>"><u>��Ƶ</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Perid %> name="perid"></td>
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
                              <td width="70%" align="right">
							 <input type="button" name="delperson" value="ɾ����Ա" onClick="javascript:theForm_Submit('delperson')">
							  <input type="button" name="sendmail" value="�����ʼ�" onClick="javascript:theForm_Submit('sendmail')">
							  <input type="button" name="novideo" value="ȡ����Ƶ" onClick="javascript:theForm_Submit('novideo')">
							  <input type="button" name="delvideo" value="ɾ����Ƶ" onClick="javascript:theForm_Submit('delvideo')">
							  <input type="button" name="delvideo" value="ȡ���Ƽ�" onClick="javascript:theForm_Submit('nobestvideo')">
							  <input type="button" name="delvideo" value="��Ϊ�Ƽ�" onClick="javascript:theForm_Submit('bestvideo')">
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

