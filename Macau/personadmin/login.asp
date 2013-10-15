<!--#include file="../conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-个人求职管理后台登录</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">

<link href="../css/01387.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="778" height="427" border="0" align="center" cellPadding="0" cellSpacing="0" bgColor="#ffffff">
  <tr> 
    <td width="49%"><table width="82%" height="336" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="80"><img src="../images/person_bg.gif" width="333" height="80" /></td>
      </tr>
      <tr>
        <td height="256" valign="top" background="../images/lgoinbg.gif"><table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px;">
  <form action="check.asp" method="post" name="form1" id="form1">
              <tr >
                <td width="87" height="28" align="right">用 户 
                  名：</td>
                <td width="225">&nbsp;
                  <input name="username" type="text" class="input" id="username" size="16" /></td>
              </tr>
              <tr>
                <td height="28" align="right">密　　码：</td>
                <td>&nbsp;
                  <input name="password" type="password" class="input" id="password" size="16" /></td>
              </tr>
              <tr>
                <td height="28" align="right">验 证 码：</td>
                <td>&nbsp;
                  <input name="verifycode" type="text" class="input" id="verifycode" value="<%If GetCode=9999 Then Response.Write "9999"%>" size="5" maxlength="50" />                  &nbsp;请在附加码框输入 <img src="../company/getcode.asp" /></td>
              </tr>
              <tr>
                <td height="50" colspan="2" align="center">&nbsp;
                    <button accesskey="K" type="submit"  class="win2_"><img src="../images/203.gif" width="16" height="16" /> 登录系统</button>
                  <input type="button" name="Submit2" value="免费注册" class="win2_" onclick=Javascript:location='reg_first.asp' /></td>
              </tr>
            </form>
        </table>
            <table class="t3" cellspacing="0" cellpadding="0" width="71%" align="center" border="0">
              <tr>
                <td style="line-height:170%;"><div>
                  <li>需要帮助请 <a href="../about/help.asp">点这里</a> </li>
                  <li>还不是会员,请点这里 <a href="reg_first.asp">免费注册</a> <br>
                  <a href="../company/login.asp"><img src="../images/qylogin2.gif" width="124" height="24" border="0" /></a></li>
                </div></td>
              </tr>
          </table></td>
      </tr>
    </table></td>
    <td width="51%"><p>　    
      <table height="336" cellpadding="0" cellspacing="0">
        <tr>
          <td height="26" style="BORDER-bottom: #D7D7D7 1px solid;"><strong style="font-size:14px; color:#00810E;">您还不是会员吗? 
            请先免费注册。</strong></td>
        </tr>
        <tr>
          <td style="line-height:170%;"><a href="reg_first.asp"><img src="../images/reguser.gif" width="135" height="25" border="0"></a> 
            &nbsp;&nbsp; <a href="../help/toudijianli.asp" target="_blank"><img src="../images/howtoapply.gif" width="135" height="25" border="0"></a> 
            <br>
            <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
            <tr>
              <td width="12%" rowspan="2"><img src="../images/icon1.gif" width="52" height="50"></td>
                <td width="88%" height="25"><STRONG><a href="#">简历管理 / 相片管理</a></STRONG></td>
            </tr>
            <tr>
              <td>澳门劳工招聘网的简历中心，您可以在此创建自己专业的个性化的简历。</td>
            </tr>
            <tr>
              <td rowspan="2"><img src="../images/icon2.gif" width="52" height="50"></td>
              <td height="25"><A href="#" target="_blank"><STRONG>找工作</STRONG></A></td>
            </tr>
            <tr>
              <td>在茫茫职场中如何找工作？澳门劳工招聘网的职位搜索器助您一臂之力！</td>
            </tr>
            <tr>
              <td rowspan="2"><img src="../images/icon3.gif" width="54" height="50"></td>
              <td height="25"><A href="#"><STRONG>在线申请工作</STRONG></A></td>
            </tr>
            <tr>
              <td>当您找到感兴趣的职位时，可以立即将您在澳门劳工招聘网上的简历在线投递给招聘单位。</td>
            </tr>
            <tr>
              <td rowspan="2"><img src="../images/icon4.gif" width="61" height="52"></td>
              <td height="25"><A href="#"><STRONG>收藏感兴趣的职位</STRONG></A></td>
            </tr>
            <tr>
              <td>设置并订阅您个性化的职位搜索器，澳门劳工招聘网会贴心的将理想的职位发送到您的信箱中。</td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
