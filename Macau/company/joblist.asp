<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call JobOverTime()
set rs=conn.execute("select count(id) from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"' and canshow='ok'")
if rs(0)=0 then
conn.execute("update [01387company] set canshow=0 where cid='"&request.cookies("01387job")("cid")&"'")
else
conn.execute("update [01387company] set canshow=1 where cid='"&request.cookies("01387job")("cid")&"'")
end if
rs.close
set rs=nothing
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"' order by detailtime desc,id desc" ,conn,1,1
'set rs=server.createobject("adodb.recordset")
'rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body>
<!--#include file="inc/page.inc"-->
<script language="JavaScript" type="text/JavaScript">
<!--

function confirmdel(id){
  if (confirm("��ȷ��Ҫɾ��������Ƹ��Ϣ?")) 
  window.location.href="deljob.asp?page=<%=currentpage%>&id="+id+""
} 
//-->
</script>

<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%"  border='0' cellpadding='0' cellspacing='0' class="jobp_table">
    <tr>
      <td colspan='2' class='jobp_table_top'>ְλ�����б�</td>
    </tr>
    <tr>
      <td colspan="2" ></td>
      </tr>
    
    <tr>
      <td height="40" colspan="2" valign="top" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
          <td width="160" height="21" background="../images/f2.gif"  class="jobp">ְλ����</td>
          <td width="62" height="21"  class="jobp">��ǰ״̬</td>
          <td width="57" height="21" class="jobp">������</td>
          <td width="50" height="21" class="jobp">����</td>
          <td width="82" height="21"  class="jobp">����ʱ��</td>
          <td width="83" height="21"  class="jobp">��ֹ����</td>
          <td height="21" colspan="3"  class="jobp">����</td>
        </tr>
        <%if rs1.eof and rs1.bof then%>
        <tr>
          <td height="24" colspan="9" align="center" bgcolor="#FFFFFF" class="p11"><strong>�����͹���Ƹ������ʱû����Ϣ��</strong></td>
        </tr>
        <%end if%>
        <%
					  i=1
					  do while not rs1.eof
					  if i mod 2 = 0 then
					  bg="bgcolor=#ffffff" 
					  '����Ǳ���ͼƬ,�� 
					  'bg="background=""image/*.*"""
					  else
					  bg="bgcolor=#F6F9FD"
					  end if
					  %>
        <tr <%=bg%>>
          <td height="25" align="center">
              <a href="../jobs/ShowJob.asp?jid=<%=rs1("jid")%>" target="_blank" ><%=rs1("jobname")%></a><br />
              <%if rs1("closed")=true then response.Write("<font color=red>��ְλ�Ѷ��ᡣԭ��"&rs1("closed_reason")&"<br>���᣺"&rs1("closed_time")&"<br>�ⶳ��"&rs1("closed_overtime")&"</font>")%>
          </div></td>
          <td align="center"><a href="javascript:;" onMouseDown="MM_openBrWindow('modifycanshow.asp?jid=<%=rs1("jid")%>','','width=200,height=130')"><u>
              <%
						select case rs1("canshow")
						case "ok"
						response.Write("<font color=#009900>����</font>")
						case "no"
						response.Write("<font color=#4088BA>�ر�</font>")
						end select
						%>
          </u></a></td>
          <td align="center">
              <%set rs2=server.createobject("adodb.recordset")
					    rs2.open "select * from [01387applylist] where jid='"&rs1("jid")&"'" ,conn,1,1%>
              <%=rs2.recordcount%></td>
          <td align="center"><font face="Geneva, Arial, Helvetica, sans-serif">
            <font class="p11"><%=rs1("lookcount")%></font>
          </font></td>
          <td align="center"><font face="Geneva, Arial, Helvetica, sans-serif" color="666666"><%=rs1("publishtime")%></font></div></td>
          <td align="center"><font face="Geneva, Arial, Helvetica, sans-serif" color="666666">
              <%if rs1("overtime")="2049-1-1" then response.Write("������Ч") else response.write(rs1("overtime"))%>
          </font></div></td>
          <td width="58" align="center"><a href="republishjobs.asp?jid=<%=rs1("jid")%>">�ط�</a></div></td>
          <td width="39" align="center">
              <%response.write("<a href='edit_jobs.asp?jid="&rs1("jid")&"'><font color=green>�༭</font></a>")%>
          </div></td>
          <td width="45" align="center"><a href='javascript:confirmdel(<%=rs1("id")%>)'><font color="#FF3300">ɾ��</font></a></div></td>
        </tr>
        <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
        <table width="100%" height="18" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12"> <form method=Post action='joblist.asp'>
          <tr>
            <td height="30" align="right" bordercolor="#f0f0f0" bgcolor="#FFFFFF">����
              <%
   If currentpage > 1 Then
      response.write "<a href='joblist.asp?page="+cstr(1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='joblist.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>ǰҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰҳ-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='joblist.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='joblist.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if
   Response.write "<font color='#333333'>ҳ��:</font>" & "<font color=#ff0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333'>��/ҳ&nbsp" & "��</font>" & "<font color=#ff0000>" & Cstr(Rs1.RecordCount) & "</font>" & "<font color='#333333'>����Ϣ</font>&nbsp;&nbsp;"

response.write "&nbsp;&nbsp;&nbsp;&nbsp;"
response.write "<font color='#333333'>ת����</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
   response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
%></td>
          </tr></form>
        </table>
        </td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="1" cellpadding="1" style="margin-left:25px; margin-top:10px;">
  <tr>
    <td width="86%" height="25"><strong> ������Ϣ��<img src="../images/20.gif" width="41" height="23" /></strong></td>
  </tr>
  <tr>
    <td class="p13"><img src="../images/11.gif" width="13" height="13" /> ������Ѿ��е������˲ţ����״̬һ���޸�Ϊ���رա�</td>
  </tr>
  <tr>
    <td class="p13"><img src="../images/2.gif" width="13" height="13" /> �����Ƹ��Ϣ�ѹ���Ч����(��ʱ״̬���Զ���Ϊ���رա�)��������ʹ�á��ط������·���</td>
  </tr>
  <tr>
    <td class="p13"><img src="../images/3.gif" width="13" height="13" /> �����Ҫ����Ƹ��Ϣˢ������ҳ����ʹ�á��ط�������ˢ�£�ÿ��ˢ�¼������48Сʱ</td>
  </tr>
  <tr>
    <td class="p13"><img src="../images/4.gif" width="13" height="13" /> �����Ҫ�޸���Ƹ��Ϣ����ʹ�á��༭������</td>
  </tr>
  <tr>
    <td class="p13"><img src="../images/5.gif" /> �����Ҫ����Ƹ��Ϣ���м�ְȫְת������������һ������ת��</td>
  </tr>
</table>
<br /></td>
  </tr>
</table>

<!--#include file="bottom.asp" -->
</body>
</html>
<%
'rs.close
'set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
