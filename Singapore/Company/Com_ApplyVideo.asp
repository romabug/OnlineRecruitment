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

'//������Ƶ�����ռ���
SQL = "Select * From [pH_Company_VideoInBox] Where Comid='"&Comid&"' Order By AddDate Desc"
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
		
		if (id=="delvideoinbox")
		{
		  if(confirm('ȷ�ϳ���ɾ��ѡ���ļ�¼'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=delvideoinbox";
			openwin();
			form.submit();	   
		   }

		}
		
		if (id=="invite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=invite";
			openwin();
			form.submit();	   
		}
		
		if (id=="enableinvite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=enableinvite";
			openwin();
			form.submit();	   
		}
		
		if (id=="disableinvite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=disableinvite";
			openwin();
			form.submit();	   
		}		
		if (id=="send")
		{
		    form.target='rslt';
			form.action="Com_SendApp.asp?param=videoinbox";
			openwin();
			form.submit();	   
		}
		
    if (id=="video")
     {
	    form.target='rslt';
		form.action="Com_SendVideoBox.asp?param=video";
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
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��ְ��������Ƶ����</title>
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
            <!--#include file="../Lefter/Company_Video.asp" -->
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
                                          <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������Ƶ����</font></b></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_ApplyVideo.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="dddddd">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="8%" height="25">���</td>
                                          <td width="12%" height="25" bgcolor="f5f5f5">�� 
                                            ��</td>
                                          <td width="20%" bgcolor="f5f5f5">�Ա�-����-ѧ��</td>
                                          <td height="25" bgcolor="f5f5f5">ӦƸְλ</td>
                                          <td width="14%" height="25">����ʱ��</td>
                                          <td width="11%" height="25">�������</td>
                                          <td width="7%">ѡ��</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid        = Rs("Ncid")
 Perid       = Rs("Perid")
 Jobid       = Rs("Jobid")
 Flag        = Rs("Flag")
 Click       = Rs("Click")
 AddDate     = FormatDateTime(Rs("AddDate"),2)
 
 RealName    = ""
 Sex         = ""
 Age         = ""
 Edus        = ""
 

 SQL = "Select RealName,Sex,Age,Edus From [pH_Person_Info] Where Perid='"&Perid&"'"
 Set Re = Conn.Execute(SQL)
 If Not Re.Eof Then
  RealName    = Re("RealName")
  Sex         = Re("Sex")
  Age         = Re("Age")
  Edus        = Re("Edus")
 End if
 Re.Close
 '��ȡְλ����
 JobName = ""
 SQL = "Select JobName From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
 Set Re = Conn.Execute(SQL)
 If Not Re.Eof Then JobName = Re(0)
 Re.Close
 '��ȡ�Ա�
 Sex_Str = Cls_Sex(Sex)
 '��ȡѧ��
 Edus_Str = Cls_Edus(Edus)

%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><%= TheRecord+i %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF"> 
                                            <a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a> </td>
                                          <td height="25" align="center" valign="baseline" bgcolor="#FFFFFF"> 
                                            <%= Sex_Str&"-"&Age&"-"&Edus_Str %> </td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= JobName %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF"><font color="<%= Color_Str %>"><%= AddDate %></font></td>
                                          <td height="25" bgcolor="#FFFFFF"><%= Click %></td>
                                          <td height="25" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= Ncid %> name=perid></td>
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
                              <td height="30" align="right">
							  <input type="button" name="delete" value="ɾ����¼" onClick="javascript:theForm_Submit('delvideoinbox')">
							  
                                <input type="button" name="send" value="��������" onClick="javascript:theForm_Submit('send')">
								<input type="button" name="video" value="������Ƶ����" onclick="javascript:theForm_Submit('video')" style="width:90px;">
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
                <td><p><font color="#999999">�������� ����������ְ�ߵ���˾ָ���ĵص�μ����� ;<br>
                    ������Ƶ���� ������ְ����ָ����ʱ�䵽��վ�μӹ�˾��������Ƶ���� ;<br>
                    </font> </p>
                  </td>
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
