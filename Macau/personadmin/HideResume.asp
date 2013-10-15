<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select username,uid,resumestatus,uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
if request.querystring("action")="modify" then
  if request.form("resumestatus")="" then
    response.redirect "HideResume.asp"
  end if
  conn.execute("update [01387member] set resumestatus='"&request.form("resumestatus")&"' where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'")
  response.Write"<script language=javascript>alert('修改成功！');"
  response.write"this.location.href='HideResume.asp';</SCRIPT>"
  response.end()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body >
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
        <table border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
          <tr>
            <td height="22" class="win2_update_table_top">简历保密设置</td>
          </tr>
 <form name="form1" method="post" action="HideResume.asp?action=modify">            <tr>
            <td><table width="100%" align="center" border="0" cellpadding="0" cellspacing="2" id="AutoNumber57" style="BORDER-COLLAPSE: collapse">
                <tr>
                  <td height="30" bgcolor="#FFEDD2"><p style="LINE-HEIGHT: 19px"><b>&nbsp;公开隐藏设置</b></td>
                </tr>
                <tr>
                  <td valign="bottom" bgcolor="#FFFAF0" style="line-height:30px"><input name="resumestatus" type="radio" value="open" <%if rs("resumestatus")="open" then%>checked<%end if%>>
                    完全公开我的简历 <br>
                    <input name="resumestatus" type="radio" value="hide" <%if rs("resumestatus")="hide" then%>checked<%end if%>>
                  隐藏我的简历<font color="#384249">&nbsp;</font><font color="#333333">（完全保密，任何人都搜索不到您的简历）</font></td>
                </tr>
                <tr>
                  <td height="47" bgcolor="#FFFAF0" style="line-height:30px"><button accesskey="K" type="submit"  class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认修改</button></td>
                </tr>
              </table></td>
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
