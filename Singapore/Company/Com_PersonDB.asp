<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Classid = Replace_Text(Request("Classid"))
If Classid = "" Then Classid = 0
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

'//������ҵ�˲ſ�
SQL = "Select Ncid,Perid,AddDate From [pH_Company_PersonDB] Where Comid='"&Comid&"' "
If Classid <> "0" And Classid <> "" Then
 SQL = SQL& " And Classid="&Classid
End if
SQL = SQL& " Order By AddDate Desc"
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
		
		if (id=="delpersondb")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=delpersondb";
			openwin();
			form.submit();	   
		   }

		}
		
		if (id=="delfavrecycle")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=delfavrecycle";
			openwin();
			form.submit();	   
		}
		if (id=="removepersondb")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=removepersondb";
			openwin();
			form.submit();	   
		}
		if (id=="send")
		{
		    form.target='rslt';
			form.action="Com_SendApp.asp?param=persondb";
			openwin();
			form.submit();	   
		}
				
		
}
function openwin()
  {
    disp=window.open("","rslt","width=500,height=320,resizable=yes");
	disp.focus();
  }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- �˲ſ�</title>
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
                                          <td height="25" bgcolor="f5f5f5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="40%"><b><font color="#000000">&nbsp;��ҵ�˲ſ�</font></b> 
                                                  | <a href="Com_PersonDB_Class.asp">�������</a></td>
                                                <td align="right">
					<select name="menu2" onChange="MM_jumpMenu('parent',this,0)" style="width:100px;">
                   <option value="?classid=0">ȫ�����</option>
                                                    <% 
				  Set Re = Conn.Execute("Select Classid,ClassName From [pH_Company_PersonDB_Class] Where Comid='"&Comid&"' order by AddDate Desc")
				  While Not Re.Eof
				   %>
				   <option value="<%= "?Classid="&Re(0) %>" <% If cint(Classid)=Re(0) Then Response.write "Selected" %>><%=Re(1)%></option>
				   <%
				   
				   Re.Movenext
				  Wend
				  Re.Close
				   %>
                                                  </select> 
                                                  </td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><table width="100%" border="0" cellspacing="0" cellpadding="4">
                                              <tr> 
                                                <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� 
                                                  ��<Font color="#FF0000"><%= PCount %></Font>ҳ 
                                                  | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
                                                <td width="50%" align="right"> 
                                                  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Classid="&Classid&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Classid="&Classid&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		  
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Classid="&Classid&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Classid="&Classid&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>
                                                </td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="eeeeee">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="6%" height="25">ѡ��</td>
                                          <td width="12%" height="25" bgcolor="f5f5f5">�� 
                                            ��</td>
                                          <td width="18%" bgcolor="f5f5f5">�Ա�-����-ѧ��</td>
                                          <td width="25%" height="25" bgcolor="f5f5f5">��ҵѧУ</td>
                                          <td height="25">��ְ����</td>
                                          <td width="15%" height="25">����ʱ��</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid        = Rs("Ncid")
 Perid       = Rs("Perid")
 AddDate     = FormatDateTime(Rs("AddDate"),2)
 RealName    = ""
 Sex         = ""
 Age         = ""
 Edus        = ""
 LastSchool  = ""
 WorkWill1   = ""
 SQL = "Select RealName,Sex,Age,Edus,LastSchool,WorkWill1 From [pH_Person_Info] Where Perid='"&Perid&"'"
 Set Re = Conn.Execute(SQL)
 If Not Re.Eof Then
  RealName    = Re("RealName")
  Sex         = Re("Sex")
  Age         = Re("Age")
  Edus        = Re("Edus")
  LastSchool  = Re("LastSchool")
  WorkWill1   = Re("WorkWill1")
 End if
 Re.Close
 '��ȡ�Ա�
 Sex_Str = Cls_Sex(Sex)
 '��ȡѧ��
 Edus_Str = Cls_Edus(Edus)
%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= Ncid %> name=perid></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF">
										  <a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a>
										  </td>
                                          <td height="25" align="center" valign="baseline" bgcolor="#FFFFFF">
										  <%= Sex_Str&"-"&Age&"-"&Edus_Str %>
										  </td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= LastSchool %></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= WorkWill1 %></td>
                                          <td height="25" bgcolor="#FFFFFF"><font color="<%= Color_Str %>"><%= AddDate %></font></td>
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
                                            ѡ�����м�¼ </td>
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
                              <td height="30" align="right"> <input type="button" name="delete" value="����ɾ��" onClick="javascript:theForm_Submit('delpersondb')"> 
                                <input type="button" name="delete2" value="ɾ��������վ" onClick="javascript:theForm_Submit('delfavrecycle')"> 
                                <input type="button" name="send" value="��������" onClick="javascript:theForm_Submit('send')"> 
								<input type="button" name="send" value="ת�Ƶ�" onClick="javascript:theForm_Submit('removepersondb')">
                                <select name="persondbclass" style="width:100px;">
				<%Set Re = Conn.Execute("Select Classid,ClassName From [pH_Company_PersonDB_Class] Where Comid='"&Comid&"' order by AddDate Desc")
				  While Not Re.Eof
				   %>
				   <option value="<%= Re(0) %>"><%=Re(1)%></option>
				   <%
				   
				   Re.Movenext
				  Wend
				  Re.Close
				   %>
                                </select> </td>
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
                <td> <font color="#666666">�˲ſ��������Ϊ���ʶ�ѡ������ְ����Ϣ ;<br>
                  ����ͨ����� ����ѡ�񷢳����������ɾ���˲���Ϣ ;<br>
                  ��ɾ�����˲���Ϣ���Զ����˲ſ��б���ɾ�� ;</font></td>
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
CloseDB
 %>
