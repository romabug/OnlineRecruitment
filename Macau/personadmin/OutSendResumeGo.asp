<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim uid
uid=request.cookies("01387job")("uid")
if len(uid)<>15 then
response.write "<br>"+"<li>��������"
response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where uid='"&uid&"'" ,conn,1,1
dim email,needjobname,companyname,otherdemand,uname,sex,updatetime,nation,province,birthday,marry,height,address,regtime,logintime,picurl
email=request.Form("email")
needjobname=request.Form("needjobname")
companyname=request.Form("companyname")
otherdemand=replace(replace(request.form("otherdemand"),chr(32),"&nbsp;"),chr(13),"<br>")
if email="" or needjobname="" then
response.redirect"OutSendResume.asp"
response.end()
end if
select case rs("sex")
case true
sex="��"
case false
sex="Ů"
end select
select case rs("province")
		  case 1
		  province="����"
		  case 2
		  province="���"
		  case 3
		  province="�Ϻ�"
		  case 4
		  province="����"
		  case 5
		  province="�㽭"
		  case 6
		  province="�㶫"
		  case 7
		  province="����"
		  case 8
		  province="����"
		  case 9
		  province="����"
		  case 10
		  province="����"
		  case 11
		  province="ɽ��"
		  case 12
		  province="����"
		  case 13
		  province="����"
		  case 14
		  province="����"
		  case 15
		  province="�Ĵ�"
		  case 16
		  province="����"
		  case 17
		  province="����"
		  case 18
		  province="������"
		  case 19
		  province="�ӱ�"
		  case 20
		  province="����"
		  case 21
		  province="����"
		  case 22
		  province="����"
		  case 23
		  province="ɽ��"
		  case 24
		  province="���ɹ�"
		  case 25
		  province="����"
		  case 26
		  province="����"
		  case 27
		  province="����"
		  case 28
		  province="�ຣ"
		  case 29
		  province="�½�"
		  case 30
		  province="����"
		  case 31
		  province="����"
		  case 32
		  province="̨��"
		  case 33
		  province="���"
		  case 34
		  province="����"
		  case 35
		  province="����"
		  case 36
		  province="����"
		  end select
if rs("pic")<>"" then
            if rs("pichide")="ok" then
            pic="<img src='http://www.01387job.com/person/image/nopic.gif' width='121' height='166' border='0' style='border:1px solid #000000'>"
            else
            pic="<a href='http://www.01387job.com/person/upload/"&rs("pic")&"' target='_blank'><img src='http://www.01387job.com/person/upload/"&rs("pic")&"' width='121' height='160' border='0' style='border:1px solid #FFB877'></a>"
            end if
            else
            pic="<img src='http://www.01387job.com/person/image/nopic.gif' width='121' height='166' border='0' style='border:1px solid #000000'>"
end if
select case rs("degree")
					  case 0
					  degree="��������"
					  case 1
					  degree="����"
					  case 2
					  degree="ְ��"
					  case 3
					  degree="��ר"
					  case 4
					  degree="��ר"
					  case 5
					  degree="����"
					  case 6
					  degree="˶ʿ"
					  case 7
					  degree="��ʿ"
