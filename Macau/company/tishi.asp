<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="82%" height="69" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="padding:5px;margin-left:25px;margin-top:15px;" >
  <tr>
          <td bgcolor="#FFFFFF" style="line-height:170%; background:#F2F2F2"><p>�� 
              �F��˾Ŀǰ��<font color="#FF0000">���M���T</font>��B�����M���T����:<br />
              1. �l����I�YӍ���ڹ���Ƹ�YӍ��<br />
              2. �����յ��ڹ�Ͷ�f�ĺ��v��<br />
              3. ���Բ鿴�յ����v���M��ʽ��</p>
            <p>�� ��������Ƹ���ܵ�ʹ���������ƣ��磺ֻ�����[�˲Ŏ��Y���ֺ��v�Y�ϣ����ܾ��Ϲ���Ͷ�f�ĺ��v�YӍ,�ȵȡ�<br />
              �� �������ܸ��ࡢ����ݵķ��գ� 
              <%Call RsName(rsy,"select * from [01387Feedback] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
				%>
              <a href="CompanyReg.asp"><font color="#FF0000"><u>���R����������ʽ���T>>></u></font></a></p>
            <p>�ͷ��ᾀ��400-6756-269  <br />
              QQ��601652392<br />
              MSN��macau-69@hotmail.com<br />
              �] �䣺service@macau69.com<br />
            </p>
            </a></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
