<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Hurry=request("Hurry")
Canshow=request("Canshow")
sql="select a.jid,a.cid,a.jobtype,a.jobname,a.sex,a.detailtime,a.overtime,b.companyname,a.neednum,a.degree,a.hurry,a.canshow,a.closed,b.id,b.lastlogin from [01387joblist] a inner join [01387company] b on a.cid=b.cid where a.jobtype=1"


if Hurry<>"" then
sql=sql&" and a.hurry="&hurry&""
end if
if Canshow<>"" then
sql=sql&" and a.Canshow='"&Canshow&"'"
end if
sql=sql&" order by a.detailtime desc,a.id desc"
Call RsName(rs,sql,1,1)
session("httpurl")=request.ServerVariables("URL")
%>
<!--#include file="inc/Page15.inc"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<script language=jscript>
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
	
		{form1.action="sxjob.asp?page=<%=currentpage%>";form1.submit();}
}
</script>

<script language="javascript">
function delID(ID,url,mes){
var mymes;
mymes=confirm(mes);
if(mymes==true){
window.location=url+ID;
}
}


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
</script> 

<style>
����.info {position:relative;color:#2B49A1; text-decoration:none;font-size:12px;width:150px;text-align:center;height:25px;line-height:25px;}/*�������ӵ�����,һ��Ҫ����Ϊrelative����ʹ��ʾ�����������*/
����.info:hover {background:#fff;color:#509205;text-decoration:none;}
����.info span {display: none }/*���������µ�spanΪ����״̬*/
����.info:hover span /*����hover�µ�span����Ϊ����״̬,��������ʾ���λ��*/{display:block;position:absolute;top:10px;left:120px;width:130px;border:1px solid #ccc; background:#fff; color:#000;padding:5px;text-align:left;text-decoration:none;}
����</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr> 
      <td height="25" colspan="9" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�����С�ְ��λ 
          �� ��</font></strong></div></td>
    </tr>
	<form name="form2" method="post" action="JobSearch.asp">
    <tr bgcolor="#E8EEF9">
      <td height="28" colspan="10">&nbsp;ְλ������ 
        <input name="key" type="text" class="input" id="key" size="30">
        ����ʱ�䣺
        <input name="key2" type="text" class="input" id="key2" value="360" size="4" maxlength="3">
        ������ 
        <input name="Submit" type="submit" class="botton" value="����">
        ���ؼ��ֿ�Ϊ��ְλ���ƣ� <a href='JobList.asp?Hurry=0'><font color=blue>δ�Ӽ�</font></a> <a href='JobList.asp?Hurry=1'><font color=red>�ѼӼ�</font></a>
		
	<a href='JobList.asp?Canshow=ok'><font color=blue>����</font></a> <a href='JobList.asp?Canshow=no'><font color=red>�ر�</font></a></td>
    </tr>	
	</form>
    <%if request("Hurry")<>"" then%>
    <%Call RsName(rsHurry,"select jid,jobname,hurrytime from [01387joblist] where hurry=1 order by hurrytime",1,1)%>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="10">ְλ�Ӽ������</td>
    </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="10"> <%
	  j=1
	  do while not rsHurry.eof%> <%=rsHurry(1)%>&nbsp;����ʱ�䣺<strong><font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif"><%=rsHurry(2)%></font></strong>&nbsp;���� <font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=datediff("d",date(),rsHurry(2))%></strong></font> �쵽��&nbsp; <%if rsHurry(2)<date() then response.write("<font color=red>�ѹ���</font>") else response.write("<font color=blue>��Ч</font>")%>
        || 
        <%if j mod 2=0 then%> <br> <br> <%end if%> <%
	  j=j+1
	  rsHurry.movenext
	  loop%> </td>
    </tr>
    <%
rsHurry.close
set rsHurry=nothing
%>
    <%end if%>
<form name="form1" method="post" action="">
    <tr bgcolor="#CEDBF2">
      <td height="22">ְλ����</td>
      <td width="28%" bgcolor="#CEDBF2">��˾��</td>
      <td align="center"><a href="JobList.asp?Hurry=">�Ӽ�</a></td>
      <td align="center"><a href="JobList.asp?Canshow=">״̬</a></td>
      <td align="center">����</td>
      <td align="center">��������</td>
      <td align="center">��ֹ����</td>
      <td align="center">����</td>
      <td align="center">&nbsp;</td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="18%" height="28"><div align="center"><a class="info" href="ShowJobdetail.asp?Cid=<%=rs(1)%>&ChkNo=<%=rs(0)%>" ><b><%=rs(3)%></b><span>ѧ��Ҫ��:<%
select case rs(9)
case 0
response.write("��������")
case 1
response.write("����")
case 2
response.write("ְ��")
case 3
response.write("��ר")
case 4
response.write("��ר")
case 5
response.write("����")
case 6
response.write("˶ʿ")
case 7
response.write("��ʿ")
end select
%><br>
��Ƹ������<%=rs(8)%>��<br>
ˢ��ʱ�䣺<%=rs("lastlogin")%></span></a></div></td>
      <td bgcolor="#f1f3f5"><a href="ShowCompany.asp?ChkNo=<%=rs(1)%>" ><%=rs(7)%> </a>  </td>
      <td width="7%"><div align="center"> 	<%if rs(10)=true then response.Write("<a href='jobhurry.asp?ChkNo="&rs(0)&"' target=_blank><font color=#ff0000>�ѼӼ�</font></a>")else response.write("<a href='jobhurry.asp?ChkNo="&rs(0)&"' target=_blank><font color=blue>δ�Ӽ�</font></a>")
	  %>
          
      </div></td>
      <td width="7%"> <div align="center">
        <%if rs(11)="ok" then response.Write("<a href='JobList.asp?Canshow=ok'><font color=blue>����</font></a>")else response.write("<a href='JobList.asp?Canshow=no'><font color=red>�ر�</font></a>")%>
      </div></td><td width="8%" align="center"><%if rs("closed")=true then %><a href="JobClosed.asp?ChkNo=<%=rs(0)%>"><font color="#CC0000">�Ѷ���</font></a><%else%><a href="JobClosed.asp?ChkNo=<%=rs(0)%>">û����</a><%end if%></td>
      <td width="10%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(5))%></font></div></td>
      <td width="10%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(6)%></font></div></td>
      
      <td width="7%" align="center"><a href=# onclick="delID(5,'deljob.asp?ChkNo=<%=rs(0)%>&page=<%=currentpage%>','ȷʵҪɾ����?')">ɾ��</a></td>
      <td width="5%" align="center"><input name="ChkNo" type="checkbox" value="<%=trim(rs("id"))%>"></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="9"> <div align="right">
	            <input type="button" name="Button3" value="ȫѡ" style="font-size=12;height=26" onClick="CheckAll(this.form)">
          <input type="button" name="Button2" value="��ѡ" style="font-size=12;height=26" onClick="CheckOthers(this.form);">
        <input type="button" name="btnShow" value="����ˢ�µ���ҳ" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
      </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("JobList","Canshow="&Canshow&"&Hurry="&Hurry&"&")%>
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