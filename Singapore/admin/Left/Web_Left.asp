<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../Web_Session.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
 <HEAD>
 <title>网站管理中心</title>
 <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
 <meta name="CODE_LANGUAGE" Content="C#">
 <meta name="vs_defaultClientScript" content="JavaScript">
 <link rel="stylesheet" type="text/css" href="../../../Css/css_offices.css">
 <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<body leftmargin="0" topmargin="0" bgcolor="#B3D2F1">

<div style="display:" id="abx1">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">系统设置</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Other_Parameter.asp" class="blue10" target="framRight">网站参数</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_System_SendMail.asp" class="blue10" target="framRight">群发邮件</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_System_Jobmail.asp" class="blue10" target="framRight">职位订阅</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Master_Log.as" class="blue10" target="framRight">登陆日志</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Master_Manage.asp" class="blue10" target="framRight">管理员管理</a></td>
  </tr>
</table>
</div>
<div style="display:none;" id="abx2">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">企业管理</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_All.asp" class="blue10" target=framRight>全部企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Vip.asp" class="blue10" target=framRight>收费企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Video.asp" class="blue10" target=framRight>企业视频</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Free.asp" class="blue10" target=framRight>免费企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Term.asp" class="blue10" target=framRight>到期收费企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Wait.asp" class="blue10" target=framRight>等待审核企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_Up.asp" class="blue10" target=framRight>等待升级企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_WaitVideo.asp" class="blue10" target=framRight>审核企业视频</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Company_VipLevel.asp" class="blue10" target=framRight>企业权限管理</a></td>
  </tr>
</table>
</div>
<div style="display:none;" id="abx3">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">个人管理</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_All.asp" class="blue10" target=framRight>全部会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Showme.asp" class="blue10" target=framRight>自荐会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Top.asp" class="blue10" target=framRight>固顶会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Video.asp" class="blue10" target=framRight>视频简历</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Full.asp" class="blue10" target=framRight>全职会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Part.asp" class="blue10" target=framRight>兼职会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_WaitBest.asp" class="blue10" target=framRight>等待自荐会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_WaitVideo.asp" class="blue10" target=framRight>审核视频简历</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Person_Wait.asp" class="blue10" target=framRight>等待审核会员</a></td>
  </tr>
</table>
</div>
<div style="display:none;" id="abx4">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">培训机构</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_All.asp" class="blue10" target=framRight>全部机构</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Vip.asp" class="blue10" target=framRight>收费机构</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Free.asp" class="blue10" target=framRight>免费机构</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Up.asp" class="blue10" target=framRight>待升级机构</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Wait.asp" class="blue10" target=framRight>待审核机构</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Lessons.asp" class="blue10" target=framRight>培训课程管理</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Teachers.asp" class="blue10" target=framRight>培训讲师管理</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Books.asp" class="blue10" target=framRight>培训书架管理</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Educate_Demands.asp" class="blue10" target=framRight>培训需求管理</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx5">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">院校会员</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_All.asp" class="blue10" target=framRight>全部会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_Vip.asp" class="blue10" target=framRight>收费会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_Free.asp" class="blue10" target=framRight>免费会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_Term.asp" class="blue10" target=framRight>到期收费会员</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_Wait.asp" class="blue10" target=framRight>等待审核会员</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_School_Up.asp" class="blue10" target=framRight>等待升级会员</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx6">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">职位管理</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Job_All.asp" class="blue10" target=framRight>全部职位</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Job_Top.asp" class="blue10" target=framRight>固顶职位</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Job_Best.asp" class="blue10" target=framRight>急聘职位</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Job_Full.asp" class="blue10" target=framRight>全职职位</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Job_Part.asp" class="blue10" target=framRight>兼职职位</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx7">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">猎头兼职</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Locale_Base.asp" class="blue10" target=framRight>猎头企业</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Locale_Jobs.asp" class="blue10" target=framRight>猎头职位</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Part_Company.asp" class="blue10" target=framRight>兼职招聘信息</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Part_Person.asp" class="blue10" target=framRight>兼职求职信息</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx8">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">视频招聘</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Video_All.asp" class="blue10" target=framRight>视频招聘会</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Video_Add.asp" class="blue10" target=framRight>添加招聘会</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx9">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">资讯管理</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_New_Add.asp" class="blue10" target=framRight>添加新闻</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_New_Manage.asp" class="blue10" target=framRight>新闻管理</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_New_Type.asp" class="blue10" target=framRight>类别管理</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx10">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">分站设置</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_City_Add.asp" class="blue10" target=framRight>添加地区</a></td>
  </tr>
  <tr>
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_City_Manage.asp" class="blue10" target=framRight>地区管理</a></td>
  </tr>
</table>
</div>

<div style="display:none;" id="abx11">
<table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="27" bgcolor="#445588" style="padding-left:10px;"><strong><font color="#FFFFFF">其他管理</font></strong></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Other_Ads.asp" class="blue10" target=framRight>广告管理</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Link.asp" class="blue10" target=framRight>友情连接</a></td>
  </tr>
  <tr> 
    <td height="27" align="left" valign="top" background="../Images/left10_bg1.gif" style="padding-top:10px;padding-left:10px;"><a href="../Web_Friend.asp" class="blue10" target=framRight>合作伙伴</a></td>
  </tr>
</table>
</div>

</body>
</HTML>
