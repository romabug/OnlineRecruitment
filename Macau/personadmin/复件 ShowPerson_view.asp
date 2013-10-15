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
    <td width="438" colspan="2" align="right" style="line-height:160%;"><strong class="showjob"><font color="#333333" >
	<%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower")<>"" and session("01387jobcid")<>"" then%><%=rs1("uname")%><%else%><%=left(rs1("uname"),1)%><%
				select case rs1("sex")
				case true
				response.write("先生")
				case false
				response.write("小姐")
				end select%><%end if%>的个人简历</font></strong><br>
    更新日期：<font color="#000099"><%=rs1("updatetime")%></font> 注册日期：<font color="#000099"><%=rs1("regtime")%></font></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;个人基本资料(<font face="Geneva, Arial, Helvetica, sans-serif">NO.<%=rs1("uid")%></font>)</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td width="535" valign="middle"> <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr > 
          <td width="119" height="26" > <div align="right"><font color="#000099">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</font></div></td>
          <td width="209"  id="resume">
<%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower")<>"" and session("01387jobcid")<>"" then%>
<%=rs1("uname")%><%else%><%=left(rs1("uname"),1)%><%
				select case rs1("sex")
				case true
				response.write("先生")
				case false
				response.write("小姐")
				end select%><%end if%></td>
          <td width="98"><div align="right"><font color="#000099">性&nbsp;&nbsp;&nbsp;&nbsp;别：</font></div></td>
          <td width="109" id="resume"> 
            <%
				select case rs1("sex")
				case true
				response.write("男")
				case false
				response.write("女")
				end select
				%>          </td>
        </tr>
        <tr> 
          <td height="26" align="right"><font color="#000099">民&nbsp;&nbsp;&nbsp;&nbsp;族：</font></td>
          <td><%=rs1("nation")%></td>
          <td align="right"><font color="#000099">户&nbsp;&nbsp;&nbsp;&nbsp;籍：</font></td>
          <td id="resume"><%
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
        </tr>
        <tr > 
          <td height="26"> <div align="right"><font color="#000099">年&nbsp;&nbsp;&nbsp;&nbsp;龄：</font></div></td>
          <td id="resume"><%=datediff("yyyy",rs1("birthday"),date())%></td>
          <td><div align="right"><font color="#000099">身&nbsp;&nbsp;&nbsp;&nbsp;高：</font></div></td>
          <td><%=rs1("height")%>cm</td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#000099">婚姻状况：</font></div></td>
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
		  end select%>          </td>
          <td align="right"><font color="#000099">现所在地：</font></td>
          <td><%=rs1("address")%></td>
        </tr>
      </table></td>
    <td width="163" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"> 
            <%if rs1("pic")<>"" then%>
            <%if rs1("pichide")="ok" then%>
            <img src='../images/nophoto.jpg' border='0' > 
            <%else%>
            <a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank">            </a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"><img src='../personadmin/upload/<%=rs1("pic")%>' width="84" height="112" border='0' style='border:1px solid #000000'></a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank">
            <%end if%>
            </a> 
            <%else%>
            <img src='../images/nophoto.jpg' border='0' > 
          <%end if%>          </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;求职意向</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="118" height="26" align="right"><font color="#000099">应聘的行业(一)：</font></td>
    <td width="213"><%
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
    <td width="93" align="right"><font color="#000099">意向职位(一)：</font></td>
    <td width="274"><%=rs1("subcatelog")%></td>
  </tr>
  <tr>
    <td height="26" align="right"><div align="right"><font color="#000099">应聘的行业(二)：</font></div></td>
    <td><%
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
    <td><div align="right"><font color="#000099">意向职位(二)：</font></div></td>
    <td><%=rs1("subcatelog2")%></td>
  </tr>
  <tr >
    <td height="26" align="right" ><div align="right"><font color="#000099">最适合的职位：</font></div></td>
    <td><%=rs1("jobname")%></td>
    <td ><div align="right"><font color="#000099">全职/兼职：</font></div></td>
    <td ><%
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
    <td height="26" align="right"><div align="right"><font color="#000099">薪水要求：</font></div></td>
    <td><%select case rs1("salary")
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
      (元/月)</td>
    <td><div align="right"><font color="#000099">住房要求：</font></div></td>
    <td><%=rs1("workhouse")%></td>
  </tr>
  <tr>
    <td height="26" align="right" ><div align="right"><font color="#000099">到岗时间：</font></div></td>
    <td colspan="3" ><%
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
      &nbsp;&nbsp;</td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;工作经历</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="119" height="26"><div align="right"><font color="#000099">工作经验：</font></div></td>
    <td width="579"><%=rs1("doneyear")%>年</td>
  </tr>
  <tr>
    <td height="26"><div align="right"><font color="#000099">工作经历：</font></div></td>
    <td height="30" style="word-break:break-all;padding-top:10px;padding-bottom:10px;line-height:160%;"><%=rs1("job_career")%></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;教育背景</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr > 
    <td width="120" height="26"><div align="right"><font color="#000099">毕业院校：</font></div></td>
    <td height="26"><%=rs1("college")%></td>
    <td height="26"><div align="right"><font color="#000099">学&nbsp;&nbsp;&nbsp;&nbsp;历：</font></div></td>
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
    <td height="26"><div align="right"><font color="#000099">主修专业：</font></div></td>
    <td><%=rs1("spec1")%></td>
    <td><div align="right"><font color="#000099">第二专业：</font></div></td>
    <td><%=rs1("spec2")%></td>
  </tr>
  <tr > 
    <td height="26" ><div align="right"><font color="#000099">计算机水平：</font></div></td>
    <td><%=rs1("com_level")%></td>
    <td><div align="right"><font color="#000099">政治面貌：</font></div></td>
    <td><%=rs1("zzmm")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#000099">第一外语：</font></div></td>
    <td width="216"><%=rs1("l_type1")%></td>
    <td width="91"><div align="right"><font color="#000099">广东话水平：</font></div></td>
    <td width="271"><%=rs1("l_level1")%></td>
  </tr>
  <tr > 
    <td height="26"><div align="right"><font color="#000099">第二外语：</font></div></td>
    <td><%=rs1("l_type2")%></td>
    <td><div align="right"><font color="#000099">英语水平：</font></div></td>
    <td><%=rs1("l_level2")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#000099">所获证书：</font></div></td>
    <td colspan="3"><%=rs1("certificate")%></td>
  </tr>
  <tr > 
    <td height="26" align="right" ><font color="#000099">培训与教育经历：</font></td>
    <td colspan="3"><table width="496" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
        <tr> 
          <td width="496" style="word-break:break-all;line-height:160%;padding-top:10px;padding-bottom:10px;"><%=rs1("edu_career")%></td>
        </tr>
        <tr> 
          <td height="10"> </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;自我评价</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr > 
    <td width="119" height="26" class="joblook"> <div align="right"><font color="#000099">自我评价：</font></div></td>
    <td width="579" height="60" class="joblook" style="word-break:break-all; line-height:160%; padding-top:10px;padding-bottom:10px;"><%=rs1("selfintro")%></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;联系方式</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
  <tr > 
    <td width="104" height="26"><div align="right"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话：</font></div></td>
    <td width="212"><%=rs1("tel")%></td>
    <td width="85"><div align="right"><font color="#000099">手&nbsp;&nbsp;&nbsp;&nbsp;机：</font></div></td>
    <td width="199"><%=rs1("mobile")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#000099">聊天号码：</font></div></td>
    <td><%=rs1("chatno")%></td>
    <td><div align="right"><font color="#000099">个人主页：</font></div></td>
    <td><a href="<%=rs1("selfweb")%>" target=_blank><%=rs1("selfweb")%></a></td>
  </tr>
  <tr > 
    <td height="26"><div align="right"><font color="#000099">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</font></div></td>
    <td><%=rs1("zipcode")%></td>
    <td><div align="right"><font color="#000099">E-mail：</font></div></td>
    <td ><a href="mailto:<%=rs1("email")%>"><%=rs1("email")%></a></td>
  </tr>
</table>
<table width="560" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center">Copyright(C)2006-2008 澳门劳工招聘网版权所有   闽ICP备059883745号</td>
  </tr>
</table>
</body>
</html>
<%
rs1.close
set rs1=nothing
call closeconn()
%>
