<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select companyname,regtime from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select uid,degree,birthday,sex,doneyear,subcatelog2,lastlogin,uname from [01387member] where resumestatus='open' and jobtype=2 order by lastlogin desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<!--#include file="inc/page20.inc"-->
<script language=jscript>
function CheckOthers(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            if (e.checked==false)
            {
                e.checked = true;
            }
            else
            {
                e.checked = false;
            }
    }
}

function CheckAll(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            e.checked = true;
    }
}
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="jianli.asp";form1.submit();}
	else
		{form1.action="Favoadd.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<br />
<table border="0" cellpadding="0" cellspacing="1" class='win_update_table'>
  <tr>
    <td class='win_update_table_top' colspan="2">ģ������</td>
  </tr>
 <form action="member_search_ok.asp" method="post"  name="form1" id="form1">
        <tr>
          <td height="30" align="right" bgcolor="#FBF8F4"  class='win_update_table_td'>�ؼ��֣�</td>
          <td height="30"  bgcolor="#FFFFFF" >&nbsp;
                <input id="Keywords" style="FONT-SIZE: 12px; FONT-FAMILY: ����" maxlength="20" 
name="Keywords" />&nbsp;
                <input type="submit" name="Submit2222" value=" ģ������ " /></td>
          </tr>
      </form>
</table>
<table border="0" cellpadding="0" cellspacing="1" class='win_update_table'>
  <tr>
    <td colSpan=2  class='win_update_table_top'>�߼���������</td>
  </tr>
<form  name="form1" action=member_search_ok.asp method=post>
            <TR>
              <TD width="23%" align=right class='win_update_table_td'>������λ���ͣ�</TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <select id=MainCateLog style="FONT-SIZE: 12px; FONT-FAMILY: ����" name=MainCateLog>
                    <option value="" selected >����</option>
                    <option value="1" >��ʳ/����/����</option>
                    <option value="2" >�̵�/����/�̳�</option>
                    <option value="3" >����/�Ƶ�/����/����</option>
                    <option value="4" >����ҵ/�ɻ���/����</option>
                    <option value="5" >��Ѷ�Ƽ�/����/ͨѶ</option>
                    <option value="6" >���/ý��/����/���</option>
                    <option value="7" >ˮ/��/��/�յ�/����</option>
                    <option value="8" >����ά��/��������</option>
                    <option value="9" >����/װ��/�ӹ�</option>
                    <option value="10" >��ķ/����/����</option>
                    <option value="11" >��/����/��Ħ</option>
                    <option value="12" >����/ģ��/����ҵ</option>
                    <option value="13" >��չ/����/�ƹ�</option>
                    <option value="14" >����/����ҵ</option>
                    <option value="15" >԰��/��԰ά��</option>
                    <option value="16" >������/ó��</option>
                    <option value="17" >����/����/����</option>
                    <option value="18" >����/����/����</option>
                    <option value="19" >����/��ѵ</option>
                    <option value="20" >����/����/ҽ��</option>
                    <option value="21" >��ѯ/�н�/����</option>
                    <option value="22" >�ۺ���ְ/����</option>
                    <option value="23" >�߼�/�ۺϹ���</option>
                    <option value="24" >������������</option>
              </select></TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'>����ְλ���ƣ�</TD>
              <TD height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <input id=Jobname style="FONT-SIZE: 12px; FONT-FAMILY: ����" maxlength=20 
name=Jobname>
                (������Ϊ����)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'>�������飺</TD>
              <TD height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <input 
onKeyPress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" 
id=Doneyear style="FONT-SIZE: 12px; IME-MODE: disabled; FONT-FAMILY: ����" 
maxlength=2 size=3 name=Doneyear>
                �� (������Ϊ����) </TD>
            </TR>
            <TR>
              <TD height=22 align=right bgcolor="#FBF8F4" class='win_update_table_td'> Ҫ��нˮ��<BR>
              </TD>
              <TD width=77% height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <select name="salary" id="select2">
                    <option value="0" selected >����</option>
                    <option value="1" >3000����</option>
                    <option value="2" >3000-4000</option>
                    <option value="3" >4000-5000</option>
                    <option value="4" >5000-7000</option>
                    <option value="5" >7000����</option>

                </select></TD>
            </TR>
            <TR>
              <TD height=30 align=right class='win_update_table_td'><span class="style2">�Ա�</span></TD>
              <TD width=77% height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=sex size=1 id="select3" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                    <OPTION value="" selected>����</OPTION>
                    <OPTION value="1">��</OPTION>
                    <OPTION value="0">Ů</OPTION>
                </SELECT>
              </TD>
            </TR>
            <TR>
              <TD height=30 align=right class='win_update_table_td'><span class="style2">ѧ����</span></TD>
              <TD width=77% height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Degree 
size=1 id="select4" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                    <option value="0" >��������</option>
                    <option value="1" >����</option>
                    <option value="2" >ְ��</option>
                    <option value="3" >��ר</option>
                    <option value="4" >��ר</option>
                    <option value="5" >����</option>
                    <option value="6" >˶ʿ</option>
                    <option value="7" >��ʿ</option>
                    <OPTION value="" selected>����</OPTION>
                </SELECT></TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">��ߣ�</span></TD>
              <TD height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <input name="height1" type="text" id="height1" style="FONT-SIZE: 12px; FONT-FAMILY:����" size=5 maxlength="3">
                CM&nbsp;��
                <input name="height2" type="text" id="height2" style="FONT-SIZE: 12px; FONT-FAMILY:����" size=5 maxlength="3">
                CM (������Ϊ����)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">���䣺</span></TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <input name="Birthday1" type="text" id="Birthday1" style="FONT-SIZE: 12px; FONT-FAMILY:����" size=5 maxlength="2">
                ��&nbsp;��
                <input name="Birthday2" type="text" id="Birthday2" style="FONT-SIZE: 12px; FONT-FAMILY:����" size=5 maxlength="2">
              �� (������Ϊ����)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2"> ȫְ/��ְ��</span></TD>
              <TD height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Jobtype 
size=1 id="select9" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                    <OPTION value="" selected>������ 
                    <OPTION value="1">ȫְ 
                    <OPTION 
value="2">��ְ</OPTION>
                </SELECT>
              </TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">����״����</span></TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Marry size=1 id="select10" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                    <OPTION value=�ѻ�>�ѻ�</OPTION>
                    <OPTION value=δ��>δ��</OPTION>
                    <OPTION value=����>����</OPTION>
                    <OPTION value="" selected>���� </OPTION>
                </SELECT></TD>
            </TR>
            <TR bgcolor="#FFFFFF">
              <TD height=36 colSpan=2 align=middle><div align="center">
                  <input type="submit" name="Submit22" value=" �˲����� ">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" name="Submit22" value="����">
              </div></TD>
            </TR>
        </FORM>
</table>
</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
>
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
