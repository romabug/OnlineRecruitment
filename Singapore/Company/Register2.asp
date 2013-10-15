<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Username,Password,Comid,Question,Answer,Email
Username = Replace_text(Request.Form("username")) '//用户名
Password = Replace_text(Request.Form("password")) '//密码
Randomize timer
znum = cint(8999*Rnd+1000)
Comid = "VR"&gen_key(10)&znum                     '//会员ID
Question = Replace_text(Request.Form("question")) '//问题提示
Answer = Replace_text(Request.Form("answer"))     '//提示答案
Email = Replace_text(Request.Form("mailbox"))       '//电子邮件
Cityid = Replace_text(Request.Form("Cityid"))       '//地区站点

Dim Agree
'//检验用户是否同意用户协议
Agree = Replace_text(request.form("agree"))
If Agree = "" Then
  Response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，您没有同意用户服务协议,请重新注册...');history.back(-1);</script>"
  Response.end
End if

Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,comid From [pH_Company_Base] Where username='"&username&"' or Email='"&Email&"' or comid='"&comid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("comid")=comid then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 
CloseRs


 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 企业会员注册</title>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>
<script language="JavaScript" src="../js/Company_Register2.js"></script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_reg.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="50%" height="75" valign="bottom"><img src="../Images/reg_01.gif" width="280" height="67"></td>
                <td width="50%" valign="bottom"><img src="../Images/reg2_3.gif" width="380" height="54"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><br>
          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="25"><STRONG 
            class=font14b STYLE1>第二步 详细资料</STRONG>（说明：带“<FONT 
            color=#ff0000>*</FONT>”号的为必填项）</td>
              </tr>
            </table>
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
              <form action="Register_Ok.asp" name="reg" method="POST" onSubmit="return check_reg();">
                <tr> 
                  <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                      <tr> 
                        <td valign="top" bgcolor="#FFFFFF"> <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                            <TBODY>
                              <TR> 
                                <TD class=font-14 height=3></TD>
                              </TR>
                              <TR> 
                                <TD class=font-14 bgColor=#999999 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>基本资料</strong></FONT></TD>
                              </TR>
                              <TR> 
                                <TD bgColor=#e2e2e2 height=2></TD>
                              </TR>
                            </TBODY>
                          </TABLE>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 企业名称：</td>
                              <td height="30"> <input name="companyname" type="text" id="companyname" size="50" maxlength="50" style="width:200px;">
                                如：<%= Cls_WebName %></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" >证件号码：</td>
                              <td height="30" > <input name="licence" type="text" size="25" maxlength="25" style="width:200px;"> 
                                <font color="#50463d">企业的营业执照等</font> </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 所属行业：</td>
                              <td height="30"> <select name="industry" id="industry" style="width:200px;">
                                  <option value="1">互联网、电子商务</option>
                                  <option value="2">计算机业（软件、数据库、系统集成）</option>
                                  <option value="3">计算机业（硬件、网络设备）</option>
                                  <option value="4">电子、微电子技术</option>
                                  <option value="5">通讯、电信业</option>
                                  <option value="6">家电业</option>
                                  <option value="7">批发零售(百货、超市、专卖店)</option>
                                  <option value="8">贸易、商务、进出口</option>
                                  <option value="9">电气</option>
                                  <option value="10">电力、能源、矿产业</option>
                                  <option value="11">石油、化工业</option>
                                  <option value="12">生物工程、制药、环保</option>
                                  <option value="13">机械制造、机电设备、重工业</option>
                                  <option value="14">汽车、摩托车</option>
                                  <option value="15">仪器仪表、电工设备</option>
                                  <option value="16">广告、公关、设计</option>
                                  <option value="17">媒体、影视制作、新闻出版</option>
                                  <option value="18">艺术、文化传播</option>
                                  <option value="19">快速消费品（食品、饮料、粮油、化妆品、烟酒）</option>
                                  <option value="20">纺织品业（服饰、鞋类、家纺用品、皮具）</option>
                                  <option value="21">咨询业（顾问、会计师、审计师、法律）</option>
                                  <option value="22">金融业（投资、保险、证券、银行、基金）</option>
                                  <option value="23">建筑、房地产、物业管理、装潢</option>
                                  <option value="24">餐饮、娱乐、酒店</option>
                                  <option value="25">运输、物流、快递</option>
                                  <option value="26">旅游业</option>
                                  <option value="27">办公设备、文化体育休闲用品、家居用品</option>
                                  <option value="28">印刷、包装、造纸</option>
                                  <option value="29">生产、制造、加工</option>
                                  <option value="30">教育、培训、科研院所</option>
                                  <option value="31">医疗、保健、卫生服务</option>
                                  <option value="32">人才交流、中介</option>
                                  <option value="33">协会、社团、政府公用事业、社区服务</option>
                                  <option value="34">农、林、牧、副、渔业</option>
                                  <option value="35">其他</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 企业性质：</td>
                              <td height="30" > <select name="properity" style="width:120px;">
                                  <option value="1">国有企业</option>
                                  <option value="2">外资企业</option>
                                  <option value="3">合资企业</option>
                                  <option value="4">私营企业</option>
                                  <option value="5">民营企业</option>
                                  <option value="6">股份制企业</option>
                                  <option value="7">集体企业</option>
                                  <option value="8">集体事业</option>
                                  <option value="9">乡镇企业</option>
                                  <option value="10">行政机关</option>
                                  <option value="11">社会团体</option>
                                  <option value="12">事业单位</option>
                                  <option value="13">跨国企业</option>
                                  <option value="14">其他</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 成立日期：</td>
                              <td height="30"> <input name="set_year" type="text" size="4" maxlength="4">
                                年 
                                <select name="set_month">
                                  <%for i=1 to 12%>
                                  <option  value="<%=i%>"><%=i%></option>
                                  <%next%>
                                </select>
                                月 
                                <select name="set_day">
                                  <%for i=1 to 31%>
                                  <option value="<%=i%>"><%=i%></option>
                                  <%next%>
                                </select>
                                日 </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 注册资金：</td>
                              <td height="30" > <input name="reg_currency" type="text" size="25" maxlength="25" style="width:100px;">
                                万元 
                                <select name="currencytype" id="currencytype" style="width:80px;">
                                  <option value="1">人民币</option>
                                  <option value="2">美元</option>
                                  <option value="3">欧元</option>
                                  <option value="4">英镑</option>
                                  <option value="5">港币</option>
                                  <option value="6">台币</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 员工人数：</td>
                              <td height="30"> <select name="workers" id="workers" style="width:100px;">
                                  <OPTION value=9>10人以下</OPTION>
                                  <OPTION value=49>10～50人</OPTION>
                                  <OPTION value=199>50～200人</OPTION>
                                  <OPTION value=499>200～500人</OPTION>
                                  <OPTION value=999>500～1000人</OPTION>
                                  <OPTION value=1000>1000人以上</OPTION>
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 企业所在地区：</td>
                              <td height="30" >
                                <!--#include file="../Include/Class_Locus.asp" -->
                              </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 企业简介：</td>
                              <td height="30"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="70%"><textarea name="company_memo" cols="50" rows="8" id="company_memo"></textarea></td>
                                    <td><font color="#50463d">最大字符数5000,请尽可能详细填写资料，以确保贵公司资料顺利通过本网审核！包括：公司基本资料+产品或服务+经营业绩等</font></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table>
                          <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                            <TBODY>
                              <TR> 
                                <TD class=font-14 height=3></TD>
                              </TR>
                              <TR> 
                                <TD class=font-14 bgColor=#999999 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>联系方式</strong></FONT></TD>
                              </TR>
                              <TR> 
                                <TD bgColor=#e2e2e2 height=2></TD>
                              </TR>
                            </TBODY>
                          </TABLE>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 联系人：</td>
                              <td height="30"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;"> 
                                <font color="#50463d">请输入正确联系人，以方便求职者与贵公司联系，如：王小姐或张先生</font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 联系电话：</td>
                              <td height="30" ><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
                                <input name="phonekeep" type="checkbox" id="phonekeep" value="1"> 
                                <font color="#333333">屏蔽电话</font><font color="#50463d"> 
                                [固定电话号码，如：010-82615888] </font> </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">传真号码：</td>
                              <td height="30"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30"> 
                              </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 电子邮件：</td>
                              <td height="30" > <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"> 
                                <input name="emailkeep" type="checkbox" id="emailkeep" value="1">
                                屏蔽邮件地址 </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">企业网站：</td>
                              <td height="30"> <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 邮政编码：</td>
                              <td height="30" > <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                              </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> 通讯地址：</td>
                              <td height="30"> <input name="address" type="text" size="100" style="width:260px;">
                                如：北京市海淀区成府路××号 </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="40" align="center"> <input type="hidden" name="username" value="<%= username %>"> 
                    <input type="hidden" name="password" value="<%= password %>"> 
					<input type="hidden" name="cityid" value="<%= Cityid %>">
                    <input type="hidden" name="comid" value="<%= comid %>"> 
					<input type="hidden" name="question" value="<%= question %>"> 
                    <input type="hidden" name="answer" value="<%= answer %>"> 
                    <input type="submit" name="Submit" value=" 完 成 注 册 " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table></td></tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 
CloseDB
 %>
