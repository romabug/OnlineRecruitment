<%
Server.ScriptTimeout	=500						
UserPass				= "10125154"			'ϵͳ�������룬���޸�neeaoΪ���Լ������룡
URL						= Request.ServerVariables("URL")
Action					= Request("Action")
db						="SqlIn.mdb"		'��¼���ݿ�·���޸�Ϊ������ݿ�·��


dim conn,connstr 
'On Error Resume Next
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.Open connstr
If Err Then
	err.Clear
	Set conn = Nothing
	Response.Write "���ݿ����ӳ������������ִ���"
	Response.End
End If

If Session("AdminPassWord")<>UserPass Then
  If Request.Form("LPass")<>"" Then
    If Request.Form("LPass")=UserPass Then
      Session("AdminPassWord")=UserPass
      Call Main()
    Else
	 response.write"��֤ʧ�ܣ�"
    End If
  Else
	Call Login()
  End If
  Response.End
Else
	Select Case Action
		Case "Del"
			Call Delip()
		Case "lock"
			Call lockIP()
		Case "unlock"
			Call UnLockip()
		Case "Logout"
			Call Logout()
		Case "config"
			Call config()
		Case "saveconfig"
			Call saveconfig()
		Case Else 
			Call Main()
	end Select
End If

Sub Login()
	%>
<title>Sqlͨ�÷�ע��ϵͳ3.1���ռ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <style type="text/css">
<!--

table {
	font: 14px Tahoma, Verdana, "����";
}
a:link, a:visited {
	text-decoration: none;
	color: #036;
	font-family: Tahoma, Verdana, "����";
}
a:hover {
	text-decoration: none;
	color: #999999;
	font-family: Tahoma, Verdana, "����";
}
body {
	font-size: 9pt;
	color: #999999;
}
-->
  </style>
<table border="1" width="500" height="120" bgcolor="#DDDDDD" cellpadding="3" bordercolorlight="#000000" bordercolordark="#F2F2F9" cellspacing="0" align=center>
<tr>
<td width="100%" height="30%" bgcolor="#808080"><p align="center">
<font color="#FFFFFF" face="Verdana" style="font-size: 9pt"><B>SQLͨ�÷�ע��ϵͳ�����½</B></font></td>
</tr>
<tr>
<td width="100%" height="70%"><form method="POST" action="<%=URL%>">
<center><p><font face="Verdana">
  <span style="font-size: 9pt">Password: <input type="password" name="LPass"
size="20" style="background-color:#DDDDDD; border-left: none; border-right: none; border-top: none; border-bottom: solid 1px"> 
<input type="submit" value="Login" name="B1" style="border: thin outset"></span></font></p>
      </center>
    </form>
    </td>
  </tr>
</table>
    <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>ϵͳ���¼�¼��
          <textarea name="textfield" cols="70" rows="20">���¼�¼��
2.0��ǿ�� �������Զ���ע����Ip���ܣ�ʹע���߲����ٷ��ʱ�վ��
3.0�� ��2.0��ǿ��Ļ����ϣ������˺�̨�����ܣ�
���Բ鿴�������ύ���ݼ�¼���ܣ������ע����ip�������Լ�ɾ��ע���¼���ܣ�
v3.1beta�� �Ժ��Ĵ��������Ż���ȥ����һ��û�õ�ѭ����ʹ����ִ���ٶȸ��죡
 ʹ����ִ���ٶȸ����Զ��徯����Ϣ�������post���˶�����������������,
 ���js��vbsͨ������,���������������ϵ�aspͨ�÷�ע��
3.1���ռ����
   * ����3.1beta�������ڼ���Ķ���js������˵Ĺ��ܶ�����İ�ȫ��������������
   * ����3.1beta���������Ŀ�վ��������������
   * ��3.1beta���еİ�ȫ������Ϊ��ȫҳ�棬ʹ���������Ը�ǿ�����潫����ʾ��
   * ���޴�����⣬�˰汾Ϊ���ռ���棬�Ժ��˽����ٶԴ˳��������£�
 
 </textarea>
       </td>
      </tr>
    </table>     
    <hr width="500" noshade>
    <div align="center">SQLͨ�÷�ע��ϵͳ 3.1���ռ���� (c)2006-10<BR>
      <A href="http://www.neeao.com" target=_blank>Code By Neeao</A> <a href="Http://www.cnbct.org">Bug.Center.Team-©��Ԥ������С��</a>    </div>
    <p>
        <%
End Sub

Sub Main()
	Call header()
%>
<script language="JavaScript">
<!--
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
//-->
</script> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr align=center bgcolor=#FFFFFF>
<%
sql="select * from SqlIn order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "��������"
else
'��ҳ��ʵ�� 
listnum=20
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'��ŵ�ʵ��
j=rs.recordcount
j=j-(page-1)*listnum
i=0
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
 <td height=20>���</td>
 <td><font color=red>�����ɣ�</font></td>
 <td>�Ƿ�����</td>
 <td>����</td>
 <td>����ҳ��</td>
 <td>����ʱ��</td>
 <td>�ύ��ʽ</td>
 <td>�ύ����</td>
 <td>�ύ����</td>
 
