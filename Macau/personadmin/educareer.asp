<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-������ְ����--�����͹�/��������/�͹���Ƹ</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language=javascript>
function Juge(theForm)
{
  edu_career=theForm.edu_career.value;
  if (edu_career == "")
  {
    alert("��ѵ���������!");
    theForm.edu_career.focus();
    return (false);
  }
  if (edu_career.length>1000)
  {
  alert("��ѵ������������ܳ���1000�֣�");
  theForm.edu_career.focus();
  return (false);
  }
 }
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top">������ѵ</td>
  </tr><form name="form1" method="post" action="educareer_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td width="104" height="32" class="win2_update_table_td"><div align="right">���ѧ����</div></td>
          <td><select name="degree" class="input" id="degree">
            <option value="0" <%if rs("degree")=0 then%>selected<%end if%>>��������</option>
            <option value="1" <%if rs("degree")=1 then%>selected<%end if%>>����</option>
            <option value="2" <%if rs("degree")=2 then%>selected<%end if%>>ְ��</option>
            <option value="3" <%if rs("degree")=3 then%>selected<%end if%>>��ר</option>
            <option value="4" <%if rs("degree")=4 then%>selected<%end if%>>��ר</option>
            <option value="5" <%if rs("degree")=5 then%>selected<%end if%>>����</option>
            <option value="6" <%if rs("degree")=6 then%>selected<%end if%>>˶ʿ</option>
            <option value="7" <%if rs("degree")=7 then%>selected<%end if%>>��ʿ</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">��ҵԺУ��</div></td>
          <td><input name="college" type="text" class="input" id="college" value="<%=rs("college")%>" size="26">
          </td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">����רҵ��</div></td>
          <td><input name="spec1" type="text" class="input" id="spec1" value="<%=rs("spec1")%>" size="26">
          </td>
          <td class="win2_update_table_td"><div align="right">�ڶ�רҵ��</div></td>
          <td><input name="spec2" type="text" class="input" id="spec2" value="<%=rs("spec2")%>" size="26"></td>
        </tr>
        <tr bgcolor="#FFFAF0">
          <td height="32" class="win2_update_table_td"><div align="right">�����ˮƽ��</div></td>
          <td><select name="com_level" class="input">
            <option value="���������һ��" <%if rs("com_level")="���������һ��" then%>selected<%end if%>>���������һ��</option>
            <option value="�칫���������" <%if rs("com_level")="�칫���������" then%>selected<%end if%>>�칫���������</option>
            <option value="����ʹ�ò������" <%if rs("com_level")="����ʹ�ò������" then%>selected<%end if%>>����ʹ�ò������</option>
            <option value="�����շ��ʼ����Ű�" <%if rs("com_level")="�����շ��ʼ����Ű�" then%>selected<%end if%>>�����շ��ʼ����Ű�</option>
            <option value="���|����|�칫|Ӳ��" <%if rs("com_level")="���|����|�칫|Ӳ��" then%>selected<%end if%>>��Ϥ���������</option>
            <option value="��ͨ�������" <%if rs("com_level")="��ͨ�������" then%>selected<%end if%>>��ͨ�������</option>
            <option value="��ͨ����Ӳ��" <%if rs("com_level")="��ͨ����Ӳ��" then%>selected<%end if%>>��ͨ����Ӳ��</option>
            <option value="��ͨ���Ӳ��" <%if rs("com_level")="��ͨ���Ӳ��" then%>selected<%end if%>>��ͨ���Ӳ��</option>
            <option value="�������̵���" <%if rs("com_level")="�������̵���" then%>selected<%end if%>>�������̵���</option>
            <option value="����INTERNET���" <%if rs("com_level")="����INTERNET���" then%>selected<%end if%>>����INTERNET���</option>
            <option value="��ͨINTERNET���" <%if rs("com_level")="��ͨINTERNET���" then%>selected<%end if%>>��ͨINTERNET���</option>
            <option value="��ʵ�ʵ�Ӧ������" <%if rs("com_level")="��ʵ�ʵ�Ӧ������" then%>selected<%end if%>>��ʵ�ʵ�Ӧ������</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">������ò��</div></td>
          <td><select name="zzmm" class="input" id="zzmm">
            <option value="Ⱥ��" <%if rs("zzmm")="Ⱥ��" then%>selected<%end if%>>Ⱥ��</option>
            <option value="�й���Ա" <%if rs("zzmm")="�й���Ա" then%>selected<%end if%>>�й���Ա</option>
            <option value="������Ա" <%if rs("zzmm")="������Ա" then%>selected<%end if%>>������Ա</option>
            <option value="��������" <%if rs("zzmm")="��������" then%>selected<%end if%>>��������</option>
            <option value="����" <%if rs("zzmm")="����" then%>selected<%end if%>>����</option>
          </select></td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">��һ���</div></td>
          <td width="186"><input name="l_type1" type="text" class="input" value="<%=rs("l_type1")%>" size="26"></td>
          <td width="107" class="win2_update_table_td"><div align="right">����ˮƽ��</div></td>
          <td width="191"><select name="l_level1" class="input" id="l_level1">
            <option value="����" <%if rs("l_level1")="����" then%>selected<%end if%>>����</option>
            <option value="һ��" <%if rs("l_level1")="һ��" then%>selected<%end if%>>һ��</option>
            <option value="����" <%if rs("l_level1")="����" then%>selected<%end if%>>����</option>
            <option value="����" <%if rs("l_level1")="����" then%>selected<%end if%>>����</option>
          </select></td>
        </tr>
        <tr bgcolor="#FFFAF0">
          <td height="32" class="win2_update_table_td"><div align="right">�ڶ����</div></td>
          <td><input name="l_type2" type="text" class="input" id="l_type2" value="<%=rs("l_type2")%>" size="26"></td>
          <td class="win2_update_table_td"><div align="right">Ӣ��ˮƽ��</div></td>
          <td><select name="l_level2" class="input" id="l_level2">
            <option value="����" <%if rs("l_level2")="����" then%>selected<%end if%>>����</option>
            <option value="һ��" <%if rs("l_level2")="һ��" then%>selected<%end if%>>һ��</option>
            <option value="����" <%if rs("l_level2")="����" then%>selected<%end if%>>����</option>
            <option value="����" <%if rs("l_level2")="����" then%>selected<%end if%>>����</option>
          </select></td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">����֤�飺</div></td>
          <td colspan="3"><input name="certificate" type="text" class="input" id="certificate" value="<%=rs("certificate")%>" size="44">
            (���֤����ʦ֤��ĳĳ���ʦ��֤��)</td>
        </tr>
        <tr>
          <td height="150" bgcolor="#FFFAF0" class="win2_update_table_td"><div align="right">��ѵ�����������</div></td>
          <td colspan="3" bgcolor="#FFFAF0"> 
          �ꡡ���� ������ �꣠�¡� ����ѧУ����ѵ�������ơ�����רҵ����Ŀ���ơ�������ú���֤��
                          <br />
          <textarea name="edu_career" cols="70" rows="7" class="input" id="edu_career"><%if rs("edu_career")<>"" then response.Write(replace(replace(rs("edu_career"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
</textarea>
            <font color="#FF0000"> *</font>(1000������)</td></tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button>
          </td>
        </tr>
      </table>
    </td>
  </tr></form>
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
