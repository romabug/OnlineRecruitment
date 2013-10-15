<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
Function LenTemp(temp,length)
	if len(temp)>=length then
		lenTemp=left(temp,length) & ".."
	else
		lenTemp=temp
	end if
End Function
jid=request.QueryString("jid")
Call RsName(rs,"select A.id,A.jid,A.cid,A.jobname,B.companyname,A.neednum,A.maincatelog,A.subcatelog,A.jobtype,A.sex,A.needage,A.degree,A.salary,A.publishtime,A.overtime,A.jobtime,A.jobplace,A.doneyear,A.lookcount,A.demand,A.interview,B.contact,B.tel,B.fax,B.province,B.citys,B.address,B.zipcode,B.mobile,B.email,B.website,A.zhufang,A.fangfa,A.jobcity from [01387joblist] A inner join [01387company] B on A.cid=B.cid where A.jid='"&jid&"' order by A.id desc",1,1)
if rs.eof and rs.bof then
Call ShowError("参数错误！")
end if
Call RsName(rs1,"select jid,jobname,neednum from [01387joblist] where cid='"&rs(2)&"'  and canshow='ok' order by id desc",1,1)
conn.execute("update [01387joblist] set lookcount=lookcount+1 where jid='"&jid&"'")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网--<%=rs(3)%>--澳门劳工/澳门劳务/劳工招聘</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。提供劳务咨询,劳务培训,劳务输出等一条龙服务。">
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员">

<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/JavaScript">
	function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}