</tr>
<%do while not rs.eof and i<listnum
n=n+1%>
<form action="<%=url%>?Action=Del" method=post name=check>
<tr align=center bgcolor="#FFFFFF" height=22>
 <td><input name="ID" type="checkbox" id="ID" value=<%=rs("id")%>><%=n%></td>
 <td><%=rs("SqlIn_IP")%>
</td>

<td><%	if rs("Kill_ip")=true then 
			response.write "<font color='red'>������</font>"
		else
			response.write "<font color='green'>�ѽ���</font>"
		end if
	%></td>
 <td>
 <%	if rs("Kill_ip")=true then 
			response.write "<a href="&URL&"?action=unlock&id="&rs("id")&">����IP</a>"
		else
			response.write "<a href="&URL&"?action=lock&id="&rs("id")&">����IP</a>"
		end if
	%>
 
 </td>
 <td><%=rs("SqlIn_WEB")%></td>
 <td><%=rs("SqlIn_TIME")%></td>
 <td><%=rs("SqlIn_FS")%></td>
 <td><%=rs("SqlIn_CS")%></td>
 <td><%=N_Replace(rs("SqlIn_SJ"))%></td>
</tr>
<%rs.movenext 
i=i+1 
j=j-1
loop%>
<tr bgcolor="#FFFFFF">
<%filename=URL%>
<td colspan=9 align=right><%=Rs.recordcount%> ����¼&nbsp;&nbsp;<%=listnum%> ����¼/ҳ&nbsp;&nbsp;�� <%=rs.pagecount%> ҳ 
      <% if page=1 then %>
      <%else%>
      <a href=<%=filename%>><strong>|<<</strong></a>
      <a href=<%=filename%>?page=<%=page-1%>><strong><<</strong></a>
      <a href=<%=filename%>?page=<%=page-1%>><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
	  <% if rs.pagecount-page <> 0 then %>
      <a href=<%=filename%>?page=<%=page+1%>><b>[<%=page+1%>]</b></a>
      <a href=<%=filename%>?page=<%=page+1%>><strong>>></strong></a>
      <a href=<%=filename%>?page=<%=rs.pagecount%>><strong>>>|</strong></a>
	  <%end if%>
	  <input name="chkall" type="checkbox" id="chkall" value="select" onclick="CheckAll(this.form)" style="border:0">ȫѡ
	  <input type=submit name=action value="ɾ��" style="font-size: 9pt;  color: #000000; background-color: #EAEAF4; solid #EAEAF4" >
	  </td>
<%end if%>
</form>
</tr> 
</table>
<%
	Call footer()
end Sub

sub config()
	Call header()
	Set rsinfo=conn.execute("select * from config")
	N_In		= rsinfo("N_In")
	Kill_IP		= rsinfo("Kill_IP")			
	WriteSql	= rsinfo("WriteSql")		
	alert_url	= rsinfo("alert_url")
	alert_info	= rsinfo("alert_info")
	kill_info	= rsinfo("kill_info")
	N_type		= rsinfo("N_type")
	Sec_Forms	= rsinfo("Sec_Forms")
	Sec_Form_open = rsinfo("Sec_Form_open")
	rsinfo.close
	Set rsinfo=Nothing 

%>

