<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim DayDate
DayDate=Year(Date)&"��"&Month(Date)&"��"&Day(Date)&"��"

 %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href=../CSS/css_offices.css rel=stylesheet>

</head>
<body  topmargin="0" leftmargin="0" >

<div align="center">
  <TABLE id=footer cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
      <TR> 
        <TD bgColor=#B3D2F1 height="4"> </TD>
      </TR>
      <TR> 
        <TD height="21" align=right valign="middle" bgColor=#ECF4FC>
<table width="100%" border="0" cellspacing="0">
            <tr>
              <td width="50%" style="padding-top:3px;padding-left:3px;">���죺<%= DAYDate %></td>
              <td width="50%" align="right" style="padding-top:3px;">�����ͼ���֧�� <a href="http://www.it5k.com" target="_blank" class="hei1">�¼���������</a>&nbsp; </td>
            </tr>
          </table> </TD>
      </TR>
    </TBODY>
  </TABLE>
</div>

</body>
</html>

