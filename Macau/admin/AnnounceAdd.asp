<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
mytype=request("mytype")
if mytype="" then
Call RsName(rs,"Select id,mytype,title,content,addtime from [01387Announce] order by id desc",1,1)
else
Call RsName(rs,"Select id,mytype,title,content,addtime from [01387Announce] where mytype="&Cint(mytype)&" order by id desc",1,1)
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function confirmdel(id){
  if (confirm("ȷ��Ҫɾ����?")) 
  window.location.href="Announce_Del.asp?id="+id+""
} 
var x=0
function showMsg(msg,bl){
try{
  zb=eval('document.all.'+msg+'.style');
   
zb.display =(bl?'inline':'none')

}catch(e){}

}
</script>
<%call main_top()%>
<!--#include file="inc/Page15.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="AnnounceAdd_save.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� �� Ա �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="18%" height="30"><div align="right">�������</div></td>
      <td width="82%"><input type="radio" name="mytype" value="1">
        ���˻�Ա���� 
        <input type="radio" name="mytype" value="2">
        ��ҵ��Ա���� 
        <input type="radio" name="mytype" value="3">
        ��վ��̨����</td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">���⣺ </div></td>
      <td height="30"><input name="title" type="text" class="input" id="title" size="80">
        <font color="#FF3300"><strong>*(50������)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">���ݣ� </div></td>
      <td height="30"><textarea name="content" cols="80" rows="8" class="input" id="content"></textarea>
        <font color="#FF3300"><strong>*(1500������)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="ȷ �� �� ��">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="4" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
        Ա �� �� �� ��</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>���</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>����</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>����ʱ��</strong></font></div></td>
    <td height="25"><div align="center"><font color="#999999"><font color="#333333"></font></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="11%" height="30"><div align="center"> 
        <%
	select case rs(1)
	case 1
	response.Write("<a href='AnnounceAdd.asp?mytype=1'><font color=red>���˹���</a></font>")
	case 2
	response.Write("<a href='AnnounceAdd.asp?mytype=2'><font color=blue>��ҵ����</a></font>")
	case 3
	response.Write("<a href='AnnounceAdd.asp?mytype=3'><font color=green>��̨����</a></font>")
	end select
	%>
      </div></td>
    <td width="68%"><div align="center"><a style="cursor:hand" onclick="javascript:showMsg('zb<%=rs(0)%>',x=1-x)"><font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(2)%></font></a></div></td>
    <td width="13%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></div></td>
    <td width="8%"><div align="center"><a href='javascript:confirmdel(<%=rs(0)%>)'><font color="#FF3300">ɾ��</font></a></div></td>
  </tr>
  <tr id="zb<%=rs(0)%>" style="display:none"> 
    <td height="30" colspan="4" bgcolor="#D7EAFF"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs(3)%></strong></font></td>
  </tr>
  <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("AnnounceAdd","mytype="&request("mytype")&"&")%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseRs()
call CloseConn()
%>
</body>
</html>