<table width="730" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" align="center">ϵͳ����<br></td>
  </tr>
  <tr>
    <td><table width="100%" bordercolor="#000000" style="border-collapse:collapse; "  border="1" cellspacing="5" cellpadding="0">
	<form name="form" method="post" action="<%=url%>?action=saveconfig">
		<tr>
        <td  align="left">��Ҫ���˵Ĺؼ��֣�</td>
        <td>&nbsp; <input name="N_In" type="text" value="<%=N_In%>" id="r_str" style=" " size="50">
        ��&quot;|&quot;�ֿ�</td>
      </tr>
      <tr>
        <td>�Ƿ��¼��������Ϣ��</td>
        <td>&nbsp; <select name="WriteSql" id="r_kill">
          <option value="1" <%if WriteSql=1 Then response.write "selected"%>>��</option>
          <option value="0" <%if WriteSql=0 Then response.write "selected"%>>��</option>
        </select></td>
      </tr>
      <tr>
        <td>�Ƿ���������IP��</td>
        <td>&nbsp; <select name="Kill_IP" id="r_kill">
          <option value="1" <%if Kill_IP=1 Then response.write "selected"%>>��</option>
          <option value="0" <%if Kill_IP=0 Then response.write "selected"%>>��</option>
        </select></td>
      </tr>
      <tr>
        <td>�Ƿ����ð�ȫҳ�棺</td>
        <td>&nbsp; <select name="Sec_Form_open" id="r_kill">
          <option value="1" <%if Sec_Form_open=1 Then response.write "selected"%>>��</option>
          <option value="0" <%if Sec_Form_open=0 Then response.write "selected"%>>��</option>
        </select>
		����������ܣ��������ȷ�ϴ�ҳ��������ˣ���ȷ���԰�ȫûӰ�죡
		</td>
      </tr>
	  <tr>
        <td>����Ϊ��ȫ��ҳ�棺</td>
        <td>&nbsp; <input name="Sec_Forms" type="text" value="<%=Sec_Forms%>" id="r_str" style=" " size="50">
        ��&quot;|&quot;�ֿ�</td>
      </tr>
      <tr>
        <td>�����Ĵ���ʽ��</td>
        <td>&nbsp; <select name="N_type" id="r_kill">
          <option value="1" <%if N_type=1 Then response.write "selected"%>>ֱ�ӹر���ҳ</option>
          <option value="2" <%if N_type=2 Then response.write "selected"%>>�����ر�</option>
		  <option value="3" <%if N_type=3 Then response.write "selected"%>>��ת��ָ��ҳ��</option>
		  <option value="4" <%if N_type=4 Then response.write "selected"%>>�������ת</option>
        </select></td>
      </tr>
	<tr>
        <td>�������תUrl��</td>
        <td>&nbsp; <input name="alert_url" type="text" value="<%=alert_url%>" id="r_str" style=" " size="30">ע�⣬����Ķ��ǰ�Ƿ��ţ�����Ӣ�ĵģ�
		</td>
      </tr>
      <tr>
        <td>������ʾ��Ϣ��</td>
        <td>&nbsp; <textarea name="alert_info" cols="45" rows="4" id="r_err2" style=";  "><%=alert_info%></textarea>\n\n���У�
		</td>
      </tr>
	  <tr>
        <td>��ֹ������ʾ��Ϣ��</td>
        <td>&nbsp; <textarea name="kill_info" cols="45" rows="4" id="r_err2" style=";  "><%=kill_info%></textarea>\n\n����
		</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input name="enter_3" type="submit" id="enter_3" value="�ύ">
        </div></td>
        </tr>
	  </form>
    </table></td>
  </tr>
</table>
<%
	Call footer()
end Sub

Sub header()

%>

<title>Sqlͨ�÷�ע��ϵͳ3.1���ռ����-By Neeao (Bug.Center.Team-©��Ԥ������С��)</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--

table {
	font: 14px Tahoma, Verdana, "����";
}
a:link, a:visited {
	text-decoration: none;
	color: #036;
	font-family: Tahoma, Verdana, "����";
}
a:hover {
	text-decoration: none;
	color: #F90;
	font-family: Tahoma, Verdana, "����";
}
body {
	font-size: 9pt;

}
-->
</style>
  <table width="98%" border="0" align="center" cellspacing="0" bgcolor="#CCCCCC">
    <tr>
		<td width="70%" bgcolor="#FFFFFF"><div align="center"><FONT color=#000000>SQLͨ�÷�ע��ϵͳ</FONT></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="?Action=config">ϵͳ����</a></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="<%=URL%>">�鿴��Ϣ</a></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="?Action=Logout">�˳���½</a></div></td>
      
    </tr>
</table><br/>
<%

End Sub 
	sub footer()

%>
    <div align="center">Sqlͨ�÷�ע��ϵͳ3.1���ռ���� 2006-10<BR>
      <A href="http://www.neeao.com" target=_blank>Code By Neeao</A> <a href="Http://www.cnbct.org">Bug.Center.Team-©��Ԥ������С��</a>    </div>

<%
end Sub
Sub Delip()
dim id 
id = request.form("id")
conn.execute("delete from SqlIn where id in ( " & id & ")")
Response.Redirect URL
End sub

Sub Lockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=true where id="&id)
Response.Redirect URL
End sub

Sub UnLockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=False where id="&id)
Response.Redirect URL
End sub

Sub Logout()
	Session("AdminPassWord")="NUll"
	Response.Redirect URL
End Sub

Sub saveconfig
	N_In		=replace(request.form("N_In"),"'","''")
	Kill_IP		=request.form("Kill_IP")			
	WriteSql	=request.form("WriteSql")		
	alert_url	=request.form("alert_url")
	alert_info	=request.form("alert_info")
	kill_info	=request.form("kill_info")
	N_type		=request.form("N_type")
	Sec_Forms	=request.form("Sec_Forms")
	Sec_Form_open=request.form("Sec_Form_open")

	sql="update config set N_In='"&N_In&"',Kill_IP="&Kill_IP&",WriteSql="&WriteSql&",alert_url='"&alert_url&"',alert_info='"&alert_info&"',kill_info='"&kill_info&"',N_type="&N_type&",Sec_Forms='"&Sec_Forms&"',Sec_Form_open="&Sec_Form_open&""
	'response.write sql
	conn.execute(sql)
	Application.Lock
	set Application("Neeao_config_info")=nothing
	Application.unlock
	Call main()
End Sub 

Function N_Replace(N_urlString)
	N_urlString = Replace(N_urlString,"'","''")
    N_urlString = Replace(N_urlString, ">", "&gt;")
    N_urlString = Replace(N_urlString, "<", "&lt;")
    N_Replace = N_urlString
End Function
%>