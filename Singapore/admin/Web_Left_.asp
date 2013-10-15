<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
 <HEAD>
 <title>网站管理中心</title>
 <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
 <meta name="CODE_LANGUAGE" Content="C#">
 <meta name="vs_defaultClientScript" content="JavaScript">
 <link rel="stylesheet" type="text/css" href="../Css/css_offices.css">
 <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<script language="Javascript">
	var Obj;
	function expand(el)
	{
		Obj = eval("child"+el)
		if(Obj.style.display == "none")
		{
			Obj.style.display = "block"
		}
		else
		{
			Obj.style.display = "none"
		}
	}
</script>
</HEAD>
<body leftmargin="0" topmargin="0">
<table width="171" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td background="images/left_bg_admin.jpg" valign="top" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="30">&nbsp;</td>
        </tr>
      </table>
      <div style="display:" id="abx1"></div>
	  <div style="display:none;" id="abx2"></div>
      <div id=parent1 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(1);return false;" class="a01">系统设置</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child1 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Other_Parameter.asp" class="link2" target=framRight>网站参数</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_System_SendMail.asp" class="link2" target=framRight>群发邮件</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Master_Manage.asp" class="link2" target=framRight>管理员管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Master_Log.asp" class="link2" target=framRight>登录日志</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_System_Jobmail.asp" class="link2" target=framRight>职位订阅</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
     
      <div id=parent2 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(2);return false;" class="a01">企业管理</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child2 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_All.asp" class="link2" target=framRight>全部企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Vip.asp" class="link2" target=framRight>收费企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Video.asp" class="link2" target=framRight>企业视频</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Free.asp" class="link2" target=framRight>免费企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Term.asp" class="link2" target=framRight>到期收费企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Wait.asp" class="link2" target=framRight>等待审核企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_Up.asp" class="link2" target=framRight>等待升级企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_WaitVideo.asp" class="link2" target=framRight>审核企业视频</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Company_VipLevel.asp" class="link2" target=framRight>企业权限管理</a></td>
          </tr>
		
		 
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent3 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(3);return false;" class="a01">个人管理</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child3 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_All.asp" class="link2" target=framRight>全部会员</a></td>
          </tr>
		 <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Showme.asp" class="link2" target=framRight>自荐会员</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Top.asp" class="link2" target=framRight>固顶会员</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Video.asp" class="link2" target=framRight>视频简历</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Full.asp" class="link2" target=framRight>全职会员</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Part.asp" class="link2" target=framRight>兼职会员</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_WaitBest.asp" class="link2" target=framRight>等待自荐会员</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_WaitVideo.asp" class="link2" target=framRight>审核视频简历</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Person_Wait.asp" class="link2" target=framRight>等待审核会员</a></td>
          </tr>
		 
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent4 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(4);return false;" class="a01">培训机构</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child4 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_All.asp" class="link2" target=framRight>全部培训机构</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Vip.asp" class="link2" target=framRight>收费培训机构</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Free.asp" class="link2" target=framRight>免费培训机构</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Up.asp" class="link2" target=framRight>待升级机构</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Wait.asp" class="link2" target=framRight>待审核机构</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Lessons.asp" class="link2" target=framRight>培训课程管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Teachers.asp" class="link2" target=framRight>培训讲师管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Books.asp" class="link2" target=framRight>培训书架管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Educate_Demands.asp" class="link2" target=framRight>培训需求管理</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>


      <div id=parent6 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(6);return false;" class="a01">职位管理</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child6 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Job_All.asp" class="link2" target=framRight>全部职位</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Job_Top.asp" class="link2" target=framRight>固顶职位</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Job_Best.asp" class="link2" target=framRight>急聘职位</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Job_Full.asp" class="link2" target=framRight>全职职位</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Job_Part.asp" class="link2" target=framRight>兼职职位</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent7 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(7);return false;" class="a01">兼职信息</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child7 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Part_Company.asp" class="link2" target=framRight>兼职招聘信息</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Part_Person.asp" class="link2" target=framRight>兼职求职信息</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent8 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(8);return false;" class="a01">视频招聘</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child8 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Video_All.asp" class="link2" target=framRight>视频招聘会</a></td>
          </tr>
		 <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Video_Add.asp" class="link2" target=framRight>添加招聘会</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent9 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(9);return false;" class="a01">猎头服务</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child9 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Locale_Base.asp" class="link2" target=framRight>招聘企业</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Locale_Jobs.asp" class="link2" target=framRight>招聘职位</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Locale_comApply.asp" class="link2" target=framRight>企业申请</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent10 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(10);return false;" class="a01">资讯管理</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child10 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_New_Add.asp" class="link2" target=framRight>添加新闻</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_New_Manage.asp" class="link2" target=framRight>新闻管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_New_Type.asp" class="link2" target=framRight>类别管理</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent11 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(11);return false;" class="a01">分站设置</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child11 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_City_Add.asp" class="link2" target=framRight>添加地区</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_City_Manage.asp" class="link2" target=framRight>地区管理</a></td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent12 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(12);return false;" class="a01">其他管理</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child12 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Other_Ads.asp" class="link2" target=framRight>广告管理</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Link.asp" class="link2" target=framRight>友情连接</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Vote.asp" class="link2" target=framRight>在线调查</a></td>
          </tr>
		  <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="Web_Friend.asp" class="link2" target=framRight>合作伙伴</a></td>
          </tr>
		  
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent13 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="expand(13);return false;" class="a01">版权信息</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      <div id=child13 class=child style="display='none'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td><a href="http://www.xjp-job.com" class="link2" target=_blank>新加坡劳务</a> <font color="003366">版权所有</font></td>
          </tr>
		 <tr> 
            <td width="30" align="right" height="22"><img src="images/icon_list2.gif" width="9" height="9"></td>
            <td width="10">&nbsp;</td>
            <td> </td>
          </tr>
        </table>
       
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>

      <div id=parent13 class=parent style="display='block'"> 
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/bt_bg1_admin_left.jpg" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Web_logout.asp" class="a01" target="_parent">安全退出</a></td>
          </tr>
        </table>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="6"></td>
          </tr>
        </table>
      </div>
      
    </td>
    <td bgcolor="#D1E6F7" width="1"></td>
  </tr>
</table>
</body>
</HTML>

