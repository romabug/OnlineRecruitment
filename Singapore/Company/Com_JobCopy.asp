<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Jobid,Tmp
Dim Cmd,Rs,BestFlag,PhoneKeep,EmailKeep

Check_Url() '//��վ�ύ���ݼ��
Jobid = Replace_Text(Request.QueryString("Param"))
Check_Id(Jobid)

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobCopy"
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
'//0��ҵ����,1����ְλ��
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing

'//�жϸ���ҵ��Ա�ܷ񷢲�ְλ
Set Re = Conn.Execute("Select Nc_Vip_Jobs From [pH_Company_Base] Where Comid='"&Comid&"'")
Jobs = Re(0)
Re.Close
If Jobs <= 0 Then
 Response.redirect "../Public/Error.asp?param=2001"
End if

'//���û�ȡְλ��Ϣ�Ĵ洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobEdit"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Jobid",3,1,4)
Cmd.Parameters("@Jobid") = Jobid
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ�ְλ��Ϣ��"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����

'//0ְλ����,1���,2����,3����,4��Ƹ����,5��������ʡ,6��,7����Ҫ��,8���Ե�ַ,9�Ա�,10��������,11����ʱ��,12��ʾ����,13ӦƸ����,14ְλ״̬,15Ҫ����ְ�����ڵ�ʡ,16��,17��С����,18�������,19�̶�,20��ҵ����,21��Ƹ,22��ֹ����,23��ϵ��,24�绰,25����,26�绰����,27�ʼ�,28�ʼ�����,29��˾��ַ,30��������,31ѧ��
'//�� Tmp(0,0) ��ʾְλ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing

If Tmp(21,0) = True Then
 BestFlag = 1
Elseif Tmp(21,0) = False Then
 BestFlag = 0
End if

If Tmp(26,0) = True Then
 PhoneKeep = 1
Elseif Tmp(26,0) = False Then
 PhoneKeep = 0
End if

If Tmp(28,0) = True Then
 EmailKeep = 1
Elseif Tmp(28,0) = False Then
 EmailKeep = 0
End if

SQL = "Insert Into [pH_Job_Base] (Comid,JobType,JobClass,JobName,Deal,Number,Work_Area,Work_City,Require,Chat_Addr,Sex,Works,LastUpdate_Time,ViewClicks,SendClicks,JobFlag,Area,City,Min_Age,Max_Age,TopAll,DeptId,BestFlag,End_Date,ContactPerson,Phone,CompanyFax,PhoneKeep,Email,EmailKeep,Address,ZipCode,Edus) Values ('"&Comid&"',"&Tmp(0,0)&",'"&Tmp(1,0)&"','"&Tmp(2,0)&"',"&Tmp(3,0)&","&Tmp(4,0)&",'"&Tmp(5,0)&"','"&Tmp(6,0)&"','"&Tmp(7,0)&"','"&Tmp(8,0)&"',"&Tmp(9,0)&","&Tmp(10,0)&",getdate(),0,0,1,'"&Tmp(15,0)&"','"&Tmp(16,0)&"',"&Tmp(17,0)&","&Tmp(18,0)&",0,"&Tmp(20,0)&","&BestFlag&",'"&Tmp(22,0)&"','"&Tmp(23,0)&"','"&Tmp(24,0)&"','"&Tmp(25,0)&"',"&PhoneKeep&",'"&Tmp(27,0)&"',"&EmailKeep&",'"&Tmp(29,0)&"','"&Tmp(30,0)&"',"&Tmp(31,0)&")"

 Conn.Execute(SQL)
 
 '//������ҵ����ְλ��
 SQL = "UpDate [pH_Company_Base] Set PublishCount=PublishCount+1,Nc_Vip_Jobs=Nc_Vip_Jobs-1 Where Comid='"&Comid&"'"
 Conn.Execute(SQL)

 Response.redirect "Com_JobManage.asp"

'//�ر����ݿ�����
CloseDB
 %>
