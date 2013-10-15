<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
dim chkNO,cid
chkNO=request("chkNO")
cid=request("cid")
if chkNO="" then
Call ShowError("请选择一个职位！")
end if
Call RsName(rs,"select * from [01387joblist] where jid='"&ChkNo&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/editjobs.js"></SCRIPT>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="EditJob_Save.asp">
    <tr> 
      <td background="image/admin_bg_1.gif" height="25" colspan="2"><div align="center"><strong><font color="#FFFFFF">招　聘　职　位 
          详 细 信 息 ( 收到 <font color="#FFFF00"> 
          <%	Call RsName(rs_jid,"select count(*) from [01387applylist] where  jid='"&ChkNo&"'"  ,1,1) %>
          <%=rs_jid(0)%></font> 个简历 )</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">状态：</div></td>
      <td height="30"><%if rs("canshow")="no" then%> <strong><font color="#FF0000">关闭</font></strong> <%else%> <strong><font color="#0000FF">开放</font></strong> <%end if%> &nbsp;&nbsp; <%if rs("overtime")<date() then%> <font color="#FF0000"><strong>招聘时间已经到期</strong></font> <%else%> <font color="#0000FF"><strong>招聘时间有效期内</strong></font> <%end if%> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">岗位类别：</div></td>
      <td height="30"> <font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <!--  新的大类列表 -->
        <select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
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
        <SELECT name="subcatelog" class="input" id="subcatelog">
          <option value="<%=rs("subcatelog")%>"><%=rs("subcatelog")%></option>
        </SELECT>
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="23%" height="26"><div align="right">招聘职位：</div></td>
      <td width="77%"><font color="#000000"> 
        <input name="jobname" class="input" style="font-size: 12px" value="<%=rs("jobname")%>" size="40" maxlength="60">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right"><font color="#000000">招聘人数：</font></div></td>
      <td> <font color="#000000"> 
        <input name="neednum" class="input" value="<%=rs("neednum")%>" size="6" maxlength="5">
        人</font>  </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">截止日期： </div></td>
      <td> </font><font color="#000000">
        <input name="overtime" class="input" value="<%=rs("overtime")%>" size="18" maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26"><div align="right">学&nbsp;&nbsp;&nbsp; 历：</div></td>
      <td height="18"><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">
        <select name="degree" class="input" id="degree">
          <option value="0" <%if rs("degree")=0 then%>selected<%end if%>>高中以下</option>
          <option value="1" <%if rs("degree")=1 then%>selected<%end if%>>高中</option>
          <option value="2" <%if rs("degree")=2 then%>selected<%end if%>>职高</option>
          <option value="3" <%if rs("degree")=3 then%>selected<%end if%>>中专</option>
          <option value="4" <%if rs("degree")=4 then%>selected<%end if%>>大专</option>
          <option value="5" <%if rs("degree")=5 then%>selected<%end if%>>本科</option>
          <option value="6" <%if rs("degree")=6 then%>selected<%end if%>>硕士</option>
          <option value="7" <%if rs("degree")=7 then%>selected<%end if%>>博士</option>
        </select>
        及以上</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">工作地区<font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">：</font> 
        </div></td>
      <td height="18"><font color="#000000">
        <input name="jobcity" class="input" value="<%=rs("jobcity")%>" size="18" maxLength="15">
        </font> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">工作经验：</div></td>
      <td height="21"><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <select name="doneyear" class="input" id="doneyear">
          <option value="0" <%if rs("doneyear")=0 then%>selected<%end if%>>应届毕业生</option>
          <option value="1" <%if rs("doneyear")=1 then%>selected<%end if%>>1年</option>
          <option value="2" <%if rs("doneyear")=2 then%>selected<%end if%>>2年</option>
          <option value="3" <%if rs("doneyear")=3 then%>selected<%end if%>>3年</option>
          <option value="4" <%if rs("doneyear")=4 then%>selected<%end if%>>4年</option>
          <option value="5" <%if rs("doneyear")=5 then%>selected<%end if%>>5年</option>
          <option value="6" <%if rs("doneyear")=6 then%>selected<%end if%>>6年</option>
          <option value="7" <%if rs("doneyear")=7 then%>selected<%end if%>>7年</option>
          <option value="8" <%if rs("doneyear")=8 then%>selected<%end if%>>8年</option>
          <option value="9" <%if rs("doneyear")=9 then%>selected<%end if%>>9年</option>
          <option value="10" <%if rs("doneyear")=10 then%>selected<%end if%>>10年</option>
        </select>
        年及以上</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别： </div></td>
      <td height="21"> <font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <select name="sex" size="1" class="input">
          <option value="3" <%if rs("sex")=3 then%>selected<%end if%>>不限</option>
          <option value="1" <%if rs("sex")=1 then%>selected<%end if%>>男</option>
          <option value="2" <%if rs("sex")=2 then%>selected<%end if%>>女</option>
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">年&nbsp;&nbsp;&nbsp; 龄： </div></td>
      <td height="21"><font color="#000000"> 
        <input name="needage" class="input" value="<%=rs("needage")%>" size="20">
        (默认:无要求) </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">具体要求：</div></td>
      <td height="30"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
            <td height="10"> </td>
          </tr>
          <tr> 
            <td width="100%"><textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px"><%=replace(replace(rs("demand"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea></td>
          </tr>
          <tr> 
            <td height="10"> </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">薪资待遇：</div></td>
      <td height="30"><font color="#000000"> 
        <input class="input" value="<%=rs("salary")%>" maxlength="5" size="6" name="Salary">
        </font>元/月 默认&quot;0&quot;表示工资面议</td>
    </tr>
    <%if rs("jobtype")=2 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">兼职时间： </div></td>
      <td height="21"> <div align="left"><font color="#000000"> 
          <input name="jobtime" class="input" value="<%=rs("jobtime")%>" size="32" maxlength="50">
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">兼职地点： </div></td>
      <td height="21"><div align="left"><font color="#000000"> 
          <input name="jobplace" class="input" value="<%=rs("jobplace")%>" size="32" maxlength="100">
          </font></div></td>
    </tr>
    <%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">面试须知：</div></td>
      <td height="30"> <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
            <td height="10"> </td>
          </tr>
          <tr> 
            <td width="100%"><textarea class="input"  name="interview" rows="4" cols="76" style="font-size: 12px"><% if rs("interview")<>"" then response.Write(replace(replace(rs("interview"),"&nbsp;",chr(32)),"<br>",chr(13)))%></textarea></td>
          </tr>
          <tr> 
            <td height="10"> </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" bgcolor="#f1f3f5"><div align="right">联 系 人： </div></td>
      <td height="30"> <font color="#000000"> 
        <input name="contact" class="input" style="font-size: 12px" value="<%=rs("contact")%>" size="36">
        </font> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <div align="right">联系电话： </div></td>
      <td height="30" bgcolor="#f1f3f5"><font color="#000000"> 
        <input name="tel" class="input" value="<%=rs("tel")%>" size="18"  maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td valign="middle" bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;传&nbsp;&nbsp;&nbsp;&nbsp;真：</td>
      <td height="30"><font color="#000000"> 
        <input name="fax" class="input" value="<%=rs("fax")%>" size="18" maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td valign="middle" bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;电子邮箱：</td>
      <td height="30"><font color="#000000"> 
        <input name="email" class="input" style="font-family: Verdana; font-size: 12px" value="<%=rs("email")%>" size="35">
        </font><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;面试地址：</td>
      <td height="30"><font color="#000000"> 
        <input name="address" class="input" style="font-family: Verdana; font-size: 11px" value="<%=rs("address")%>" size="35">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <div align="right">邮政编码： </div></td>
      <td height="30"><font color="#000000"> 
        <input name="zipcode" class="input" style="font-size: 12px" value="<%=rs("zipcode")%>" size="10" maxlength="6">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30" colspan="2"><div align="center"> 
          <input NAME="Button3" TYPE="button" class="12" style="width:100;height:30" onClick="javascript:history.go(-1)" VALUE="返回上一页">
          <input NAME="Button32" TYPE="submit" class="12" style="width:100;height:30" onClick="javascript:history.go(-1)" VALUE="确定修改">
          <input name="jid" type="hidden" id="jid" value="<%=chkNO%>">
          <input type="button" name="Button2" value="该企业所有招聘职位" onClick="window.location.href='CompanyJobList.asp?cid=<%=cid%>'" style="width=150;height=30;font-size=12px">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>