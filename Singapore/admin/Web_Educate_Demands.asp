<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"148") <= 0 Then 
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
 SQL = "Select Ncid,Title,Type,Name,Userid,Price1,Price2,BeginDate,EndDate,AddDate,Flag From [pH_Educate_Demand] "
Else
 SQL = "Select Ncid,Title,Type,Name,Userid,Price1,Price2,BeginDate,EndDate,AddDate,Flag From [pH_Educate_Demand] Where Title Like '%"&ParamName&"%' or Properity Like '%"&ParamName&"%' "
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
<title>��վ���ݹ���</title>
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
		
		if (id=="deldemand")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='_self';
			form.action="Web_Educate_Option.asp?param=deldemand&pageno=Web_Educate_Demands.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhedemand")
		{
		    form.target='_self';
			form.action="Web_Educate_Option.asp?param=shenhedemand&pageno=Web_Educate_Demands.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
			
		if (id=="noshenhedemand")
		{
		 if(confirm('ȡ����˽�Ӱ��ü�¼����վ����ʾ'))
		  {
			form.target='_self';
			form.action="Web_Educate_Option.asp?param=noshenhedemand&pageno=Web_Educate_Demands.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;<font color="#FFFFFF">�� <strong>��ѵ����</strong></font></td>
          <td width="50%" align="right">&nbsp;</td>
        </tr>
      </table></td>
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
                        <td width="24%" height="25" bgcolor="f5f5f5"><u>����</u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>��Ա����</u></td>
                        <td width="8%" height="25" bgcolor="f5f5f5"><u>��ϵ��</u></td>
                        <td width="12%" height="25" bgcolor="f5f5f5"><u>��ѵ����(Ԫ)</u></td>
                        <td width="20%" height="25" bgcolor="f5f5f5"><u>��ѵʱ��</u></td>
                        <td width="4%"><u>���</u></td>
                        <td width="9%" bgcolor="f5f5f5"><u>����ʱ��</u></td>
                        <td bgcolor="f5f5f5"><u>�������</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.schid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid         = Rs("Ncid")
 Title		  = Rs("Title")
 Type1		  = Rs("Type")			
 Name		  = Rs("Name")
 Userid		  = Rs("Userid")
 Price1		  = Rs("Price1")
 Price2		  = Rs("Price2")
 BeginDate	  = FormatDateTime(Rs("BeginDate"),2)
 EndDate	  = FormatDateTime(Rs("EndDate"),2)
 AddDate	  = FormatDateTime(Rs("AddDate"),2)
 Flag 		  = Rs("Flag")
 
 '//��ȡ�Ƿ�ͨ�����
 Flag_Str = ""
 If Flag = 1 Then
 	Flag_Str = "<font color=#009900>��</font>"
 Else
 	Flag_Str = "<font color=#ff0000>��</font>"
 End if
 '//��ȡ��Ա����(��ҵ/����)
 Type_Str = ""
 Type_Url = ""
 If Type1 = "Company" Then
  Type_Str = "��ҵ"
  Type_Url = "<a href=../Company/Info/Com_Master_Preview.asp?Param="&Userid&" target=_blank><u>"&Name&"</u></a>"
 Else
  Type_Str = "����"
  Type_Url = "<a href=../Person/Resume/Resume_Master_Preview.asp?Param="&Userid&" target=_blank><u>"&Name&"</u></a>"
 End if
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Educate/Demand_Info.asp?Param=<%= Ncid %>" target="_blank"><%= Title %></a></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><%= Type_Str %></td>
                        <td height="25"><%= Type_Url %></td>
                        <td height="25" align="left">��<%= Price1&"-"&Price2 %></td>
                        <td height="25" bgcolor="f5f5f5"><%= BeginDate&"��"&EndDate %></td>
                        <td height="25"><%= Flag_Str %></td>
                        <td height="25" align="center"><%= AddDate %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><a href="../Educate/Demand_Info.asp?Param=<%= Ncid %>" target="_blank"><u>��ϸ</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Ncid %> name="schid"></td>
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
                              <td width="50%" height="25">�������� 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="����">
                              </td>
                              <td width="50%" align="right">
							 <input type="button" name="delete" value="ɾ��" onClick="javascript:theForm_Submit('deldemand')">
                                <input type="button" name="noshenhe" value="ȡ�����" onClick="javascript:theForm_Submit('noshenhedemand')">
							 <input type="button" name="shenhe" value="ͨ�����" onClick="javascript:theForm_Submit('shenhedemand')">
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

