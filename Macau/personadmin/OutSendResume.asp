<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call ShowError("即将推出！")
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select companyname,needjobname,email,sendtime,otherdemand,id from [01387sendresume] where uid='"&request.cookies("01387job")("uid")&"' order by id desc" ,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网</title>
<link href="../style/591.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="inc/page15.inc"-->
<script language="JavaScript">
function confirmdel(id){
  if (confirm("确定要删除吗?")) 
  window.location.href="OutSendResume_del.asp?page=<%=currentpage%>&id="+id+""
} 
var x=0
function showMsg(msg,bl){
try{
  zb=eval('document.all.'+msg+'.style');
   
zb.display =(bl?'inline':'none')

}catch(e){}

}
</script>
<!--#include file="top.asp"-->
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="26" valign="bottom" background="../images/neiye_02.gif"> <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="346" height="22">当前位置：<a href="../index.asp">澳门劳工招聘网</a> → <a href="../person/">个人会员管理中心</a> 
            → 简历外发</td>
          <td width="414"><font color="#FF3300"> 
            <!--#include file="../inc/gonggao1.asp"-->
            </font></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="1" background="../images/x2.gif"></td>
  </tr>
</table>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="161" valign="top" background="../images/neiye_08.gif"> 
    <!--#include file="inc/left.asp"-->  
    </td>
    <td width="616" valign="top">
<table width="617" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="9" height="34" background="../images/neiye_06.gif">&nbsp;</td>
          <td width="608" background="../images/neiye_06.gif"><!--#include file="welcome.asp"--></td>
        </tr>
      </table>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
                <td background="../img/bar_bg.gif"><strong><font color="#333333">简历外发</font></strong></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="center"> 
            <form name="form1" method="post" action="OutSendResumeGo.asp">
              <table width="600" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td height="36" colspan="2"><font color="333333">外发简历是以您在本站上的简历风格（<a href="ViewResume.asp" target="_blank"><u><font color="#FF3300">预览简历效果</font></u></a>），对您在网站、报刊、杂志等媒体上筛选的招聘信息，统一进行求职申请！</font></td>
                </tr>
                <tr> 
                  <td width="203" height="26"><div align="right">请输入该企业的E-MAIL地址：</div></td>
                  <td width="389"> <p> 
                      <input name="email" type=text class="input" size="30">
                      <font color="#FF0000">*</font>（企业邮件地址）</p></td>
                </tr>
                <tr> 
                  <td height="26"><div align="right">请输入您应聘的职位名称：</div></td>
                  <td><input name="needjobname" type=text class="input" id="needjobname" size="30"> 
                    <font color="#FF0000">*</font>（职位名称） </td>
                </tr>
                <tr> 
                  <td height="26"><div align="right">请输入您应聘的企业名称：</div></td>
                  <td><input name="companyname" type=text class="input" id="companyname" size="30">
                    （仅作备忘,可以不填）</td>
                </tr>
                <tr> 
                  <td valign="top"><p align="right" style="margin-top:3">请输入您的其它说明/要求：</td>
                  <td><textarea name="otherdemand" cols="60" rows="4" class="input" id="otherdemand"></textarea></td>
                </tr>
              </table>
              <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="60" align="center"> <input type="submit" name="Submit" value="确 定 发 送" style="width=130;height=30"> 
                    &nbsp; <input type="reset" name="Submit2" value=" 重 置 " style="width=80;height=30"> 
                  </td>
                </tr>
              </table>
            </form>
            <table width="600" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFD89D">
              <tr align="center" bgcolor="#FFEDD2"> 
                <td width="137" height="26">公司名称<font color="#FF0000">&nbsp;</font></td>
                <td width="86">职位名称</td>
                <td width="168"><font face="Verdana, Arial, Helvetica, sans-serif">接收E-mail</font></td>
                <td width="57">其他要求</td>
                <td width="62">发送时间</td>
                <td width="47">操作</td>
              </tr>
              <%if rs1.eof and rs1.bof then%>
              <tr bgcolor="#FFFFFF"> 
                <td height="24" colspan="6"><div align="center"><strong><font color="#FF3300">暂时没有信息！</font></strong></div></td>
              </tr>
              <%end if%>
              <%
					  i=1
					  do while not rs1.eof
					  if i mod 2 = 0 then
					  bg="bgcolor=#ffffff" 
					  '如果是背景图片,即 
					  'bg="background=""image/*.*"""
					  else
					  bg="bgcolor=#FFFAF0"
					  end if
					  %>
              <tr <%=bg%>> 
                <td height="28"><div align="center"><%=rs1(0)%></div></td>
                <td><div align="center"><%=rs1(1)%></div></td>
                <td><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(2)%></font></div></td>
                <td><div align="center"><a style="cursor:hand" onclick="javascript:showMsg('zb<%=rs1(5)%>',x=1-x)"><font color="#FF0000">点击查看</font></a></div></td>
                <td> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(3)%></font></div></td>
                <td><div align="center"><a href="javascript:confirmdel(<%=rs1(5)%>)"><font color="#FF3300">删除</font></a> 
                  </div></td>
              </tr>
              <tr <%=bg%>  id="zb<%=rs1(5)%>" style="display:none"> 
                <td height="28" colspan="6"><%=rs1(4)%></td>
              </tr>
              <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"> </td>
              </tr>
            </table>
            <%Call PageGo2("OutSendResume","")%>
            <table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="../inc/bottom.asp"-->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
