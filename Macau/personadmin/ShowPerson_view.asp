<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
uid=request.cookies("01387job")("uid")

Call RsName(rs1,"select * from [01387member] where uid='"&uid&"'",1,1)
if rs1.recordcount=0 then
Call ShowError("无此信息！")
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网--<%=rs1("uname")%>简历详细信息--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css" />
<link href="../css/01387.css" rel="stylesheet" type="text/css" />



</head>
<script language="JavaScript" type="text/JavaScript">
<!--

	function call_window(url)
	{
		showModelessDialog(url,window,"dialogWidth:530px;dialogHeight:250px;center:yes;help:no;resizable:no;status:no");
	}
//-->
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="700" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="262" height="80"><img src="../images/logo.gif" width="188" height="62"></td>
    <td width="438" colspan="2" align="right" style="line-height:160%;"><div align="left"><strong class="showjob"><font color="#FF3300" ><span lang="EN-US" style="font-size:12.0pt"><%=rs1("uname")%> 的简历预览</span></font></strong><br>
      </div></td>
  </tr>
</table>
<hr align="center" width="720" size="6">
<table width="720" height="28" border="0" align="center">
  <tr> 
    <td width="210" height="24"><span style="font-size: 12.0pt; font-family: 黑体">编号<strong><font face="Geneva, Arial, Helvetica, sans-serif">：</font></strong><strong><%=rs1("id")%></strong></span></td>
    <td><div align="right"><font color="#FF0000">·显示为</font><a   title=繁体转换  href=""       name=StranLink><font color="#FF0000">繁體中文</font></a><font color="#FF0000">·</font></div></td>
  </tr>
</table>


	<!--  表格开始-->
	

<style>
<!--
table.MsoTableGrid
	{border:1.0pt solid windowtext;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.0pt;
	font-family:"Times New Roman";
	}
 p.MsoNormal
	{mso-style-parent:"";
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";
	margin-left:0cm; margin-right:0cm; margin-top:0cm}
-->
</style>


