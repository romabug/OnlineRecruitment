<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request("id")
if id="" or isnumeric(id)=false then
	Call ShowError("��������")
end if
page=request("page")
'response.Write(urlgo)
'response.End()
Call RsName(rs,"Select companyname,power,powertime,begintime,overtime,dealman,dealresult,dealtime,regtime,dealstatus from [01387company] where id="&id&"",1,1)
if request("action")="go" then
	power=request.form("power")
	powertime=request.form("powertime")
	dealresult=request("dealresult")
	dealstatus=request("dealstatus")
	select case powertime
	case 1
	overtime=rs(8)
	case 2
	overtime=dateadd("m",3,now())
	case 3
	overtime=dateadd("m",6,now())
	case 4
	overtime=dateadd("yyyy",1,now())
	case 5
	overtime=dateadd("yyyy",2,now())
	case 6
	overtime=dateadd("m",1,now())
	end select
	if Cint(request.cookies("01387job")("userpower"))<2 then
		conn.execute("update [01387company] set dealman='"&request.cookies("01387job")("superlogin")&"',dealresult='"&dealresult&"',dealtime='"&now()&"',closed=0 where id="&request.querystring("id"))
	else
		conn.execute("update [01387company] set dealman='"&request.cookies("01387job")("superlogin")&"',dealresult='"&dealresult&"',dealtime='"&now()&"',power="&power&",powertime="&powertime&",begintime='"&now()&"',overtime='"&overtime&"',dealstatus='"&dealstatus&"',closed=0 where id="&request.querystring("id"))
	end if
	call ShowErrorTo("�����ɹ���","CompanyDeal.asp?id="&request("id"))
end if
if Cint(request.cookies("01387job")("userpower"))<2 then
	if rs(5)<>request.cookies("01387job")("superlogin") then
		Call ShowErrorClose("��Ȩ�ޣ�")
	end if
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="CompanyDeal.asp?action=go&id=<%=id%>&page=<%=page%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��˾��</div></td>
      <td><strong><%=rs(0)%></strong></td>
    </tr>
    <%if Cint(request.cookies("01387job")("userpower"))>1 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��Ա���</div></td>
      <td><select name="power" id="power">
          <option value="4" <%if rs(1)=4 then response.Write("selected")%>>�ص��Ƽ�</option>
          <option value="3" <%if rs(1)=3 then response.Write("selected")%>>VIP��Ա</option>
          <option value="2" <%if rs(1)=2 then response.Write("selected")%>>��ʽ��Ա</option>
          <option value="1" <%if rs(1)=1 then response.Write("selected")%>>��ͨ��Ա</option>
        </select></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��Ա����ʱ�䣺</div></td>
      <td><select name="powertime" class="input" id="powertime">
          <option value=1 <%if rs(2)=1 then response.write("selected")%>>��ѻ�Ա(����)</option>
          <option value=6 <%if rs(2)=6 then response.write("selected")%>>һ����</option>
          <option value=2 <%if rs(2)=2 then response.write("selected")%>>������</option>
          <option value=3 <%if rs(2)=3 then response.write("selected")%>>����</option>
          <option value=4 <%if rs(2)=4 then response.write("selected")%>>һ��</option>
          <option value=5 <%if rs(2)=5 then response.write("selected")%>>����</option>
        </select></td>
    </tr>
    <%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��ʼʱ�䣨�Ѵ�����</div></td>
      <td><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">����ʱ�䣨�Ѵ�����</div></td>
      <td><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">�����ˣ�</div></td>
      <td><strong><%=rs(5)%></strong></td>
    </tr>
    <tr> 
      <td width="36%" height="120" bgcolor="#f1f3f5"><div align="right">��������</div></td>
      <td width="64%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="dealresult" cols="40" rows="6" class="input" id="dealresult"><%=rs(6)%></textarea>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">����ʱ�䣺</div></td>
      <td><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(7)%></font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">����״̬��</div></td>
      <td><strong> 
        <input name="dealstatus" type="text" class="input" id="dealstatus" value="<%=rs(9)%>" size="15" maxlength="30">
        </strong></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="ȷ���ύ" style="font-size=12;height=26">
          &nbsp;&nbsp;<a href="javascript:window.close()">[�رմ���]</a> </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call closers()
call CloseConn()
%>
</body>
</html>