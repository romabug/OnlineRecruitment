<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if request.QueryString("action")="modify" then
dim cid,power,powertime,overtime
cid=request.querystring("cid")
power=request.form("power")
powertime=request.form("powertime")
Call RsName(rs,"select regtime,overtime from [01387company] where cid='"&cid&"'",1,1)
select case powertime
case 1
overtime=rs(0)
case 2
overtime=dateadd("m",3,now())
case 3
overtime=dateadd("m",6,now())
case 4
overtime=dateadd("yyyy",1,now())
case 5
overtime=dateadd("yyyy",2,now())
end select
conn.execute("update [01387company] set power="&power&",powertime="&powertime&",begintime='"&now()&"',overtime='"&overtime&"' where cid='"&cid&"'")
Call CloseRs()
call ShowErrorTo("�����ɹ���","CompanyList.asp?page="&request("page")&"")
end if
if chkNO="" then
Call ShowError("��ѡ��һ����ҵ��")
end if
if len(chkNO)<>15 then
Call ShowError("��������")
end if
Call RsName(rs,"Select cid,companyname,power,powertime from [01387company] where cid='"&ChkNo&"'",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ModifyComPower.asp?page=<%=request("page")%>&action=modify&cid=<%=chkNo%>">
    <tr> 
      <td height="25" colspan="3" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� ��ҵ �� Ա �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#E1E9F7"> 
      <td height="28" colspan="3"><div align="center"><a href="CompanyList.asp?power=4"><font color="#FF0000">�ص��Ƽ�</font></a>��<a href="CompanyList.asp?power=3"><font color="#006600">VIP��Ա</font></a>��<a href="CompanyList.asp?power=2"><font color="#0000FF">��ʽ��Ա</font></a>��<a href="CompanyList.asp?power=1">��ͨ��Ա</a>��<a href="CompanyList.asp?power=0">�������Ա</a>��<a href="CompanyList.asp?power=">���л�Ա�б�</a></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">��˾</div></td>
      <td><div align="center">��Ա�ȼ�</div></td>
      <td><div align="center">������ʱ��</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="19%" height="28" bgcolor="#f1f3f5"><div align="center"><%=rs(1)%></div></td>
      <td width="60%"><div align="center"> 
          <input type="radio" name="power" value="4" <%if rs(2)=4 then response.Write("checked")%>>
          <font color="#FF0000">�ص��Ƽ� 
          <input name="power" type="radio" value="3" <%if rs(2)=3 then response.Write("checked")%>>
          <font color="#006600">VIP��Ա</font></font> 
          <input name="power" type="radio" value="2" <%if rs(2)=2 then response.Write("checked")%>>
          <font color="#0000FF">��ʽ��Ա</font> 
          <input type="radio" name="power" value="1" <%if rs(2)=1 then response.Write("checked")%>>
          ��ͨ��Ա</div></td>
      <td width="21%"><div align="center"> 
          <select name="powertime" class="input" id="powertime">
            <option value=1 <%if rs(3)=1 then response.write("selected")%>>��ѻ�Ա(����)</option>
            <option value=2 <%if rs(3)=2 then response.write("selected")%>>������</option>
            <option value=3 <%if rs(3)=3 then response.write("selected")%>>����</option>
            <option value=4 <%if rs(3)=4 then response.write("selected")%>>һ��</option>
            <option value=5 <%if rs(3)=5 then response.write("selected")%>>����</option>
          </select>
        </div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="3"> <div align="center"> 
          <input type="submit" name="btnPower" value="ȷ���޸�" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="�� ��" onclick="location.href='CompanyList.asp'" style="font-size=12;height=26">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>