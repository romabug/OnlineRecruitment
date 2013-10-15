<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
dim Keywords,sql,Rs,Sparameter
Keywords=request.Form("Keywords")
set rs=server.CreateObject("ADODB.recordset")
If Keywords<>"" then
		sql="select uid,degree,birthday,sex,SubCateLog,lastlogin,uname,pic,doneyear,province,citys,id from [01387member] where resumestatus='open'"
		sql=sql & " and MainCatelog like '%"& Keywords &"%'"
		sql=sql & " or Uname like '%"& Keywords &"%'"
		sql=sql & " or Jobname like '%"& Keywords &"%'"
		sql=sql & " or Degree like '%"& Keywords &"%'"
		sql=sql & " or Jobtype like '%"& Keywords &"%'"
		sql=sql & " or Marry like '%"& Keywords &"%'"
		sql=sql & " or selfintro like '%"& Keywords &"%'"
		sql=sql & " or job_career like '%"& Keywords &"%'"
		sql=sql & " or edu_career like '%"& Keywords &"%'"
		sql=sql & " or subcatelog like '%"& Keywords &"%'"
		sql=sql & " or Spec1 like '%"& Keywords &"%'"
		Sparameter="&keywords="& Keywords & "&"
else
		dim MainCateLog,Jobname,Doneyear,salary,sex,Degree,height1,height2,Birthday1,Birthday2,Jobtype,Marry
		MainCateLog=request("MainCateLog")
		Jobname=request("Jobname")
		Doneyear=request("Doneyear")
		salary=request("salary")
		sex=request("sex")
		Degree=request("Degree")
		height1=request("height1")
		height2=request("height2")
		Birthday1=request("Birthday1")
		Birthday2=request("Birthday2")
		Jobtype=request("Jobtype")
		Marry=request("Marry")
		Sparameter="MainCateLog=" & MainCateLog & "&Jobname=" & Jobname & "&Doneyear=" & Doneyear & "&salary=" & salary & "&sex=" & sex & "&Degree=" & Degree & "&height1=" & height1 & "&height2=" & height2 & "&Birthday1=" & Birthday1 & "&Birthday2=" & Birthday2 & "&Jobtype=" & Jobtype &  "&Marry=" & Marry & "&"
		sql="select uid,degree,birthday,sex,SubCateLog,lastlogin,uname,pic,doneyear,province,citys,id from [01387member] where resumestatus='open'"
		if MainCatelog<>"" then
			sql=sql & " and MainCateLog ="& MainCateLog & ""
		end if
		if Jobname<>"" then
			sql=sql & " and Jobname like '%"&Jobname&"%'"
		end if
		if Doneyear<>"" then
			sql=sql & " and Doneyear >="&Doneyear&""
		end if
		
		if salary<>"" then
			sql=sql & " and salary >="&salary&""
		end if
		
		if sex<>"" then
			sql=sql & " and sex ="&sex&""
		end if
		
		if Degree<>"" then
			sql=sql & " and Degree ='"&Degree&"'"
		end if
		
		if height1<>"" and height2<>"" then
			sql=sql & "and (height>="& height1 &" and height<="& height2 &")"
		end if
		
		if Birthday1<>"" and Birthday2<>"" then
			sql=sql & "and (Year(getdate())-year(Birthday) >="&Birthday1&" and Year(getdate())-year(Birthday)<="&Birthday2&")"
		end if
		
		if Jobtype<>"" then
			sql=sql & " and Jobtype ='"&Jobtype&"'"
		end if
		
		if Marry<>"" then
			sql=sql & " and Marry ='"&Marry&"'"
		end if
End if
sql=sql & "order by lastlogin desc"
rs.open sql,conn,1,1
%>
<!--#include file="../Jobs/page.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<script language=jscript>
function CheckOthers(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            if (e.checked==false)
            {
                e.checked = true;
            }
            else
            {
                e.checked = false;
            }
    }
}

function CheckAll(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            e.checked = true;
    }
}
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="jianli.asp";form1.submit();}
	else
		{form1.action="Favoadd.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="jobp_table">
  <tr>
    <td height="20" background="../images/neiye_06.gif" class='jobp_table_top'>人才搜索</td>
    </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td align="center" valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF">
          <form name="form3" method="post" action="../PersonInfo/ShowCheckPerson.asp" target=_blank>
            <tr>
              <td width="11%" align="center" class="jobp">姓名</td>
              <td width="6%" align="center" class="jobp">性别</td>
              <td width="8%" align="center" class="jobp">年龄</td>
              <td width="8%" align="center" class="jobp">学历</td>
              <td width="11%" align="center" class="jobp">工作经验</td>
              <td width="22%" class="jobp">第一期望职位</td>
              <td width="10%" align="center" class="jobp">籍贯</td>
              <td width="17%" align="center" class="jobp">最近登录时间</td>
              <td width="7%" align="center" class="jobp">操作</td>
            </tr>
            <%
		i=1
		do while not rs.eof
		if rs(6)<>"" then
		%>
            <tr <%if i mod 2 = 0 then response.Write "bgcolor=#F6F9FD" else response.Write "bgcolor=#ffffff" end if%>>
              <td width="11%" height="23" align="center"><a href="../Person/viewresume.asp?sid=<%=rs(11)%>" target="_blank">
		
			<%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower") >3  and session("01387jobcid")<>"" then%>
          	<%=rs(6)%>
            <%else%>
            <%=left(trim(rs("uname")),1)%> 
            <%
				select case rs("sex")
				case true
				response.write("先生")
				case false
				response.write("小姐")
				end select%>
            <%end if%>
			  
			  </a></td>
              <td width="6%" height="23"><div align="center">
                <%
						select case rs(3)
						case true
						response.write("男")
						case false
						response.write("女")
						end select
						%>
              </div></td>
              <td width="8%" height="23" align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=datediff("yyyy",rs(2),date())%></font></td>
              <td width="8%" height="23" align="center"><%
					  select case rs(1)
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
					  end select
					  %>              </td>
              <td width="11%" height="23" align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs(8)%></strong></font>年</td>
              <td width="22%" height="23" align="center"><div align="left"><%=rs(4)%></div></td>
              <td height="23" align="center"><%
		  select case rs(9)
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
		  %>              </td>
              <td width="17%" height="23" align="center" ><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(5))%></font></td>
              <td width="7%" height="23" align="center" ><input name="MyChk" type="checkbox" id="MyChk" value="<%=rs(0)%>"></td>
            </tr>
            <tr>
              <td height="1" colspan="9" background="../images/x1.gif"></td>
            </tr>
            <%
			end if
		i=i+1
		if i>MaxPerpage then exit do
		rs.movenext
		loop
		%>
            <tr>
              <td height="22" colspan="9"><div align="right">
                <input type="button" name="Button3" value="全选" style="font-size=12" onClick="CheckAll(this.form)">
                <input type="button" name="Button2" value="反选" style="font-size=12" onClick="CheckOthers(this.form);">
                <input type="submit" name="btnApply" value="显示所选" style="font-size=12">
              </div></td>
            </tr>
          </form>
        </table>
              <%Call PageGo("member_search_ok",""&Sparameter&"")%>
              <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="10"></td>
                </tr>
            </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
