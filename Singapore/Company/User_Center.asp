<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action


'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_UserCenter"
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

'//0企业名称,1登陆次数,2最后登陆时间,3更新时间,4VIP标记,5VIP开通时间,6VIP类型,7截止时间,8会员状态,9有无视频,10视频开通时间,11截止时间,12,下载联系方式次数,13发布职位次数
'//如 Tmp(0,0) 表示企业名称
'//关闭记录集对象
Rs.Close
Set Cmd = Nothing

CompanyName           = Tmp(0,0)
LoginCount            = Tmp(1,0)
LastDate              = Tmp(2,0)
LastUpdate_Time       = Tmp(3,0)
Vip_Flag              = Tmp(4,0)
Vip_Date              = Tmp(5,0)
Vip_Level             = Tmp(6,0)
Vip_EndDate           = Tmp(7,0)
Flag                  = Tmp(8,0)
Nc_Video              = Tmp(9,0)
Video_Date            = Tmp(10,0)
Video_EndDate         = Tmp(11,0)
Vip_Clicks			  = Tmp(12,0)
Vip_Jobs			  = Tmp(13,0)
'获取会员的类别
Level_Str = ""
Click_Str = ""
If Flag = True Then '已经通过审核
 If Vip_Flag = True Then '是高级会员
  If DateDiff("d",Vip_Date,Date()) >= 0 And DateDiff("d",Vip_EndDate,Date()) <= 0 Then
   Level_Str = "您是<font color=#ff0000>高级收费会员</font>["&FormatDateTime(Vip_Date,2)&" 至 "&FormatDateTime(Vip_EndDate,2)&"],还可以发布<u>"&Vip_Jobs&"</u>条招聘职位"
   Click_Str = "<tr><td height=""25""><img src=""../Images/icon2.gif"" width=""12"" height=""16"">"
   Click_Str = Click_Str&" 高级会员：您的企业目前还可以查看<u>"&Vip_Clicks&"</u>位人才的联系方式,<a href=Com_VipClicks.asp><u>详细记录</u></a> ;"
   Click_Str = Click_Str&"</td></tr>"
  Else
   Level_Str = "您是<font color=#ff0000>过期收费会员</font>[过期时间："&FormatDateTime(Vip_EndDate,2)&"]"
  End if
 Else '免费会员
   Level_Str = "您是<font color=#ff0000>免费会员</font>[招聘的部分功能受到限制]"
 End if
Else
   Level_Str = "您是<font color=#ff0000>未审核会员</font>[招聘的部分功能受到限制]"
End if

'判断会员是否有视频
Video_Str = ""
If Nc_Video = True Then

 If DateDiff("d",Video_Date,Date()) >= 0 And DateDiff("d",Video_EndDate,Date()) <= 0 Then
  Video_Str = "开通时间：<u>"&Formatdatetime(Video_Date,2)&"</u> 截止时间：<u>"&Formatdatetime(Video_EndDate,2)&"</u>"
 Elseif DateDiff("d",Video_EndDate,Date()) > 0  Then
  Video_Str = "已经截止，截止时间：<u>"&Formatdatetime(Video_EndDate,2)&"</u>"
 End if
 
Else
 Video_Str = "您的企业没有制作视频，<a href=Com_Rec_Record.asp target=_blank>点击这里开始录制视频</a>"
End if

'获取有效职位
Job_Num      = 0
ViewClicks   = 0
SQL = "Select Count(Jobid),Sum(ViewClicks) From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And DateDiff(d,End_Date,GetDate())<=0"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 Job_Num      = Rs(0)
 ViewClicks   = Rs(1)
End if
Rs.Close

'获取收件夹信件数
InBox_Num          = 0 
InBox_NewNum       = 0
'收件夹信件数
Set Rs = Conn.Execute("Select Count(*) From [pH_Company_InBox] Where Comid='"&Comid&"'")
If Not Rs.Eof Then InBox_Num = Rs(0)
Rs.Close
'收件夹新信件数
Set Rs = Conn.Execute("Select Count(*) From [pH_Company_InBox] Where Comid='"&Comid&"' And Flag=0")
If Not Rs.Eof Then InBox_NewNum = Rs(0) 
Rs.Close

'获取人才库人数
PersonDB_Num          = 0 

Set Rs = Conn.Execute("Select Count(*) From [pH_Company_PersonDB] Where Comid='"&Comid&"'")
If Not Rs.Eof Then PersonDB_Num = Rs(0)
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td width="175" valign="top"> 
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;帐号信息</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  尊敬的<%= Cls_WebName %>用户：<font color=#ff0000><%= CompanyName %></font>，欢迎您进入企业招聘管理中心 
                </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  会员类别：<%= Level_Str %> ;</td>
              </tr>
              <%= Click_Str %> 
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  企业视频：<%= Video_Str %></td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  上次登录时间：<u><%= LastDate %></u> ，登录次数： <u><%= LoginCount %></u> 次 ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  如果您对<%= Cls_WebName %>有任何问题或者建议，请<a href="../Public/Feedback.asp" target="_blank">点击这里</a>发表您的看法 
                  .</td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;招聘信息</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  职位信息：<font color=#ff0000><u><%= Job_Num %></u></font> 个有效职位 ,被求职者总计浏览 <font color=#ff0000><u><%= ViewClicks %></u></font> 次 ,<a href="Com_JobManage.asp"><u>点此查看</u></a> ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  收件夹中有 <font color=#ff0000><u><%= InBox_Num %></u></font> 封应聘邮件，其中 <font color=#ff0000><u><%= InBox_NewNum %></u></font> 封是新邮件 ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  企业人才库有 <font color=#ff0000><u><%= PersonDB_Num %></u></font> 份简历 ,<a href="Com_PersonDB.asp"><u>点此查看</u></a>  .</td>
              </tr>
            </table>
            
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;简历搜索</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="Com_FastSearch.asp">快速搜索</a> 只需指定很少的搜索条件便能快速地搜索到企业所需的人才 
                  ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="Com_Searcher.asp">搜索器</a> 可以将常用的搜索条件保存，能快速的按预定的条件来搜索合适的人才 
                  ; </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  为您精心设计 <a href="Com_AllSearch.asp">详细搜索</a> <a href="Com_ClassSearch.asp">分类搜索</a> 
                  等强大简历搜索引擎，助您轻松找到合适人才 .</td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;提醒信息</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  请将<a href="Com_BasicInfo.asp">企业基本信息</a>、<a href="Com_Dept.asp">部门信息</a>、<a href="Com_Logo.asp">企业图片</a>等填写完整 
                  ,以达到更好的招聘效果 ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="http://www.chsi.com.cn/xlcx/" target="_blank">全国高等教育学历查询</a>; 
                </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  如果您在使用过程遇到任何问题欢迎随时<a href="../Public/Contact.asp">联系我们</a> .</td>
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
'//关闭数据库连接
CloseDB
 %>
