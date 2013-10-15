<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim mydate
mydate=request("mydate")
if request("mydate")<>"" then
Call RsName(rs,"Select ip,fromwhere,visittime,detailtime from [01387IpCount] where visittime='"&mydate&"' order by visittime desc,id desc",1,1)
else
Call RsName(rs,"Select ip,fromwhere,visittime,detailtime from [01387IpCount] order by visittime desc,id desc",1,1)
end if
Function URLDecode(enStr)
	dim deStr
	dim c,i,v
	deStr=""
	for i=1 to len(enStr)
		c=Mid(enStr,i,1)
		if c="%" then
			v=eval("&h"+Mid(enStr,i+1,2))
			if v<128 then
				deStr=deStr&chr(v)
				i=i+2
			else
				if isvalidhex(mid(enstr,i,3)) then
					if isvalidhex(mid(enstr,i+3,3)) then
						v=eval("&h"+Mid(enStr,i+1,2)+Mid(enStr,i+4,2))
						deStr=deStr&chr(v)
						i=i+5
					else
						v=eval("&h"+Mid(enStr,i+1,2)+cstr(hex(asc(Mid(enStr,i+3,1)))))
						deStr=deStr&chr(v)
						i=i+3 
					end if 
				else 
					destr=destr&c
				end if
			end if
		else
			if c="+" then
				deStr=deStr&" "
			else
				deStr=deStr&c
			end if
		end if
	next
	URLDecode=deStr
end function

function isvalidhex(str)
	isvalidhex=true
	str=ucase(str)
	if len(str)<>3 then isvalidhex=false:exit function
	if left(str,1)<>"%" then isvalidhex=false:exit function
		c=mid(str,2,1)
	if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
		c=mid(str,3,1)
	if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
end function
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<!--#include file="inc/Page15.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<!--#include file="IpTop.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="3" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">首 
        页 IP 统 计 列 表</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>IP</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>从何处访问</strong></font></div></td>
    <td><div align="center"><font color="#333333"><strong>访问时间</strong></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="16%" height="30"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><%=rs(0)%></font></div></td>
    <td width="48%"><div align="center"><font color="#0033CC" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
		  if rs(1)="self" then 
		    response.Write("直接输入网址") 
		  elseif instr(rs(1),"3721")>1 then
			  aaa=instr(rs(1),"name=") 'name=字符串出现的位置
			  if aaa=0 then
			    aaa=instr(rs(1),"p=")
			    bbb=instr(aaa+2,rs(1),"&") '第2个&出现的位置 
			      if bbb=0 then
			         bbb=len(rs(1))+1
			      end if
			  mylove=mid(rs(1),aaa+2,bbb-aaa-2) 
			  else
			    bbb=instr(aaa+5,rs(1),"&") '第2个&出现的位置 
			      if bbb=0 then
			         bbb=len(rs(1))+1
			      end if
			  mylove=mid(rs(1),aaa+5,bbb-aaa-5) 
			  end if
		      response.write("<a href='"&rs(1)&"' target=_blank><font color=red><b>3721：</b></font>"&URLDecode(mylove)&"</a>")
			 elseif instr(rs(1),"baidu")>1 then
			  aaa=instr(rs(1),"wd=") 'wd=字符串出现的位置
			    bbb=instr(aaa+3,rs(1),"&") '第2个&出现的位置 
			      if bbb=0 then
			         bbb=len(rs(1))+1
			      end if
			  mylove=mid(rs(1),aaa+3,bbb-aaa-3) 
		      response.write("<a href='"&rs(1)&"' target=_blank><font color=red><b>百度关键字：</b></font>"&URLDecode(mylove)&"</a>")
			else
			  response.write("<a href='"&rs(1)&"' target=_blank>"&rs(1)&"</a>")
		  end if	
		 %>
        </font></div></td>
    <td width="15%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%if rs(3)<>"" then response.Write(rs(3)) else response.Write(rs(2))%></font></strong></div></td>
  </tr>
  <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("IpCount","mydate="&mydate&"&")%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseRs()
call CloseConn()
%>
</body>
</html>