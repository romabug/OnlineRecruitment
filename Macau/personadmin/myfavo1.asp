<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387favorite] where mytype=2 and uid='"&request.cookies("01387job")("uid")&"' order by favotime desc,id desc" ,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��</title>
<link href="../style/591.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
<!--#include file="inc/page15.inc"-->
<script language="JavaScript" type="text/JavaScript">
function confirmdel(id){
  if (confirm("���Ҫɾ��������Ϣ?")) 
  window.location.href="Myfavo_del.asp?page=<%=currentpage%>&id="+id+""
} 
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="26" valign="bottom" background="../images/neiye_02.gif"> <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="346" height="22">��ǰλ�ã�<a href="../index.asp">�����͹���Ƹ��</a> �� <a href="../person/">���˻�Ա��������</a> 
            �� �ҵ�ְλ�ղ�</td>
          <td width="414"><font color="#FF3300"> 
            <!--#include file="../inc/gonggao1.asp"-->
            </font></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="1" background="../images/x2.gif"></td>
  </tr>
</table>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="161" valign="top" background="../images/neiye_08.gif"> 
    <!--#include file="inc/left.asp"-->  
    </td>
    <td width="616" valign="top">
<table width="617" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="9" height="34" background="../images/neiye_06.gif">&nbsp;</td>
          <td width="608" background="../images/neiye_06.gif"><!--#include file="welcome.asp"--></td>
        </tr>
        <tr> 
          <td colspan="2">
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><table width="600" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
                      <td background="../img/bar_bg.gif"><strong><font color="#333333">�ҵ�ְλ�ղ�</font></strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td align="center"> <br> <table width="600" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFD09D">
                    <tr align="center" bgcolor="#FFEDD2"> 
                      <td width="150" height="29">��ҵ����</td>
                      <td width="110">ְλ����</td>
                      <td width="35">�Ա�</td>
                      <td width="78">��������</td>
                      <td width="77">��ֹ����</td>
                      <td colspan="3">����</td>
                    </tr>
                    <%
					  i=0
					  do while not rs1.eof%>
                    <tr align="center" bgcolor="#FFF9F0"> 
                      <td height="22"> <%set rs2=server.createobject("adodb.recordset")
                          rs2.open "select companyname,cid from [01387company] where cid='"&rs1("cid")&"'" ,conn,1,1%><%if not rs2.eof then%><a href="ShowCompany.asp?chkNO=<%=rs1("cid")%>"><%=rs2("companyname")%></a><%end if%></td>
                      <td height="22"> <%set rs3=server.createobject("adodb.recordset")
                          rs3.open "select * from [01387joblist] where jid='"&rs1("jid")&"'" ,conn,1,1%><a href="ShowJobdetail.asp?jid=<%=rs1("jid")%>"><%=rs3("jobname")%></a></td>
                      <td height="22"> <%
						select case rs3("sex")
						case "1"
						response.write("��")
						case "2"
						response.write("Ů")
						case "3"
						response.write("����")
						end select
						%> </td>
                      <td height="22"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs3("publishtime")%></font></td>
                      <td height="22"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
                        <%
						select case rs3("overtime")
						case "1"
						response.write(""&dateadd("d",1,rs3("publishtime"))&"")
						case "2"
						response.write(""&dateadd("d",3,rs3("publishtime"))&"")
						case "3"
						response.write(""&dateadd("d",7,rs3("publishtime"))&"")
						case "4"
						response.write(""&dateadd("d",15,rs3("publishtime"))&"")
						case "5"
						response.write(""&dateadd("m",1,rs3("publishtime"))&"")
						case "6"
						response.write(""&dateadd("m",3,rs3("publishtime"))&"")
						case "7"
						response.write("������Ч")
						end select
						%>
                        </font></td>
                      <td width="57" height="22"> <%set rs4=server.createobject("adodb.recordset")
                          rs4.open "select uid,jid from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' and jid='"&rs3("jid")&"'" ,conn,1,1%> <%if rs4.recordcount>=1 then%> <font color=red>�ѷ�����</font> <%else%> <a href="javascript:;" onMouseDown="MM_openBrWindow('sendapply.asp?jid=<%=rs3("jid")%>&cid=<%=rs3("cid")%>','','width=426,height=180')">���ͼ���</a> 
                        <%end if%> </td>
                      <td width="55" height="22"><a href="ShowJobdetail.asp?jid=<%=rs1("jid")%>">��ʾ</a></td>
                      <td width="29" height="22"><a href="javascript:confirmdel(<%=rs1("id")%>)"><font color="#FF3300">ɾ��</font></a></td>
                    </tr>
                    <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop%>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10"> </td>
                    </tr>
                  </table>
                  <%Call PageGo2("Myfavo","")%> </td>
              </tr>
            </table> 
            <table width="200" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="10"> </td>
              </tr>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!--#include file="../inc/bottom.asp"-->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
rs2.close
set rs2=nothing
rs3.close
set rs3=nothing
rs4.close
set rs4=nothing
conn.close
set conn=nothing
%>
