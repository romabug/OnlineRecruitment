<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
'//�������
Dim Rs,SQL,Tmp(3)
Dim UserName,Comid,Password,Email,Question,Answer
Dim CompanyName,Licence,Industry,Properity,Set_year,Set_month,Set_day,Workers,Reg_Currency,CurrencyType
Dim Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,EmailKeep,Locus_Area,Locus_City,Address
Dim ZipCode,WebHome,LastIp

LastIp = Request.Servervariables("Remote_Addr")
'//��֤�Ƿ���ͬ���û�����ͬ�ʼ����û�
UserName                     = Replace_Text(Request.Form("username"))
Password                     = Replace_Text(Request.Form("password"))
Password2					 = Password
Password                     = Md5(Password)
Comid                        = Replace_Text(Request.Form("comid"))
Email                        = Replace_Text(Request.Form("email"))
Cityid 						 = Replace_text(Request.Form("Cityid")) '//����վ��

Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,comid From [pH_Company_Base] Where username='"&username&"' or Email='"&Email&"' or comid='"&comid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("comid")=comid then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	  response.end
    end if

end if 
CloseRs

'//�ύ����
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
CompanyName                = Replace_Text(Request.Form("CompanyName"))
Licence                    = Replace_Text(Request.Form("Licence"))
Industry                   = Replace_Text(Request.Form("Industry"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_year                   = Replace_Text(Request.Form("Set_year"))
Set_month                  = Replace_Text(Request.Form("Set_month"))
Set_day                    = Replace_Text(Request.Form("Set_day"))
Workers                    = Replace_Text(Request.Form("Workers"))
Reg_Currency               = Replace_Text(Request.Form("Reg_Currency"))
CurrencyType               = Replace_Text(Request.Form("CurrencyType"))
Company_Memo               = Replace_Text(Request.Form("Company_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
PhoneKeep                  = Replace_Text(Request.Form("PhoneKeep"))
CompanyFax                 = Replace_Text(Request.Form("CompanyFax"))
EmailKeep                  = Replace_Text(Request.Form("EmailKeep"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))

If PhoneKeep = "" Then PhoneKeep = 0
If EmailKeep = "" Then EmailKeep = 0
If Comnpany_Memo <> "" Then Comnpany_Memo = Replace(Comnpany_Memo,Chr(13),"<br>")
'//�������ݵ����ݿ�[pH_Company_Base]��
SQL = "Insert Into [pH_Company_Base] (Comid,Username,Password,CompanyName,Question,Answer,Licence,Industry,Properity,Set_Year,Set_Month,Set_Day,Workers,Reg_Currency,CurrencyType,Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,Email,EmailKeep,Locus_Area,Locus_City,Address,ZipCode,WebHome,RegDate,LastIp,LoginCount,LastDate,LastUpdate_Time,LogoKeep,Nc_Vip_Flag,ViewClicks,PublishCount,Nc_Vip_Clicks,Nc_Vip_Jobs,Flag,Nc_Video,Video_Flag,Video_Bestflag,Websub,Cityid) Values ('"&Comid&"','"&Username&"','"&Password&"','"&CompanyName&"','"&Question&"','"&Answer&"','"&Licence&"',"&Industry&","&Properity&","&Set_year&","&Set_month&","&Set_day&","&Workers&","&Reg_Currency&","&CurrencyType&",'"&Company_Memo&"','"&ContactPerson&"','"&Phone&"',"&	PhoneKeep&",'"&CompanyFax&"','"&Email&"',"&EmailKeep&",'"&Locus_Area&"','"&Locus_City&"','"&Address&"','"&ZipCode&"','"&WebHome&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),0,0,0,0,0,5,0,0,0,0,'www',"&Cityid&")"
Conn.Execute(SQL)  '//[pH_Company_Base]��

'//��½
Tmp(0) = Username
Tmp(1) = Password
Tmp(2) = Comid
Session("Company") = Tmp
Session("Server") = Request.ServerVariables("Server_Name")
Session("Nc_Vip") = 0       '//��ѻ�Ա
'//�ر����ݿ����Ӳ���
CloseDB
'//�����ʼ�����Ա
Set Fso = Server.CreateObject("Scripting.FileSystemObject") '///���ļ�
Set FileAll = Fso.OpenTextFile(server.mappath("Mail_Register.htm"), 1)
HtmlStr = FileAll.ReadAll
HtmlStr = Replace(HtmlStr,"Html_Username",Username)
HtmlStr = Replace(HtmlStr,"Html_Password",Password2)
Set Fso = Nothing
Call SendEmail(Email,HtmlStr,"�����ʺ�ע��ɹ�")
'//ע�����
Response.Write "<meta http-equiv=refresh content=""5;URL=User_Center.asp"">"
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��ҵ��Աע��</title>
</head>

<body>
<p>&nbsp;</p><table width="80%" border="0" align="center" cellspacing="1" bgcolor="#eeeeee">
  <tr> 
    <td height="100" bgcolor="f5f5f5"><table width="90%" border="0" align="center" cellspacing="0" class="text01">
        <tr> 
          <td height="30" align="center">���Ѿ��ɹ���ע���Ϊ<font color="#FF0000"><%= Cls_WebName %></font>����ҵ��Ա ����<a href="User_Center.asp">��ҵ����ƽ̨</a></td>
        </tr>
        <tr> 
          <td height="3" bgcolor="ff6600"></td>
        </tr>
        <tr> 
          <td height="30" align="center"><font color=#999999>���������ת�������������<a href="User_Center.asp"><font color=#999999>��ҵ����ƽ̨</font></a></font></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
