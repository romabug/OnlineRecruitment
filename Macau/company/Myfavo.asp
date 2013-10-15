<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call PowerCheck(1)
set rs1=server.createobject("adodb.recordset")
rs1.open "select uid from [01387favorite] where cid='"&request.cookies("01387job")("cid")&"' and mytype=1 order by id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业招聘管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
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
		{form1.action="Myfavo_del.asp?page=<%=currentpage%>";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="600" border="0" cellpadding="0" cellspacing="0" class="jobp_table">
  <tr>
    <td class='jobp_table_top'>人才收藏夹</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <form action="" method="post" name="form1" id="form1" >
        <tr align="center" bgcolor="#FFEFD7">
          <td width="22%" height="24" class="jobp">姓名<font color="#FF0000">&nbsp;</font></td>
          <td width="12%" class="jobp">学历</td>
          <td width="7%" class="jobp">年龄</td>
          <td width="8%" class="jobp">性别</td>
          <td width="27%" class="jobp">应聘职位名称</td>
          <td width="16%" class="jobp">登陆时间</td>
          <td width="8%" class="jobp">操作</td>
        </tr>
        <%if rs1.eof and rs1.bof then%>
        <tr bgcolor="#FFFFFF">
          <td height="50" colspan="7"><div align="center"><strong><font class="p11">澳门劳工招聘网，暂时没有信息！</font></strong></div></td>
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
            <%
					    set rs2=server.createobject("adodb.recordset")
					    rs2.open "select uname,degree,birthday,sex,jobname,lastlogin,id from [01387member] where uid='"&rs1(0)&"'" ,conn,1,1
					    %>
            <a href="../Person/viewresume.asp?sid=<%=rs2("id")%>" target="_blank">
		
	    <%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower") >3  and session("01387jobcid")<>"" then%>
          	<%=rs2(0)%>
            <%else%>
            <%=left(trim(rs2("uname")),1)%> 
            <%
				select case rs2("sex")
				case true
				response.write("先生")
				case false
				response.write("小姐")
				end select%>
            <%end if%>
	
			
			</a></div></td>
          <td><div align="center">
            <%
					  select case rs2(1)
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
					  %>
          </div></td>
          <td><div align="center"><%=datediff("yyyy",rs2(2),date())%></div></td>
          <td><div align="center">
            <%
						select case rs2(3)
						case true
						response.write("男")
						case false
						response.write("女")
						end select
						%>
          </div></td>
          <td align="center"><%=rs2(4)%></td>
          <td><div align="center"><%=datevalue(rs2(5))%></div></td>
          <td><div align="center">
            <input name="chkNo" type="checkbox" id="chkNo" value="<%=rs1(0)%>" />
          </div></td>
        </tr>
        <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
        <tr bgcolor="#FFFFFF">
          <td height="30" colspan="7"><div align="right">
            <input type="button" name="Button3" value="全选" style="font-size=12" onClick="CheckAll(this.form)">
                            <input type="button" name="Button2" value="反选" style="font-size=12" onClick="CheckOthers(this.form);">
                  <!--          <input name="btnShow" type="button" id="btnShow" style="font-size=12" onClick="doSubmit(document.form1,this)" value="显示所选">   -->
                            <input name="btnDel" type="button" id="btnDel" style="font-size=12" onClick="doSubmit(document.form1,this)" value="删除">        </div></td>
        </tr>
      </form>
    </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
      <table width="100%" height="18" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12">
          <form method="post" action='Myfavo.asp'>
            <tr>
              <td height="30" align="right" bordercolor="#D5EDFE" bgcolor="#FFFFFF">　　
                <%
   If currentpage > 1 Then
      response.write "<a href='Myfavo.asp?page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='Myfavo.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='Myfavo.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='Myfavo.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>后页-</font>"
      Response.write "<font color='#333333'>尾页</font>&nbsp;&nbsp;"       
   End if
   Response.write "<font color='#333333'>页次:</font>" & "<font color=#ff0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333'>条/页&nbsp" & "共</font>" & "<font color=#ff0000>" & Cstr(Rs1.RecordCount) & "</font>" & "<font color='#333333'>条信息</font>&nbsp;&nbsp;"

response.write "&nbsp;&nbsp;&nbsp;&nbsp;"
response.write "<font color='#333333'>转到：</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
   response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
%>
                &nbsp;</td>
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
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
