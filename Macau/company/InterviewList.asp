<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call PowerCheck(2)
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1

set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387applylist] where cid='"&request.cookies("01387job")("cid")&"' and status=3 order by id desc" ,conn,1,1

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="top.asp" -->
<!--#include file="inc/page.inc"-->
<script language="JavaScript" type="text/JavaScript">
<!--

function confirmdel(id){
  if (confirm("真的要删除这条信息?")) 
  window.location.href="Apply_del.asp?from=InterviewList&page=<%=currentpage%>&id="+id+""
} 
function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}
//-->
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<br />
<table border="0" cellpadding="0" cellspacing="0" class="jobp_table">
  <tr>
    <td class='jobp_table_top'>邀请面试记录</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" bgcolor="#FFEFD7">
        <td width="15%" height="24" class="jobp">邀请面试岗位</td>
        <td width="13%" class="jobp">姓名</td>
        <td width="9%" class="jobp">性别</td>
        <td width="12%" class="jobp">学历</td>
        <td class="jobp">状态</td>
        <td class="jobp">邀请函</td>
        <td class="jobp">发出邀请时间</td>
        <td class="jobp">操作</td>
      </tr>
      <%if rs1.eof and rs1.bof then%>
      <tr bgcolor="#FFFFFF">
        <td height="50" colspan="8" align="center"><strong><font class="p11">澳门劳工招聘网，暂时没有信息！</font></strong></td>
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
        <td height="24"><div align="center">
          <a href="../jobs/Showjob.asp?jid=<%=rs1("jid")%>" target="_blank"><%
					  set rs3=server.createobject("adodb.recordset")
					  rs3.open "select jobname from [01387joblist] where jid='"&trim(rs1("jid"))&"'" ,conn,1,1
					  %>
          <%=rs3(0)%></a></div></td>
        <td height="24"><div align="center"> 
					  <%         'response.Write rs1("uid")
				
					  set rs2=server.createobject("adodb.recordset")
                     rs2.open "select uname,sex,degree,id from [01387member] where uid='"&rs1("uid")&"'" ,conn,1,1		
					  suname=rs2(0)
					  sid=rs2(3)
					  ssex=rs2(1)
					  sxl=rs2(2)
					  %>
          <a href="../Person/ShowPerson.asp?sid=<%=sid%>" target="_blank" ><%=suname%></a></div></td>
        <td><div align="center">
          <%
						select case ssex
						case true
						response.write("男")
						case false
						response.write("女")
						end select
						%>
        </div></td>
        <td><div align="center">
          <%
					  select case sxl
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
					  rs2.close
					  %>
        </div></td>
        <td width="12%" align="center"><font color="#009900">已通知面试</font></td>
        <td width="17%" align="center"><a href="javascript:;" onClick="go_url('Apply_viewcompanymessage.asp?id=<%=rs1(0)%>',250,430);">发出的面试通知书</a></td>
        <td width="15%" align="center"><%=rs1("replytime")%></td>
        <td width="7%" align="center"><div align="center"><a href="javascript:confirmdel(<%=rs1("id")%>)"><font color="#FF3300">删除</font></a></div></td>
      </tr>
      <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
    </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
      <table width="100%" height="18" border="1" align="center" cellPadding="0" cellSpacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12">
          <form method=Post action='InterviewList.asp'>
            <tr>
              <td height="30" align="right" bordercolor="#D5EDFE" bgcolor="#FFFFFF">　　
                <%
   If currentpage > 1 Then
      response.write "<a href='InterviewList.asp?page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='InterviewList.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='InterviewList.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='InterviewList.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
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
