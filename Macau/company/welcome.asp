<%
cid=request.cookies("01387job")("cid")
if len(cid)<>15 then
Call ShowError("��������")
end if
Call RsName(rs_top,"select companyname,regtime,overtime,power,begintime from [01387company] where cid='"&cid&"'",1,1)
if not rs_top.eof then
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="../images/m16.gif">
  <tr>
    <td height="37" ><font color="#FF3300"><strong style="color:#56A61F">&nbsp;&nbsp;<%=rs_top(0)%></strong></font>
    <font color="#666666"><strong>��ӭ����</strong></font><font color="#666666">
  <%
select case rs_top(3)
case 0
powervalue="[��ͨ��Ա]&nbsp;"
case 1
powervalue="[��ͨ��Ա]&nbsp;"
case 2
powervalue="[��ʽ��Ա]&nbsp;"
case 3
powervalue="[VIP��Ա]&nbsp;"
case 4
powervalue="[�ص��Ƽ���Ա]&nbsp;"
end select
response.write(powervalue)%>
  <%if rs_top(3)<>0 and rs_top(3)<>1 then
response.write("��Ϊ��Աʱ�䣺<font class='p11'>"&datevalue(rs_top("begintime"))&"</font> ����ʱ�䣺<font class='p11'>"&datevalue(rs_top("overtime"))&"</font>")%>
  <%
else
response.write("ע��ʱ�䣺<font face='Geneva, Arial, Helvetica, sans-serif'><strong>"&datevalue(rs_top("regtime"))&"</strong></font>")
end if
end if
rs_top.close
set rs_top=nothing
%></td>
    <td width="104" ><a class="whome" href="default.asp" ></a></td>
    <td width="2%" >&nbsp;</td>
  </tr>
</table>
