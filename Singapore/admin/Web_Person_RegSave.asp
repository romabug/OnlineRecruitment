<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"125") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
 
Username = Replace_text(Request.Form("username")) '//�û���
Password = Replace_text(Request.Form("password")) '//����
Password = Md5(Password)
Randomize timer
Znum = Cint(8999*Rnd+1000)
Perid = Cls_WebKey&gen_key(10)&Znum               '//��ԱID
Useremail=replace_text(request.form("useremail")) '//�ʼ�
Question = replace_text(request.form("question")) '//������ʾ
Answer = replace_text(request.form("answer"))     '//��ʾ��
JobType = replace_text(request.form("jobtype"))     '//��Ա����

Set Rs = Server.Createobject("ADODB.recordset")
'//����Ƿ���ͬ���ʺ�
Rs.Open "Select UserName,UserEmail,Perid From [pH_Person_Base] Where Username='"&username&"' or Useremail='"&useremail&"'  or Perid='"&Perid&"'",Conn,1,1

If Not Rs.Eof Then
    '//ͬ�����ʺ�
	If Rs("Username") = UserName or Rs("Perid") = Perid Then
	    CloseRs
		CloseDB
		Response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		Response.end
    End if
	'//ͬ�����ʼ�
    If Rs("Useremail") = Useremail Then
	    CloseRs
	    CloseDB
		Response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	    Response.end
    End if

End if 
Rs.Close

'//�����̳�Ļ�Ա��
rs.open "select id,User_name,Email from [User] where user_name='"&username&"' or email='"&useremail&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("user_name")=username then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		response.end
    end if
    if rs("email")=useremail then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//�ύ����
JobType                    = Replace_text(Request.Form("jobtype"))
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
RealName                   = Replace_Text(Request.Form("RealName"))
Sex                        = Replace_Text(Request.Form("Sex"))
Nation                     = Replace_Text(Request.Form("Nation"))
Edus                       = Replace_Text(Request.Form("Edus"))
Marry                      = Replace_Text(Request.Form("Marry"))
BirthYear                  = Replace_Text(Request.Form("BirthYear"))
Age                  	   = Cint(Year(Date())) - Cint(BirthYear)
LastSchool                 = Replace_Text(Request.Form("LastSchool"))
ZyClass                    = Replace_Text(Request.Form("ZyClass"))
Speciality                 = Replace_Text(Request.Form("Speciality"))
Door_Area                  = Replace_Text(Request.Form("huji"))
Door_City                  = Replace_Text(Request.Form("huji1"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Stature                    = Replace_Text(Request.Form("Stature"))
Tizhong                    = Replace_Text(Request.Form("Tizhong"))
Byear                      = Replace_Text(Request.Form("Byear"))
BirthMonth                 = Replace_Text(Request.Form("BirthMonth"))
BirthDay                   = Replace_Text(Request.Form("BirthDay"))
PersonPhone                = Replace_Text(Request.Form("PersonPhone"))
MsnQQ                      = Replace_Text(Request.Form("MsnQQ"))
WebHome                    = Replace_Text(Request.Form("WebHome"))
Codeid                     = Replace_Text(Request.Form("Codeid"))
CodeType                   = Replace_Text(Request.Form("CodeType"))
Mt                         = Replace_Text(Request.Form("Mt"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
Address                    = Replace_Text(Request.Form("Address"))


'//�������ݵ����ݿ�[pH_Person_Base]��[pH_Person_Info]��
SQL = "Insert Into [pH_Person_Base] (Perid,Username,Password,UserEmail,Journal,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Question,Answer,Websub) Values ('"&Perid&"','"&Username&"','"&Password&"','"&UserEmail&"',1,getdate(),'"&LastIp&"',getdate(),getdate(),1,'"&Question&"','"&Answer&"','"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Base]��

SQL = "Insert Into [pH_Person_Info] (Perid,UserName,RealName,Sex,Nation,Edus,Marry,Age,LastSchool,ZyClass,Speciality,Door_Area,Door_City,Locus_Area,Locus_City,Stature,Tizhong,Byear,BirthYear,BirthMonth,BirthDay,PersonPhone,MsnQQ,WebHome,InterView,ProvideHouse,Post,ViewClicks,ContactKeep,ResumeKeep,PhotoKeep,ResumeMode,Codeid,CodeType,Mt,ZipCode,Address,PerType,JobType,TopAll,Nc_Video,Video_Flag,Video_BestFlag,Websub) Values ('"&Perid&"','"&Username&"','"&Realname&"',"&Sex&",'"&Nation&"',"&Edus&","&Marry&","&Age&",'"&LastSchool&"','"&ZyClass&"','"&Speciality&"','"&Door_Area&"','"&Door_City&"','"&Locus_Area&"','"&Locus_City&"',"&Stature&","&TiZhong&","&Byear&","&BirthYear&","&BirthMonth&","&BirthDay&",'"&PersonPhone&"','"&MsnQQ&"','"&WebHome&"',0,0,0,0,0,0,0,1,'"&Codeid&"',"&CodeType&",'"&Mt&"','"&ZipCode&"','"&Address&"',1,"&JobType&",0,0,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Info]��

'//����̳��Ա������Ӽ�¼
SQL = "Insert Into [User] (User_name,User_Pass,Login_Last_Date,Login_Last_Ip,Login_Count,Creat_Date,Up_Date,Pass_Matter,Pass_Key,Email,MsnQQ,Address,myWeb,TelPhone,RelName) Values ('"&Username&"','"&Replace_text(request.form("password"))&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),'"&Question&"','"&Answer&"','"&UserEmail&"','"&MsnQQ&"','"&Address&"','"&WebHome&"','"&PersonPhone&"','"&Realname&"')"
Conn.Execute(SQL)

 '�������
 Response.write "<script language=JavaScript>alert('������ɣ�');location.href='Web_Person_All.asp';</script>"
 Response.End()

Call CloseDB()
 %>

