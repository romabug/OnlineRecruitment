<%
'Designed By L.C.H
'���к�̨���ö���
%>
<%
'L.C.H-001�����������ݿ��¼
Function RsName(Rs_Name,Sql,A,B)
Set Rs_Name=Server.CreateObject("Adodb.RecordSet")
Rs_Name.open Sql,conn,A,B
End Function
'************************************************************************
'L.C.H-002�ͷż�¼��
Sub CloseRs()
rs.close
set rs=nothing
End Sub
'************************************************************************
'L.C.H-003�ͷ�conn
Sub CloseConn()
conn.close
set conn=nothing
End Sub
'************************************************************************
%>
<%
'L.C.H-004������ҳ������ 
Sub main_top()
Call RsName(Announce,"select top 1 * from [01387Announce] where mytype=3 order by id desc",1,1)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="image/admin_bg_2.gif" class="12">
  <tr> 
    <td width="3%" height="25" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><img src="image/i_home.gif" width="16" height="18"></div></td>
    <td width="18%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"> 
        <script language=javascript>
<!--
calendar = new Date();
day = calendar.getDay();
month = calendar.getMonth();
date = calendar.getDate();
year = calendar.getYear();
if (year< 100) year = 1900 + year;
cent = parseInt(year/100);
g = year % 19;
k = parseInt((cent - 17)/25);
i = (cent - parseInt(cent/4) - parseInt((cent - k)/3) + 19*g + 15) % 30;
i = i - parseInt(i/28)*(1 - parseInt(i/28)*parseInt(29/(i+1))*parseInt((21-g)/11));
j = (year + parseInt(year/4) + i + 2 - cent + parseInt(cent/4)) % 7;
l = i - j;
emonth = 3 + parseInt((l + 40)/44);
edate = l + 28 - 31*parseInt((emonth/4));
emonth--;
var dayname = new Array ("����", "��һ", "�ܶ�", "����", "����", "����", "����");
var monthname = 
new Array ("1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��" );
document.write("<font color=#0033ff style='font-size:9pt'>"+year +"��");
document.write(monthname[month]);
document.write(date + "��");
document.write("&nbsp;");
document.write(dayname[day]+" "+"</font>");
document.write("<br></font>");

//-->
</script>
        </font></div></td>
    <td width="67%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><marquee scrolldelay=50; scrollamount=2; onMouseOver=stop(); onMouseOut=start(); direction=left;width="67%">
      <%if Announce.eof and Announce.bof then%>
	  ���޹��棡
	  <%end if%>
	  <%do while not Announce.eof%>
	  <a href="AnnounceDetail.asp?id=<%=Announce("id")%>" target="_blank"><%=Announce("title")%></a>
	  <%Announce.movenext
	  loop%>
	  </marquee></td>
    <td width="12%" bgcolor="#FFFFFF" background="image/admin_bg_2.gif"><div align="center"><a href="../" target="_parent">Macau69��ҳ</a></div></td>
  </tr>
</table>
<%
Announce.close
set Announce=nothing
End Sub
'************************************************************************
%>
<%
'L.C.H-005��̨��������ҳ���β�ļ�
Sub footer()
response.Write("<table width='98%' border='0' cellspacing='0' cellpadding='0' class='table2' align='center'><tr><td height=8> </td></tr><tr>")
response.Write("<td><div align='center'>Copyright&copy;2007&nbsp;�����͹���Ƹ�� &nbsp;<a href='http://www.macau69.com/' target='_blank'>macau69.com</a>&nbsp;.&nbsp;All Rights Reserved. </div></td></tr></table>")
End Sub
'************************************************************************
'L.C.H-006��ʾ������ʾ�ҷ�����һҳ
Function ShowError(a)
response.write("<script language=javascript>alert('"&a&"');javascript:history.go(-1)")
response.write("</script>")
response.end()
End Function
'************************************************************************
'L.C.H-007��ʾ������ʾ������������һҳ
Function ShowErrorTo(a,b)
response.write("<script language=javascript>alert('"&a&"');")
response.write("this.location.href='"&b&"';</script>")
response.end()
End Function
'************************************************************************
'L.C.H-009��ҳ����
Function PageGo(a,sql)
response.write "<table width='99%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#999999' bgcolor='#f0f0f0' class='12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='24' bordercolor='#f0f0f0'><div align='center'>"
   If currentpage > 1 Then
      response.write "<a href='"&a&".asp?"&sql&"page="+cstr(1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentpage-1)+"'><font color='#ff0000'>ǰҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰҳ-</font>"      
   End if
   If currentpage < rs.PageCount Then
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentPage+1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(rs.PageCount)+"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if
Response.write "<font color='#333333'>ҳ��:</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>/" & Cstr(rs.pagecount) & "</font>&nbsp;"
Response.write "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>��/ҳ&nbsp" & "��</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(rs.RecordCount) & "</font>" & "<font color='#333333'>����Ϣ</font>&nbsp;&nbsp;"
response.write "<font color='#333333'>ת����</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-010Ȩ�޷���
Function PowerCheck(a)
if Cint(request.cookies("01387job")("userpower"))<Cint(a) then
Call ShowError("��Ȩ�ޣ�")
end if
End Function
%>
