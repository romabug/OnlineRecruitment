<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"172") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action=Request.QueryString("Action")
Select Case Action  
 Case "Del"
  Call Del() 
 Case "Best"
  Call Best()   
End Select

'//������ҵ�����м�¼
Set Rs = Server.Createobject("ADODB.recordset")
'//��֯��ѯ���
SQL = "Select ac_id,ac_CompanyName,ac_name,ac_phone,ac_mail,ac_qq,ac_Adddate,ac_Flag From [pH_Locale_comApply] Order by ac_ID Desc"

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
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
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
		
}

</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>��ҵ������ͷ</strong></font></td>
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
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="1" class="text02">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="6%" height="25">&nbsp;���</td>
                        <td height="25">��˾����</td>
                        <td width="8%">��ϵ��</td>
                        <td width="13%">&nbsp;�绰</td>
                        <td width="15%" height="25">&nbsp;�����ʼ�</td>
                        <td width="12%" height="25">&nbsp;���칤��</td>
                        <td width="10%" height="25">&nbsp;�ύʱ��</td>
                        <td width="5%" height="25">����</td>
                        <td width="12%">�� ��</td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 ac_id            = Rs("ac_id")
 ac_CompanyName   = Rs("ac_CompanyName")
 ac_name          = Rs("ac_name")
 ac_phone         = Rs("ac_phone")
 ac_mail          = Rs("ac_mail")
 ac_qq            = Rs("ac_qq")
 ac_Adddate       = Rs("ac_Adddate")
 ac_Flag          = Rs("ac_Flag")
 
 If ac_Flag = 0 Then
   Flag = "<font color=""#FF0000"">��</font>"
  Else
   Flag = "<font color=""#009900"">��</font>"
  End if
 
%>
                      <tr bgcolor="f5f5f5"> 
                        <td height="25" align="center"><%= thePage+i %></td>
                        <td height="25"><%= ac_CompanyName %></td>
                        <td height="25" align="center"><%= ac_name %></td>
                        <td height="25"><%= ac_phone %></td>
                        <td height="25"><%= ac_mail %></td>
                        <td height="25"><%= ac_qq %></td>
                        <td height="25"><%= Formatdatetime(ac_Adddate,2) %></td>
                        <td height="25" align="center"><%= Flag %></td>
                        <td height="25"><a href="?Action=Del&id=<%= ac_id %>">ɾ��</a> 
                          <a href="?Action=Best&id=<%= ac_id %>">���</a> 
                          <a href="Web_Locale_comApply2.asp?Action=Best&id=<%= ac_id %>">��ϸ</a> 
                        </td>
                      </tr>
                      <% 
 Rs.Movenext
Next %>
                    </table></td>
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

Sub Del()
 Dim id

 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Delete From [pH_Locale_comApply]  Where ac_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 
 Response.Redirect "Web_Locale_comApply.asp"
End sub

Sub Best()
 Dim id

 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Update [pH_Locale_comApply] Set ac_Flag=1 Where ac_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 
 Response.Redirect "Web_Locale_comApply.asp"
End sub

Rs.Close
Set Rs = Nothing
Call CloseDB()
%>

