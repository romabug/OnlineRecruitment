<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select title,addtime,id,mytype from [01387VoteTitle] order by id desc",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function confirmdel(a,id){
  if (confirm("ȷ��Ҫɾ����?")) 
  window.location.href="Vote_Del.asp?action="+a+"&id="+id+""
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="Vote_Add_One.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">���� 
          ��վͶƱ����</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="17%" height="30"><div align="right">ͶƱ���ͣ�</div></td>
      <td width="83%"><input type="radio" name="mytype" value="1">
        ��ѡ�� 
        <input type="radio" name="mytype" value="2">
        ��ѡ��</td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">�������⣺ </div></td>
      <td height="30"><input name="title" type="text" class="input" id="title" size="100"></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="�� һ ��">
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
    <td height="25" colspan="4" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">��վ��ҳͶƱ�б�</font></strong></div></td>
  </tr>
  <%if rs.eof and rs.bof then%>
  <tr bgcolor="#f1f3f5"> 
    <td height="25" colspan="4"> <div align="center"><strong><font color="#FF0000">�����ݣ�</font></strong></div></td>
  </tr>
  <%end if%>
  <%do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="11%" height="30"><div align="right">��&nbsp;&nbsp;�⣺ </div></td>
    <td width="73%" bgcolor="#f1f3f5"><a style="cursor:hand" onclick="javascript:showMsg('zb<%=rs(2)%>',x=1-x)"><font color="#0033CC"><%=rs(0)%></font></a>&nbsp;&nbsp;<%if rs(3)=1 then%>����ѡ�ͣ�<%else%>����ѡ�ͣ�<%end if%></td>
    <td width="10%"><div align="right"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(1)%></font></strong></div></td>
    <td width="6%"><div align="center"><a href='javascript:confirmdel("title",<%=rs(2)%>)'><font color="#FF3300">ɾ��</font></a></div></td>
  </tr>
  <tr bgcolor="#D7EAFF" id="zb<%=rs(2)%>" style="display:none"> 
    <td height="30" colspan="4"><table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
	  <%Call RsName(rs1,"Select selectitem,votecount,id from [01387VoteSelect] where titleid="&rs(2)&"",1,1)
	  if not rs1.eof then
	  %>
	  <%do while not rs1.eof%>
        <tr bgcolor="#D7EAFF" class="table"> 
          <td width="11%" height="30" bgcolor="#D7EAFF"><div align="right">ѡ&nbsp;&nbsp;� 
            </div></td>
          <td width="73%"><font color="#0033CC"><%=rs1(0)%></font></td>
          <td width="10%"><div align="right">��Ʊ��<strong><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(1)%></font></strong></div></td>
          <td width="6%"><div align="center"><a href='javascript:confirmdel("select",<%=rs1(2)%>)'><font color="#FF3300">ɾ��</font></a></div></td>
        </tr>
		<%rs1.movenext
		loop
		rs1.close
		set rs1=nothing
		end if
		%>
      </table></td>
  </tr>
  <%rs.movenext
loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call CloseRs()
call footer()
call CloseConn()
%>
</body>
</html>