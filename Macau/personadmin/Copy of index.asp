<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%Call RsName(rs,"select uname,regtime,logintime,lastlogin,updatetime,resumestatus,job_career,edu_career from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,1,1)%>
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
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
      <table width="80%" height="62" border="0" cellpadding="0" cellspacing="0" style="margin-left:25px;margin-top:15px;">
            <tr>
              <td height="46" >
                <table width="436" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="97" rowspan="4" align="center"><img src="../images/nophoto.jpg" width="81" height="95" /></td>
                    <td width="339" height="25" class="p15"><%=request.cookies("01387job")("personusername")%> , ��ӭ��½</td>
                  </tr>
                  <tr>
                    <td height="25" >������½ʱ�䣺<font class="p15" color="#FF0000"><%=session("lastloginperson")%></font></td>
                  </tr>
                  <tr>
                    <td height="25" >��¼������<font class="p15"><%=rs(2)%></font></td>
                  </tr>
                  <tr>
                    <td height="25" >�����͹���Ƹ������������߾��裬������ְ��ƭ��</td>
                  </tr>
                </table>
                </td>
            </tr>
            <tr>
              <td><table width="445" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    
                <td width="445" height="50" valign="bottom"><table width="100%" border="0">
                    <tr> 
                      <td height="37"><img src="../images/m17.gif" width="443" height="37" /></td>
                    </tr>
                    <tr> 
                      <td class="p13"><br />
                        �����ڵ������<strong>��ѻ�Ա</strong>��������ϵ��ʽ���ܶ԰��Ź����Ͱ��ŵ�����˾����������ϵ�ͷ���Ա����Ϊ������Ա�����������Ի��ᡣ 
                        <br />
                        ������߿ͷ�QQ:&nbsp; <a target="blank" href="tencent://message/?uin=601652392&Site=�����͹���Ƹ��&Menu=yes"><img src="../images/qq.gif?p=1:601652392:1" alt="���������ҷ���Ϣ" width="57" height="16" 

border="0" /></a> &nbsp; ���QQ��601652392����������Ϊ<strong>������Ա</strong>�� </td>
                    </tr>
                    <tr> 
                      <td class="p13"><br /> <br />
                        �����͹���Ƹ���ǰ�������������Ϣƽ̨�����Ź�������ΪѰ���͹������գ�<br /> <br /> <strong>������Ա���������·���</strong><br /> 
                        <br />
                        1.��ϵ��ʽ�����а��Ź����Ͱ�������˾���������ǽ�ֱ������ȡ����ϵ��<br /> <br />
                        2.���Ź������ڵؿ�չ�ĸ����͹���Ƹ�ᣬ����������ͨ���ֻ����ŵķ�ʽ֪ͨ��<br /> <br />
                        3.�����ѯ���Ÿ���ҵ�͹����������������ã����Ҫ���������ѵȡ�<br /> <br />
                        4.����Ƽ��������۵��͹����ⷿ��Ϣ��<br /> <br/>
                        5.������¼�������͹���Ƹ���˲����ݿ⣬���ṩ�����ź�������������ʹ�á�<br /> <br /> <br /> 
                        <hr /> </td>
                    </tr>
                  </table></td>
                  </tr>
                  <tr>
                    <td class="p13"><%Call RsName(rs1,"select count(*) from [01387favorite] where mytype=2 and uid='"&request.cookies("01387job")("uid")&"'",1,1)%>
������ְλ�ղأ�<font class="wel2"><%=rs1(0)%></font> ��
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="MyFavo.asp">����鿴</a>)</td>
                </tr>
                 
                  <tr>
                    <td  class="p13"><%Call RsName(rs1,"select count(*) from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"'",1,1)%>
����ӦƸ������λ��¼��<font class="wel2"><%=rs1(0)%></font> ��
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="ApplyList.asp">����鿴</a>)</td>
                </tr>
                  <tr>
                    <td  class="p13"><%call RsName(rs1,"select Count(*) from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' and status=3",1,1)%>
��������֪ͨ��<font class="wel2"><%=rs1(0)%></font> ��
<%
						rs1.close
						set rs1=nothing
						%>
(<a href="InterView.asp">����鿴</a>)</td>
                  </tr><tr>
                    <td  class="p13">���ϴθ��¼�����ʱ��Ϊ��<font class="wel2"><%=rs(4)%></font></td>
                  </tr> <tr>
                    <td class="p13">������״̬��<font class="wel2">
                    <%if rs(5)="open" then response.Write("������ʾ") else response.Write("����")%>
                    </font> (<a href="HideResume.asp">����޸�</font></a>) <font color="#999999">(������Ѿ��ҵ���������Ѽ����������)</font></td>
                </tr><tr>
                    <td  class="p13">���ļ������ƶȣ�<%if rs(0)="" or rs(6)="" or rs(7)="" then%>
                <%aa=""%>
                <%if rs(0)="" then aa=aa&"<a href='basicinfo.asp'><u><font color=#456991><b>��������</b></font></u></a>&nbsp;"%>
                <%if rs(6)="" then aa=aa&"<a href='jobcareer.asp'><u><font color=#456991><b>��������</b></font></u></a>&nbsp;"%>
                <%if rs(7)="" then aa=aa&"<a href='educareer.asp'><u><font color=#456991><b>��������</b></font></u></a>&nbsp;"%>
                <%response.write(""&aa&"δ��д������")%>
                <%else
				response.write "<font color=#456991><b>����������</b></font>"
				end if%></td>
                  </tr>
                </table>
                  <table width="445" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="445" height="60" valign="bottom"><img src="../images/m18.gif" width="443" height="37" /></td>
                    </tr>
                    <tr>
                      <td class="p13"><img src="../images/1.gif" width="13" height="13" /> ����������ļ�����ʹ��ҵ�������ҵ��㡣</td>
                    </tr>
                    <tr>
                      <td  class="p13" style="padding-left:10px; line-height:140%;"><img src="../images/2.gif" width="13" height="13" /> �ҵ����ʵĹ������뼰ʱ������ļ�����������ν�ĸ��š�</td>
                    </tr>
                    <tr>
                      <td height="1" background="../images/m21.gif"></td>
                    </tr>
                    <tr>
                      <td  class="p13"><img src="../images/3.gif" width="13" height="13" /> Ϊ��ʹ�����͹���Ƹ���ܸ��õ�Ϊ���ṩ���ĵķ���<a href="#">��ӭ�μӿͻ��������</a>��</td>
                    </tr>
                    <tr>
                      
                <td  class="p13"><img src="../images/4.gif" width="13" height="13" /> 
                  ����Ҫ�����͹���Ƹ��Ϊ���ṩ��Щ��ʵ�õĹ��ܣ�<a href="mailto:service@macau69.com">��ӭд�ʼ���������</a>��</td>
                    </tr>
                </table></td>
            </tr>
      </table></td></tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
