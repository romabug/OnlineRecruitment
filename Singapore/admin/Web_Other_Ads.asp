<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"200") <= 0 Then 
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
 SQL = "Select * From [pH_Web_Ad] Where Cityid=0"
Else
 SQL = "Select * From [pH_Web_Ad] Where AdName Like '%"&ParamName&"%' And  Cityid=0"
End if

SQL = SQL&" Order By WebName,Ad_Width Asc"
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
		
		if (id=="delads")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='_self';
			form.action="Web_Other_Option.asp?param=delads&pageno=Web_Other_Ads.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%">&nbsp;<font color="#FFFFFF">�� <strong>������</strong></font></td>
          <td width="50%" align="right"><a href="Web_Other_AddAds.asp"><font color="#FFFFFF">��ӹ��</font></a></td>
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
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>����ҳ��</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>���λ������</u></td>
                        <td width="8%" height="25"><u>�ļ�����</u></td>
                        <td width="11%" height="25"><u>��ʼ����</u></td>
                        <td width="11%" height="25"><u>��ֹ����</u></td>
                        <td width="7%" height="25"><u>����</u></td>
                        <td width="15%" height="25" bgcolor="f5f5f5">����ͼ</td>
                        <td width="8%" bgcolor="f5f5f5"><u>�������</u></td>
                        <td width="5%"> <INPUT onclick=SelectAllItem(this.form.ncid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid          = Rs("Ncid")
 AdName        = Rs("AdName")
 WebName       = Rs("WebName")
 AdClass       = Rs("AdClass")
 BeginDate     = Rs("BeginDate")
 EndDate       = Rs("EndDate")
 Sort1         = Rs("Ad_Sort")
 AdFile        = Rs("AdFile") 
 '�������ҳ��
 Select Case WebName
  Case 1:WebName_Str = "��ҳ"
  Case 2:WebName_Str = "ְλ����"
  Case 3:WebName_Str = "��ͷְλ"
  Case 4:WebName_Str = "��ְ��Ϣ"
  Case 5:WebName_Str = "�˲��Լ�"
  Case 6:WebName_Str = "У԰��Ƹ"
  Case 7:WebName_Str = "ѧ����ְ"
 End Select
 '�ļ�����
 Select Case AdClass
  Case 1:AdClass_Str = "ͼƬ�ļ�"
  Case 2:AdClass_Str = "Flash�ļ�"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><%= WebName_Str %></td>
                        <td height="25" align="left"><%= AdName %></td>
                        <td height="25"><%= AdClass_Str %></td>
                        <td height="25"><%= BeginDate %></td>
                        <td height="25" align="center"><%= EndDate %></td>
                        <td height="25"><%= Sort1 %></td>
                        <td height="25" bgcolor="f5f5f5">
		<% If AdClass = 1 Then %>
		
		 <a href="<%= "http://"&Rs("AdUrl") %>" target="_blank"><img src="../Uploadfiles/AdFile/<%= Rs("AdFile") %>" width="100" height="30" border="0"></a>
		 <% Else %>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="100" height="30">
          <param name="movie" value="../Uploadfile./AdFile/<%= Rs("AdFile") %>">
          <param name=quality value=high>
          <embed src="../Uploadfiles/AdFile/<%= Rs("AdFile") %>" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="435" height="75"></embed>
        </object>
		<% End if %>
						</td>
                        <td height="25" bgcolor="f5f5f5"><a href="Web_Other_EditAds.asp?param=<%= Ncid %>">�༭</a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= ncid %> name="ncid"></td>
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
							 <input type="button" name="delads" value="ɾ��" onClick="javascript:theForm_Submit('delads')">
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

