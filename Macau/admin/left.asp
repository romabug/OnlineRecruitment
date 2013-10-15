<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/ShowMenu.js"></script>
<body bgcolor="#799ae1" leftmargin="0" topmargin="5" marginwidth="0" marginheight="0" scroll=yes>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="image/title.gif" width="158" height="38"></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/title_bg_quit.gif"><table width="80%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><a href="main.asp" target="mainFrame"><strong>管理首页</strong></a> <strong>|</strong> 
              <a href="logout.asp" target="_parent"><strong>退出</strong></a></div>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_3.gif" onclick=showsubmenu(2)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">企业会员管理</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu2><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="CompanyList.asp" target="mainFrame">企业会员列表</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ClosedRecord.asp" target="mainFrame">企业会员冻结记录</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="JobList.asp" target="mainFrame">所有职位列表</a></td>
        </tr>
       <!--
		<tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="JobListPart.asp" target="mainFrame">兼职列表</a></td>
        </tr>
		-->
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ClosedRecordJob.asp" target="mainFrame">职位冻结记录</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyOvertime.asp" target="mainFrame">最近一个月到期会员</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyOverRecord.asp" target="mainFrame">会员到期处理记录</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyReg.asp" target="mainFrame">企业申请正式会员</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_4.gif" onclick=showsubmenu(3)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">个人会员管理</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu3><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="PersonList.asp" target="mainFrame">个人会员列表</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ApplyPro.asp" target="mainFrame">申请高级人才</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="image/admin_left_1.gif" onclick=showsubmenu(0)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
      <tr>
        <td><div align="center"><strong><font color="#0033CC">资料上传管理</font></strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" id=submenu0><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
      <tr>
        <td width="100%" height="5" colspan="2"></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Adver_Right.asp" target="mainFrame">广告管理</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Vote.asp" target="mainFrame">首页投票管理</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="AnnounceAdd.asp" target="mainFrame">发布会员公告</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Hr_add.asp" target="mainFrame">HR资料上传</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Services_add.asp" target="mainFrame">服务专区</a></td>
      </tr>
    </table>
        <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="image/admin_left_2.gif" onclick=showsubmenu(1)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
      <tr>
        <td><div align="center"><strong><font color="#0033CC">客户提交信息</font></strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" id=submenu1><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
      <tr>
        <td height="5" colspan="2"></td>
      </tr>
	  <!--
      <tr>
        <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td width="79%"><a href="FreeList.asp" target="mainFrame">自由兼职信息</a></td>
      </tr>
	  -->
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Feedback.asp" target="mainFrame">投诉意见反馈</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Companyquick.asp" target="mainFrame">企业快速注册通道</a></td>
      </tr>
	  <!--
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Entrust.asp" target="mainFrame">委托招聘信息</a></td>
      </tr>-->
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="KnowFrom.asp" target="mainFrame">得知本网途径调查</a></td>
      </tr>
    </table>
        <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_5.gif" onclick=showsubmenu(4)><table width="51%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">系统管理</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu4><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
		   <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="link/link_list.asp" target="mainFrame">友情链接管理</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="link/add_link.asp" target="mainFrame">添加友情链接</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="IpCount.asp" target="mainFrame">首页IP访问统计</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="NewPageCount.asp" target="mainFrame">页面流量统计</a></td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="ManagerAdd.asp" target="mainFrame">添加管理员</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="LoginRecord.asp" target="mainFrame">后台登录记录</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ChangePwd.asp" target="mainFrame">密码修改</a></td>
		  
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
