<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/basicinfo.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top"><strong>求职意向</strong>管理</td>
  </tr><form name="form1" method="post" action="basicinfo_save_job.asp" onSubmit="return Juge(this)">
  <tr>
    <td>
      <br>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td width="15%" height="26" class="win2_update_table_td"><div align="right">应聘的行业(一)：</div></td>
          <td width="35%"><select name="maincatelog" class="input" id="select2" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
            <option value="0" >请选择</option>
            <option value="1" <%if rs("maincatelog")=1 then%>selected<%end if%>>饮食/餐厅/厨房</option>
            <option value="2" <%if rs("maincatelog")=2 then%>selected<%end if%>>商店/超市/商场</option>
            <option value="3" <%if rs("maincatelog")=3 then%>selected<%end if%>>博彩/酒店/旅游/服务</option>
            <option value="4" <%if rs("maincatelog")=4 then%>selected<%end if%>>运输业/飞机场/物流</option>
            <option value="5" <%if rs("maincatelog")=5 then%>selected<%end if%>>资讯科技/电脑/通讯</option>
            <option value="6" <%if rs("maincatelog")=6 then%>selected<%end if%>>广告/媒体/出版/设计</option>
            <option value="7" <%if rs("maincatelog")=7 then%>selected<%end if%>>水/电/气/空调/电梯</option>
            <option value="8" <%if rs("maincatelog")=8 then%>selected<%end if%>>汽车维修/汽车美容</option>
            <option value="9" <%if rs("maincatelog")=9 then%>selected<%end if%>>建筑/装修/杂工</option>
            <option value="10" <%if rs("maincatelog")=10 then%>selected<%end if%>>保姆/家政/保安</option>
            <option value="11" <%if rs("maincatelog")=11 then%>selected<%end if%>>理发/美容/按摩</option>
            <option value="12" <%if rs("maincatelog")=12 then%>selected<%end if%>>演艺/模特/娱乐业</option>
            <option value="13" <%if rs("maincatelog")=13 then%>selected<%end if%>>会展/公关/推广</option>
            <option value="14" <%if rs("maincatelog")=14 then%>selected<%end if%>>工厂/制造业</option>
            <option value="15" <%if rs("maincatelog")=15 then%>selected<%end if%>>园林/公园维护</option>
            <option value="16" <%if rs("maincatelog")=16 then%>selected<%end if%>>进出口/贸易</option>
            <option value="17" <%if rs("maincatelog")=17 then%>selected<%end if%>>外语/翻译/传译</option>
            <option value="18" <%if rs("maincatelog")=18 then%>selected<%end if%>>金融/拍卖/保险</option>
            <option value="19" <%if rs("maincatelog")=19 then%>selected<%end if%>>教育/培训</option>
            <option value="20" <%if rs("maincatelog")=20 then%>selected<%end if%>>健美/护理/医疗</option>
            <option value="21" <%if rs("maincatelog")=21 then%>selected<%end if%>>咨询/中介/法律</option>
            <option value="22" <%if rs("maincatelog")=22 then%>selected<%end if%>>综合文职/行政</option>
            <option value="23" <%if rs("maincatelog")=23 then%>selected<%end if%>>高级/综合管理</option>
            <option value="24" <%if rs("maincatelog")=24 then%>selected<%end if%>>其它技术工种</option>
          </select>
                <font color="#FF0000">*</font></td>
          <td width="15%" class="win2_update_table_td"><div align="right">具体职位(一)：</div></td>
          <td width="35%"><SELECT name="subcatelog" class="input" id="select3">
            <option value="<%=rs("subcatelog")%>"><%=rs("subcatelog")%></option>
          </SELECT>
                <font color="#FF0000">*</font></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">应聘的行业(二)：</div></td>
          <td><select name="maincatelog2" class="input" id="maincatelog2" onChange="javascript:selectjob(this, document.form1.subcatelog2)" >
            <option value="0" >请选择</option>
            <option value="1" <%if rs("maincatelog2")=1 then%>selected<%end if%>>饮食/餐厅/厨房</option>
            <option value="2" <%if rs("maincatelog2")=2 then%>selected<%end if%>>商店/超市/商场</option>
            <option value="3" <%if rs("maincatelog2")=3 then%>selected<%end if%>>博彩/酒店/旅游/服务</option>
            <option value="4" <%if rs("maincatelog2")=4 then%>selected<%end if%>>运输业/飞机场/物流</option>
            <option value="5" <%if rs("maincatelog2")=5 then%>selected<%end if%>>资讯科技/电脑/通讯</option>
            <option value="6" <%if rs("maincatelog2")=6 then%>selected<%end if%>>广告/媒体/出版/设计</option>
            <option value="7" <%if rs("maincatelog2")=7 then%>selected<%end if%>>水/电/气/空调/电梯</option>
            <option value="8" <%if rs("maincatelog2")=8 then%>selected<%end if%>>汽车维修/汽车美容</option>
            <option value="9" <%if rs("maincatelog2")=9 then%>selected<%end if%>>建筑/装修/杂工</option>
            <option value="10" <%if rs("maincatelog2")=10 then%>selected<%end if%>>保姆/家政/保安</option>
            <option value="11" <%if rs("maincatelog2")=11 then%>selected<%end if%>>理发/美容/按摩</option>
            <option value="12" <%if rs("maincatelog2")=12 then%>selected<%end if%>>演艺/模特/娱乐业</option>
            <option value="13" <%if rs("maincatelog2")=13 then%>selected<%end if%>>会展/公关/推广</option>
            <option value="14" <%if rs("maincatelog2")=14 then%>selected<%end if%>>工厂/制造业</option>
            <option value="15" <%if rs("maincatelog2")=15 then%>selected<%end if%>>园林/公园维护</option>
            <option value="16" <%if rs("maincatelog2")=16 then%>selected<%end if%>>进出口/贸易</option>
            <option value="17" <%if rs("maincatelog2")=17 then%>selected<%end if%>>外语/翻译/传译</option>
            <option value="18" <%if rs("maincatelog2")=18 then%>selected<%end if%>>金融/拍卖/保险</option>
            <option value="19" <%if rs("maincatelog2")=19 then%>selected<%end if%>>教育/培训</option>
            <option value="20" <%if rs("maincatelog2")=20 then%>selected<%end if%>>健美/护理/医疗</option>
            <option value="21" <%if rs("maincatelog2")=21 then%>selected<%end if%>>咨询/中介/法律</option>
            <option value="22" <%if rs("maincatelog2")=22 then%>selected<%end if%>>综合文职/行政</option>
            <option value="23" <%if rs("maincatelog2")=23 then%>selected<%end if%>>高级/综合管理</option>
            <option value="24" <%if rs("maincatelog2")=24 then%>selected<%end if%>>其它技术工种</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">具体职位(二)：</div></td>
          <td><SELECT name="subcatelog2" class="input" id="subcatelog2">
            <option value="<%=rs("subcatelog2")%>"><%=rs("subcatelog2")%></option>
          </SELECT></td>
        </tr>
        <tr >
          <td height="26" class="win2_update_table_td"><div align="right">最适合的职位：</div></td>
          <td><input name="jobname" type="text" class="input" id="jobname" value="<%=rs("jobname")%>">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">全职/兼职：</div></td>
          <td><select name="jobtype" class="input" id="jobtype">
            <option value=1 <%if rs("jobtype")=1 then%>selected<%end if%>>全职</option>
            <option value=2 <%if rs("jobtype")=2 then%>selected<%end if%>>兼职</option>
            <option value=3 <%if rs("jobtype")=3 then%>selected<%end if%>>都可以</option>
          </select></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">薪水要求：</div></td>
          <td><select name="salary" class="input" id="salary">
            <option value="0" <%if rs("salary")=0 then%>selected<%end if%>>面议</option>
            <option value="1" <%if rs("salary")=1 then%>selected<%end if%>>3000以下</option>
            <option value="2" <%if rs("salary")=2 then%>selected<%end if%>>3000-4000</option>
            <option value="3" <%if rs("salary")=3 then%>selected<%end if%>>4000-5000</option>
            <option value="4" <%if rs("salary")=4 then%>selected<%end if%>>5000-7000</option>
            <option value="5" <%if rs("salary")=5 then%>selected<%end if%>>7000以上</option>
          </select>            
            (元/月)</td>
          <td class="win2_update_table_td"><div align="right">住房要求：</div></td>
          <td><select name="workhouse" class="input" id="workhouse">
            <option value="面议协商" <%if rs("workhouse")="面议协商" then%>selected<%end if%>>面议协商</option>
            <option value="公司提供" <%if rs("workhouse")="公司提供" then%>selected<%end if%>>公司提供</option>
            <option value="自行解决" <%if rs("workhouse")="自行解决" then%>selected<%end if%>>自行解决</option>
          </select></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">到岗时间：</div></td>
          <td colspan="3" ><select name="checkindate" class="input" id="checkindate">
            <option value="0">请选择</option>
            <option value="1" <%if rs("checkindate")=1 then%>selected<%end if%>>随时到岗</option>
            <option value="2" <%if rs("checkindate")=2 then%>selected<%end if%>>三天内</option>
            <option value="3" <%if rs("checkindate")=3 then%>selected<%end if%>>一周内</option>
            <option value="4" <%if rs("checkindate")=4 then%>selected<%end if%>>一个月内</option>
            <option value="5" <%if rs("checkindate")=5 then%>selected<%end if%>>三个月内</option>
            <option value="6" <%if rs("checkindate")=6 then%>selected<%end if%>>面议协商</option>
          </select>
                <font color="#FF0000">*</font></td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认发送</button>
          </td>
        </tr>
      </table>
    </td>
  </tr></form>
</table><br />
</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%call closeconn()%>
