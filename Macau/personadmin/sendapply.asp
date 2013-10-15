<!--#include file="../conn.asp"-->
<!--#include file="inc/random.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>发送简历</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<body>
<style type="text/css">
<link href="../css/01387.css" rel="stylesheet" type="text/css" />

<!--
body {
	background-color: #D4D0C8;
	
}
.idt{ height:50px; width:100%; color:#333333; text-align:center; font-size:14px; font-weight:bold; margin-top:50px; line-height:160%;}
-->
</style>
<%
jid=request.QueryString("jid")
cid=request.QueryString("cid")
uid=request.cookies("01387job")("uid")
set rs=server.CreateObject("adodb.recordset")
sql="select uid,jid from [01387applylist] where uid='"&uid&"' and jid='"&jid&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.Write "<div class=""idt""><img src='../images/22.gif' align='absmiddle'/> 澳门劳工招聘网提醒您，该职位已投过简历!</div>"
response.end()
rs.close
set rs=nothing
end if
%>
<script language="JavaScript">
	function refurbish()
	{
		window.returnValue = ""
		window.close();
	}
	function submit_form(form)
	{
		document.all.formSubmit.value = "正在执行...";
		document.all.formSubmit.disabled = true;
		form.submit();
	}
	
	function call_window(url)
	{
		showModelessDialog(url,window,"dialogWidth:750px;dialogHeight:600px;center:yes;help:no;resizable:no;status:no");
	}
</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25"><strong>&nbsp;<img src="image/21.gif" width="16" height="16" /> 求职信</strong> *内容不能为空</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="ter" style="margin-left:5px;margin-right:5px;">
    <form action="sendapply_save.asp?action=send&jid=<%=jid%>&cid=<%=cid%>" method="post" target="form_iframe" name="form0" >
  <tr > 
      <td class="ter2"><table width="100%" border="0" cellpadding="0" cellspacing="0">

        <tr>
          <td height="77" align="center"><textarea name="member_message" cols="50" rows="5"  id="member_message"></textarea></td>
        </tr>
      </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="right"><input name="formSubmit" type="button" id="formSubmit" onclick="submit_form(form0);" value=" 确认发送 " />
              <input type="button" name="Submit2" value=" 预览我的简历 " onclick="call_window('cn_person_preview.php');" />
              <input type="button" name="Submit2" value=" 取消 " onclick="window.close();" />
            &nbsp;</td>
          </tr>
        </table></td>
  </tr>
  </form>
</table>
<iframe width="0" height="0" name="form_iframe"></iframe>
</body>
