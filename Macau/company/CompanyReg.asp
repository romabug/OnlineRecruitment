<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
set rs1=conn.execute("select contact,companyname,email,tel from [01387company] where cid='"&request.cookies("01387job")("cid")&"'")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript>
//Design By L.C.H
function fucCheckLength(strTemp)
{
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}
function Juge(theForm)
{ 
  	if (theForm.uname.value == "")
  {
    alert("��������ϵ��!");
    theForm.uname.focus();
    return (false);
  }
	if (theForm.email.value == "")
	{
		alert("��������\"email\"!");
		theForm.email.focus();
		return (false);
	}
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_@.";
	var checkStr = theForm.email.value;
	var allValid = true;
	for (i = 0;  i < checkStr.length;  i++)
	{
		ch = checkStr.charAt(i);
		for (j = 0;  j < checkOK.length;  j++)
		if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length)
		{
			allValid = false;
			break;
		}
	}

	if (theForm.email.value.length < 6)
	{
			allValid = false;
	}

	if (!allValid)
	{
		alert("������� \"�����ʼ���ַ\" ��Ч!");
		theForm.email.focus();
		return (false);
	}

	address=theForm.email.value;
    if(address.length>0)
	{
        i=address.indexOf("@");
        if(i==-1)
		{
			window.alert("�Բ���������ĵ����ʼ���ַ�Ǵ���ģ�")
			theForm.email.focus();
			return false
        }
       ii=address.indexOf(".")
        if(ii==-1)
		{
			window.alert("�Բ���������ĵ����ʼ���ַ�Ǵ���ģ�")
			theForm.email.focus();
			return false
        }

    }
	if (checktext(theForm.email.value))
	{
		alert("����������Ч��\"email\"!");
		theForm.email.select();
		theForm.email.focus();
		return (false);
	}
  	 if (theForm.content.value == "")
  {
    alert("�����뱸ע��");
    theForm.content.focus();
    return (false);
  }
}
function checktext(text)
{
			allValid = true;

		for (i = 0;  i < text.length;  i++)
		{
			if (text.charAt(i) != " ")
			{
				allValid = false;
				break;
			}
		}

return allValid;
}
//-->
</SCRIPT>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="600" border="0" align="center" cellpadding="0" cellspacing="1" class='win_update_table'>
  <tr>
    <td  class='win_update_table_top' colspan="2">�����Ϊ��ʽ��Ա</td>
  </tr>
        <form name="form1" method="post" action="CompanyReg_save.asp" onSubmit="return Juge(this)"><tr bgcolor="#FFFFFF">
          <td height="28" class='win_update_table_td2'><div align="right">��ϵ�ˣ� </div></td>
          <td height="26"><input name="uname" class="input" value="<%=rs1(0)%>" size="30" maxlength="30" />
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="28" class='win_update_table_td2'><div align="right">E-Mail�� </div></td>
          <td height="26"><input name="email" class="input" value="<%=rs1(2)%>" size="30" maxlength="30" />
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="28" class='win_update_table_td2'><div align="right">��˾���� </div></td>
          <td height="26"><input name="company" class="input" value="<%=rs1(1)%>" size="30" maxlength="30" /></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="28" class='win_update_table_td2'><div align="right">��&nbsp;&nbsp;���� </div></td>
          <td height="26"><input name="tel" class="input" value="<%=rs1(3)%>" size="30" maxlength="30" /></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="16%" valign="top" class='win_update_table_td2'><div align="right">��&nbsp;&nbsp;ע��</div></td>
          <td width="84%" valign="top"><textarea name="content" cols="40" rows="6" class="input"></textarea>
              <font color="#FF0000">*</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="36" colspan="2" align="center" ><button accesskey="K" type="submit" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button></td>
        </tr> </form>
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
