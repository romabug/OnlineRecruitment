<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
applyid=request("applyid")
if request.QueryString("action")="send" then
applyid=request.QueryString("applyid")
cid=request.cookies("01387job")("cid")
if len(applyid)<>15 or len(cid)<>15 then
response.write "<br>"+"<li>参数错误！"
response.end
end if
if request.form("company_message")="" then
response.Write"<script language=javascript>alert('请输入应聘通知内容！');"
response.write"javascript:history.go(-1);</SCRIPT>"
response.end()
end if
conn.execute("update [01387applylist] set company_message='"&replace(replace(request.form("company_message"),chr(32),"&nbsp;"),chr(13),"<br>")&"',status=3 where applyid='"&applyid&"'")
conn.close
set conn=nothing
%>
<script language="javascript">
alert("发送成功！");
opener.location.reload();
top.close();
</script>
<%
end if
%>
<title>发送应聘通知</title>
<style type="text/css">
<!--
.a {
	font-size: 12px;
}
-->
</style>
<style type="text/css">
<!--
.b {
	background-color: #FFFFFF;
	border: 1px solid #999999;
	font-size: 12px;
}
-->
</style>
<body leftmargin="5" topmargin="10" marginwidth="0" marginheight="0">
<table width="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFBC62" class="a">
  <form name="form1" method="post" action="Apply_interview.asp?action=send&applyid=<%=applyid%>">
  <tr bgcolor="dbdbdb"> 
      <td height="26" bgcolor="#FFEDD2">
<div align="center">发送应聘通知</div></td>
  </tr>
  <tr bgcolor="f0f0f0"> 
      <td width="786" height="26" bgcolor="#FFFAF0">
<div align="center">
          <textarea name="company_message" cols="50" rows="6" class="b" id="company_message"></textarea>
        </div></td>
  </tr>
  <tr bgcolor="f0f0f0"> 
      <td height="40" bgcolor="#FFFAF0">
<div align="center">
          <input type="submit" name="Submit" value=" 确 定 发 送 " style="height=30;width=130;font-size=12px">
        </div></td>
  </tr></form>
</table>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="20" align="center" class="a">澳门劳工招聘网(www.macau69.com)</td>
  </tr>
</table>
</body>
