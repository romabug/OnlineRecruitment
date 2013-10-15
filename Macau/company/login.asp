<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理后台登录</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">

<link href="../css/01387.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="778" height="427" border="0" align="center" cellPadding="0" cellSpacing="0" bgColor="#ffffff">
  <tr> 
    <td width="49%"><table width="82%" height="336" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="80"><img src="../images/companylogin.gif" width="333" height="80" /></td>
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
                  <input name="password" type="password" class="input" id="password" size="16" />              </td>
            </tr>
            <tr>
              <td height="28" align="right">验 证 码：</td>
              <td>&nbsp;
                  <input name="verifycode" type="text" class="input" id="verifycode" value="<%If GetCode=9999 Then Response.Write "9999"%>" size="5" maxlength="50" />
                &nbsp;请在附加码框输入 <img src="getcode.asp" /></td>
            </tr>
            <tr>
              <td height="50" colspan="2" align="center">&nbsp;
                <button accesskey="K" type="submit"  class="win2_"><img src="../images/203.gif" width="16" height="16" /> 登录系统</button>
                <input type="button" name="Submit2" value="免费注册" class="win2_" onclick=Javascript:location='reg_one.asp' /></td>
            </tr>
          </form>
        </table>
          <table class="t3" cellspacing="0" cellpadding="0" width="71%" align="center" border="0">
            <tr>
              <td height="72" style="line-height:170%;">
			  <div>
			  
                <li>需要帮助请 <a href="../about/help.asp">点这里</a> </li>
                <li>还不是会员,请点这里 <a href="reg_one.asp">免费注册</a></li>
                <a href="../personadmin/login.asp"><img src="../images/renlogin.gif" width="124" height="24" border="0" /></a> </div>              </td>
            </tr>
          </table></td>
      </tr>
    </table>    </td>
    <td width="51%"><p>　    
      <table height="336" cellpadding="0" cellspacing="0">
        <tr>
          <td height="26" style="BORDER-bottom: #D7D7D7 1px solid;"><strong style="font-size:14px; color:#00810E;">还不是雇主会员? 请先注册</strong></td>
        </tr>
        <tr>
          <td style="line-height:170%;BORDER-bottom: #D7D7D7 1px solid;"><strong>免费注册方便、快捷，注册企业会员后，您即可：</strong>
              <li>立即发布公司职位 </li>
            <li>立即查询简历库 ，3万简历任您查！ </li>
            <li>立即发送面试邀请信 </li>
            <li>立即收藏感兴趣的简历！ </li>
            <li>注册后不限期免费使用！ </li></td>
        </tr>
        <tr>
          <td valign="top" style="line-height:160%;"><br />
&nbsp;&nbsp;&nbsp;&nbsp;随着互联网的日益发展，网上招聘已迅猛之势，快速成长，已成为不容忽视的招聘方式，大量数据表明，企业已将互联网视为最主要的招聘媒体之一，企业在网上招聘的投入也逐月递增。<br />
            &nbsp;&nbsp;&nbsp;&nbsp;澳门劳工招聘网，充分发扬了互联网的快速、便捷、高效、资源共享的优势，是企业从事网上招聘的最佳载体。目前，万余家各种规模的企业已经申请注册网才系统，并坚持一贯地使用澳门劳工招聘网招聘系统。 </td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
