<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
dim chkNO,cid
chkNO=request("chkNO")
cid=request("cid")
if chkNO="" then
Call ShowError("��ѡ��һ��ְλ��")
end if
Call RsName(rs,"select * from [01387joblist] where jid='"&ChkNo&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/editjobs.js"></SCRIPT>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="EditJob_Save.asp">
    <tr> 
      <td background="image/admin_bg_1.gif" height="25" colspan="2"><div align="center"><strong><font color="#FFFFFF">�С�Ƹ��ְ��λ 
          �� ϸ �� Ϣ ( �յ� <font color="#FFFF00"> 
          <%	Call RsName(rs_jid,"select count(*) from [01387applylist] where  jid='"&ChkNo&"'"  ,1,1) %>
          <%=rs_jid(0)%></font> ������ )</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">״̬��</div></td>
      <td height="30"><%if rs("canshow")="no" then%> <strong><font color="#FF0000">�ر�</font></strong> <%else%> <strong><font color="#0000FF">����</font></strong> <%end if%> &nbsp;&nbsp; <%if rs("overtime")<date() then%> <font color="#FF0000"><strong>��Ƹʱ���Ѿ�����</strong></font> <%else%> <font color="#0000FF"><strong>��Ƹʱ����Ч����</strong></font> <%end if%> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">��λ���</div></td>
      <td height="30"> <font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <!--  �µĴ����б� -->
        <select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
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
        <SELECT name="subcatelog" class="input" id="subcatelog">
          <option value="<%=rs("subcatelog")%>"><%=rs("subcatelog")%></option>
        </SELECT>
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="23%" height="26"><div align="right">��Ƹְλ��</div></td>
      <td width="77%"><font color="#000000"> 
        <input name="jobname" class="input" style="font-size: 12px" value="<%=rs("jobname")%>" size="40" maxlength="60">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right"><font color="#000000">��Ƹ������</font></div></td>
      <td> <font color="#000000"> 
        <input name="neednum" class="input" value="<%=rs("neednum")%>" size="6" maxlength="5">
        ��</font>  </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��ֹ���ڣ� </div></td>
      <td> </font><font color="#000000">
        <input name="overtime" class="input" value="<%=rs("overtime")%>" size="18" maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26"><div align="right">ѧ&nbsp;&nbsp;&nbsp; ����</div></td>
      <td height="18"><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">
        <select name="degree" class="input" id="degree">
          <option value="0" <%if rs("degree")=0 then%>selected<%end if%>>��������</option>
          <option value="1" <%if rs("degree")=1 then%>selected<%end if%>>����</option>
          <option value="2" <%if rs("degree")=2 then%>selected<%end if%>>ְ��</option>
          <option value="3" <%if rs("degree")=3 then%>selected<%end if%>>��ר</option>
          <option value="4" <%if rs("degree")=4 then%>selected<%end if%>>��ר</option>
          <option value="5" <%if rs("degree")=5 then%>selected<%end if%>>����</option>
          <option value="6" <%if rs("degree")=6 then%>selected<%end if%>>˶ʿ</option>
          <option value="7" <%if rs("degree")=7 then%>selected<%end if%>>��ʿ</option>
        </select>
        ������</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��������<font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">��</font> 
        </div></td>
      <td height="18"><font color="#000000">
        <input name="jobcity" class="input" value="<%=rs("jobcity")%>" size="18" maxLength="15">
        </font> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">�������飺</div></td>
      <td height="21"><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <select name="doneyear" class="input" id="doneyear">
          <option value="0" <%if rs("doneyear")=0 then%>selected<%end if%>>Ӧ���ҵ��</option>
          <option value="1" <%if rs("doneyear")=1 then%>selected<%end if%>>1��</option>
          <option value="2" <%if rs("doneyear")=2 then%>selected<%end if%>>2��</option>
          <option value="3" <%if rs("doneyear")=3 then%>selected<%end if%>>3��</option>
          <option value="4" <%if rs("doneyear")=4 then%>selected<%end if%>>4��</option>
          <option value="5" <%if rs("doneyear")=5 then%>selected<%end if%>>5��</option>
          <option value="6" <%if rs("doneyear")=6 then%>selected<%end if%>>6��</option>
          <option value="7" <%if rs("doneyear")=7 then%>selected<%end if%>>7��</option>
          <option value="8" <%if rs("doneyear")=8 then%>selected<%end if%>>8��</option>
          <option value="9" <%if rs("doneyear")=9 then%>selected<%end if%>>9��</option>
          <option value="10" <%if rs("doneyear")=10 then%>selected<%end if%>>10��</option>
        </select>
        �꼰����</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�� </div></td>
      <td height="21"> <font color="#003399" face="Geneva, Arial, Helvetica, sans-serif"> 
        <select name="sex" size="1" class="input">
          <option value="3" <%if rs("sex")=3 then%>selected<%end if%>>����</option>
          <option value="1" <%if rs("sex")=1 then%>selected<%end if%>>��</option>
          <option value="2" <%if rs("sex")=2 then%>selected<%end if%>>Ů</option>
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��&nbsp;&nbsp;&nbsp; �䣺 </div></td>
      <td height="21"><font color="#000000"> 
        <input name="needage" class="input" value="<%=rs("needage")%>" size="20">
        (Ĭ��:��Ҫ��) </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">����Ҫ��</div></td>
      <td height="30"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
            <td height="10"> </td>
          </tr>
          <tr> 
            <td width="100%"><textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px"><%=replace(replace(rs("demand"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea></td>
          </tr>
          <tr> 
            <td height="10"> </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">н�ʴ�����</div></td>
      <td height="30"><font color="#000000"> 
        <input class="input" value="<%=rs("salary")%>" maxlength="5" size="6" name="Salary">
        </font>Ԫ/�� Ĭ��&quot;0&quot;��ʾ��������</td>
    </tr>
    <%if rs("jobtype")=2 then%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��ְʱ�䣺 </div></td>
      <td height="21"> <div align="left"><font color="#000000"> 
          <input name="jobtime" class="input" value="<%=rs("jobtime")%>" size="32" maxlength="50">
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right">��ְ�ص㣺 </div></td>
      <td height="21"><div align="left"><font color="#000000"> 
          <input name="jobplace" class="input" value="<%=rs("jobplace")%>" size="32" maxlength="100">
          </font></div></td>
    </tr>
    <%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right">������֪��</div></td>
      <td height="30"> <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
            <td height="10"> </td>
          </tr>
          <tr> 
            <td width="100%"><textarea class="input"  name="interview" rows="4" cols="76" style="font-size: 12px"><% if rs("interview")<>"" then response.Write(replace(replace(rs("interview"),"&nbsp;",chr(32)),"<br>",chr(13)))%></textarea></td>
          </tr>
          <tr> 
            <td height="10"> </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" bgcolor="#f1f3f5"><div align="right">�� ϵ �ˣ� </div></td>
      <td height="30"> <font color="#000000"> 
        <input name="contact" class="input" style="font-size: 12px" value="<%=rs("contact")%>" size="36">
        </font> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <div align="right">��ϵ�绰�� </div></td>
      <td height="30" bgcolor="#f1f3f5"><font color="#000000"> 
        <input name="tel" class="input" value="<%=rs("tel")%>" size="18"  maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td valign="middle" bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�棺</td>
      <td height="30"><font color="#000000"> 
        <input name="fax" class="input" value="<%=rs("fax")%>" size="18" maxLength="15">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td valign="middle" bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;�������䣺</td>
      <td height="30"><font color="#000000"> 
        <input name="email" class="input" style="font-family: Verdana; font-size: 12px" value="<%=rs("email")%>" size="35">
        </font><font color="#003399" face="Geneva, Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <p align="right" style="margin-top:3">&nbsp;&nbsp;���Ե�ַ��</td>
      <td height="30"><font color="#000000"> 
        <input name="address" class="input" style="font-family: Verdana; font-size: 11px" value="<%=rs("address")%>" size="35">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td bgcolor="#f1f3f5"> <div align="right">�������룺 </div></td>
      <td height="30"><font color="#000000"> 
        <input name="zipcode" class="input" style="font-size: 12px" value="<%=rs("zipcode")%>" size="10" maxlength="6">
        </font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30" colspan="2"><div align="center"> 
          <input NAME="Button3" TYPE="button" class="12" style="width:100;height:30" onClick="javascript:history.go(-1)" VALUE="������һҳ">
          <input NAME="Button32" TYPE="submit" class="12" style="width:100;height:30" onClick="javascript:history.go(-1)" VALUE="ȷ���޸�">
          <input name="jid" type="hidden" id="jid" value="<%=chkNO%>">
          <input type="button" name="Button2" value="����ҵ������Ƹְλ" onClick="window.location.href='CompanyJobList.asp?cid=<%=cid%>'" style="width=150;height=30;font-size=12px">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
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