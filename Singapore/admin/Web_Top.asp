<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<html>
<head>
<title><%= Cls_WebName %> -- 管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href=css/css.css rel=stylesheet>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
.a01 
{
	background-image: url(Images/nav10_bg1.jpg);
	color: #ffffff;
	font-weight: bold;
	padding-top:4px;
} 
.a02 
{
	background-image: url(Images/nav10_bg2.jpg);
	color: #ffffff;
	padding-top:4px;
}
</style>
<script language="JavaScript">
function asecBoard(n) 
{ 
    for(i=1;i<12;i++) 
    { 
        eval("document.getElementById('a"+i+"').className='a02'"); 
    } 
    eval("document.getElementById('a"+n+"').className='a01'"); 
	parent.framLeft.location.replace("Left/Left"+n+".asp");
}
</script>
<script language=vbscript>
 sub logout()
  a=msgbox ("你真的要退出系统吗？",vbyesno)
  if a=6 then
   window.top.navigate "Web_Logout.asp"
  end if
 end sub
</script>
<body leftmargin="0" topmargin="0" >
<div align="center"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="68" valign="top" background="Images/top10_bg.jpg"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="300"><img src="Images/logo_admin.jpg" width="300" height="44"></td>
                  <td align="right" valign="top" style="padding-top:15px;padding-right:25px;"><font color="#C2D9ED"><a href="../Index.asp" target="_blank" class="k1">网站首页</a> 
                    | <a href="Web_Index.asp" class="k1" target="_parent">管理首页</a> | <a href="javascript:" onClick="javascript:logout();" class="k1">安全退出</a></font></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="120" height="24">&nbsp;</td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="24" align="center" background="Images/nav10_bg1.jpg" id="a1" class="a01" onClick="asecBoard(1);parent.framRight.location.replace('Web_System_SendMail.asp');">系统设置</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a2" class="a02" onClick="asecBoard(2);parent.framRight.location.replace('Web_Company_All.asp');">企业管理</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a3" class="a02" onClick="asecBoard(3);parent.framRight.location.replace('Web_Person_All.asp');">个人管理</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a4" class="a02" onClick="asecBoard(4);parent.framRight.location.replace('Web_Educate_All.asp');">培训机构</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a5" class="a02" onClick="asecBoard(5);parent.framRight.location.replace('Web_School_All.asp');">院校会员</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a6" class="a02" onClick="asecBoard(6);parent.framRight.location.replace('Web_Job_All.asp');">职位管理</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a7" class="a02" onClick="asecBoard(7);parent.framRight.location.replace('Web_Intro_All.asp');">人才中介</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a8" class="a02" onClick="asecBoard(8);parent.framRight.location.replace('Web_Video_All.asp');">视频招聘</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a9" class="a02" onClick="asecBoard(9);parent.framRight.location.replace('Web_New_Add.asp');">资讯管理</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a10" class="a02" onClick="asecBoard(10);parent.framRight.location.replace('Web_City_Manage.asp');">分站设置</td>
                      </tr>
                    </table></td>
                  <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="24" align="center" background="Images/nav10_bg2.jpg" id="a11" class="a02" onClick="asecBoard(11);parent.framRight.location.replace('Web_Locale_Base.asp');">其他管理</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="5" bgcolor="#445588"></td>
    </tr>
  </table>

</div>

</body>

</html>

