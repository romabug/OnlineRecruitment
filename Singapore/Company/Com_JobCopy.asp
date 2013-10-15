<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Jobid,Tmp
Dim Cmd,Rs,BestFlag,PhoneKeep,EmailKeep

Check_Url() '//跨站提交数据检测
Jobid = Replace_Text(Request.QueryString("Param"))
Check_Id(Jobid)

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//调用存储过程
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
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称,1发布职位数
'//如 Tmp(0,0) 表示企业名称
'//关闭数据库对象
Rs.Close
Set Cmd = Nothing

'//判断该企业会员能否发布职位
Set Re = Conn.Execute("Select Nc_Vip_Jobs From [pH_Company_Base] Where Comid='"&Comid&"'")
Jobs = Re(0)
Re.Close
If Jobs <= 0 Then
 Response.redirect "../Public/Error.asp?param=2001"
End if

'//调用获取职位信息的存储过程
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
 Response.write "没有找到职位信息！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组

'//0职位类型,1类别,2名称,3待遇,4招聘人数,5工作地区省,6市,7具体要求,8面试地址,9性别,10工作年限,11发布时间,12显示次数,13应聘次数,14职位状态,15要求求职者所在地省,16市,17最小年龄,18最大年龄,19固顶,20企业部门,21急聘,22截止日期,23联系人,24电话,25传真,26电话屏蔽,27邮件,28邮件屏蔽,29公司地址,30邮政编码,31学历
'//如 Tmp(0,0) 表示职位类型
'//关闭数据库对象
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
 
 '//更新企业发布职位数
 SQL = "UpDate [pH_Company_Base] Set PublishCount=PublishCount+1,Nc_Vip_Jobs=Nc_Vip_Jobs-1 Where Comid='"&Comid&"'"
 Conn.Execute(SQL)

 Response.redirect "Com_JobManage.asp"

'//关闭数据库连接
CloseDB
 %>
