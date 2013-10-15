<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select companyname,regtime from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select uid,degree,birthday,sex,subcatelog,lastlogin,uname,doneyear,province,id from [01387member] where resumestatus='open' and promember=1  and canshow='ok' order by lastlogin desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<!--#include file="inc/page20.inc"-->
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
	    {form1.action="ShowCheckPerson.asp";form1.submit();}
	else
		{form1.action="Favoadd.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <br />
        <table width="600" border="0" cellpadding="0" cellspacing="0" class="jobp_table">
          <tr>
            <td  class='jobp_table_top'>高级人才列表</td>
          </tr>
          <tr>
            <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <form action="" method="post" name="form1" id="form1">
                  <tr align="center">
                    <td width="94" height="24" class="jobp">姓名<font color="#FF0000">&nbsp;</font></td>
                    <td width="68" class="jobp">学历</td>
                    <td width="41" class="jobp">年龄</td>
                    <td width="44" class="jobp">性别</td>
                    <td width="62" class="jobp">籍贯</td>
                    <td width="67" class="jobp">工作经验</td>
                    <td width="115" class="jobp">第一期望职位</td>
                    <td width="103" class="jobp">登陆时间</td>
                    <td width="42" class="jobp">操作</td>
                  </tr>
                  <%if rs1.eof and rs1.bof then%>
                  <tr bgcolor="#FFFFFF">
                    <td height="50" colspan="9"><div align="center"><font class="p11"><strong>澳门劳工招聘网，暂时没有信息！</strong></font></div></td>
                  </tr>
                  <%end if%>
                  <%
					  i=1
					  do while not rs1.eof
					  if i mod 2 = 0 then
					  bg="bgcolor=#ffffff" 
					  '如果是背景图片,即 
					  'bg="background=""image/*.*"""
					  else
					  bg="bgcolor=#F6F9FD"
					  end if
					  %>
                  <tr <%=bg%>>
                    <td height="24"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">
					
					<a href="../Person/viewresume.asp?sid=<%=rs1("id")%>" target="_blank"><%=rs1(6)%></a></font></div></td>
                    <td height="24" align="center"><%
					  select case rs1(1)
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
					  %></td>
                    <td align="center"><%=datediff("yyyy",rs1(2),date())%></td>
                    <td align="center"><%
						select case rs1(3)
						case true
						response.write("男")
						case false
						response.write("女")
						end select
						%></td>
                    <td align="center"><%
		  select case rs1(8)
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
		  %></td>
                    <td align="center"><%=rs1(7)%>年</td>
                    <td align="center"><%=rs1(4)%></td>
                    <td><div align="center"><%=datevalue(rs1(5))%></div></td>
                    <td><div align="center">
                        <input name="chkNo" type="checkbox" value="<%=rs1(0)%>" />
                    </div></td>
                  </tr>
                  <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
                  <tr>
                    <td height="30" colspan="9" bgcolor="#FFFFFF"><div align="right">
                        <input type="button" name="Button3" value="全选" style="font-size=12" onClick="CheckAll(this.form)" />
                        <input type="button" name="Button2" value="反选" style="font-size=12" onClick="CheckOthers(this.form);" />
                        <input type="button" name="btnApply" value="加入人才收藏夹" style="font-size=12" onClick="doSubmit(document.form1,this)" />
           <!--   <input name="btnShow" type="button" id="btnShow" style="font-size=12" onClick="doSubmit(document.form1,this)" value="显示所选" />   -->
                    </div></td>
                  </tr>
                </form>
            </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="5"></td>
                  </tr>
                </table>
              <table width="100%" height="18" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12">
                  <form method="post" action='MemberlistPro.asp'>
                    <tr>
                      <td height="30" align="right" bordercolor="#f0f0f0" bgcolor="#FFFFFF">　　
                        <%
   If currentpage > 1 Then
      response.write "<a href='MemberlistPro.asp?page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>后页-</font>"
      Response.write "<font color='#333333'>尾页</font>&nbsp;&nbsp;"       
   End if
   Response.write "<font color='#333333'>页次:</font>" & "<font color=#ff0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333'>条/页&nbsp" & "共</font>" & "<font color=#ff0000>" & Cstr(Rs1.RecordCount) & "</font>" & "<font color='#333333'>条信息</font>&nbsp;&nbsp;"

response.write "&nbsp;&nbsp;&nbsp;&nbsp;"
response.write "<font color='#333333'>转到：</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
   response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
%></td>
                    </tr>
                  </form>
              </table></td>
          </tr>
        </table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
