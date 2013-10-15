<%
'Designed By L.C.H
'所有后台调用东东
%>
<%
'L.C.H-001建立连接数据库记录
Function RsName(Rs_Name,Sql,A,B)
Set Rs_Name=Server.CreateObject("Adodb.RecordSet")
Rs_Name.open Sql,conn,A,B
End Function
'************************************************************************
'L.C.H-002释放记录集
Sub CloseRs()
rs.close
set rs=nothing
End Sub
'************************************************************************
'L.C.H-003释放conn
Sub CloseConn()
conn.close
set conn=nothing
End Sub
'************************************************************************
%>
<%
'L.C.H-004管理首页公告栏 
Sub main_top()
Call RsName(Announce,"select top 1 * from [01387Announce] where mytype=3 order by id desc",1,1)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="image/admin_bg_2.gif" class="12">
  <tr> 
    <td width="3%" height="25" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><img src="image/i_home.gif" width="16" height="18"></div></td>
    <td width="18%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"> 
        <script language=javascript>
<!--
calendar = new Date();
day = calendar.getDay();
month = calendar.getMonth();
date = calendar.getDate();
year = calendar.getYear();
if (year< 100) year = 1900 + year;
cent = parseInt(year/100);
g = year % 19;
k = parseInt((cent - 17)/25);
i = (cent - parseInt(cent/4) - parseInt((cent - k)/3) + 19*g + 15) % 30;
i = i - parseInt(i/28)*(1 - parseInt(i/28)*parseInt(29/(i+1))*parseInt((21-g)/11));
j = (year + parseInt(year/4) + i + 2 - cent + parseInt(cent/4)) % 7;
l = i - j;
emonth = 3 + parseInt((l + 40)/44);
edate = l + 28 - 31*parseInt((emonth/4));
emonth--;
var dayname = new Array ("周日", "周一", "周二", "周三", "周四", "周五", "周六");
var monthname = 
new Array ("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月" );
document.write("<font color=#0033ff style='font-size:9pt'>"+year +"年");
document.write(monthname[month]);
document.write(date + "日");
document.write("&nbsp;");
document.write(dayname[day]+" "+"</font>");
document.write("<br></font>");

//-->
</script>
        </font></div></td>
    <td width="67%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><marquee scrolldelay=50; scrollamount=2; onMouseOver=stop(); onMouseOut=start(); direction=left;width="67%">
      <%if Announce.eof and Announce.bof then%>
	  暂无公告！
	  <%end if%>
	  <%do while not Announce.eof%>
	  <a href="AnnounceDetail.asp?id=<%=Announce("id")%>" target="_blank"><%=Announce("title")%></a>
	  <%Announce.movenext
	  loop%>
	  </marquee></td>
    <td width="12%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><a href="../" target="_parent">Macau69首页</a></div></td>
  </tr>
</table>
<%
Announce.close
set Announce=nothing
End Sub
'************************************************************************
%>
<%
'L.C.H-005后台管理所有页面的尾文件
Sub footer()
response.Write("<table width='98%' border='0' cellspacing='0' cellpadding='0' class='table2' align='center'><tr><td height=8> </td></tr><tr>")
response.Write("<td><div align='center'>Copyright&copy;2007&nbsp;澳门劳工招聘网 &nbsp;<a href='http://www.macau69.com/' target='_blank'>macau69.com</a>&nbsp;.&nbsp;All Rights Reserved. </div></td></tr></table>")
End Sub
'************************************************************************
'L.C.H-006显示错误提示且返回上一页
Function ShowError(a)
response.write("<script language=javascript>alert('"&a&"');javascript:history.go(-1)")
response.write("</script>")
response.end()
End Function
'************************************************************************
'L.C.H-007显示错误提示且重新载入另一页
Function ShowErrorTo(a,b)
response.write("<script language=javascript>alert('"&a&"');")
response.write("this.location.href='"&b&"';</script>")
response.end()
End Function
'************************************************************************
'L.C.H-009分页调用
Function PageGo(a,sql)
response.write "<table width='99%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#999999' bgcolor='#f0f0f0' class='12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='24' bordercolor='#f0f0f0'><div align='center'>"
   If currentpage > 1 Then
      response.write "<a href='"&a&".asp?"&sql&"page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   If currentpage < rs.PageCount Then
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(rs.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>后页-</font>"
      Response.write "<font color='#333333'>尾页</font>&nbsp;&nbsp;"       
   End if
Response.write "<font color='#333333'>页次:</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>/" & Cstr(rs.pagecount) & "</font>&nbsp;"
Response.write "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>条/页&nbsp" & "共</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(rs.RecordCount) & "</font>" & "<font color='#333333'>条信息</font>&nbsp;&nbsp;"
response.write "<font color='#333333'>转到：</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-010权限分配
Function PowerCheck(a)
if Cint(request.cookies("01387job")("userpower"))<Cint(a) then
Call ShowError("无权限！")
end if
End Function
%>
