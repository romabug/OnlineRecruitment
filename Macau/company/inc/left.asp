<link rel="stylesheet" href="../style/menu.css" />
<script language="javascript" src="../js/menu.js"></script>
<SCRIPT language=javascript src="../js/pubfunc.js"></SCRIPT>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div id="leftmenu">
              <ul><img src="../images/22.gif"><a href="index.asp"><font color="#FF3300"><strong>企业管理中心</strong></font></a>
                <li class="parent3"> <a id="leftmenuitem1" onclick="actionSubMenu(this);">企业资料管理</a> 
                  <ul id="leftmenuitem1sub">
                    <li><a href="myaccount.asp">企业帐号</a></li>
                    <li><a href="updatecompanyinfo.asp">企业基本资料</a></li>
                    <li class="end"><a href="updatecontactinfo.asp">企业联系方式</a></li>
                  </ul>
                </li>
                <li class="parent3"> <a id="leftmenuitem2" onclick="actionSubMenu(this);">企业职位管理</a> 
                  <ul id="leftmenuitem2sub">
                    <li><a href="publishjobs.asp">发布职位</a></li>
					<li><a href="publishparttimejobs.asp">兼职发布</a></li>
                    <li class="end"><a href="joblist.asp">职位管理</a></li>
                  </ul>
                </li>
                <li class="parent2"> <a id="leftmenuitem3" onclick="actionSubMenu(this);">招聘信息中心</a> 
                  <ul id="leftmenuitem3sub">
                    <li><a href="ApplyList.asp">收到应聘简历</a></li>
                    <li><a href="Myfavo.asp">人才储备库</a></li>
                    <li class="end"><a href="InterviewList.asp">邀请面试记录</a></li>
                  </ul>
                </li>
                
          <li class="parent2"> <a id="leftmenuitem4" onclick="actionSubMenu(this);"><strong>优</strong>才简历库</a> 
            <ul id="leftmenuitem4sub">
                    <li><a href="MemberList.asp">全部简历信息</a></li>
					<li><a href="MemberlistPro.asp">高级人才库</a></li>
					<li><a href="MemberlistPart.asp">兼职人才库</a></li>
                    
              <li class="end"><a href="membersearch.asp">人才搜索引擎</a></li>
                  </ul>
                </li>
                
          <li class="parent2"><a id="leftmenuitem6" onclick="actionSubMenu(this);"><strong>优</strong>才特色区</a> 
            <ul id="leftmenuitem6sub">
                    
              <li><a href="../Hr_Club/hr_down.asp" target="_blank">人力资源表格下载</a></li>
					<li><a href="../HR_cp/" target="_blank">员工个人素质测评</a></li>
                  </ul></li>
                <li class="parent3"> <a href="logout.asp">安全退出</a> 
                </li>
              </ul>
            </div>
            <script language="javascript" type="text/javascript">
<!--
//定义左菜单数组
var leftmenus = new Array();
leftmenus[0] = document.getElementById("leftmenuitem1");
leftmenus[1] = document.getElementById("leftmenuitem2");
leftmenus[2] = document.getElementById("leftmenuitem3");
leftmenus[3] = document.getElementById("leftmenuitem4");
leftmenus[4] = document.getElementById("leftmenuitem5");
leftmenus[5] = document.getElementById("leftmenuitem6");

initLeftMenu();
-->
</script>
            <br>
            <br>
          </td>
        </tr>
      </table>