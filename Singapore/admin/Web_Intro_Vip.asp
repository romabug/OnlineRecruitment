<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Ncid,Schid,Username,SchoolName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"221") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
Select Case Action
 Case "flag"
  Call Flag_Submit() '//���Ȼ���ͨ����˺���
 Case "del"
  Call Del_Submit() '//ɾ����¼�ĺ���
End Select

'//��ȡ����
ParamName = Replace_Text(Request("ParamName"))

'//������ҵ�����м�¼
Set Rs = Server.Createobject("ADODB.recordset")
'//��֯��ѯ���
If ParamName = "" Then
 SQL = "Select Ncid,Corid,Username,Corpname,Locus_Area,Locus_City,Nc_Vip_Date,Nc_Vip_EndDate,Nc_Vip_Level,RegDate From [pH_Intro_Base] Where Nc_Vip_Flag=1 "
Else
 SQL = "Select Ncid,Corid,Username,Corpname,Locus_Area,Locus_City,Nc_Vip_Date,Nc_Vip_EndDate,Nc_Vip_Level,RegDate From [pH_Intro_Base]  Where (Username Like '%"&ParamName&"%' or CorpName Like '%"&ParamName&"%') And Nc_Vip_Flag=1 "
End if
SQL = SQL&" Order By Ncid Desc"
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
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
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
		
		if (id=="delschool")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='_self';
			form.action="Web_Intro_Option.asp?param=delschool&pageno=Web_Intro_Vip.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhe")
		{
		    form.target='_self';
			form.action="Web_Intro_Option.asp?param=shenhe&pageno=Web_Intro_Vip.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Intro_SendMail.asp?pageno=Web_Intro_Vip.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
			
		if (id=="novip")
		{
		 if(confirm('ȷ�Ͻ��иò�����'))
		  {
			form.target='_self';
			form.action="Web_Intro_Option.asp?param=novip&pageno=Web_Intro_Vip.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">�� <strong>�շ��н����</strong></font></td>
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
                        <td width="11%" height="25" bgcolor="f5f5f5"><u>�û���</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>ְ���������</u></td>
                        <td width="10%" bgcolor="f5f5f5"><u>���ڵ���</u></td>
                        <td width="8%" height="25"><u>�շ�����</u></td>
                        <td width="9%" height="25"><u>��ͨʱ��</u></td>
                        <td width="9%" height="25"><u>��ֹʱ��</u></td>
                        <td width="9%" height="25"><u>ע��ʱ��</u></td>
                        <td width="5%"><u>״̬</u></td>
                        <td><u>����</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.corid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid                 = Rs("Ncid")
 Corid				  = Rs("Corid")
 Username             = Rs("Username")
 Corpname			  = Rs("Corpname")
 RegDate              = Rs("RegDate")
 Vip_Date		      = FormatDateTime(Rs("Nc_Vip_Date"),2)
 Vip_EndDate		  = FormatDateTime(Rs("Nc_Vip_EndDate"),2)
 Vip_Level		      = Rs("Nc_Vip_Level")
 Locus_Area			  = Rs("Locus_Area")
 Locus_City			  = Rs("Locus_City")
 '//��ȡע������
 If RegDate <> "" Then
  RegDate = FormatDateTime(RegDate,2)
 End if
			   
 '//��ȡ�շѻ�Ա��״̬
 Vip_Str = ""
 If DateDiff("d",Vip_EndDate,Date()) <= 0  Then
 	Vip_Str = "����"
 Else
 	Vip_Str = "<font color=#ff0000>����</font>"
 End if
 
  '//����VIP��Ա������
  Vip_Flag_Str = "<a href=""Web_Intro_EditVip.asp?Corid="&Corid&"&PageNo=Web_Intro_Vip.asp?PageNo="&PageNo&"""><u>VIP</u></a>"
 '��ȡVIP����
 Level_Str = ""
 Set Re = Conn.Execute("Select i_VipName From [pH_Intro_VipLevel] Where i_LevelId="&Cstr(Vip_Level))
 If Not Re.Eof Then Level_Str = Re(0)
 Re.Close
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Intro/Info/Index.asp?Param=<%= Corid %>" target="_blank"><%= Username %></a></td>
                        <td height="25" align="left"><a href="../Intro/Info/Index.asp?Param=<%= Corid %>" target="_blank"><%= CorpName %></a></td>
                        <td height="25" align="center"><%= Locus_Area&Locus_City %></td>
                        <td height="25"><%= Level_Str %></td>
                        <td height="25"><%= Vip_Date %></td>
                        <td height="25" align="center"><%= Vip_EndDate %></td>
                        <td height="25"><%= RegDate %></td>
                        <td height="25" align="center"><%= Vip_Str %></td>
                        <td height="25" align="center"><a href="Web_Intro_EditPass.asp?Corid=<%= Corid %>&PageNo=<%= "Web_Intro_Vip.asp?PageNo="&PageNo %>"><u>����</u></a> 
                          <a href="Web_Intro_Update.asp?Corid=<%= Corid %>&PageNo=<%= "Web_Intro_Vip.asp?PageNo="&PageNo %>"><u>�༭</u></a> 
                          <%= Vip_Flag_Str %> </td>
                        <td height="25"><INPUT type=checkbox value=<%= Corid %> name="corid"></td>
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
                              <td width="34%" height="25">�������� 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="����">
                              </td>
                              <td width="66%" align="right">
							 <input type="button" name="delete" value="ɾ��" onClick="javascript:theForm_Submit('delschool')">
							  <input type="button" name="sendmail" value="�����ʼ�" onClick="javascript:theForm_Submit('sendmail')">
                                <input type="button" name="novip" value="ȡ��VIP�ʸ�" onClick="javascript:theForm_Submit('novip')">
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