</script>
<body>
<!--#include file="../inc/top_showjob.asp"-->
<table width="776" height="88" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/qjoblook_bg.gif">
  <tbody>
    <tr>
      <td width="776" height="48" valign="bottom" style="padding-left:25px;"><font color="#ffffff" size="4" face="黑体">&nbsp;<%=rs(4)%></font></td>
    </tr>
    <tr>
      <td height="26"  style="padding-left:260px; padding-top:3px;"><img src="../images/sj.gif"  /> <a href="ShowCompany.asp?cid=<%=rs(2)%>" class="qjob14" target="_self">公司简介</a>  &nbsp;&nbsp;<img src="../images/sj.gif"  /> <a href="ShowAllJob.asp?cid=<%=rs(2)%>" class="qjob14">所有招聘职位</a>   &nbsp;&nbsp;<img src="../images/sj.gif" /> <a href="ShowCompany.asp?cid=<%=rs(2)%>" class="qjob14">联系方式</a></td>
    </tr>
    <tr>
      <td height="10"></td>
    </tr>
  </tbody>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="193" height="430" valign="top" bgcolor="#E9F1F7" class="ta"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center"><a href="ShowAllJob.asp?cid=<%=rs(2)%>"><img src="../images/jobst.gif" width="193" height="31" border="0" /></a></td>
      </tr>
      <tr>
        <td align="right"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <%do while not rs1.eof%>
            <tr>
              <td height="26" align="left"><a href="ShowJob.asp?jid=<%=rs1(0)%>" title="<%=rs1(1)%>"><%=LenTemp(rs1(1),10)%></a>&nbsp;<font color="#555555">(<font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(2)%></font>人)</font></td>
            </tr>
            <%
			  rs1.movenext
			  loop
			  %>
        </table></td>
      </tr>
    </table></td>
    <td width="1" background="../images/dian.gif"></td>
    <td width="617" align="center" valign="top" bgcolor="#F8F8F8"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
        <tr> 
          <td>            <table width="569" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="569" height="24" align="left" background="../images/job_bg.gif" class="showjob"><%=rs(3)%><%=rs(5)%>人</td>
            </tr>
            <tr>
              <td height="8" align="left" ><img src="../images/shojob2.gif" width="569" height="8" /></td>
            </tr>
          </table>
            <TABLE width=569 border=0 align="center" cellPadding=0 cellSpacing=0 borderColorDark=#ffffff>
              <TBODY>
                <TR > 
                  <TD width=93 height="25" align="center"><font color="#003399">岗位类别：</font></TD>
                  <TD width=218 align="left">&nbsp;<%
							select case rs(6)
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
                  &gt; <%=rs(7)%></TD>
                  <TD width=88 align="center"><font color="#003399">工作类别：</font></TD>
                  <TD width=170 align="left">&nbsp;<%if rs(8)=1 then response.write("全职") else response.write("兼职")%>                  </TD>
                </TR>
                <TR> 
                  <TD height="25" align="center"><font color="#003399">要求性别：</font></TD>
                  <TD align="left">&nbsp;<%
								  select case rs(9)
								  case 3
								  response.write("无要求")
								  case 1
								  response.write("男")
								  case 2
								  response.write("女")
								  end select
								  %></TD>
                  <TD align="center"><font color="#003399">年龄要求：</font></TD>
                  <TD align="left">&nbsp;<%if rs(10)="" then response.Write("无要求") else response.write(rs(10))%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">学历要求：</font></TD>
                  <TD align="left">&nbsp;<%
								  select case rs(11)
								  case 0
								  response.write("高中以下")
								  case 1
								  response.write("高中")
								  case 2
								  response.write("职高")
								  case 3
								  response.write("中专")
								  case 4
								  response.write("大专")
								  case 5
								  response.write("本科")
								  case 6
								  response.write("硕士")
								  case 7
								  response.write("博士")
								  end select
								  %>及以上</TD>
                  <TD align="center"><font color="#003399">工资待遇：</font></TD>
                  <TD align="left">&nbsp;<%if rs(12)=0 then response.Write("面议")else response.Write(rs(12)&"元/月")%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">工作经验：</font></TD>
                  <TD align="left">&nbsp;<font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(17)%>年</font></TD>
                  <TD align="center"><font color="#003399">浏览次数：</font></TD>
                  <TD align="left">&nbsp;<font  face="Geneva, Arial, Helvetica, sans-serif"><%=rs(18)+1%></font></TD>
                </TR>
				<TR > 
                  <TD height="25" align="center"><font color="#003399">住房要求：</font></TD>
                  <TD align="left">&nbsp;<%select case rs("zhufang")
				  case "0"
				  response.Write "面议协商"
				  case "1"
				  response.Write "提供住房"
				  case "2"
				  response.Write "自行解决"
				  end select
				  %></TD>
                  <TD align="center"><font color="#003399">工作地区：</font></TD>
                  <TD align="left"><%=rs("jobcity")%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">发布日期：</font></TD>
                  <TD align="left"><font face="Geneva, Arial, Helvetica, sans-serif">&nbsp;<%=rs(13)%></font></TD>
                  <TD align="center"><font color="#003399">截止日期：</font></TD>
                  <TD align="left">&nbsp;<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%if rs(14)="2049-1-1" then response.Write("长期有效")else response.Write(rs(14))%>
                  </strong></font></TD>
                </TR>
				<TR > 
                  <TD height="25" align="center"><font color="#003399">面试要求：</font></TD>
                  <TD height="24" align="left">&nbsp;<%=rs(20)%></TD>
                  <TD height="24" align="center"><font color="#003399">联系方法：</font></TD>
                  <TD height="24" align="left"><%select case rs("fangfa")
				  case "1"
				  response.Write "电话联系"
				  case "2"
				  response.Write "通过网络"
				  case "3"
				  response.Write "单位面试"
				  end select
				  %></TD>
				</TR><TR > 
                  <TD height="10" colspan="4" align="center">&nbsp;</TD>
                  </TR>
                <TR > 
                  <TD colspan="4"><table width="569" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="569" height="29" align="left" background="../images/jobte.gif" class="showjob">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="100%" border="0" cellspacing="6" cellpadding="5">
                      <tr> 
                        <td align="left"  style="line-height:160%;word-wrap: break-word; word-break: break-all;">
						  <%=rs(19)%></td>
                      </tr>
                    </table></TD>
                </TR>
                <TR> 
                  <TD colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="197" height="40">&nbsp;</td>
                        <td width="127"><a href="javascript:;" onClick="go_url('sendapply.asp?jid=<%=rs(1)%>&cid=<%=rs(2)%>',200,426);"><img src="../images/But.gif" border="0"></a></td>
                        <td width="125"><a href="FavoAdd.asp?jid=<%=rs(1)%>&cid=<%=rs(2)%>" target="_blank"><img src="../images/szj.gif" width="116" height="24" border="0"></a></td>
                        <td width="120"><a href="Commend.asp?jid=<%=rs(1)%>" target="_blank"><img src="../images/fend.gif" border="0"></a></td>
                      </tr>
                    </table>
                    <table width="569" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="569" height="28" align="left" background="../images/cont.gif" class="showjob">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="6" cellpadding="5">
                      <tr>
                        <td align="left" class="1" style="line-height:180%;">联 系 人：&nbsp;<%=rs(21)%><br />
                          电&nbsp;&nbsp;&nbsp; 话：&nbsp;<span style="line-height:20px"><%=rs(22)%></span><br />
                        传&nbsp;&nbsp;&nbsp; 真：&nbsp;<span style="line-height:20px"><%=rs(23)%></span><br />
                        手&nbsp;&nbsp;&nbsp; 机：&nbsp;<span style="line-height:20px"><%=rs(18)%></span><br />
                        通讯地址：&nbsp;<span style="line-height:20px"><%
		  select case rs(24)
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
                        <%=rs(25)&rs(26)%> </span><br />
                        邮政编码：<span style="line-height:20px"><span class="1" style="line-height:180%;">&nbsp;</span><%=rs(27)%></span><br />
                        电子邮件：&nbsp;<a href="mailto:<%=rs(29)%>"><%=rs(29)%></a><br />
                        公司网站：&nbsp;<a href="<%=rs(30)%>" target="_blank"><%=rs(30)%></a></td>
                      </tr>
                    </table>                  </TD>
                </TR>
              </TBODY>
          </TABLE></td>
        </tr>
        
      </table>    </td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5" bgcolor="#E9F1F7"></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
<%
call closers()
rs1.close
set rs1=nothing
call closeconn()
%>
</body>
</html>
