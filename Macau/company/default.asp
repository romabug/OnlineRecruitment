<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call RsName(rsM,"select top 1 id,title,viewed from [01387CompanyMessage] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
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
<body>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
	  <!--#include file="left.asp"-->
</td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="80%" height="62" border="0" cellpadding="0" cellspacing="0" style="margin-left:25px;margin-top:15px;">
        <tr>
          <td height="23" class="p12"><font color="#456991"><%=request.cookies("01387job")("companyusername")%></font> , ��ӭ��½<br />
          ������½ʱ�䣺<font color="#FF0000"><%=session("lastlogin")%></font></td>
        </tr>
        <tr>
          <td height="23" ><%if request.cookies("01387job")("cidpower") < 1 then%>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="padding:5px;" >

              <tr>
                <td bgcolor="#FFFFFF" style="line-height:170%; background:#F2F2F2"> 
                  <div align="left"><img src="../images/24.gif" width="17" height="17" align="absmiddle" /> 
                    <br />
                    �� �F��˾Ŀǰ�����M���T��B�����M���T����:<br />
                    1. �l����I�YӍ���ڹ���Ƹ�YӍ��<br />
                    2. �����յ��ڹ�Ͷ�f�ĺ��v��<br />
                    3. �����M��վ�ͷ����Բ鿴Ͷ�f���v���M��ʽ��</div>
                  <p>�� �����ݹ��ܕ�����ʹ�ã��磺���ܲ鿴�����˲ź��v���M��ʽ�����ܾ��Ϲ���Ͷ�f�ĺ��v�YӍ��<br />
                    �� �������ܸ��ࡢ����ݵķ��գ� 
                    <%Call RsName(rsy,"select * from [01387Feedback] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
				%>
                    <a href="CompanyReg.asp"><font color="#FF0000"><u>���R����������ʽ���T>>></u></font></a></p>
                  <p>�ͷ��ᾀ��400 6756 269<br />
                    QQ��601652392<br />
                    MSN��macau-69@hotmail.com<br />
                    �] �䣺service@macau69.com<br />
                  </p>
            </td>
              </tr>
            </table>
          <%end if%></td>
        </tr>
        <tr>
          <td><table width="445" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="445" height="50" valign="bottom"><img src="../images/m17.gif" width="443" height="37" /></td>
            </tr>
            <tr>
              <td class="p13">δ�鿴ӦƸ������<span class="p14"><%Call RsName(rs,"select count(*) from [01387Applylist] where cid='"&request.cookies("01387job")("cid")&"' and status='1'",1,1)
			  response.Write rs(0) 
			  call closers()%>
              </span> �� (<a href="ApplyList.asp">����鿴</a>)   &nbsp;&nbsp;&nbsp;|     &nbsp;&nbsp;&nbsp;��ӦƸ������<span class="p14">
              <%Call RsName(rs,"select count(*) from [01387Applylist] where cid='"&request.cookies("01387job")("cid")&"'",1,1)
			  response.Write rs(0) 
			  call closers()%></span> �� </td>
            </tr>
            <tr>
              <td class="p13">��Ƹְλ��<span class="p14"><%call RsName(rs,"select sum(lookcount),count(*) from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"'",1,1)%><%=rs(1)%></span>�� (<a href="joblist.asp">����鿴</a>)   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;|       &nbsp;&nbsp;&nbsp;ְλ�ܵ����<span class="p14"><%=rs(0)%></span>��
                <%call closers()%></td>
            </tr>
            <tr>
              <td  class="p13">��˾��Ϣ������ʱ��Ϊ��</span> &nbsp; |       &nbsp; ���ϴε�½ʱ��Ϊ��<span class="p14"><%=session("lastlogin")%></span></td>
            </tr>
            <tr>
              <td  class="p13"><%call RsName(rs,"select count(*) from [01387favorite] where cid='"&request.cookies("01387job")("cid")&"' and mytype=1",1,1)%>�˲��ղؼм�����<span class="p14"><%=rs(0)%></span> �� (<a href="Myfavo.asp">����鿴</a>)
                <%call Closers()%></td>
            </tr>
          </table>
            <table width="445" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="445" height="60" valign="bottom"><img src="../images/m18.gif" width="443" height="37" /></td>
              </tr>
              <tr>
                <td class="p13"><img src="../images/1.gif" width="13" height="13" /> �����˾���е����ʵ��˲ţ��뼰ʱ�ر���Ӧ����Ƹ��Ϣ��</td>
              </tr>
              <tr>
                <td height="40"  style="padding-left:10px; line-height:140%;"><img src="../images/2.gif" width="13" height="13" /> ����ְ���ձ�ϲ���鿴��һ�ܵ�ְλ������Ϊ��߹�˾����ƸЧ���������͹���Ƹ��<br />
&nbsp;&nbsp;                ����������ÿ�ܶ���ˢ�� ������Ƹ��ְλ��(<a href="#">����鿴��˾������Ƹ��ְλ</a>) </td>
              </tr>
              <tr>
                <td height="1" background="../images/m21.gif"></td>
              </tr>
              <tr>
                <td  class="p13"><img src="../images/3.gif" width="13" height="13" /> Ϊ��ʹ�����͹���Ƹ���ܸ��õ�Ϊ���ṩ���ĵķ���<a href="#">��ӭ�μӿͻ��������</a>��</td>
              </tr>
              <tr>
                <td  class="p13"><img src="../images/4.gif" width="13" height="13" /> ����Ҫ�����͹���Ƹ��Ϊ���ṩ��Щ��ʵ�õĹ��ܣ�<a href="mailto:service@macau69.com">��ӭ���ʼ���������</a>��</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
