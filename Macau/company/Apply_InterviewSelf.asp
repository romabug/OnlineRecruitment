<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->
<%uid=request.QueryString("uid")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发送应聘通知</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#D4D0C8">
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr bgcolor="#EEEEEE">
    <td height="27" colspan="2" >&nbsp;<span class="win_"><img src="../images/90.gif" width="18" height="15" /></span>&nbsp;<strong>发送应聘通知</strong></td>
  </tr>
  <form action="Apply_InterviewSelf_save.asp?uid=<%=uid%>" method="post" target="form_iframe" name="form0">
    <tr >
      <td width="20%" height="30" align="right" >选择职位：</td>
      <td width="80%"><%set rs1=server.createobject("adodb.recordset")
	                  rs1.open"select jid,jobname from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"'",conn,1,1%>
          <%if rs1.eof and rs1.bof then
					  response.Write"<script language=javascript>alert('您没有发布招聘职位！');"
					  response.write"this.location.href='Myfavo.asp';</SCRIPT>"
					  response.end()
					  end if%>
          <select name="jid" class="input">
            <%do while not rs1.eof%>
            <option value="<%=rs1(0)%>"><%=rs1(1)%></option>
            <%rs1.movenext
		loop%>
          </select>      </td>
    </tr>
    <tr >
      <td align="right" >面试通知：</td>
      <td height="100"><textarea name="company_message" cols="45" rows="6" class="input" id="textarea">面试时间：
面试地点：
其它要求：
</textarea>
  <input name="uid" type="hidden" id="uid" value="<%=uid%>" /></td>
    </tr>
    <tr >
      <td height="43" colspan="2" align="center"><input name="formSubmit" type="button" id="formSubmit" onclick="submit_form(form0);" value=" 确认发送 " /> <input name="formSubmit2" type="button" onclick="window.close();" value=" 取消 " /></td>
    </tr>
  </form>
</table>
</body>
</html>
<iframe width="0" height="0" name="form_iframe"></iframe>