end select		
select case rs("maincatelog")
							case 1
							maincatelog="��ʳ/����/����"
							case 2
							maincatelog="�̵�/����/�̳�"
							case 3
							maincatelog="����/�Ƶ�/����/����"
							case 4
							maincatelog="����ҵ/�ɻ���/����"
							case 5
							maincatelog="��Ѷ�Ƽ�/����/ͨѶ"
							case 6
							maincatelog="���/ý��/����/���"
							case 7
							maincatelog="ˮ/��/��/�յ�/����"
							case 8
							maincatelog="����ά��/��������"
							case 9
							maincatelog="����/װ��/�ӹ�"
							case 10
							maincatelog="��ķ/����/����"
							case 11
							maincatelog="��/����/��Ħ"
							case 12
							maincatelog="����/ģ��/����ҵ"
							case 13
							maincatelog="��չ/����/�ƹ�"
							case 14
							maincatelog="����/����ҵ"
							case 15
							maincatelog="԰��/��԰ά��"
							case 16
							maincatelog="������/ó��"
							case 17
							maincatelog="����/����/����"
							case 18
							maincatelog="����/����/����"
							case 19
							maincatelog="����/��ѵ"
							case 20
							maincatelog="����/����/ҽ��"
							case 21
							maincatelog="��ѯ/�н�/����"
							case 22
							maincatelog="�ۺ���ְ/����"
							case 23
							maincatelog="�߼�/�ۺϹ���"
							case 24
							maincatelog="������������"
end select
select case rs("maincatelog2")
							case 1
							maincatelog2="��ʳ/����/����"
							case 2
							maincatelog2="�̵�/����/�̳�"
							case 3
							maincatelog2="����/�Ƶ�/����/����"
							case 4
							maincatelog2="����ҵ/�ɻ���/����"
							case 5
							maincatelog2="��Ѷ�Ƽ�/����/ͨѶ"
							case 6
							maincatelog2="���/ý��/����/���"
							case 7
							maincatelog2="ˮ/��/��/�յ�/����"
							case 8
							maincatelog2="����ά��/��������"
							case 9
							maincatelog2="����/װ��/�ӹ�"
							case 10
							maincatelog2="��ķ/����/����"
							case 11
							maincatelog2="��/����/��Ħ"
							case 12
							maincatelog2="����/ģ��/����ҵ"
							case 13
							maincatelog2="��չ/����/�ƹ�"
							case 14
							maincatelog2="����/����ҵ"
							case 15
							maincatelog2="԰��/��԰ά��"
							case 16
							maincatelog2="������/ó��"
							case 17
							maincatelog2="����/����/����"
							case 18
							maincatelog2="����/����/����"
							case 19
							maincatelog2="����/��ѵ"
							case 20
							maincatelog2="����/����/ҽ��"
							case 21
							maincatelog2="��ѯ/�н�/����"
							case 22
							maincatelog2="�ۺ���ְ/����"
							case 23
							maincatelog2="�߼�/�ۺϹ���"
							case 24
							maincatelog2="������������"
end select
select case rs("jobtype")
		  case 1
		  jobtype="ȫְ"
		  case 2
		  jobtype="��ְ"
		  case 3
		  jobtype="������"
end select
select case rs("checkindate")
		   case 1
		   checkindate="��ʱ����"
		   case 2
		   checkindate="������"
		   case 3
		   checkindate="һ����"
		   case 4
		   checkindate="������"
		   case 5
		   checkindate="һ������"
		   case 6
		   checkindate="����Э��"
