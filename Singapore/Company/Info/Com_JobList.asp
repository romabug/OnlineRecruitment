<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Comid,Username,Cmd,Rs,SQL,i,JobId,JobName
Dim CompanyName,DeptName,Deal,Numbers,BeginDate,EndDate,Edus,Flag,Works,Min_Age,Max_Age,Age_Str,Sex,Locus

'//获取提交的参数
JobId     = Request("JobId")
'Response.write Jobid
'Response.End()
If Jobid = "" Then
 Response.write "<script>alert('-您没有选择记录！-');window.close();</script>"
 Response.End()
End if
Jobid = Split(Jobid,",")

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 企业招聘职位</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Header/Info/Person_Search.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF"><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <Form action="" method="post" name="theForm">
          <% 
For k = 0 to UBound(Jobid)
Param = Trim(Jobid(k))
'//查找企业信息
SQL = "Select CompanyName,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate,Comid From [pH_Company_Base] Where Comid In (Select Comid From [pH_Job_Base] Where Jobid="&Param&")"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 CompanyName           = Rs(0)
 Vip_Flag              = Rs(1)
 Vip_Date              = Rs(2)
 Vip_EndDate           = Rs(3)
 Comid				  = Rs(4)
 
End if

Rs.Close

'//调用存储过程
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobView"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Cmd.Parameters.Append Cmd.CreateParameter("@Jobid",3,1,4)
Cmd.Parameters("@Jobid") = Param
Set Rs = Cmd.Execute
If Not Rs.Eof Then
 Flag = 1
 i    = 0
 Tmp  = Rs.GetRows() '//将数据填充到数组
End if
'0职位ID,1职位类型,2职位类别,3名称,4待遇,5人数,6工作省,7市,8具体要求,9面试地址,10学历,11性别,12工作年限,13更新时间,14显示次数,15应聘次数,16状态,17要求省,18市,19最小年龄,20最大年龄,21部门ID,22截止日期,23联系人,24电话,25传真,26电话屏蔽,27邮件,28邮件屏蔽,29地址,30邮政编码
Set Cmd = Nothing

If Flag = 1 Then
 Ncid     = Tmp(0,i)
 JobName = Tmp(3,i)
 '更新职位的浏览次数
 Conn.Execute("Update [pH_Job_Base] Set ViewClicks=ViewClicks+1 Where Jobid="&Cstr(Ncid))

End if

If Flag = 1 Then

 Deal            = Tmp(4,i)  '待遇
 Numbers         = Tmp(5,i)  '人数
 BeginDate       = FormatDateTime(Tmp(13,i),2)
 EndDate         = Tmp(22,i)
 Edus            = Tmp(10,i)
 Works           = Tmp(12,i) '//工作年限
 Min_Age         = Tmp(19,i) '//最小年龄
 Max_Age         = Tmp(20,i) '//最大年龄
 Sex             = Tmp(11,i) '//性别

 '//招聘人数判定
 If Numbers = 0 Then
  Numbers = "人数不限"
 Else
  Numbers =   Numbers&"人"
 End if
 '//待遇判定
 If Deal = 0 Then
  Deal = "面议"
 Else
  Deal = Deal&"元/月"
 End if
 '//学历判定
 If Edus = 0 Then
  Edus = "不限"
 Else
  Edus = Cls_Edus(Edus)
 End if
 '//工作年限判定
 If Works = 0 Then
  Works = "不限"
 Else
  Works = Cls_Works(Works)
 End if
 '//年龄要求
 Age_Str = Cls_Age(Min_Age,Max_Age)
 '//性别判定
 Select Case Sex
  Case 0:Sex_Str = "女"
  Case 1:Sex_Str = "男"
  Case 2:Sex_Str = "不限"
 End Select
'//要求现所在地判定
If Tmp(17,i) = "不限" And Tmp(18,i) = "不限" Then
 Locus = "不限"
Else
 Locus = Tmp(17,i)&Tmp(18,i)
End if 
'//判断联系电话是否是保密的
If Tmp(26,i) = True Then
 Phone            = "符合企业招聘要求则邀请"
 CompanyFax       = "符合企业招聘要求则邀请"
Else
 Phone            = Tmp(24,i)
 CompanyFax       = Tmp(25,i)
End if
'//判断联系邮件是否是保密的
If Tmp(28,i) = True Then
 Email            = "符合企业招聘要求则邀请"
Else
 Email            = Tmp(27,i)
End if

