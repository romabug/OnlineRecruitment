<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("请选择个人会员！")
end if
Call RsName(rs,"select * from [01387member] where uid='"&chkNO&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.table {
	border-top-width: 0px;
	border-right-width: 1px;
	border-bottom-width: 0px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
}
.table1 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 0px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
	font-size: 12px;
}
.table2 {
	border-top-width: 0px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
}
-->
</style>
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>个人基本资料 | <font face="Geneva, Arial, Helvetica, sans-serif">NO: 
      <%=rs("id")%></font></strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="#ffffff"> 
    <td width="74%" valign="middle"> <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="12">
        <tr bgcolor="FFFCF7"> 
          <td width="17%" height="26" bgcolor="FFFCF7"> <div align="right"><font color="696969">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</font></div></td>
          <td width="35%" bgcolor="FFFCF7" id="resume"><%=rs("uname")%></td>
          <td width="15%"><div align="right"><font color="696969">性&nbsp;别：</font></div></td>
          <td width="33%" id="resume"> <%
				select case rs("sex")
				case true
				response.write("男")
				case false
				response.write("女")
				end select
				%> </td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">更新日期：</font></div></td>
          <td><%=rs("updatetime")%></td>
          <td><div align="right"><font color="696969">民&nbsp;族：</font></div></td>
          <td id="resume"><%=rs("nation")%></td>
        </tr>
        <tr bgcolor="FFFCF7"> 
          <td height="26"> <div align="right"><font color="696969">户&nbsp;&nbsp;&nbsp;&nbsp;籍：</font></div></td>
          <td id="resume"> <%
		  select case rs("province")
		  case 1
		  response.write("北京")
		  case 2
		  response.write("天津")
		  case 3
		  response.write("上海")
		  case 4
		  response.write("重庆")
		  case 5
		  response.write("浙江")
		  case 6
		  response.write("广东")
		  case 7
		  response.write("江苏")
		  case 8
		  response.write("福建")
		  case 9
		  response.write("湖南")
		  case 10
		  response.write("湖北")
		  case 11
		  response.write("山东")
		  case 12
		  response.write("辽宁")
		  case 13
		  response.write("吉林")
		  case 14
		  response.write("云南")
		  case 15
		  response.write("四川")
		  case 16
		  response.write("安徽")
		  case 17
		  response.write("江西")
		  case 18
		  response.write("黑龙江")
		  case 19
		  response.write("河北")
		  case 20
		  response.write("陕西")
		  case 21
		  response.write("海南")
		  case 22
		  response.write("河南")
		  case 23
		  response.write("山西")
		  case 24
		  response.write("内蒙古")
		  case 25
		  response.write("广西")
		  case 26
		  response.write("贵州")
		  case 27
		  response.write("宁夏")
		  case 28
		  response.write("青海")
		  case 29
		  response.write("新疆")
		  case 30
		  response.write("西藏")
		  case 31
		  response.write("甘肃")
		  case 32
		  response.write("台湾")
		  case 33
		  response.write("香港")
		  case 34
		  response.write("澳门")
		  case 35
		  response.write("国外")
		  case 36
		  response.write("其他")
		  end select
		  %> <%=rs("citys")%></td>
          <td><div align="right"><font color="696969">年&nbsp;龄：</font></div></td>
          <td><%=datediff("yyyy",rs("birthday"),date())%></td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">婚姻状况：</font></div></td>
          <td id="resume"><%=rs("marry")%></td>
          <td><div align="right"><font color="696969">身&nbsp;高：</font></div></td>
          <td><%=rs("height")%>cm</td>
        </tr>
        <tr> 
          <td height="26" bgcolor="FFFCF7"> <div align="right"><font color="696969">现所在地：</font></div></td>
          <td colspan="3" bgcolor="FFFCF7" id="resume"><%=rs("address")%></td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">注册日期：</font></div></td>
          <td id="resume"><%=rs("regtime")%></td>
          <td><div align="right"><font color="696969">登录次数：</font></div></td>
          <td><%=rs("logintime")%></td>
        </tr>
      </table></td>
    <td width="26%" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"> 
            <%if rs("pic")<>"" then%>
            <%if rs("pichide")="ok" then%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%else%>
            <a href="../personadmin/upload/<%=rs("pic")%>" target="_blank"><img src='../personadmin/upload/<%=rs("pic")%>' width="121" height="160" border='0' style='border:1px solid #000000'> 
            <%end if%>
            </a> 
            <%else%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%end if%>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>个人教育背景</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="696969">毕业院校：</font></div></td>
    <td height="26"><%=rs("college")%></td>
    <td height="26"><div align="right"><font color="696969">学历：</font></div></td>
    <td height="26"> <%
		              select case rs("degree")
					  case 0
					  response.Write("高中以下")
					  case 1
					  response.Write("高中")
					  case 2
					  response.Write("职高")
					  case 3
					  response.Write("中专")
					  case 4
					  response.Write("大专")
					  case 5
					  response.Write("本科")
					  case 6
					  response.Write("硕士")
					  case 7
					  response.Write("博士")
					  end select%> </td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">主修专业：</font></div></td>
    <td bgcolor="#ffffff"><%=rs("spec1")%></td>
    <td><div align="right"><font color="696969">第二专业：</font></div></td>
    <td><%=rs("spec2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="696969">计算机水平：</font></div></td>
    <td><%=rs("com_level")%></td>
    <td><div align="right"><font color="696969">政治面貌：</font></div></td>
    <td><%=rs("zzmm")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">第一外语：</font></div></td>
    <td width="35%"><%=rs("l_type1")%></td>
    <td width="14%"><div align="right"><font color="696969">广东话水平：</font></div></td>
    <td width="34%"><%=rs("l_level1")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="696969">第二外语：</font></div></td>
    <td><%=rs("l_type2")%></td>
    <td><div align="right"><font color="696969">英语水平：</font></div></td>
    <td><%=rs("l_level2")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">所获证书：</font></div></td>
    <td colspan="3"><%=rs("certificate")%></td>
  </tr>
  <tr bgcolor="#FFF7EE"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="696969">培训与教育经历：</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"><%=rs("edu_career")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="3%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="97%" background="../img/bar_bg.gif"><strong>个人求职意向</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="#696969">应聘的行业(一)：</font></div></td>
    <td width="34%"> <%
							select case rs("maincatelog")
							case 1
							response.Write("饮食/餐厅/厨房")
							case 2
							response.Write("商店/超市/商场")
							case 3
							response.Write("博彩/酒店/旅游/服务")
							case 4
							response.Write("运输业/飞机场/物流")
							case 5
							response.Write("资讯科技/电脑/通讯")
							case 6
							response.Write("广告/媒体/出版/设计")
							case 7
							response.Write("水/电/气/空调/电梯")
							case 8
							response.Write("汽车维修/汽车美容")
							case 9
							response.Write("建筑/装修/杂工")
							case 10
							response.Write("保姆/家政/保安")
							case 11
							response.Write("理发/美容/按摩")
							case 12
							response.Write("演艺/模特/娱乐业")
							case 13
							response.Write("会展/公关/推广")
							case 14
							response.Write("工厂/制造业")
							case 15
							response.Write("园林/公园维护")
							case 16
							response.Write("进出口/贸易")
							case 17
							response.Write("外语/翻译/传译")
							case 18
							response.Write("金融/拍卖/保险")
							case 19
							response.Write("教育/培训")
							case 20
							response.Write("健美/护理/医疗")
							case 21
							response.Write("咨询/中介/法律")
							case 22
							response.Write("综合文职/行政")
							case 23
							response.Write("高级/综合管理")
							case 24
							response.Write("其它技术工种")
							end select
							%> </td>
    <td width="14%"><div align="right"><font color="#696969">意向职位(一)：</font></div></td>
    <td width="35%"><%=rs("subcatelog")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">应聘的行业(二)：</font></div></td>
    <td> <%
							select case rs("maincatelog2")
							case 1
							response.Write("饮食/餐厅/厨房")
							case 2
							response.Write("商店/超市/商场")
							case 3
							response.Write("博彩/酒店/旅游/服务")
							case 4
							response.Write("运输业/飞机场/物流")
							case 5
							response.Write("资讯科技/电脑/通讯")
							case 6
							response.Write("广告/媒体/出版/设计")
							case 7
							response.Write("水/电/气/空调/电梯")
							case 8
							response.Write("汽车维修/汽车美容")
							case 9
							response.Write("建筑/装修/杂工")
							case 10
							response.Write("保姆/家政/保安")
							case 11
							response.Write("理发/美容/按摩")
							case 12
							response.Write("演艺/模特/娱乐业")
							case 13
							response.Write("会展/公关/推广")
							case 14
							response.Write("工厂/制造业")
							case 15
							response.Write("园林/公园维护")
							case 16
							response.Write("进出口/贸易")
							case 17
							response.Write("外语/翻译/传译")
							case 18
							response.Write("金融/拍卖/保险")
							case 19
							response.Write("教育/培训")
							case 20
							response.Write("健美/护理/医疗")
							case 21
							response.Write("咨询/中介/法律")
							case 22
							response.Write("综合文职/行政")
							case 23
							response.Write("高级/综合管理")
							case 24
							response.Write("其它技术工种")
							end select
							%> </td>
    <td><div align="right"><font color="#696969">意向职位(二)：</font></div></td>
    <td><%=rs("subcatelog2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">职位名称：</font></div></td>
    <td><%=rs("jobname")%></td>
    <td><div align="right"><font color="#696969">全职/兼职：</font></div></td>
    <td>
	      <%
		  select case rs("jobtype")
		  case 1
		  response.Write("全职")
		  case 2
		  response.Write("兼职")
		  case 3
		  response.Write("都可以")
		  end select
		  %>
	</td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">薪水要求：</font></div></td>
    <td><%select case rs("salary")
	  case 0
	  response.Write("面议")
	  case 1
	  response.Write("3000以下")
	  case 2
	  response.Write("3000-4000")
	  case 3
	  response.Write("4000-5000")
	  case 4
	  response.Write("5000-7000")
	  case 5
	  response.Write("7000以上")
	  end select%>(元/月)</td>
    <td><div align="right"><font color="#696969">住房要求：</font></div></td>
    <td><%=rs("workhouse")%></td>
  </tr>
  <tr> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">到岗时间：</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"> <%
		   select case rs("checkindate")
		   case 1
		   response.write("随时到岗")
		   case 2
		   response.write("三天内")
		   case 3
		   response.write("一周内")
		   case 4
		   response.write("一个月内")
		   case 5
		   response.write("三个月内")
		   case 6
		   response.write("面议协商")
		   end select
		  %> &nbsp;&nbsp;(更新日期是：<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs("updatetime")%></strong></font>)</td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="3%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="97%" background="../img/bar_bg.gif"><strong>个人工作经历</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"> <div align="right"><font color="#696969">工作经验：</font></div></td>
    <td width="83%"><%=rs("doneyear")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"> <div align="right"><font color="#696969">工作经历：</font></div></td>
    <td><%=rs("job_career")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="1%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="99%" background="../img/bar_bg.gif"><strong>自我评价</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="131" height="26"> <div align="right"><font color="#003399">自我评价内容：</font></div></td>
    <td width="644"><%=rs("selfintro")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>联系方式</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="#696969">电话：</font></div></td>
    <td width="35%"><%=rs("tel")%></td>
    <td width="14%"><div align="right"><font color="#696969">手机：</font></div></td>
    <td width="34%"><%=rs("mobile")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">聊天号码：</font></div></td>
    <td><%=rs("chatno")%></td>
    <td><div align="right"><font color="#696969">个人主页：</font></div></td>
    <td><a href="<%=rs("selfweb")%>" target=_blank><%=rs("selfweb")%></a></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">邮编：</font></div></td>
    <td><%=rs("zipcode")%></td>
    <td><div align="right"><font color="#696969">邮箱：</font> </div></td>
    <td><font color="#696969"><%=rs("email")%></font></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="36" colspan="4"><div align="center"> 
        <input TYPE="button" VALUE="   返 回 上 一 页  " NAME="Button" style="width:150;height:30" onClick="javascript:history.go(-1)">
      </div></td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>