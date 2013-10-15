<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
  response.Redirect("reg_one.asp")
  response.End()
end if 
session("username")=request.Form("username")
session("pwd1")=request.form("pwd1")
session("password")=md5(request.Form("pwd1"))
'session("question")=request.Form("question")
'session("answer")=request.Form("answer")
session("email")=request.Form("email")
session("cid")=gen_key(7)
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from [01387company] where cid='"&session("cid")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
session("cid")=gen_key(7)
rs.close
set rs=nothing
end if
if session("username")="" or session("password")=""   then
response.Redirect("reg_one.asp")
response.End()
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from [01387company] where username='"&session("username")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.write"<SCRIPT language=JavaScript>alert('用户帐号已经存在，请重新选择！');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册企业会员</title>
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>

<table width="766" height="8" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" id="AutoNumber35" style="border-collapse: collapse">
  <tr> 
   <td width="776" height="8"></td>
  </tr>
</table>
  <center>
  <table width="776" border="0" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" style="border-collapse: collapse">
<form name="form1" action="reg_two_save.asp" method="post" onSubmit="return Juge(this)">      <tr> 
        <td width="96%" height="638" valign="top"> <div align="right"> <font color="#009900" face="Verdana" style="font-size: 14px" > 
            <strong> </strong></font><font color="#000000" face="Verdana" style="font-size: 12px" >
            </font></div>
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999">
            <tr>
              <td height="521" bgcolor="#FFFFFF"><table width="100%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="21" align="left" bgcolor="#999999"><font color="#FFFFFF" face="Verdana" style="font-size: 14px" >
                      <p style="margin-left:10px;margin-top:3px;font-size: 14px"> <strong> <b>基本信息</b> </strong> </p>
                    </font> </td>
                  </tr>
                  <tr>
                    <td height="2" bgcolor="#E2E2E2"></td>
                  </tr>
                </table>
                  <br />
                  <table width="100%" height="234" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
                  <tr bgcolor="#FFFFFF"> 
                    <td height="30" align="right" bgcolor="#F6F9FD"> 用户帐号： </td>
                    <td height="20" align="left" bgcolor="#F6F9FD"><input name="username" type="text" class="input" id="username" size="20"  maxlength="20" onkeypress="return regInput(this,'username',5);" onpaste="return regInput(this,'username',true);" /> 
                    </td>
                    <td align="left" bgcolor="#F6F9FD">&nbsp; </td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td height="25" align="right" nowrap="nowrap" bgcolor="#F6F9FD"> 
                      公司名称： </td>
                    <td height="20" align="middle" bgcolor="#F6F9FD"><p align="left"> 
                        <input name="companyname" type="text" class="input" size="38" maxlength="200" />
                      </p></td>
                    <td width="315" height="20" align="left" bgcolor="#F6F9FD"><font color="#666666">&nbsp; 
                      </font> </td>
                  </tr>
                  <tr> 
                    <td align="right" width="107" bgcolor="#ffffff" height="25"> 
                      信息来源： </td>
                    <td width="308" height="20" align="middle" bgcolor="#ffffff"><p align="left"> 
                        <input name="licence" type="text" class="input" id="licence" size="38" maxlength="80" />
                      </p></td>
                    <td width="315" height="20" align="left" bgcolor="#ffffff"><font color="#666666">可选择填写</font></td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td height="25" align="right"><span style="FONT-SIZE: 12px; FONT-FAMILY: 宋体"> 
                      所属行业： </span> </td>
                    <td width="308" height="20" align="middle"><p align="left"> 
                        <select name="trade" size="1" class="input" id="trade" style="width: 240px; font-size: 12px; font-family: 宋体">
                          <script language="JavaScript" type="text/javascript">writeTrade()</script>
                        </select>
                      </p></td>
                    <td width="315" height="20" align="left">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td height="25" align="right" nowrap="nowrap"> 公司简介： </td>
                    <td height="20" colspan="2" align="middle"><div align="left"><span style="FONT-SIZE: 12px; FONT-FAMILY: 宋体"><font color="#FF0000">*</font><font color="#666666">( 
                        最大字符数5000,请尽可能详细填写资料。</font></span>) 　</div></td>
                  </tr>
                  <tr> 
                    <td width="107" height="68" align="left">　</td>
                    <td height="68" colspan="2" align="left" valign="top"><textarea name="intro" cols="64" rows="4" class="input" id="intro">本公司急招以下人员赴澳门工作</textarea> 
                      <span style="FONT-SIZE: 12px; FONT-FAMILY: 宋体"> </span></td>
                  </tr>
                </table>
                <br />
                  <table width="100%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="21" align="left" bgcolor="#999999"><font color="#FFFFFF" face="Verdana" style="font-size: 14px" >
                        <p style="margin-left:10px;margin-top:3px;font-size: 14px"> <strong><b>联系方式</b></strong> </p>
                      </font> </td>
                    </tr>
                    <tr>
                      <td height="2" bgcolor="#E2E2E2"></td>
                    </tr>
                  </table>
                <br />
                  <table width="100%" height="200" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
                  <tr> 
                    <td width="105" height="25" align="right"> 联 系 人： </td>
                    <td width="387" height="18" align="middle"><p align="left"> 
                        <input name="contact" type="text" class="input" id="contact" size="28" maxlength="50" />
                      </p></td>
                    <td width="238" align="left"><div align="left"> </div></td>
                  </tr>
                  <tr bgcolor="#F6F9FD">
                    <td height="25" align="right">电子邮件：</td>
                    <td height="22" align="middle" bgcolor="#F6F9FD"><input name="email" type="text" class="input" id="email" size="28" maxlength="50" /></td>
                    <td align="left" bgcolor="#F6F9FD">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td height="25" align="right"> 联系电话： </td>
                    <td height="22" align="middle" bgcolor="#F6F9FD"><p align="left"> 
                        <input name="tel" type="text" class="input" id="tel" size="28" maxlength="50" />
                      </p></td>
                    <td width="238" align="left" bgcolor="#F6F9FD"><div align="left"> 
                      </div></td>
                  </tr>
                  <tr> 
                    <td align="right" height="25">手 机： </td>
                    <td align="middle" height="22"><div align="left"> 
                        <input name="mobile" type="text" class="input" id="mobile3" size="28" maxlength="50" />
                      </div></td>
                    <td width="238" align="left">　 </td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td align="right" height="25"> 传 真：</td>
                    <td height="22" align="middle" bgcolor="#F6F9FD"><p align="left"> 
                        <input name="fax" type="text" class="input" id="fax2" size="28" maxlength="50" />
                      </p></td>
                    <td width="238" align="left" bgcolor="#F6F9FD">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td align="right" height="25">公司主页：</td>
                    <td align="middle" bgcolor="#FFFFFF" height="1"><p align="left"> 
                        <input name="website" type="text" class="input" id="website" value="Http://" size="38" maxlength="50" />
                      </p></td>
                    <td align="middle" bgcolor="#FFFFFF">　</td>
                  </tr>
                  <tr bgcolor="#F6F9FD"> 
                    <td height="25" align="right" nowrap="nowrap"> 通讯地址： </td>
                    <td height="19" colspan="2" align="middle" bgcolor="#F6F9FD"><p align="left"> 
                        <font color="#000000"> 
                        <select name="province" id="province" onchange="javascript:selectcitys(this, document.form1.citys)" >
                          <option value="" selected="selected" >请选择</option>
                          <option value="1" >北京</option>
                          <option value="2" >天津</option>
                          <option value="3" >上海</option>
                          <option value="4" >重庆</option>
                          <option value="5" >浙江</option>
                          <option value="6" >广东</option>
                          <option value="7" >江苏</option>
                          <option value="8" >福建</option>
                          <option value="9" >湖南</option>
                          <option value="10" >湖北</option>
                          <option value="11" >山东</option>
                          <option value="12" >辽宁</option>
                          <option value="13" >吉林</option>
                          <option value="14" >云南</option>
                          <option value="15" >四川</option>
                          <option value="16" >安徽</option>
                          <option value="17" >江西</option>
                          <option value="18" >黑龙江</option>
                          <option value="19" >河北</option>
                          <option value="20" >陕西</option>
                          <option value="21" >海南</option>
                          <option value="22" >河南</option>
                          <option value="23" >山西</option>
                          <option value="24" >内蒙古</option>
                          <option value="25" >广西</option>
                          <option value="26" >贵州</option>
                          <option value="27" >宁夏</option>
                          <option value="28" >青海</option>
                          <option value="29" >新疆</option>
                          <option value="30" >西藏</option>
                          <option value="31" >甘肃</option>
                          <option value="32" >台湾</option>
                          <option value="33" >香港</option>
                          <option value="34" >澳门</option>
                          <option value="35" >国外</option>
                          <option value="36">其他</option>
                        </select>
                        ( 省、市)<font color="#FF0000"> 
                        <select name="citys" id="citys">
                        </select>
                        </font>(市、区) 
                        <input name="address" type="text" class="input" size="30" maxlength="50"/>
                        </font> </p></td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td height="25" align="right" nowrap="nowrap"> 邮&nbsp;&nbsp;&nbsp; 
                      编： </td>
                    <td height="10" align="middle" bgcolor="#FFFFFF"><p align="left"> 
                        <input name="zipCode" type="text" class="input" size="8" maxlength="6"/>
                      </p></td>
                    <td width="238" align="middle" bgcolor="#FFFFFF">&nbsp;</td>
                  </tr>
                </table>
                
              </td>
            </tr>
          </table>
          <p align="center"> 　 
            <button accesskey="K" type="submit" class="win_"><img src="../images/203.gif" width="16" height="16" /> 提交注册</button>
            &nbsp; &nbsp;&nbsp; 
            <input type="reset" value="发布职位 " name="Reset"  style="HEIGHT: 30px; width:120px; font-family: 宋体; font-size: 14px">
            <br />
            <br />
            <br />
          </p></td>
      </tr></form>
    </table>
  </center>
<table width="766" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF">
  <tr><td></td></tr>
      </table>
<!--#include file="bottom.asp"-->
</body>
</html>
<%conn.close
set conn=nothing%>