'//判断企业是否是VIP会员
SQL = "Select Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Re = Conn.Execute(SQL)
Nc_Vip_Flag      = Re(0)
Nc_Vip_Date      = Re(1)
Nc_Vip_EndDate   = Re(2)
Re.Close
%>
          <tr valign="top"> 
            <td align="center"><table width="540" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="30" class="font-14"><b><%= K+1 %>.</b><a href="Com_View.asp?Param=<%= Comid %>" target="_blank"><b><%= CompanyName %></b></a></td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td bgcolor="ff811e" height="2"></td>
                </tr>
                <tr> 
                  <td height="25" bgcolor="#ffeee0" class="font-14"><Font color="#000000">&nbsp;<%= Tmp(3,i) %></Font></td>
                </tr>
                <tr> 
                  <td><table width="100%" border="0" cellspacing="1" cellpadding="4">
                      <tr bgcolor="#FFFFFF"> 
                        <td width="15%" height="23" align="left" bgcolor="#f9f9f9">职位类型：</td>
                        <td width="35%" height="23"><%= Cls_JobType(Tmp(1,i)) %></td>
                        <td width="15%" height="23" align="left" bgcolor="#f9f9f9">招聘人数：</td>
                        <td width="35%" height="23"><%= Numbers %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">发布日期：</td>
                        <td height="23"><%= BeginDate %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">截止日期：</td>
                        <td height="23"><%= EndDate %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">薪金待遇：</td>
                        <td height="23"><%= Deal %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">工作地区：</td>
                        <td height="23"><%= Tmp(6,i)&Tmp(7,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">学历要求：</td>
                        <td height="23"><%= Edus %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">工作年限：</td>
                        <td height="23"><%= Works %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">年龄要求：</td>
                        <td height="23"><%= Age_Str %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">性别要求：</td>
                        <td height="23"><%= Sex_Str %></td>
                      </tr>
                      <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <% If Vip_Flag = True And DateDiff("d",Now(),Vip_Date)<=0 And DateDiff("d",Now(),Vip_EndDate)>=0 Then %>
                      <% If Not IsArray(Session("Person")) Then %>
                      <tr align="left" bgcolor="#FFFFFF"> 
                        <td height="23" colspan="4">&nbsp;注册并登陆后才能查看企业的联系方式；请<a href="../../Public/MemberLogin.asp">[<u>开始登陆</u>]</a>或者<a href="../../Public/Register.asp">[<u>免费注册</u>]</a></td>
                      </tr>
                      <% Else %>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">联系人：</td>
                        <td height="23"><%= Tmp(23,i) %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">联系电话：</td>
                        <td height="23"><%= Phone %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">传真号码：</td>
                        <td height="23"><%= CompanyFax %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">邮政编码：</td>
                        <td height="23"><%= Tmp(30,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">邮箱地址：</td>
                        <td height="23" colspan="3"><%= Email %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">联系地址：</td>
                        <td height="23" colspan="3"><%= Tmp(29,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">面试地址：</td>
                        <td height="23" colspan="3"><%= Tmp(9,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <% 
  End if
End if
 %>
                    </table></td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td><strong>职位描述：</strong><br> <%= Tmp(8,i) %> </td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td height="30" align="center" valign="bottom"> <img src="../../Images/Company/Joblist_t1.gif" width="100" height="20" onclick="window.open('../../Person/Per_Option.asp?param=fav&ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <img src="../../Images/Company/Joblist_t2.gif" width="100" height="20" onclick="window.open('../../Person/Per_SendApplication.asp?ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <% 
If Nc_Vip_Flag = True Then
 If DateDiff("d",Nc_Vip_Date,Date()) >= 0 And DateDiff("d",Nc_Vip_EndDate,Date()) <= 0 Then
 %>
                    <img src="../../Images/Company/Joblist_t3.gif" width="100" height="20" onclick="window.open('../../Person/Per_Option.asp?param=video&ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <% 
 End if
End if
 %>
                    <img src="../../Images/Company/Joblist_t4.gif" width="100" height="20" onclick="window.open('../../Person/Per_Friend.asp?ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                  </td>
                </tr>
                <tr> 
                  <td height="20" align="center"><hr size="1" color="#dddddd"></td>
                </tr>
              </table></td>
            <td width="1" bgcolor="#dddddd"></td>
            <td width="4">&nbsp;</td>
            <td width="190" align="center">&nbsp; </td>
          </tr>
          <% 
End if
Next
 %>
        </form>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Include/Info/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 

'//关闭数据库连接
Set Rs = Nothing
CloseDB
 %>