<table width="720" border="1" align="center" cellpadding="0" cellspacing="0" class="MsoTableGrid" id="table1" style="width: 540.0pt; border-collapse: collapse; border: medium none; ">
        <tr> 
          <td width="720" colspan="5" valign="top" style="width: 540.0pt; border: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: 黑体"> 
              基本资料 <strong> </strong> </span></td>
        </tr>
        <tr> 
          <td width="720" height="20" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">姓名</span></td>
                  
    <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
      <span lang="EN-US" style="font-size:12.0pt"> <%=rs1("uname")%> </span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">性别</span></td>
          <td width="264" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
              <%
				select case rs1("sex")
				case true
				response.write("男")
				case false
				response.write("女")
				end select
				%>
              </span></td>
          <td width="120" rowspan="5" align="center" valign="middle" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <table width="142" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="center"> <%if rs1("pic")<>"" then%> <%if rs1("pichide")="ok" then%> <img src='../images/nophoto.jpg' border='0' > <%else%> <a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"> 
                  </a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"><img src='../personadmin/upload/<%=rs1("pic")%>' width="121" height="160" border='0' style='border:1px solid #000000'></a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"> 
                  <%end if%>
                  </a> <%else%> <img src='../images/nophoto.jpg' border='0' > <%end if%> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">民族</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("nation")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">户籍</span></td>
          <td width="264" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              <%=rs1("citys")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">年龄</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=datediff("yyyy",rs1("birthday"),date())%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">身高</span></td>
          <td width="264" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("height")%> 厘米</span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align: center"> <span style="font-size: 12.0pt; font-family: 宋体">婚姻</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
              <%select case rs1("marry")
		  case 1
		  response.Write("未婚")
		  case 2
		  response.Write("已婚")
		  case 3
		  response.Write("离异")
		  case 4
		  response.Write("保密")
		  end select%>
              </span></td>
          <td width="384" colspan="2" valign="top" style="width: 198.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">现所在地址</span></td>
          <td width="612" colspan="3" valign="top" style="width: 369.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"> <span lang="EN-US" style="font-size:12.0pt"> 
              <!--地址不公开-->
              <%=rs1("address")%></span> 
      <p class="MsoNormal">&nbsp;
            <p class="MsoNormal">&nbsp;
            <p class="MsoNormal">&nbsp;</td>
        </tr>
        <tr> 
          <td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: 黑体"> 
              求职意向</span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">应聘行业</span><span style="font-size:
  12.0pt;font-family:宋体">①</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              </span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">具体职位</span><span style="font-size:
  12.0pt;font-family:宋体">①</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("subcatelog")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">应聘行业</span><span style="font-size:
  12.0pt;font-family:宋体">②</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              </span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">具体职位</span><span style="font-size:
  12.0pt;font-family:宋体">②</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("subcatelog2")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">最适合职位</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("jobname")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">全职</span><span lang="EN-US" style="font-size:12.0pt">/</span><span style="font-size: 12.0pt; font-family: 宋体">兼职</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              </span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">期望薪水</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
	  end select%>
              <span style="font-family: 宋体">(澳门圆/月)</span> </span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">住房要求</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("workhouse")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">到岗时间</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              </span></td>
          <td width="384" colspan="3" valign="top" style="width: 288.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
        </tr>
        <tr> 
          <td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: 黑体"> 
              工作经历</span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align: center; text-indent: 6.0pt"> 
              <span style="font-size: 12.0pt; font-family: 宋体">工作经验</span></td>
          <td width="612" colspan="4" valign="top" style="width: 459.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt"><%=rs1("doneyear")%> 年</span></td>
        </tr>
        <tr style="height: 48.25pt"> 
          <td width="720" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></p>
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
          
    <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
      <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt"><%=rs1("job_career")%><br>
        </span></td>
        </tr>
        <tr> 
          <td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: 黑体"> 
              教育背景</span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align: center"> <span style="font-size: 12.0pt; font-family: 宋体">毕业院校</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("college")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">学历</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp; 
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
              </span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">主修专业</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("spec1")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">第二专业</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("spec2")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">计算机水平</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("com_level")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">政治面貌</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("zzmm")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">第一外语</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_type1")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">粤语水平</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_level1")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">第二外语</span></td>
          <td width="612" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_type2")%></span></td>
          <td width="384" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">英语水平</span></td>
          <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_level2")%></span></td>
        </tr>
        <tr> 
          <td width="720" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">所获证书</span></td>
          <td width="612" colspan="4" valign="top" style="width: 459.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("certificate")%></span></td>
        </tr>
        <tr style="height: 48.25pt"> 
          <td width="720" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal" align="center" style="text-align:center"> <span style="font-size: 12.0pt; font-family: 宋体">教育经历</span><span lang="EN-US" style="font-size:12.0pt">/</span><span style="font-size: 12.0pt; font-family: 宋体">培训经历</span></td>
          
    <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
      <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("edu_career")%><br>
        </span></td>
        </tr>
        <tr> 
          <td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: 黑体"> 
              自我评价、自荐说明</span></td>
        </tr>
        <tr style="height: 48.25pt"> 
          <td width="720" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></p>
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
          
    <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
      <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt"><%=rs1("selfintro")%><br>
        </span></td>
        </tr>
 
      </table>   
	




  
        <div align="center"><br>
  <font color="#999999">更新日期：<%=rs1("updatetime")%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注册日期：<%=rs1("regtime")%></p> </font></div>
</div>
        <p><br>
</p>

<table width="100%" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" bgcolor="#CCCCCC"><p>&nbsp;</p>
      <p>Copyright(C)2006-2008 澳门劳工招聘网信息所有，未经允许不准转载！</p>
      <p>&nbsp;</p></td>
  </tr>
</table>

</body>
<script src="../js/big5.js" language="JavaScript"></script>
</html>
<%
rs1.close
set rs1=nothing
call closeconn()
%>
