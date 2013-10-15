<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime,doneyear,job_career,selfintro from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
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
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/jobcareer.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table border="0" cellpadding="0" cellspacing="0"  class="win2_update_table">
  <tr>
    <td height="22" colspan="2" class="win2_update_table_top">个人工作经历</td>
  </tr><form name="form1" method="post" action="jobcareer_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td height="35" align="right" class="win2_update_table_td">工作经验：</td>
    <td width="543"><input name="doneyear" type="text" class="input" id="doneyear" value="<%=rs("doneyear")%>" size="7" />	
年<font color="#FF0000">*</font>(应届毕业生填写<font color="#FF0000">0</font>)</td>
  </tr>
  <tr>
    <td height="133" align="right" class="win2_update_table_td">工作经历：</td>
    <td><table width="96%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="26%">实习/工作时间</td>
        <td width="31%">实习/工作单位</td>
        <td width="43%">实习/工作岗位</td>
      </tr>
    </table>
      <textarea name="job_career" cols="65" rows="7" class="input" id="job_career"><%if rs("job_career")<>"" then response.Write(replace(replace(rs("job_career"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
    </textarea>
      <font color="#FF0000">*</font> （1000字以内）</td>
  </tr>
  <tr>
    <td height="144" align="right" class="win2_update_table_td">自我评价：</td>
            <td height="144">特长、技能、自我评价、自我推荐等 
              <textarea name="selfintro" cols="65" rows="7" class="input" id="selfintro"><%if rs("selfintro")<>"" then response.Write(replace(replace(rs("selfintro"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
                    </textarea>
      <font color="#FF0000">*</font>（500字以内）</td>
  </tr>
  <tr>
    <td height="50" colspan="2" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认发送</button></td>
    </tr>
  </form>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
