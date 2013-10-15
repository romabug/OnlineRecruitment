<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
dim uid
uid=request.cookies("01387job")("uid")
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387applypro] where uid='"&uid&"'" ,conn,1,1
set rs2=server.createobject("adodb.recordset")
rs2.open "select pic from [01387member] where uid='"&uid&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language=javascript>
function check()
{
if (document.form1.message.value=="")
{
alert("请输入留言内容！");
document.form1.message.focus();
return false;
}
}
function SureOut()
{
if (confirm("确定退出高级人才行列？"))
{
location.href="ApplyProOut.asp";
}
else
{
}
}
</script>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong><font color="#333333">申请高级人才</font></strong></td>
  </tr>
</table>
<br>
<br>
<br>
<br>
<br>
<%if  rs1.eof and rs1.bof then%>
<table width="600" border="0" align="center" cellpadding="3" cellspacing="1">
  <form name="form1" method="post" action="ApplyProGo.asp">
    <tr bgcolor="#FFEDD2">
      <td height="30" colspan="2"><div align="center"><strong>申请高级人才</strong></div></td>
    </tr>
    <tr bgcolor="#FFFAF0">
      <td width="166" height="26" bgcolor="#FFFAF0"><div align="right">个人相片：</div></td>
      <td width="431"><%if rs2(0)="" then%>
          <iframe src="ApplyPro_uploadpic.asp" width="450" height="28" frameborder="0" scrolling="no"></iframe>
        <%else%>
          <a href="upload/<%=rs2(0)%>" target="_blank"><img src="upload/<%=rs2(0)%>" width="145" height="200" style='border:1px solid #000000'></a><font color="#FF0000">(要修改相片，请从左边导航栏进入"上传相片"栏目)</font>
          <%end if%>
      </td>
    </tr>
    <tr bgcolor="#FFFAF0">
      <td height="26"><div align="right">身份证复印件：</div></td>
      <td width="431"><iframe src="ApplyPro_uploadidcard.asp" width="450" height="28" frameborder="0" scrolling="no"></iframe></td>
    </tr>
    <tr bgcolor="#FFFAF0">
      <td height="26"><div align="right">申请自荐：</div></td>
      <td><textarea name="message" cols="50" rows="6" class="input" id="message"></textarea></td>
    </tr>
    <tr bgcolor="#FFFAF0">
      <td height="26">&nbsp;</td>
      <td height="26"><font color="#FF0000">(申请高级人才，你的薪水要求不能为“面议”，否则将不予审核通过)</font></td>
    </tr>
    <tr bgcolor="#FFFAF0">
      <td height="26" colspan="2"><div align="center">
        <input type="submit" name="Submit" value="提 交 申 请" style="width=130;height:30;font-size=12px" onClick="return check()">
      </div></td>
    </tr>
  </form>
</table>
<%else%>
<%if rs1("passok")=3 then%>
<table width="600" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr bgcolor="#FFEDD2">
    <td height="30" colspan="2"><div align="center"><strong>您已经成为澳门劳工招聘网的高级人才</strong></div></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td width="226" height="26"><div align="right">申请时间</div></td>
    <td width="359"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("applytime")%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td height="26"><div align="right">审核时间</div></td>
    <td><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("passtime")%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td height="26" colspan="2"><div align="right">
      <input type="button" name="Submit2" value="退出高级人才行列" style="width=130;height:30;font-size=12px" onClick="return SureOut()">
      <font color="#FF0000"><strong>(谨慎使用！)</strong></font> </div></td>
  </tr>
</table>
<%else if rs1("passok")=2 then%>
<table width="600" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr bgcolor="#FFEDD2">
    <td height="30" colspan="2"><div align="center"><strong>您已经申请成过澳门劳工招聘网的高级人才<font color="#FF0000">（拒绝通过！）</font></strong></div></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td width="223" height="26"><div align="right">申请时间</div></td>
    <td width="362"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("applytime")%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td height="26"><div align="right">审核时间</div></td>
    <td><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("passtime")%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td height="26"><div align="right">拒绝理由</div></td>
    <td><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("refuse")%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td height="26" colspan="2"><div align="right">
      <input type="button" name="Submit22" value="退出申请" style="width=130;height:30;font-size=12px" onClick="return SureOut()">
    </div></td>
  </tr>
</table>
<%else%>
<table width="600" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr bgcolor="#FFEDD2">
    <td height="30" colspan="2"><div align="center"><strong>您已经提交申请澳门劳工招聘网的高级人才<font color="#FF0000">（等待审核）</font></strong></div></td>
  </tr>
  <tr bgcolor="#FFFAF0">
    <td width="222" height="26"><div align="right">申请时间</div></td>
    <td width="363"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("applytime")%></strong></font></td>
  </tr>
</table>
<%
	  end if
	  end if
	  end if
	  %></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
rs2.close
set rs2=nothing
conn.close
set conn=nothing
%>
