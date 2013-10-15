<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
Call JobOverTime()
dim RS,sql,Companyname,Properity,Jobname,Salary,list2,sex,Degree,Jobtype,Doneyear,pubtime,Sparameter
	Companyname=request("Companyname")
	Properity=request("Properity")
	Jobname=request("Jobname")
	Salary=request("Salary")
	list2=request("list2")
	sex=request("sex")
	Degree=request("Degree")
	Jobtype=request("Jobtype")
	Doneyear=request("Doneyear")
	publisttime=request("publisttime")
Sparameter="Companyname=" & Companyname & "&Properity=" & Properity & "&Jobname=" & Jobname & "&Salary=" & Salary & "&list2=" & list2 & "&sex=" & sex & "&Degree=" & Degree & "&Jobtype=" & Jobtype & "&Doneyear=" & Doneyear & "&publisttime=" & publisttime & "&"
set RS=Server.CreateObject("ADODB.Recordset")
Sql="select A.id,A.jid,A.cid,A.jobname,B.companyname,A.neednum,A.salary,A.publishtime,A.lookcount,A.detailtime from"

sql=sql & " [01387joblist] A inner join [01387company] B on A.cid=B.cid where A.canshow='ok'"

If Companyname<>"" then
	sql=sql & " and B.Companyname like '%"& Companyname &"%'"
End If

If Properity<>""  then
	sql=sql & " and B.properity ="& properity & ""
End If

If Jobname<>"" then
	sql=sql & " and A.Jobname like '%"& Jobname &"%'"
End If

If Salary<>"" then
	sql=sql & " and A.Salary>= "&Salary&""
End If

If list2<>"" then
	sql=sql & " and A.MainCateLog ="&list2&""
End If

If sex<>"" then
	sql=sql & " and A.Sex="& sex &""
End If

If Degree<>"" then
	sql=sql & " and A.Degree>="&Degree&""
End If

If Jobtype<>"" then
	sql=sql & " and A.Jobtype='"& Jobtype &"'"
End If

If Doneyear<>"" then
	sql=sql & " and A.Doneyear >="& Doneyear &""
End If

If publisttime<>"" then
	sql=sql & " and (getdate()-A.Publishtime)<="&publisttime&" "
End If
'response.write(sql)
'response.end()
sql=sql&" order by A.detailtime desc,A.id desc"
rs.open sql,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网个人求职管理-搜索结果</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
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
                  </script>
<body>
<!--#include file="top.asp"-->
<!--#include file="../Jobs/page.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" background="../images/p16.gif">
  <tr>
    <td height="37" >&nbsp;&nbsp;<%
set rs1=server.createobject("adodb.recordset")
rs1.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%><font class="wel2"><%=rs1("uname")%></font> 欢迎您！注册时间：<%=datevalue(rs1("regtime"))%> 您是个人会员<font color="#666666"><strong>(普通会员)</strong></font><%rs1.close
set rs1=nothing%></td>
    <td width="104" ><a class="whome2" href="default.asp" ></a></td>
    <td width="2%" >&nbsp;</td>
  </tr>
</table>
      <table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
        <form action="../Jobs/ShowCheckJob.asp" method="post" name="form3" target="_blank" id="form3">
          <tr align="center">
            <td height="22" colspan="7" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;共找到 <font color="#FD5901"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs.recordcount%></font></strong></font>条符合条件的信息</td>
          </tr>
          <tr align="center">
            <td width="25%" height="21" align="left"  class="jobp2" style="">&nbsp;招聘岗位</td>
            <td width="28%" height="21" align="left"  class="jobp">&nbsp;公司名称</td>
            <td width="6%" height="21" align="center"  class="jobp">人数 </td>
            <td width="12%" height="21" align="center"  class="jobp">薪水</td>
            <td width="13%" height="21"  class="jobp">发布日期</td>
            <td width="10%" height="21"  class="jobp">查看数</td>
            <td width="6%" height="21"  class="jobp">操作</td>
          </tr>
          <%
		i=1
		do while not rs.eof%>
          <tr onMouseOver="this.bgColor= '#F7F7F6'" onMouseOut="this.bgColor= '#FFFFFF'" >
            <td height="23" class="tdr">&nbsp;<a class="qjobbure" href="../Jobs/ShowJob.asp?jid=<%=rs(1)%>" target="_blank"><%=trim(rs(3))%> </a></td>
            <td class="tdr"><a class="l" href="../Jobs/ShowCompany.asp?cid=<%=rs(2)%>" target="_blank"> <%=rs(4)%> </a></td>
            <td align="center" class="tdr"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(5)%></font></td>
            <td align="center" class="tdr"><font face="Geneva, Arial, Helvetica, sans-serif">
              <%if rs(6)=0 then response.Write("面议")else response.Write(rs(6)&"元/月")%>
            </font></td>
            <td align="center" class="tdr"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(7)%></font></td>
            <td width="10%" align="center" class="tdr"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(8)%></font></td>
            <td width="6%" align="center" class="tdr"><input name="MyChk" type="checkbox" id="MyChk" value="<%=rs(1)%>" /></td>
          </tr>
          <tr>
            <td height="1" colspan="7" background="../images/x1.gif"></td>
          </tr>
          <%
		i=i+1
		if i>MaxPerpage then exit do
		rs.movenext
		loop
		%>
          <tr>
            <td height="30" colspan="7"><div align="right">
                <input type="button" name="Button3" value="全选" style="font-size=12" onclick="CheckAll(this.form)" />
                <input type="button" name="Button2" value="反选" style="font-size=12" onclick="CheckOthers(this.form);" />
                <input type="submit" name="btnApply" value="显示所选" style="font-size=12" />
            </div></td>
          </tr>
        </form>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top"><%Call PageGo("Personsearch_OK",""&Sparameter&"")%>
          </td>
        </tr>
      </table>
    <br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
Call CloseRs()
Call CloseConn()
%>
