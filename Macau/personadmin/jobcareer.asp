<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime,doneyear,job_career,selfintro from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-������ְ����--�����͹�/��������/�͹���Ƹ</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/jobcareer.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table border="0" cellpadding="0" cellspacing="0"  class="win2_update_table">
  <tr>
    <td height="22" colspan="2" class="win2_update_table_top">���˹�������</td>
  </tr><form name="form1" method="post" action="jobcareer_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td height="35" align="right" class="win2_update_table_td">�������飺</td>
    <td width="543"><input name="doneyear" type="text" class="input" id="doneyear" value="<%=rs("doneyear")%>" size="7" />	
��<font color="#FF0000">*</font>(Ӧ���ҵ����д<font color="#FF0000">0</font>)</td>
  </tr>
  <tr>
    <td height="133" align="right" class="win2_update_table_td">����������</td>
    <td><table width="96%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="26%">ʵϰ/����ʱ��</td>
        <td width="31%">ʵϰ/������λ</td>
        <td width="43%">ʵϰ/������λ</td>
      </tr>
    </table>
      <textarea name="job_career" cols="65" rows="7" class="input" id="job_career"><%if rs("job_career")<>"" then response.Write(replace(replace(rs("job_career"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
    </textarea>
      <font color="#FF0000">*</font> ��1000�����ڣ�</td>
  </tr>
  <tr>
    <td height="144" align="right" class="win2_update_table_td">�������ۣ�</td>
            <td height="144">�س������ܡ��������ۡ������Ƽ��� 
              <textarea name="selfintro" cols="65" rows="7" class="input" id="selfintro"><%if rs("selfintro")<>"" then response.Write(replace(replace(rs("selfintro"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
                    </textarea>
      <font color="#FF0000">*</font>��500�����ڣ�</td>
  </tr>
  <tr>
    <td height="50" colspan="2" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button></td>
    </tr>
  </form>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
