<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim uid
uid=request.cookies("01387job")("uid")
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387member] where uid='"&uid&"'" ,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网--澳门劳工/澳门劳务/劳工招聘</title>

<link href="../css/Resume.css" rel="stylesheet" type="text/css">
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
<body bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="0">
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="258" height="80"><img src="../images/logo.jpg" width="216" height="70"></td>
    <td width="342"><br>
      <br>
      <br>
      个人简历<font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif">NO.<%=rs1("uid")%></font></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>个人基本资料</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="445" valign="middle"> <table width="440"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="FFFCF7"> 
          <td width="102" height="26" bgcolor="FFFCF7"> <div align="right"><font color="#696969">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</font></div></td>
          <td width="140" bgcolor="FFFCF7" id="resume"><%=rs1("uname")%></td>
          <td width="98"><div align="right"><font color="#696969">性&nbsp;别：</font></div></td>
          <td width="100" id="resume"> 
            <%
				select case rs1("sex")
				case true
				response.write("男")
				case false
				response.write("女")
				end select
				%>
          </td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">更新日期：</font></div></td>
          <td><%=rs1("updatetime")%></td>
          <td><div align="right"><font color="#696969">民&nbsp;族：</font></div></td>
          <td id="resume"><%=rs1("nation")%></td>
        </tr>
        <tr bgcolor="FFFCF7"> 
          <td height="26"> <div align="right"><font color="#696969">户&nbsp;&nbsp;&nbsp;&nbsp;籍：</font></div></td>
          <td id="resume"> 
            <%
		  select case rs1("province")
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
		  %>
            <%=rs1("citys")%></td>
          <td><div align="right"><font color="#696969">年&nbsp;龄：</font></div></td>
          <td><%=datediff("yyyy",rs1("birthday"),date())%></td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">婚姻状况：</font></div></td>
          <td id="resume">
		  <%select case rs1("marry")
		  case 1
		  response.Write("未婚")
		  case 2
		  response.Write("已婚")
		  case 3
		  response.Write("离异")
		  case 4
		  response.Write("保密")
		  end select%></td>
          <td><div align="right"><font color="#696969">身&nbsp;高：</font></div></td>
          <td><%=rs1("height")%>cm</td>
        </tr>
        <tr> 
          <td height="26" bgcolor="FFFCF7"> <div align="right"><font color="#696969">现所在地：</font></div></td>
          <td colspan="3" bgcolor="FFFCF7" id="resume"><%=rs1("address")%></td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">注册日期：</font></div></td>
          <td id="resume"><%=rs1("regtime")%></td>
          <td><div align="right"><font color="#696969">登录次数：</font></div></td>
          <td><%=rs1("logintime")%></td>
        </tr>
      </table></td>
    <td width="160" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"> 
            <%if rs1("pic")<>"" then%>
            <%if rs1("pichide")="ok" then%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%else%>
            <a href="../person/upload/<%=rs1("pic")%>" target="_blank"><img src='../person/upload/<%=rs1("pic")%>' width="121" height="160" border='0' style='border:1px solid #FFB877'> 
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
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>个人教育背景</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">毕业院校：</font></div></td>
    <td height="26"><%=rs1("college")%></td>
    <td height="26"><div align="right"><font color="#696969">学历：</font></div></td>
    <td height="26"> 
      <%
		              select case rs1("degree")
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
					  end select%>
    </td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">主修专业：</font></div></td>
    <td><%=rs1("spec1")%></td>
    <td><div align="right"><font color="#696969">第二专业：</font></div></td>
    <td><%=rs1("spec2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">计算机水平：</font></div></td>
    <td><%=rs1("com_level")%></td>
    <td><div align="right"><font color="#696969">政治面貌：</font></div></td>
    <td><%=rs1("zzmm")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">第一外语：</font></div></td>
    <td width="211"><%=rs1("l_type1")%></td>
    <td width="86"><div align="right"><font color="#696969">广东话水平：</font></div></td>
    <td width="199"><%=rs1("l_level1")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">第二外语：</font></div></td>
    <td><%=rs1("l_type2")%></td>
    <td><div align="right"><font color="#696969">英语水平：</font></div></td>
    <td><%=rs1("l_level2")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">所获证书：</font></div></td>
    <td colspan="3"><%=rs1("certificate")%></td>
  </tr>
  <tr bgcolor="#FFF7EE"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">培训与教育经历：</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"><%=rs1("edu_career")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>个人求职意向</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"><div align="right"><font color="#696969">应聘的行业(一)：</font></div></td>
    <td width="212"> 
      <%
							select case rs1("maincatelog")
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
							%>
    </td>
    <td width="85"><div align="right"><font color="#696969">意向职位(一)：</font></div></td>
    <td width="199"><%=rs1("subcatelog")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">应聘的行业(二)：</font></div></td>
    <td> 
      <%
							select case rs1("maincatelog2")
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
							%>
    </td>
    <td><div align="right"><font color="#696969">意向职位(二)：</font></div></td>
    <td><%=rs1("subcatelog2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">最适合的职位：</font></div></td>
    <td><%=rs1("jobname")%></td>
    <td><div align="right"><font color="#696969">全职/兼职：</font></div></td>
    <td> 
      <%
		  select case rs1("jobtype")
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
  <tr> 
    <td height="26"><div align="right"><font color="#696969">薪水要求：</font></div></td>
    <td>
	<%select case rs1("salary")
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
    <td><%=rs1("workhouse")%></td>
  </tr>
  <tr> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">到岗时间：</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"> 
      <%
		   select case rs1("checkindate")
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
		  %>
      &nbsp;&nbsp;(更新日期是：<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("updatetime")%></strong></font>)</td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>个人工作经历</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"> <div align="right"><font color="#696969">工作经验：</font></div></td>
    <td><%=rs1("doneyear")%></td>
  </tr>
  <tr> 
    <td height="26"> <div align="right"><font color="#696969">工作经历：</font></div></td>
    <td><%=rs1("job_career")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>自我评价</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"> <div align="right"><font color="#696969">自我评价内容：</font></div></td>
    <td><%=rs1("selfintro")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>联系方式</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"><div align="right"><font color="#696969">电话：</font></div></td>
    <td width="212"><%=rs1("tel")%></td>
    <td width="85"><div align="right"><font color="#696969">手机：</font></div></td>
    <td width="199"><%=rs1("mobile")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">聊天号码：</font></div></td>
    <td><%=rs1("chatno")%></td>
    <td><div align="right"><font color="#696969">个人主页：</font></div></td>
    <td><a href="<%=rs1("selfweb")%>" target=_blank><%=rs1("selfweb")%></a></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">邮编：</font></div></td>
    <td><%=rs1("zipcode")%></td>
    <td><div align="right"><font color="#696969">E-mail：</font></div></td>
    <td><a href="mailto:<%=rs1("email")%>"><%=rs1("email")%></a></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="36" colSpan="2" align="center">以上信息由澳门劳工招聘网(www.macau69.com)提供</td>
    <td width="180" height="36" align="center"><a href="#" onClick="javascript:window.close()"><font color="#000000">关闭本页</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <a href="#" onClick="javascript:window.print()"><font color="#FF3300">打印本页</font></a></td>
  </tr>
</table>
</body>
</html>
<%
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
