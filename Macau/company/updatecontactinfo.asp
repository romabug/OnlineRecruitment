<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/updatecontactinfo.js"></script>
<script language="JavaScript" src="../person/inc/index.js"></script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
         <form name="form1" method="post" action="updatecontactinfo_save.asp" onSubmit="return Juge(this)">
            <tr>
              <td colspan='2' class='win_update_table_top'>��ϵ��ʽ</td>
            </tr>
            <tr>
              <td width="32%" class='win_update_table_td'>�� ϵ �ˣ�</td>
              <td width="68%"><input name="contact" type="text" class="input" id="contact" value="<%=rs("contact")%>" size="28" maxlength="50" /></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>��ϵ�绰��</td>
              <td><input name="tel" type="text" class="input" id="tel" value="<%=rs("tel")%>" size="28" maxlength="50" /> 
                <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'><span style="FONT-SIZE: 12px; FONT-FAMILY: ����">�� �� �棺</span></td>
              <td><input name="fax" type="text" class="input" id="fax" value="<%=rs("fax")%>" size="28" maxlength="50" />
              <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>�� �� ����</td>
              <td><input name="mobile" type="text" class="input" id="mobile" value="<%=rs("mobile")%>" size="28" maxlength="50" />
              <font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>�����ʼ���</td>
              <td><input name="email" type="text" class="input" id="email"  onkeypress="return regInput(this,'mail');" value="<%=rs("email")%>" size="28" maxlength="80" onpaste="return regInput(this,'mail',true);" />
              <font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>��˾��ҳ��</td>
              <td><input name="website" type="text" class="input" id="website" value="<%=rs("website")%>" size="38" maxlength="50" />
              <font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>ͨѶ��ַ��</td>
              <td><select name="province" id="province" onChange="javascript:selectcitys(this, document.form1.citys)" >
                              <option value="0">��ѡ��</option>
                              <option value="1" <%if rs("province")=1 then%>selected<%end if%>>����</option>
                              <option value="2" <%if rs("province")=2 then%>selected<%end if%>>���</option>
                              <option value="3" <%if rs("province")=3 then%>selected<%end if%>>�Ϻ�</option>
                              <option value="4" <%if rs("province")=4 then%>selected<%end if%>>����</option>
                              <option value="5" <%if rs("province")=5 then%>selected<%end if%>>�㽭</option>
                              <option value="6" <%if rs("province")=6 then%>selected<%end if%>>�㶫</option>
                              <option value="7" <%if rs("province")=7 then%>selected<%end if%>>����</option>
                              <option value="8" <%if rs("province")=8 then%>selected<%end if%>>����</option>
                              <option value="9" <%if rs("province")=9 then%>selected<%end if%>>����</option>
                              <option value="10" <%if rs("province")=10 then%>selected<%end if%>>����</option>
                              <option value="11" <%if rs("province")=11 then%>selected<%end if%>>ɽ��</option>
                              <option value="12" <%if rs("province")=12 then%>selected<%end if%>>����</option>
                              <option value="13" <%if rs("province")=13 then%>selected<%end if%>>����</option>
                              <option value="14" <%if rs("province")=14 then%>selected<%end if%>>����</option>
                              <option value="15" <%if rs("province")=15 then%>selected<%end if%>>�Ĵ�</option>
                              <option value="16" <%if rs("province")=16 then%>selected<%end if%>>����</option>
                              <option value="17" <%if rs("province")=17 then%>selected<%end if%>>����</option>
                              <option value="18" <%if rs("province")=18 then%>selected<%end if%>>������</option>
                              <option value="19" <%if rs("province")=19 then%>selected<%end if%>>�ӱ�</option>
                              <option value="20" <%if rs("province")=20 then%>selected<%end if%>>����</option>
                              <option value="21" <%if rs("province")=21 then%>selected<%end if%>>����</option>
                              <option value="22" <%if rs("province")=22 then%>selected<%end if%>>����</option>
                              <option value="23" <%if rs("province")=23 then%>selected<%end if%>>ɽ��</option>
                              <option value="24" <%if rs("province")=24 then%>selected<%end if%>>���ɹ�</option>
                              <option value="25" <%if rs("province")=25 then%>selected<%end if%>>����</option>
                              <option value="26" <%if rs("province")=26 then%>selected<%end if%>>����</option>
                              <option value="27" <%if rs("province")=27 then%>selected<%end if%>>����</option>
                              <option value="28" <%if rs("province")=28 then%>selected<%end if%>>�ຣ</option>
                              <option value="29" <%if rs("province")=29 then%>selected<%end if%>>�½�</option>
                              <option value="30" <%if rs("province")=30 then%>selected<%end if%>>����</option>
                              <option value="31" <%if rs("province")=31 then%>selected<%end if%>>����</option>
                              <option value="32" <%if rs("province")=32 then%>selected<%end if%>>̨��</option>
                              <option value="33" <%if rs("province")=33 then%>selected<%end if%>>���</option>
                              <option value="34" <%if rs("province")=34 then%>selected<%end if%>>����</option>
                              <option value="35" <%if rs("province")=35 then%>selected<%end if%>>����</option>
                              <option value="36" <%if rs("province")=36 then%>selected<%end if%>>����</option>
                            </select>
                            ( ʡ����)<font color="#FF0000"> 
                            <SELECT name="citys" id="citys">
                              <option value="<%=rs("citys")%>"><%=rs("citys")%></option>
                            </SELECT>
                            </font>(�С���) 
                            <input name="address" type="text" class="input" value="<%=rs("address")%>" size="20" maxlength="50"/> <font color="#FF0000">*</font><font color="#624B35">&nbsp;</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>��    �ࣺ</td>
              <td><input name="zipcode" type="text" class="input" id="zipcode" value="<%=rs("zipcode")%>" size="8" maxlength="6"/>
                  <font color="#FF0000">*</font></td>
            </tr>

            <tr>
              <td height="40" colspan="2" align="center" ><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ���޸� </button></td>
            </tr>
          </form>
        </table>
      <br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" --></body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
