<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת���༭����
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>����VIP��Ա</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'���һ�Ա������  
 Set Rs = Conn.Execute("Select Username,CompanyName,Email,Nc_Vip_Level,Nc_Vip_Date,Nc_Vip_Logo From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  CompanyName   = Rs(1)
  Email         = Rs(2)
  Level         = Rs(3)
  Nc_Vip_Date   = Rs(4)
  Nc_Vip_Logo	= Rs(5)
%>
              <form action="?action=edit" method="post" name="up">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ҵ���ƣ�</td>
                  <td bgcolor="f5f5f5"><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ҵ�ʺţ�</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">�շ����ͣ�</td>
                  <td bgcolor="f5f5f5"> <select name="level" id="level">
                      <% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Company_VipLevel]")
		 			While Not Re.Eof
					%>
                      <option value="<%=Re(0)%>" <% If Level = Re(0) Then Response.write "Selected" %>><%=Re(1)%></option>
                      <%			
					  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ʼʱ�䣺</td>
                  <td bgcolor="f5f5f5"> <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Nc_Vip_Date %>"> 
                    <input name="comid" type="hidden" id="comid" value="<%= Comid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    <input name="email" type="hidden" id="email" value="<%= Email %>"> 
                    <input name="companyname" type="hidden" id="companyname" value="<%= Companyname %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">��ҳͼƬ��</td>
                  <td> <input name="logo" type="text" size="20" maxlength="80" value="<%= Nc_Vip_Logo %>"> 
                    <input type="button" name="bnt1" value="�ϴ��ļ�" onClick="window.open('Upload_flash.asp?formname=up&editname=logo&uppath=../UpLoadFiles/CompanyIndex&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2">
                    (100*31����)</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="�� ��"></td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">û���ҵ�����ҵ!</td>
              </tr>
              <% 
 End if
 Rs.Close
 Set Rs = Nothing
 %>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '�޸�����
 Comid       = Replace_text(request("Comid"))
 PageNo      = Replace_text(request("PageNo"))
 Level       = Replace_text(request("Level"))
 BeginDate   = Replace_text(request("BeginDate"))
 Email       = Replace_text(request("Email"))
 CompanyName = Replace_text(request("CompanyName"))
 Logo		 = Replace_text(request("Logo"))
 
 If Logo <> "" Then Logo = Replace(Logo,"../UpLoadFiles/CompanyIndex/","")
 '�жϻ�Ա�Ƿ���˹�
 Set Rs = Conn.Execute("Select Flag From [pH_Company_Base] Where Comid='"&Trim(Comid)&"'")
 If Rs(0) = False Then
   Response.write "<script language=JavaScript>alert('������������ͨ���Ըû�Ա�����');location.href='"&PageNo&"';</script>"
   Response.End()
 End if
 Rs.Close
 '���Ҹ߼���Ա�ļ���Ĳ���
 Set Rs = Conn.Execute("Select * From [pH_Company_VipLevel] Where i_Levelid="&Cstr(Level))
 VipClicks = Rs("i_VipClick")
 VipJobs = Rs("i_VipJob")
 Rs.Close
 '����
 SQL = "UPdate [pH_Company_Base] Set Nc_Vip_Flag=1,Nc_Vip_Level="&Level&",Nc_Vip_Date='"&BeginDate&"',Nc_Vip_EndDate=DateAdd(m,"&Level&",'"&BeginDate&"'),Nc_Vip_Clicks="&VipClicks&",Nc_Vip_Jobs="&VipJobs&",Nc_Vip_Logo='"&Logo&"' Where Comid='"&Trim(Comid)&"'"
 Conn.Execute(SQL)
 '�����ʼ�
 HtmlStr = "���ã�������ҵ["&CompanyName&"]��"&Cls_WebName&"�Ѿ���"&BeginDate&"�ɹ����óɸ߼�VIP��Ա����ֹ������"&DateAdd("m",Level,BeginDate)&"<br><hr><br>"&Cls_WebName
 'Call SendEmail(Email,HtmlStr,"������ҵ��VIP��Ա")
 
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

