<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理后台登录</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<link href="../css/01387.css" rel="stylesheet" type="text/css" />

</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="778" height="448" border="0" align="center" cellPadding="0" cellSpacing="0" bgColor="#ffffff">
  <tr> 
    <td width="49%" height="37">
	<br>
	
	<table width="100%" border="0" align="center">
        <tr> 
          <td width="31%" height="15"><div align="center"><font color="#CCCCCC" size="2"><strong> 
              </strong></font></div></td>
          <td width="69%" height="2"><div align="left"><font color="#CCCCCC"><strong></strong></font></div>
            <div align="center"></div></td>
        </tr>
        <tr> 
          <td height="101" colspan="2"><p align="center"><font color="#FF0000" size="3"> 
              <strong><font color="#FF0000" size="3"><strong><font size="2"><img src="../images/chenggongzhuce.gif" width="404" height="81" /></font></strong></font><font size="2"><br />
              </font></strong></font></p></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td><div align="center">
        <table width="333" height="300" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
          <tr> 
            <td height="80"><div align="center"><img src="../images/companylogin.gif" width="333" height="80" /></div></td>
          </tr>
          <tr> 
            <td height="256" valign="top" background="../images/lgoinbg.gif" bgcolor="#CCCCCC"><table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px;">
                <form action="check.asp" method="post" name="form1" id="form1">
                  <tr > 
                    <td width="87" height="28" align="right"><div align="right">用 
                        户 名：</div></td>
                    <td width="225" align="left">&nbsp; <input name="username" type="text" class="input" id="username" size="16" /></td>
                  </tr>
                  <tr> 
                    <td height="28" align="right"><div align="right">密　　码：</div></td>
                    <td align="left">&nbsp; <input name="password" type="password" class="input" id="password" size="16" /> 
                    </td>
                  </tr>
                  <tr> 
                    <td height="28" align="right"><div align="right">验 证 码：</div></td>
                    <td align="left">&nbsp; <input name="verifycode" type="text" class="input" id="verifycode" value="<%If GetCode=9999 Then Response.Write "9999"%>" size="5" maxlength="50" /> 
                      &nbsp;请在附加码框输入 <img src="getcode.asp" /></td>
                  </tr>
                  <tr> 
                    <td height="50" colspan="2" align="center">&nbsp; <button accesskey="K" type="submit"  class="win2_"><img src="../images/203.gif" width="16" height="16" /> 
                      登录系统</button>
                      <input type="button" name="Submit2" value="免费注册" class="win2_" onClick="Javascript:location='reg_one.asp'" /></td>
                  </tr>
                </form>
              </table>
              <table width="71%" height="32" border="0" align="center" cellpadding="0" cellspacing="0" class="t3">
                <tr> 
                  <td height="32" style="line-height:170%;">  
                      <li>需要帮助请 <a href="../about/help.asp">点这里</a> </li>
                      </td>
                </tr>
              </table></td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
