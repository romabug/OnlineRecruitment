<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if cint(request.cookies("01387job")("userpower"))<2 then
sql="Select cid,username,companyname,legal,tel,famous,power,regtime,overtime,powertime,hurry,closed_time,closed_overtime,deal,id,dealman,lastlogin,licence from [01387company] where (dealman='"&request.cookies("01387job")("superlogin")&"' or dealman is null)"
else
sql="Select cid,username,companyname,legal,tel,famous,power,regtime,overtime,powertime,hurry,closed_time,closed_overtime,deal,id,dealman,lastlogin,licence from [01387company] where 1=1"
end if
if request("key")<>"" then
sql=sql&" and (companyname like '%"&request("key")&"%' or legal='"&request("key")&"' or username='"& request("key")&"')"
end if
sql=sql&" order by lastlogin desc,regtime desc"
Call RsName(rs,sql,1,1)
%>
<!--#include file="inc/Page15.inc"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<script language=jscript>
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="ShowCompany.asp?page=<%=currentpage%>";form1.submit();}
	else if (btnClicked.name=="btnFamous")
		{form1.action="ModifyComFamous.asp?page=<%=currentpage%>";form1.submit();}
	else if (btnClicked.name=="btnPower")
		{form1.action="ModifyComPower.asp?page=<%=currentpage%>";form1.submit();}
	else if (btnClicked.name=="btnHurry")
		{form1.action="ModifyComHurrytime.asp?page=<%=currentpage%>";form1.submit();}
	else if (btnClicked.name=="btnMessage")
		{form1.action="CompanySendMessage.asp";form1.submit();}
	else if (btnClicked.name=="btnPwd")
		{form1.action="CompanyPwdReset.asp";form1.submit();}
	else if (btnClicked.name=="btnClosed")
		{form1.action="CompanyClosed.asp";form1.submit();}		
	else
		{form1.action="DelCompany.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form2" method="post" action="CompanySearch.asp">
    <tr> 
      <td height="25" colspan="11" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          ҵ �� Ա �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11">&nbsp;��ҵ��Ա������ 
        <input name="key" type="text" class="input" id="key" size="30"> <input name="Submit" type="submit" class="botton" value="����">
        ���ؼ��ֿ�Ϊ���û�������˾�������ˣ�</td>
    </tr>
  </form>
  <form name="form1" method="post" action="">
    <tr> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">�û���</div></td>
      <td bgcolor="#CEDBF2"><div align="center">��˾</div></td>
      <td bgcolor="#CEDBF2"><div align="center">����</div></td>
      <td bgcolor="#CEDBF2"><div align="center">�绰</div></td>
      <td bgcolor="#CEDBF2"><div align="center">�����¼</div></td>
      <td bgcolor="#CEDBF2"><div align="center"><a href="CompanyList.asp?Power=">��Ա�ȼ�</a></div></td>
      <td bgcolor="#CEDBF2"><div align="center"><a href="CompanyList.asp?Hurry=1">�Ӽ�</a></div></td>
      <td bgcolor="#CEDBF2"><div align="center">ע��ʱ��</div></td>
      <td bgcolor="#CEDBF2"><div align="center">������</div></td>
      <td bgcolor="#CEDBF2"><div align="center">����ʱ��</div></td>
      <td bgcolor="#CEDBF2"><div align="center">����</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr> 
      <td width="9%" height="28" bgcolor="#f1f3f5"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><a href="ShowCompany.asp?chkNo=<%=rs(0)%>"><%=rs(1)%></a></font></strong></div></td>
      <td width="15%" bgcolor="#f1f3f5"><div align="center"><a href="<%=rs("licence")%>" target="_blank"><%=replace(rs(2),request("key"),"<font color=red>"&request("key")&"</font>")%></a></div></td>
      <td width="8%" bgcolor="#f1f3f5"><div align="center"><%=rs(3)%></div></td>
      <td width="17%" bgcolor="#f1f3f5"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></div></td>
      <td width="9%" bgcolor="#f1f3f5"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif">
          <%if datevalue(rs(16))=date then response.Write("<font color=red>"&rs(16)&"</font>") else response.Write(rs(16))%>
          </font></div></td>
      <td width="8%" bgcolor="#f1f3f5"><div align="center"> 
          <%
dim power
Select Case rs(6)
Case 0
power="<a href='CompanyList.asp?Power=0'><b>�������Ա</b></a>"
Case 1
power="<a href='CompanyList.asp?Power=1'>��ͨ��Ա</a>"
Case 2
power="<a href='CompanyList.asp?Power=2'><font color=blue>��ʽ��Ա</font></a>"
Case 3
power="<a href='CompanyList.asp?Power=3'><font color=green>VIP��Ա</font></a>"
Case 4
power="<a href='CompanyList.asp?Power=4'><font color=red>�ص��Ƽ�</font></a>"
End Select
%>
          <%=power%></div></td>
      <td width="5%" bgcolor="#f1f3f5"><div align="center"> 
          <%
dim hurry
Select Case rs(10)
Case true
hurry="<a href='CompanyList.asp?Hurry=1'><font color=red>��</font></a>"
Case false
hurry="<a href='CompanyList.asp?Hurry=0'><font color=blue>��</font></a>"
End Select
%>
          <%=hurry%> </div></td>
      <td width="9%" bgcolor="#f1f3f5"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(7))%></font></strong></div></td>
      <td width="7%" bgcolor="#f1f3f5"><div align="center"> <a href="javascript:;" onMouseDown="MM_openBrWindow('CompanyDeal.asp?id=<%=rs(14)%>','','width=560,height=400')"> 
          <%if rs(15)<>"" then
	   		response.Write(rs(15))
	   else 
	   		response.write("δ����")
		end if%>
          </a></div></td>
      <td width="9%" bgcolor="#f1f3f5"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <%if rs(9)=1 then response.Write("���û�Ա") else response.write("<b>"&datevalue(rs(8))&"</b>")%>
          </font></div></td>
      <td width="4%" bgcolor="#f1f3f5"><div align="center"> 
          <%if Cint(request.cookies("01387job")("userpower"))>1 then%><input type="radio" name="ChkNo" value="<%=rs(0)%>"><%end if%>
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
<%if Cint(request.cookies("01387job")("userpower"))>1 then%>
    <tr> 
      <td height="26" colspan="11" bgcolor="#E6E9EC"> <div align="right"> 
          <input name="Page" type="hidden" value="<%=currentpage%>">
          <input type="button" name="btnMessage" value="������Ϣ" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnShow" value="��ϸ��Ϣ" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnFamous" value="�Ƽ�/ȡ��֪��" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnHurry" value="��ҳ�Ӽ�" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input name="btnPwd" type="button" id="btnPwd" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="��������">
          <input name="btnClosed" type="button" id="btnClosed" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="����/�ⶳ">
          <input type="button" name="btnDel" value="ɾ��(����)" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
	<%end if%>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("CompanySearch","Key="&request("key")&"&Power="&request("Power")&"&Famous="&request("Famous")&"&Hurry="&request("Hurry")&"&")%>
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