end select
'----���ʼ���ʼ----
Set myMail = Server.CreateObject("CDONTS.NewMail")
HTML = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><link href='http://www.01387job.com/css/Resume.css' rel='stylesheet' type='text/css'>"
HTML = HTML & "</head><body bgcolor='#ffffff' leftmargin='0' topmargin='5' marginwidth='0' marginheight='0'>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0'><tr><td width='258' height='80'><img src='http://www.01387job.com/images/logo_217_70.gif' width='216' height='70'></td><td width='342'>����Ҫ��"&otherdemand&"<br>���˼���<font color='#FF3300' face='Geneva, Arial, Helvetica, sans-serif'>NO.:"&rs("uid")&"</font></td></tr></table>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table1'><tr><td width='30'><img src='../img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>���˻�������</strong></td></tr></table>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='445' valign='middle'><table width='440'  border='0' align='center' cellpadding='0' cellspacing='0'><tr bgcolor='FFFCF7'><td width='102' height='26' bgcolor='FFFCF7'> <div align='right'><font color='#696969'>��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td><td width='140' bgcolor='FFFCF7' id='resume'>"&rs("uname")&"</td><td width='98'><div align='right'><font color='#696969'>��&nbsp;��</font></div></td><td width='100' id='resume'>"
HTML = HTML & ""&sex&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>�������ڣ�</font></div></td><td>"&rs("updatetime")&"</td><td><div align='right'><font color='#696969'>��&nbsp;�壺</font></div></td><td id='resume'>"&rs("nation")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'> <div align='right'><font color='#696969'>��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td><td id='resume'>"
HTML = HTML & ""&province&""&rs("citys")&"</td><td><div align='right'><font color='#696969'>��&nbsp;�䣺</font></div></td><td>"&datediff("yyyy",rs("birthday"),date())&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>����״����</font></div></td><td id='resume'>"&rs("marry")&"</td><td><div align='right'><font color='#696969'>��&nbsp;�ߣ�</font></div></td><td>"&rs("height")&"cm</td></tr><tr><td height='26' bgcolor='FFFCF7'> <div align='right'><font color='#696969'>�����ڵأ�</font></div></td><td colspan='3' bgcolor='FFFCF7' id='resume'>"&rs("address")&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>ע�����ڣ�</font></div></td>"
HTML = HTML & "<td id='resume'>"&rs("regtime")&"</td><td><div align='right'><font color='#696969'>��¼������</font></div></td><td>"&rs("logintime")&"</td></tr></table></td><td width='160' align='center' valign='middle'><table width='142' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>"
HTML = HTML & ""&pic&"</td></tr></table></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr> <td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>���˽�������</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>��ҵԺУ��</font></div></td><td height='26'>"&rs("college")&"</td><td height='26'><div align='right'><font color='#696969'>ѧ����</font></div></td><td height='26'>"
HTML = HTML & ""&degree&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>����רҵ��</font></div></td><td>"&rs("spec1")&"</td><td><div align='right'><font color='#696969'>�ڶ�רҵ��</font></div></td><td>"&rs("spec2")&"</td></tr><tr bgcolor='FFFCF7'><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>�����ˮƽ��</font></div></td><td>"&rs("com_level")&"</td><td><div align='right'><font color='#696969'>������ò��</font></div></td><td>"&rs("zzmm")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>��һ���</font></div></td><td width='211'>"&rs("l_type1")&"</td><td width='86'><div align='right'><font color='#696969'>�㶫��ˮƽ��</font></div></td>"
HTML = HTML & "<td width='199'>"&rs("l_level1")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>�ڶ����</font></div></td><td>"&rs("l_type2")&"</td><td><div align='right'><font color='#696969'>Ӣ��ˮƽ��</font></div></td><td>"&rs("l_level2")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>����֤�飺</font></div></td><td colspan='3'>"&rs("certificate")&"</td></tr><tr bgcolor='#FFF7EE'><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>��ѵ�����������</font></div></td><td colspan='3' bgcolor='FFFCF7'>"&rs("edu_career")&"</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'>"
HTML = HTML & "<tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>������ְ����</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'><div align='right'><font color='#696969'>ӦƸ����ҵ(һ)��</font></div></td><td width='212'>"&maincatelog&"</td><td width='85'><div align='right'><font color='#696969'>����ְλ(һ)��</font></div></td><td width='199'>"&rs("subcatelog")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>ӦƸ����ҵ(��)��</font></div></td><td>"&maincatelog2&"</td><td><div align='right'><font color='#696969'>����ְλ(��)��</font></div></td><td>"&rs("subcatelog2")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>ְλ���ƣ�</font></div></td><td>"&rs("jobname")&"</td>"
HTML = HTML & "<td><div align='right'><font color='#696969'>ȫְ/��ְ��</font></div></td><td>"&jobtype&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>нˮҪ��</font></div></td><td>"&rs("salary")&"(Ԫ/��)</td><td><div align='right'><font color='#696969'>ס��Ҫ��</font></div></td><td>"&rs("workhouse")&"</td></tr><tr><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>����ʱ�䣺</font></div></td><td colspan='3' bgcolor='FFFCF7'>"
HTML = HTML & ""&checkindate&"&nbsp;&nbsp;(���������ǣ�<font face='Geneva, Arial, Helvetica, sans-serif'><strong>"&rs("updatetime")&"</strong></font>)</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>���˹�������</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'> <div align='right'><font color='#696969'>�������飺</font></div></td><td>"&rs("doneyear")&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>����������</font></div></td><td>"&rs("job_career")&"</td>"
HTML = HTML & "</tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>��������</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'> <div align='right'><font color='#696969'>�����������ݣ�</font></div></td><td>"&rs("selfintro")&"</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>��ϵ��ʽ</strong></td>"
HTML = HTML & "</tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table2'><tr bgcolor='FFFCF7'><td width='104' height='26'><div align='right'><font color='#696969'>�绰��</font></div></td><td width='212'>"&rs("tel")&"</td><td width='85'><div align='right'><font color='#696969'>�ֻ���</font></div></td><td width='199'>"&rs("mobile")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>������룺</font></div></td><td>"&rs("chatno")&"</td><td><div align='right'><font color='#696969'>������ҳ��</font></div></td><td><a href='"&rs("selfweb")&"' target=_blank>"&rs("selfweb")&"</a></td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>�ʱࣺ</font></div></td><td>"&rs("zipcode")&"</td><td><div align='right'><font color='#696969'>E-mail��</font></div></td>"
HTML = HTML & "<td><a href='mailto:"&rs("email")&"'>"&rs("email")&"</a></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0'><tr><td height='36' align='center'>������Ϣ�ɰ����͹���Ƹ��(www.01387job.com)�ṩ</td></tr></table></body></html>"
'������
myMail.From = "master@01387job.com"
'�ռ���
myMail.To = email
'�ܼ�����
'myMail.Bcc = "pyx1980@126.com"
'����
'myMail.Cc = "pyx1980@126.com"
'�ʼ�����Ҫ��
' 0 ��Ҫ�Ե� 
' 1 ��Ҫ��һ�㣨Ĭ�ϣ� 
' 2 ��Ҫ�Ը� 
myMail.Importance = 2
'�ʼ�����
myMail.Subject = "ӦƸ��˾"&needjobname&"ְλ----01387job���˼����ⷢϵͳ"
'������ע�� e:\test.txt ָ���Ƿ������ϵ�λ�ã����ʹ�����·���������� Server.MapPath ӳ��Ϊ��ʵ·����
'myMail.AttachFile "d:\qqandice.jpg"

'NewMail ��������ָ�ʽ
'0 ��ʾ�� Body �ɰ������ı��ñ����� (HTML)
'1 ��ʾ�� Body ֻ���ڴ��ı���Ĭ��ֵ��
myMail.BodyFormat = 0
'NewMail �������ñ���
'0 ��ʾ������ MIME ��ʽ
'1 ��ʾ�����������Ĵ��ı���Ĭ��ֵ��
myMail.MailFormat = 0
'���ʼ�������ı���ֵ
myMail.Body = HTML
'���ʼ�����
myMail.Send
'���ٶ���ʵ�����ͷ��ڴ�
Set myMail = Nothing
'----���ʼ�����----
'----�ⷢ������¼д�����ݿ⿪ʼ----
conn.execute("insert into [01387sendresume] (uid,email,needjobname,companyname,otherdemand,sendtime) values ('"&uid&"','"&email&"','"&needjobname&"','"&companyname&"','"&otherdemand&"','"&date()&"')")
'----�ⷢ������¼д�����ݿ����----
Call CloseConn()
response.write("<script language=javascript>alert('�����ɹ���');this.location.href='OutSendResume.asp';</script>")
response.End()
%>
