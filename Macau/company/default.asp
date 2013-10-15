<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call RsName(rsM,"select top 1 id,title,viewed from [01387CompanyMessage] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
	  <!--#include file="left.asp"-->
</td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="80%" height="62" border="0" cellpadding="0" cellspacing="0" style="margin-left:25px;margin-top:15px;">
        <tr>
          <td height="23" class="p12"><font color="#456991"><%=request.cookies("01387job")("companyusername")%></font> , 欢迎登陆<br />
          你最后登陆时间：<font color="#FF0000"><%=session("lastlogin")%></font></td>
        </tr>
        <tr>
          <td height="23" ><%if request.cookies("01387job")("cidpower") < 1 then%>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="padding:5px;" >

              <tr>
                <td bgcolor="#FFFFFF" style="line-height:170%; background:#F2F2F2"> 
                  <div align="left"><img src="../images/24.gif" width="17" height="17" align="absmiddle" /> 
                    <br />
                    · 貴公司目前為免費會員狀態，免費會員可以:<br />
                    1. 發佈企業資訊，勞工招聘資訊。<br />
                    2. 可以收到勞工投遞的簡歷。<br />
                    3. 可以聯繫本站客服，以查看投遞簡歷的聯繫方式。</div>
                  <p>· 但部份功能暫不能使用，如：不能查看所有人才簡歷的聯繫方式，不能線上管理投遞的簡歷資訊。<br />
                    · 若想享受更多、更便捷的服務？ 
                    <%Call RsName(rsy,"select * from [01387Feedback] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
				%>
                    <a href="CompanyReg.asp"><font color="#FF0000"><u>可馬上升級為正式會員>>></u></font></a></p>
                  <p>客服熱線：400 6756 269<br />
                    QQ：601652392<br />
                    MSN：macau-69@hotmail.com<br />
                    郵 箱：service@macau69.com<br />
                  </p>
            </td>
              </tr>
            </table>
          <%end if%></td>
        </tr>
        <tr>
          <td><table width="445" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="445" height="50" valign="bottom"><img src="../images/m17.gif" width="443" height="37" /></td>
            </tr>
            <tr>
              <td class="p13">未查看应聘简历：<span class="p14"><%Call RsName(rs,"select count(*) from [01387Applylist] where cid='"&request.cookies("01387job")("cid")&"' and status='1'",1,1)
			  response.Write rs(0) 
			  call closers()%>
              </span> 条 (<a href="ApplyList.asp">点击查看</a>)   &nbsp;&nbsp;&nbsp;|     &nbsp;&nbsp;&nbsp;总应聘简历：<span class="p14">
              <%Call RsName(rs,"select count(*) from [01387Applylist] where cid='"&request.cookies("01387job")("cid")&"'",1,1)
			  response.Write rs(0) 
			  call closers()%></span> 份 </td>
            </tr>
            <tr>
              <td class="p13">招聘职位：<span class="p14"><%call RsName(rs,"select sum(lookcount),count(*) from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"'",1,1)%><%=rs(1)%></span>个 (<a href="joblist.asp">点击查看</a>)   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;|       &nbsp;&nbsp;&nbsp;职位总点击：<span class="p14"><%=rs(0)%></span>次
                <%call closers()%></td>
            </tr>
            <tr>
              <td  class="p13">公司信息最后更新时间为：</span> &nbsp; |       &nbsp; 您上次登陆时间为：<span class="p14"><%=session("lastlogin")%></span></td>
            </tr>
            <tr>
              <td  class="p13"><%call RsName(rs,"select count(*) from [01387favorite] where cid='"&request.cookies("01387job")("cid")&"' and mytype=1",1,1)%>人才收藏夹简历：<span class="p14"><%=rs(0)%></span> 份 (<a href="Myfavo.asp">点击查看</a>)
                <%call Closers()%></td>
            </tr>
          </table>
            <table width="445" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="445" height="60" valign="bottom"><img src="../images/m18.gif" width="443" height="37" /></td>
              </tr>
              <tr>
                <td class="p13"><img src="../images/1.gif" width="13" height="13" /> 如果贵公司已招到合适的人才，请及时关闭相应的招聘信息。</td>
              </tr>
              <tr>
                <td height="40"  style="padding-left:10px; line-height:140%;"><img src="../images/2.gif" width="13" height="13" /> 因求职者普遍喜欢查看近一周的职位，所以为提高贵公司的招聘效果，澳门劳工招聘网<br />
&nbsp;&nbsp;                建议您：请每周定期刷新 正在招聘的职位。(<a href="#">点击查看贵公司正在招聘的职位</a>) </td>
              </tr>
              <tr>
                <td height="1" background="../images/m21.gif"></td>
              </tr>
              <tr>
                <td  class="p13"><img src="../images/3.gif" width="13" height="13" /> 为了使澳门劳工招聘网能更好的为你提供贴心的服务，<a href="#">欢迎参加客户满意调查</a>。</td>
              </tr>
              <tr>
                <td  class="p13"><img src="../images/4.gif" width="13" height="13" /> 您需要澳门劳工招聘网为你提供哪些更实用的功能，<a href="mailto:service@macau69.com">欢迎发邮件告诉我们</a>。</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
