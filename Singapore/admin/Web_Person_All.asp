<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
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
 SQL = "Select B.Perid,B.Username,B.RegDate,I.RealName,I.Sex,I.Age,I.Edus,I.PersonPhone,I.WorkWill1,B.Nc_Best_Flag,I.TopAll,B.Flag From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid"
Else
 SQL = "Select B.Perid,B.Username,B.RegDate,I.RealName,I.Sex,I.Age,I.Edus,I.PersonPhone,I.WorkWill1,B.Nc_Best_Flag,I.TopAll,B.Flag From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid And (B.Username Like '%"&ParamName&"%' or I.RealName Like '%"&ParamName&"%')"
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
<title>ȫ�����˻�Ա</title>
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
			form.action="Web_Person_Option.asp?param=delperson&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="novideo")
		{
		  if(confirm('ȷ��ȡ�����û�����Ƶ������'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=novideo&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
						
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Person_SendMail.asp?pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="notop")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=notop&pageno=Web_Person_All.asp?pageno=<%= PageNo %>"
			form.submit();	   
		}			
		if (id=="flag")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=flag&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		if (id=="noflag")
		{
		  if(confirm('ȷ��ȡ����ˣ�'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=noflag&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		if (id=="nobest")
		{
		  if(confirm('ȷ��ȡ���û�Ա���Լ���'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=nobest&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
}

</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>ȫ�����˻�Ա</strong></font></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<Form action="" name="form" method="post">
  <tr>
    <td align="center">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
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
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="5%" height="25"><u>���</u></td>
                        <td width="12%" height="25" bgcolor="f5f5f5"><u>�û���</u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>�� ��</u></td>
                        <td width="12%" height="25" bgcolor="f5f5f5"><u>�Ա�/</u><u>����</u><u>/ѧ��</u></td>
                        <td width="12%" height="25"><u>��ϵ�绰</u></td>
                        <td width="12%"><u>��ְ����</u></td>
                        <td width="4%" height="25"><u>���</u></td>
                        <td width="4%"><u>�̶�</u></td>
                        <td width="4%"><u>�Լ�</u></td>
                        <td width="9%" height="25"><u>ע��ʱ��</u></td>
                        <td><u>�������</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.perid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Perid            = Rs("Perid")
 Username         = Rs("Username")
 RealName         = Rs("RealName")
 Sex              = Rs("Sex")
 Age              = Rs("Age")
 Edus             = Rs("Edus")
 PersonPhone      = Rs("PersonPhone")
 WorkWill1        = Rs("WorkWill1")
 Best_Flag        = Rs("Nc_Best_Flag")
 RegDate          = Rs("RegDate")
 TopAll           = Rs("TopAll")
 Flag 		      = Rs("Flag")
 '//��ȡע������
 If RegDate <> "" Then
  RegDate = FormatDateTime(RegDate,2)
 End if
 '��ȡ��Ա�Ƿ�ͨ�����
 Flag_Str = ""
 If Flag = False Then
  Flag_Str = "<font color=#ff0000>��</font>"
 Else
 Flag_Str = "<font color=#009900>��</font>"
 End if
 '��ȡ��Ա�Ƿ�̶�
 Top_Str = ""
 If TopAll = True Then
  Top_Str = "<font color=#009900>��</font>"
 End if
 '��ȡ��Ա�Ƿ��Լ�
 Best_Str = ""
 If Best_Flag = True Then
  Best_Str = "<font color=#009900>��</font>"
 End if
 '��ȡѧ��
 Edus_Str = Cls_Edus(Edus)
 '��ȡ�Ա�
 Sex_Str = Cls_Sex(Sex)
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Person/Resume/Resume_Master_Preview.asp?Param=<%= Perid %>" target="_blank"><%= Username %></a></td>
                        <td height="25" align="center"><a href="../Person/Resume/Resume_Master_Preview.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                        <td height="25"><%= Sex_Str %>/<%= Age %>/<%= Edus_Str %></td>
                        <td height="25" align="left"><%= PersonPhone %></td>
                        <td height="25" align="left"><%= WorkWill1 %></td>
                        <td height="25"><%= Flag_Str %></td>
                        <td height="25"><%= Top_Str %></td>
                        <td height="25"><%= Best_Str %></td>
                        <td height="25"><%= RegDate %></td>
                        <td height="25" align="left"> <a href="Web_Person_EditPass.asp?Perid=<%= Perid %>&PageNo=<%= "Web_Person_All.asp?PageNo="&PageNo %>"><u>����</u></a> 
                          <a href="Web_Person_TopManage.asp?Perid=<%= Perid %>&PageNo=<%= "Web_Person_All.asp?PageNo="&PageNo %>"><u>�̶�</u></a> 
                          <a href="Web_Person_Update.asp?Perid=<%= Perid %>"><u>�༭</u></a> 
						  <a href="web_Person_Showup.asp?Perid=<%= Perid %>&PageNo=<%= "Web_Person_All.asp?PageNo="&PageNo %>"><u>�Լ�</u></a>
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
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="35%" height="25">�������� 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="����">
                              </td>
                              <td width="65%" align="right"> 
                                <input type="button" name="delperson" value="ɾ��" onClick="javascript:theForm_Submit('delperson')">
							  <input type="button" name="sendmail" value="�����ʼ�" onClick="javascript:theForm_Submit('sendmail')">
							  <input type="button" name="noflag" value="ȡ�����" onClick="javascript:theForm_Submit('noflag')">
                                <input type="button" name="notop" value="ȡ���̶�" onClick="javascript:theForm_Submit('notop')">
							  <input type="button" name="nobest" value="ȡ���Լ�" onClick="javascript:theForm_Submit('nobest')">
							  
							  <input type="button" name="flag" value="ͨ�����" onClick="javascript:theForm_Submit('flag')">
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

