<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%Call RsName(rs,"select uname,regtime,logintime,lastlogin,updatetime,resumestatus,job_career,edu_career from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,1,1)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
      <table width="80%" height="62" border="0" cellpadding="0" cellspacing="0" style="margin-left:25px;margin-top:15px;">
            <tr>
              <td height="46" >
                <table width="436" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="97" rowspan="4" align="center"><img src="../images/nophoto.jpg" width="81" height="95" /></td>
                    <td width="339" height="25" class="p15"><%=request.cookies("01387job")("personusername")%> , 欢迎登陆</td>
                  </tr>
                  <tr>
                    <td height="25" >你最后登陆时间：<font class="p15" color="#FF0000"><%=session("lastloginperson")%></font></td>
                  </tr>
                  <tr>
                    <td height="25" >登录次数：<font class="p15"><%=rs(2)%></font></td>
                  </tr>
                  <tr>
                    <td height="25" >澳门劳工招聘网提醒您：提高警惕，谨防求职受骗！</td>
                  </tr>
                </table>
                </td>
            </tr>
            <tr>
              <td><table width="445" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    
                <td width="445" height="50" valign="bottom"><table width="100%" border="0">
                    <tr> 
                      <td height="37"><img src="../images/m17.gif" width="443" height="37" /></td>
                    </tr>
                    <tr> 
                      <td class="p13"><br />
                        您现在的身份是<strong>免费会员</strong>，您的联系方式不能对澳门雇主和澳门的劳务公司公开，请联系客服人员升级为赞助会员，以增加面试机会。 
                        <br />
                        点击在线客服QQ:&nbsp; <a target="blank" href="tencent://message/?uin=601652392&Site=澳门劳工招聘网&Menu=yes"><img src="../images/qq.gif?p=1:601652392:1" alt="点击这里给我发消息" width="57" height="16" 

border="0" /></a> &nbsp; 或加QQ：601652392，马上升级为<strong>赞助会员</strong>！ </td>
                    </tr>
                    <tr> 
                      <td class="p13"><br /> <br />
                        澳门劳工招聘网是澳门最大的劳务信息平台，澳门雇主不再为寻找劳工而烦恼！<br /> <br /> <strong>赞助会员可享受以下服务：</strong><br /> 
                        <br />
                        1.联系方式对所有澳门雇主和澳门劳务公司公开，他们将直接与您取得联系。<br /> <br />
                        2.澳门雇主在内地开展的各类劳工招聘会，本网将事先通过手机短信的方式通知。<br /> <br />
                        3.免费咨询澳门各行业劳工工资情况，劳务费用，体检要求，生活消费等。<br /> <br />
                        4.免费推荐澳门廉价的劳工合租房信息。<br /> <br/>
                        5.终身收录进澳门劳工招聘网人才数据库，以提供给澳门合作的人力机构使用。<br /> <br /> <br /> 
                        <hr /> </td>
                    </tr>
                  </table></td>
                  </tr>
                  <tr>
                    <td class="p13"><%Call RsName(rs1,"select count(*) from [01387favorite] where mytype=2 and uid='"&request.cookies("01387job")("uid")&"'",1,1)%>
您共有职位收藏：<font class="wel2"><%=rs1(0)%></font> 个
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="MyFavo.asp">点击查看</a>)</td>
                </tr>
                 
                  <tr>
                    <td  class="p13"><%Call RsName(rs1,"select count(*) from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"'",1,1)%>
您的应聘工作岗位记录：<font class="wel2"><%=rs1(0)%></font> 个
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="ApplyList.asp">点击查看</a>)</td>
                </tr>
                  <tr>
                    <td  class="p13"><%call RsName(rs1,"select Count(*) from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' and status=3",1,1)%>
您的面试通知：<font class="wel2"><%=rs1(0)%></font> 条
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="InterView.asp">点击查看</a>)</td>
                  </tr><tr>
                    <td  class="p13">您上次更新简历的时间为：<font class="wel2"><%=rs(4)%></font></td>
                  </tr> <tr>
                    <td class="p13">您简历状态：<font class="wel2">
                    <%if rs(5)="open" then response.Write("正常显示") else response.Write("隐藏")%>
                    </font> (<a href="HideResume.asp">点击修改</font></a>) <font color="#999999">(如果您已经找到工作建议把简历设成隐藏)</font></td>
                </tr><tr>
                    <td  class="p13">您的简历完善度：<%if rs(0)="" or rs(6)="" or rs(7)="" then%>
                <%aa=""%>
                <%if rs(0)="" then aa=aa&"<a href='basicinfo.asp'><u><font color=#456991><b>个人资料</b></font></u></a>&nbsp;"%>
                <%if rs(6)="" then aa=aa&"<a href='jobcareer.asp'><u><font color=#456991><b>工作经历</b></font></u></a>&nbsp;"%>
                <%if rs(7)="" then aa=aa&"<a href='educareer.asp'><u><font color=#456991><b>教育经历</b></font></u></a>&nbsp;"%>
                <%response.write(""&aa&"未填写完整！")%>
                <%else
				response.write "<font color=#456991><b>简历已完整</b></font>"
				end if%></td>
                  </tr>
                </table>
                  <table width="445" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="445" height="60" valign="bottom"><img src="../images/m18.gif" width="443" height="37" /></td>
                    </tr>
                    <tr>
                      <td class="p13"><img src="../images/1.gif" width="13" height="13" /> 经常更新你的简历，使企业更容易找到你。</td>
                    </tr>
                    <tr>
                      <td  class="p13" style="padding-left:10px; line-height:140%;"><img src="../images/2.gif" width="13" height="13" /> 找到合适的工作后请及时隐藏你的简历，避免无谓的干扰。</td>
                    </tr>
                    <tr>
                      <td height="1" background="../images/m21.gif"></td>
                    </tr>
                    <tr>
                      <td  class="p13"><img src="../images/3.gif" width="13" height="13" /> 为了使澳门劳工招聘网能更好的为你提供贴心的服务，<a href="#">欢迎参加客户满意调查</a>。</td>
                    </tr>
                    <tr>
                      
                <td  class="p13"><img src="../images/4.gif" width="13" height="13" /> 
                  您需要澳门劳工招聘网为你提供哪些更实用的功能，<a href="mailto:service@macau69.com">欢迎写邮件告诉我们</a>。</td>
                    </tr>
                </table></td>
            </tr>
      </table></td></tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
