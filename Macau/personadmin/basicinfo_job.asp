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
<body>
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/basicinfo.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top"><strong>��ְ����</strong>����</td>
  </tr><form name="form1" method="post" action="basicinfo_save_job.asp" onSubmit="return Juge(this)">
  <tr>
    <td>
      <br>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td width="15%" height="26" class="win2_update_table_td"><div align="right">ӦƸ����ҵ(һ)��</div></td>
          <td width="35%"><select name="maincatelog" class="input" id="select2" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
            <option value="0" >��ѡ��</option>
            <option value="1" <%if rs("maincatelog")=1 then%>selected<%end if%>>��ʳ/����/����</option>
            <option value="2" <%if rs("maincatelog")=2 then%>selected<%end if%>>�̵�/����/�̳�</option>
            <option value="3" <%if rs("maincatelog")=3 then%>selected<%end if%>>����/�Ƶ�/����/����</option>
            <option value="4" <%if rs("maincatelog")=4 then%>selected<%end if%>>����ҵ/�ɻ���/����</option>
            <option value="5" <%if rs("maincatelog")=5 then%>selected<%end if%>>��Ѷ�Ƽ�/����/ͨѶ</option>
            <option value="6" <%if rs("maincatelog")=6 then%>selected<%end if%>>���/ý��/����/���</option>
            <option value="7" <%if rs("maincatelog")=7 then%>selected<%end if%>>ˮ/��/��/�յ�/����</option>
            <option value="8" <%if rs("maincatelog")=8 then%>selected<%end if%>>����ά��/��������</option>
            <option value="9" <%if rs("maincatelog")=9 then%>selected<%end if%>>����/װ��/�ӹ�</option>
            <option value="10" <%if rs("maincatelog")=10 then%>selected<%end if%>>��ķ/����/����</option>
            <option value="11" <%if rs("maincatelog")=11 then%>selected<%end if%>>��/����/��Ħ</option>
            <option value="12" <%if rs("maincatelog")=12 then%>selected<%end if%>>����/ģ��/����ҵ</option>
            <option value="13" <%if rs("maincatelog")=13 then%>selected<%end if%>>��չ/����/�ƹ�</option>
            <option value="14" <%if rs("maincatelog")=14 then%>selected<%end if%>>����/����ҵ</option>
            <option value="15" <%if rs("maincatelog")=15 then%>selected<%end if%>>԰��/��԰ά��</option>
            <option value="16" <%if rs("maincatelog")=16 then%>selected<%end if%>>������/ó��</option>
            <option value="17" <%if rs("maincatelog")=17 then%>selected<%end if%>>����/����/����</option>
            <option value="18" <%if rs("maincatelog")=18 then%>selected<%end if%>>����/����/����</option>
            <option value="19" <%if rs("maincatelog")=19 then%>selected<%end if%>>����/��ѵ</option>
            <option value="20" <%if rs("maincatelog")=20 then%>selected<%end if%>>����/����/ҽ��</option>
            <option value="21" <%if rs("maincatelog")=21 then%>selected<%end if%>>��ѯ/�н�/����</option>
            <option value="22" <%if rs("maincatelog")=22 then%>selected<%end if%>>�ۺ���ְ/����</option>
            <option value="23" <%if rs("maincatelog")=23 then%>selected<%end if%>>�߼�/�ۺϹ���</option>
            <option value="24" <%if rs("maincatelog")=24 then%>selected<%end if%>>������������</option>
          </select>
                <font color="#FF0000">*</font></td>
          <td width="15%" class="win2_update_table_td"><div align="right">����ְλ(һ)��</div></td>
          <td width="35%"><SELECT name="subcatelog" class="input" id="select3">
            <option value="<%=rs("subcatelog")%>"><%=rs("subcatelog")%></option>
          </SELECT>
                <font color="#FF0000">*</font></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">ӦƸ����ҵ(��)��</div></td>
          <td><select name="maincatelog2" class="input" id="maincatelog2" onChange="javascript:selectjob(this, document.form1.subcatelog2)" >
            <option value="0" >��ѡ��</option>
            <option value="1" <%if rs("maincatelog2")=1 then%>selected<%end if%>>��ʳ/����/����</option>
            <option value="2" <%if rs("maincatelog2")=2 then%>selected<%end if%>>�̵�/����/�̳�</option>
            <option value="3" <%if rs("maincatelog2")=3 then%>selected<%end if%>>����/�Ƶ�/����/����</option>
            <option value="4" <%if rs("maincatelog2")=4 then%>selected<%end if%>>����ҵ/�ɻ���/����</option>
            <option value="5" <%if rs("maincatelog2")=5 then%>selected<%end if%>>��Ѷ�Ƽ�/����/ͨѶ</option>
            <option value="6" <%if rs("maincatelog2")=6 then%>selected<%end if%>>���/ý��/����/���</option>
            <option value="7" <%if rs("maincatelog2")=7 then%>selected<%end if%>>ˮ/��/��/�յ�/����</option>
            <option value="8" <%if rs("maincatelog2")=8 then%>selected<%end if%>>����ά��/��������</option>
            <option value="9" <%if rs("maincatelog2")=9 then%>selected<%end if%>>����/װ��/�ӹ�</option>
            <option value="10" <%if rs("maincatelog2")=10 then%>selected<%end if%>>��ķ/����/����</option>
            <option value="11" <%if rs("maincatelog2")=11 then%>selected<%end if%>>��/����/��Ħ</option>
            <option value="12" <%if rs("maincatelog2")=12 then%>selected<%end if%>>����/ģ��/����ҵ</option>
            <option value="13" <%if rs("maincatelog2")=13 then%>selected<%end if%>>��չ/����/�ƹ�</option>
            <option value="14" <%if rs("maincatelog2")=14 then%>selected<%end if%>>����/����ҵ</option>
            <option value="15" <%if rs("maincatelog2")=15 then%>selected<%end if%>>԰��/��԰ά��</option>
            <option value="16" <%if rs("maincatelog2")=16 then%>selected<%end if%>>������/ó��</option>
            <option value="17" <%if rs("maincatelog2")=17 then%>selected<%end if%>>����/����/����</option>
            <option value="18" <%if rs("maincatelog2")=18 then%>selected<%end if%>>����/����/����</option>
            <option value="19" <%if rs("maincatelog2")=19 then%>selected<%end if%>>����/��ѵ</option>
            <option value="20" <%if rs("maincatelog2")=20 then%>selected<%end if%>>����/����/ҽ��</option>
            <option value="21" <%if rs("maincatelog2")=21 then%>selected<%end if%>>��ѯ/�н�/����</option>
            <option value="22" <%if rs("maincatelog2")=22 then%>selected<%end if%>>�ۺ���ְ/����</option>
            <option value="23" <%if rs("maincatelog2")=23 then%>selected<%end if%>>�߼�/�ۺϹ���</option>
            <option value="24" <%if rs("maincatelog2")=24 then%>selected<%end if%>>������������</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">����ְλ(��)��</div></td>
          <td><SELECT name="subcatelog2" class="input" id="subcatelog2">
            <option value="<%=rs("subcatelog2")%>"><%=rs("subcatelog2")%></option>
          </SELECT></td>
        </tr>
        <tr >
          <td height="26" class="win2_update_table_td"><div align="right">���ʺϵ�ְλ��</div></td>
          <td><input name="jobname" type="text" class="input" id="jobname" value="<%=rs("jobname")%>">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">ȫְ/��ְ��</div></td>
          <td><select name="jobtype" class="input" id="jobtype">
            <option value=1 <%if rs("jobtype")=1 then%>selected<%end if%>>ȫְ</option>
            <option value=2 <%if rs("jobtype")=2 then%>selected<%end if%>>��ְ</option>
            <option value=3 <%if rs("jobtype")=3 then%>selected<%end if%>>������</option>
          </select></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">нˮҪ��</div></td>
          <td><select name="salary" class="input" id="salary">
            <option value="0" <%if rs("salary")=0 then%>selected<%end if%>>����</option>
            <option value="1" <%if rs("salary")=1 then%>selected<%end if%>>3000����</option>
            <option value="2" <%if rs("salary")=2 then%>selected<%end if%>>3000-4000</option>
            <option value="3" <%if rs("salary")=3 then%>selected<%end if%>>4000-5000</option>
            <option value="4" <%if rs("salary")=4 then%>selected<%end if%>>5000-7000</option>
            <option value="5" <%if rs("salary")=5 then%>selected<%end if%>>7000����</option>
          </select>            
            (Ԫ/��)</td>
          <td class="win2_update_table_td"><div align="right">ס��Ҫ��</div></td>
          <td><select name="workhouse" class="input" id="workhouse">
            <option value="����Э��" <%if rs("workhouse")="����Э��" then%>selected<%end if%>>����Э��</option>
            <option value="��˾�ṩ" <%if rs("workhouse")="��˾�ṩ" then%>selected<%end if%>>��˾�ṩ</option>
            <option value="���н��" <%if rs("workhouse")="���н��" then%>selected<%end if%>>���н��</option>
          </select></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">����ʱ�䣺</div></td>
          <td colspan="3" ><select name="checkindate" class="input" id="checkindate">
            <option value="0">��ѡ��</option>
            <option value="1" <%if rs("checkindate")=1 then%>selected<%end if%>>��ʱ����</option>
            <option value="2" <%if rs("checkindate")=2 then%>selected<%end if%>>������</option>
            <option value="3" <%if rs("checkindate")=3 then%>selected<%end if%>>һ����</option>
            <option value="4" <%if rs("checkindate")=4 then%>selected<%end if%>>һ������</option>
            <option value="5" <%if rs("checkindate")=5 then%>selected<%end if%>>��������</option>
            <option value="6" <%if rs("checkindate")=6 then%>selected<%end if%>>����Э��</option>
          </select>
                <font color="#FF0000">*</font></td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button>
          </td>
        </tr>
      </table>
    </td>
  </tr></form>
</table><br />
</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%call closeconn()%>
