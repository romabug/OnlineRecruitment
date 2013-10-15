<%
cid=request.cookies("01387job")("cid")
if len(cid)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs_top,"select companyname,regtime,overtime,power,begintime from [01387company] where cid='"&cid&"'",1,1)
if not rs_top.eof then
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="../images/m16.gif">
  <tr>
    <td height="37" ><font color="#FF3300"><strong style="color:#56A61F">&nbsp;&nbsp;<%=rs_top(0)%></strong></font>
    <font color="#666666"><strong>欢迎您！</strong></font><font color="#666666">
  <%
select case rs_top(3)
case 0
powervalue="[普通会员]&nbsp;"
case 1
powervalue="[普通会员]&nbsp;"
case 2
powervalue="[正式会员]&nbsp;"
case 3
powervalue="[VIP会员]&nbsp;"
case 4
powervalue="[重点推荐会员]&nbsp;"
end select
response.write(powervalue)%>
  <%if rs_top(3)<>0 and rs_top(3)<>1 then
response.write("成为会员时间：<font class='p11'>"&datevalue(rs_top("begintime"))&"</font> 到期时间：<font class='p11'>"&datevalue(rs_top("overtime"))&"</font>")%>
  <%
else
response.write("注册时间：<font face='Geneva, Arial, Helvetica, sans-serif'><strong>"&datevalue(rs_top("regtime"))&"</strong></font>")
end if
end if
rs_top.close
set rs_top=nothing
%></td>
    <td width="104" ><a class="whome" href="default.asp" ></a></td>
    <td width="2%" >&nbsp;</td>
  </tr>
</table>
