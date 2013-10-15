<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Param
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
Dim Vip_Flag,Vip_Date,Vip_EndDate

If Not IsArray(Session("Company")) Then 
 Response.write "<script>alert('-登录后才能进行该操作！-');location.href='../../Public/MemberLogin.asp';</script>"
 Response.End()
End if
'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//查找企业信息
SQL = "Select CompanyName,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 CloseRs
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if
CompanyName           = Rs(0)
Vip_Flag              = Rs(1)
Vip_Date              = Rs(2)
Vip_EndDate           = Rs(3)
Rs.Close

'//调用存储过程
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_PreviewJob"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Not Rs.Eof Then
 Flag = 1 
 Tmp  = Rs.GetRows() '//将数据填充到数组
 '//判断企业是否是VIP会员
 SQL = "Select Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
 Set Re = Conn.Execute(SQL)
 Nc_Vip_Flag      = Re(0)
 Nc_Vip_Date      = Re(1)
 Nc_Vip_EndDate   = Re(2)
 Re.Close
End if
'0职位ID,1职位类型,2职位类别,3名称,4待遇,5人数,6工作省,7市,8具体要求,9面试地址,10学历,11性别,12工作年限,13更新时间,14显示次数,15应聘次数,16状态,17要求省,18市,19最小年龄,20最大年龄,21部门ID,22截止日期,23联系人,24电话,25传真,26电话屏蔽,27邮件,28邮件屏蔽,29地址,30邮政编码
Set Cmd = Nothing

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName&" - "&CompanyName %> - 招聘职位</title>
</head>
<style>
.buttonstyle {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid; BACKGROUND-IMAGE: url(../../Images/input_bg2.jpg); FONT: 12px 宋体; BORDER-LEFT: #ffffff 0px solid; WIDTH: 135; CURSOR: hand; COLOR: #333333; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 22px; BACKGROUND-COLOR: #e7e7e7
}
</style>
<script language="JavaScript" src="../../js/Search_Three.js"></script>
<script language="JavaScript">
 function search_check()
 {
 if (document.quicksearch.btnSltFuntype1.value=="选择/修改"){
  alert("-请选择职位类别");
  //document.quicksearch.btnSltFuntype1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltArea1.value=="选择/修改"){
  alert("-请选择地区");
  //document.quicksearch.btnSltArea1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltIndustry1.value=="选择/修改"){
  alert("-请选择行业类别");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }
  if (document.quicksearch.btnSltIssuedate1.value=="选择/修改"){
  alert("-请选择更新日期");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }  
 if (document.quicksearch.key.value=="请输入关键字"){
  alert("-请输入关键字-");
  document.quicksearch.key.focus();
  return false;
 }
 }
</script>

<SCRIPT language=javascript>
<!--
buildDiv("popupArea","popupFuntype","popupSubfuntype","popupIndustry","popupIssuedate");
//-->
</SCRIPT>

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
    <td align="center" bgcolor="#FFFFFF"><table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="8"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="195"> <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr>
                      <td align="center"><img src="../../Images/Company/welcome.gif" width="149" height="43"></td>
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
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../../Images/mid_left.gif" width="31" height="33"></td>
                      <td background="../../Images/mid_bg.gif"><strong><font color="#ff7300">招聘职位</font></strong></td>
                      <td width="30"><img src="../../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% 
SQL = "Select Jobid,JobName From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And End_Date>=getdate() Order By LastUpdate_Time Desc,JobId Desc"
Set Rs_a = Conn.Execute(SQL)
If Not Rs_a.Eof Then
 While Not Rs_a.Eof
  Response.write "<tr><td height=25>&middot;<a href=""Com_Jobview.asp?Comid="&Comid&"&Param="&Rs_a("Jobid")&""">"&Rs_a("JobName")&"</a></td></tr>"
  Rs_a.Movenext
 Wend 
End if
Rs_a.Close
 %>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="1" bgcolor="#cfd0cf"></td>
          <td width="10"></td>
          <td width="554" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="25" align="center"><img src="../../Images/Company/arrow1.gif" width="13" height="9"></td>
                      <td height="30" class="font-14"><b><%= CompanyName %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="21">&nbsp;</td>
                      <td width="21" rowspan="2"><img src="../../Images/Company/yleft.gif" width="21" height="22"></td>
                      <td width="78" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_ybg.gif"><a href="Com_PreView.asp?Param=<%= Comid %>">企业简介</a></td>
                      <td width="28" rowspan="2"><img src="../../Images/Company/middle.gif" width="28" height="22"></td>
                      <td width="80" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_wbg.gif"><strong>招聘职位</strong></td>
                      <td width="24" rowspan="2"><img src="../../Images/Company/person_wright.gif" width="24" height="22"></td>
                      <td width="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height=1 bgcolor=#ddddda></td>
                      <td height=1 bgcolor=#ddddda></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
				   <Form action="" method="post" name="theForm">
                    <% 
If Flag = 1 Then
For i = 0 To UBound(Tmp,2)
 Set Re = Conn.Execute("Select DeptName From [pH_Company_Dept] Where Ncid="&Cstr(Tmp(21,i)))  '//查找部门表
 If Not Re.eof Then DeptName = Re(0)
 Re.Close
 Ncid            = Tmp(0,i)
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
'//更新职位的显示次数
Conn.Execute("Update [pH_Job_Base] Set ViewClicks=ViewClicks+1 Where Jobid="&Cstr(Ncid))


%>

              <tr>
                <td align="center">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td bgcolor="#ff811e" height="2"></td>
                    </tr>
                    <tr> 
                        <td height="25" bgcolor="#ffeee0" class="font-14"><Font color="#000000">&nbsp;<b><%= Tmp(3,i) %></b></Font></td>
                    </tr>
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="1" cellpadding="4">
                            <tr> 
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">职位类型：</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Cls_JobType(Tmp(1,i)) %></td>
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">薪金待遇：</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Deal %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">招聘部门：</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= DeptName %></td>
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">招聘人数：</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Numbers %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">发布日期：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= BeginDate %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">截止日期：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= EndDate %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">工作地区：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(6,i)&Tmp(7,i) %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">现所在地：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Locus %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">学历要求：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Edus %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">工作年限：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Works %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">年龄要求：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Age_Str %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">性别要求：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Sex_Str %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                           
						    <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">联系人：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(23,i) %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">联系电话：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Phone %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">传真号码：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= CompanyFax %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">邮政编码：</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(30,i) %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">邮箱地址：</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Email %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">联系地址：</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Tmp(29,i) %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="5" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">面试地址：</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Tmp(9,i) %></td>
                            </tr>
							
                          </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="cccccc" height="2"></td>
                    </tr>
                  </table>
                   
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr> 
                      <td><strong>职位描述：</strong><br> <%= Tmp(8,i) %> </td>
                    </tr>
                  </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><hr size="1" color="#cfd0cf"></td>
                      </tr>
                    </table></td>
              </tr>
<% 
 Next
Else
 Response.write "<tr><td align=Center>暂时没有招聘职位</td></tr>"
End if
 %>
                  </Form>

            </table> </td>
        </tr>
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
