<%
'Designed By L.C.H
'ǰ̨���ö���
%>
<%
Function LenTemp(temp,length)
	if len(temp)>=length then
		lenTemp=left(temp,length) & ".."
	else
		lenTemp=temp
	end if
End Function
%>
<%
'���ַ�����
Function GetLen(tempstr,Lens)
if Len(tempstr)>=lens then
	GetLen=left(tempstr,lens)
else
	GetLen=tempstr
end if
End FUnction

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
'L.C.H-004��ʾ������ʾ�ҷ�����һҳ
Function ShowError(a)
response.write("<script language=javascript>alert('"&a&"');javascript:history.go(-1)")
response.write("</script>")
response.end()
End Function
'************************************************************************
'L.C.H-005��ʾ������ʾ������������һҳ
Function ShowErrorTo(a,b)
response.write("<script language=javascript>alert('"&a&"');")
response.write("this.location.href='"&b&"';</script>")
response.end()
End Function
'************************************************************************
'L.C.H-006��ʾ������ʾ�ҹرոô���
Function ShowErrorClose(a)
response.write("<script language=javascript>alert('"&a&"');")
response.write("javascript:window.close();</script>")
response.end()
End Function
'************************************************************************
'L.C.H-007��ҳ����
Function PageGo(a,sql)
response.write "<table width='98%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#D5EDFE' bgcolor='#ffffff' class='f12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='28' bordercolor='#ffffff'><div align='right'>"
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
response.write "<input type='submit'  value='ת��'  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-008��ֹ�ⲿ�ύ
Sub Remote()
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
Call ShowError("��������")
end if 
end Sub
'************************************************************************
'L.C.H-009��ҳ����
Function PageGo2(a,sql)
response.write "<table width='100%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#D7D7D7' bgcolor='#EFEFEF' class='f12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='24' bordercolor='#ffffff'><div align='right'>"
   If currentpage > 1 Then
      response.write "<a href='"&a&".asp?"&sql&"page="+cstr(1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentpage-1)+"'><font color='#ff0000'>ǰҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰҳ-</font>"      
   End if
   If currentpage < rs1.PageCount Then
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentPage+1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(rs1.PageCount)+"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if
Response.write "<font color='#333333'>ҳ��:</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
Response.write "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>��/ҳ&nbsp" & "��</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(rs1.RecordCount) & "</font>" & "<font color='#333333'>����Ϣ</font>&nbsp;&nbsp;"
response.write "<font color='#333333'>ת����</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
response.write "<input type='submit'  value='ת��'  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-010��ҵ��Ƹְλ����
Sub JobOverTime()
dim overtime
set rs_over=conn.execute("select jid,overtime,publishtime from [01387joblist] where cid='"&request.cookies("01387job")("cid")&"'")
if not rs_over.eof then
do while not rs_over.eof
if rs_over("overtime")<date() then
  conn.execute("update [01387joblist] set canshow='no' where jid='"&rs_over("jid")&"'")
end if
rs_over.movenext
loop
rs_over.close
set rs_over=nothing
end if
end Sub
'************************************************************************
'L.C.H-010a��ҵ��Ƹ�Ӽ�ְλ����
Sub JobHurryOverTime()
dim hurry
set hurry=conn.execute("select hurrytime,jid from [01387joblist] where hurry=1")
if not hurry.eof then
do while not hurry.eof
if hurry(0)<date() then
  conn.execute("update [01387joblist] set hurry=0 where jid='"&hurry(1)&"'")
end if
hurry.movenext
loop
hurry.close
set hurry=nothing
end if
end Sub
'************************************************************************
'L.C.H-011��ҵ��Ƹְλ�Ƿ�����ж�
Function IfJobOverTime(jid)
dim overtime
Call RsName(rs_over,"select overtime from [01387joblist] where jid='"&jid&"'",1,1)
if rs_over("overtime")<=date() then
  Call ShowErrorClose("��ְλ�ѹ��ڣ����ɸ���״̬�������±༭ְλ��")
end if
rs_over.close
set rs_over=nothing
end Function
'************************************************************************
'L.C.H-012��ҵ��Ƹְλ״̬���ŵĲſ��ط�
Function RePublishJob(jid)
set rs_canshow=conn.execute("select canshow from [01387joblist] where jid='"&jid&"'")
if rs_canshow(0)="no" then
  Call ShowError("״̬�رյ�ְλ���ɽ����ط����������ȸ��ĸ�ְλ״̬��")
end if
rs_canshow.close
set rs_canshow=nothing
end Function
'************************************************************************
'L.C.H-013��ҳ���������
Function BigAd(situ)
Call RsName(rs_bigad,"select top 1 situation,mytype,width,height,img,url,show,id,adsitu from [01387AdvLogo] where situation=2 and adsitu="&situ&" and show=1 order by id desc",1,1)
if not rs_bigad.eof then
%>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFFF">
	<%if rs_bigad(1)=1 then%>
	<a href="<%=rs_bigad(5)%>&id=<%=rs_bigad(7)%>" target="_blank"><img src="ad/<%=rs_bigad(4)%>" width="<%=rs_bigad(2)%>" height="<%=rs_bigad(3)%>" border="0"></a>
	<%else%>
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%=rs_bigad(2)%>" height="<%=rs_bigad(3)%>">
              <param name="movie" value="ad/<%=rs_bigad(4)%>">
              <param name="quality" value="high">
              <embed src="ad/<%=rs_bigad(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="<%=rs_bigad(2)%>" height="<%=rs_bigad(3)%>"></embed></object> 
	<%end if%>
	</td>
  </tr>
  <tr> 
    <td height="2" align="center" valign="middle"> </td>
  </tr>
</table>
<%
end if
rs_bigad.close
set rs_bigad=nothing
End Function
'************************************************************************
'L.C.H-014����������
Function TopAd(situ)
Call RsName(rs_topad,"select top 1 situation,mytype,width,height,img,url,show,id,adsitu from [01387AdvLogo] where situation=1 and adsitu="&situ&" and show=1 order by id desc",1,1)
if not rs_topad.eof then
%>
<%if situ=1 then%>
	<%if rs_topad(1)=1 then%>
	<a href="<%=rs_topad(5)%>&id=<%=rs_topad(7)%>" target="_blank"><img src="ad/<%=rs_topad(4)%>" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>" border="0"></a>
	<%else%>
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>">
              <param name="movie" value="ad/<%=rs_topad(4)%>">
              <param name="quality" value="high">
              <embed src="ad/<%=rs_topad(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>"></embed></object> 
	<%end if%>
<%else%>
<%if rs_topad(1)=1 then%>
	<a href="../<%=rs_topad(5)%>&id=<%=rs_topad(7)%>" target="_blank"><img src="../ad/<%=rs_topad(4)%>" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>" border="0"></a>
	<%else%>
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>">
              <param name="movie" value="../ad/<%=rs_topad(4)%>">
              <param name="quality" value="high">
              <embed src="../ad/<%=rs_topad(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="<%=rs_topad(2)%>" height="<%=rs_topad(3)%>"></embed></object> 
	<%end if%>
<%end if%>
<%
end if
rs_topad.close
set rs_topad=nothing
End Function
'************************************************************************
'L.C.H-015��ҳIP����ͳ��
Function IpCount(a,b)
set ip=conn.execute("select count(id) from [01387IpCount] where ip='"&a&"' and visittime='"&date()&"'")
if ip(0)=0 then
  if b="" then
     b="self"
  end if
  conn.execute("insert into [01387IpCount] (ip,fromwhere,visittime,detailtime) values ('"&a&"','"&b&"','"&date()&"','"&now()&"')")
end if
ip.close
set ip=nothing
end Function
'************************************************************************
'L.C.H-016����ҳ����������ͳ��
Function AllPageCount(a,b)
  conn.execute("insert into [01387AllPageCount] (page,ip,visittime) values ('"&a&"','"&b&"','"&date()&"')")
end Function
'************************************************************************
'L.C.H-017û����Ƹְλ�Ĺ�˾�Զ��ر�
'Sub CloseCompany()
  'conn.execute("insert into [01387AllPageCount] (page,ip,visittime) values ('"&a&"','"&b&"','"&date()&"')")
'end Sub
'************************************************************************
'L.C.H-018Ȩ�޷���
Function PowerCheck(a)
if Cint(request.cookies("01387job")("cidpower"))<Cint(a) then
response.Redirect("tishi.asp")
response.end()
end if
End Function
'************************************************************************
'L.C.H-018aȨ�޷��䷵����ʾ��
Function PowerCheckClose(a)
if Cint(request.cookies("01387job")("cidpower"))<Cint(a) then
Call ShowErrorClose("������ֻ�Ը��ѻ�Ա���ţ�")
end if
End Function
'************************************************************************
'L.C.H-019�������߹��IP����ͳ��
Function AdvIpCount(a,b)
set ip=conn.execute("select count(id) from [01387AdvIpCount] where ip='"&a&"' and visittime='"&date()&"'")
if ip(0)=0 then
  if b="" then
     b="self"
  end if
  conn.execute("insert into [01387AdvIpCount] (ip,fromwhere,visittime,detailtime) values ('"&a&"','"&b&"','"&date()&"','"&now()&"')")
end if
ip.close
set ip=nothing
end Function
'************************************************************************
'L.C.H-020ҳ�����ͳ�Ʒ���2(ֻ�ǵ����������)
Function NewPageCount()
	Call RsName(rspage,"select Count(id) from [01387NewPageCount] where visittime='"&date()&"'",1,1)
	if rspage(0)=0 then
		conn.execute("insert into [01387NewPageCount] (mycount,visittime) values (1,'"&date()&"')")
		rspage.close
	else
		conn.execute("update [01387NewPageCount] set mycount=mycount+1 where visittime='"&date()&"'")
	end if
End Function


'--------------------------------------------------------------------------
'	�������ܣ���ͨ�÷�ҳ
'	��    ��:   Intpagecount����ҳ��
'				Intmypage  ��ǰҳ��
'				Intrecordcount  ��¼����
'				Intpagesize ÿҳ��ʾ�ļ�¼��
'				StrValue  ��ַ������ֵ					
'--------------------------------------------------------------------------
function FunPage(Intpagecount,Intmypage,Intrecordcount,Intpagesize,StrValue)
	 on error resume next
	 dim Intfor,Intlist,intlist_b
	 if intmypage>1 then
		 funpage=funpage & "<a class=he href='?page=1" & StrValue & "' title='��ǰҳ' ><img src="" ../images/pre_page_simple_act.gif"" align=""absmiddle"" border='0'/></a>&nbsp;&nbsp;"
		 funpage=funpage&"<a class=he href='?page="&Intmypage-1 & StrValue & "' title='��һҳ' ><img src="" ../images/next_page_2.gif"" align=""absmiddle"" border='0'/></a>&nbsp;"
	 else
		 funpage=funpage &""
	 	 funpage=funpage&""
	 end if
	 if Intlist<>0 then
		 if cintmypage= Intlist then
			Intlist=Intlist+5		
		 end if
	  else
	  	Intlist=Intmypage+5
	  end if
	  if intlist-9<1 then
	     intlist_b=1
	  else
	  	 intlist_b=intlist-9
	  end if		
	  for Intfor=intlist_b to Intlist          
	 	 if intfor<=Intpagecount then              
		 	 if intfor=Intmypage then       '-------ʹ��ǰҳ����Ϊ��ɫ�������ɵ��
				 funpage =funpage & strMode&" <font color='#FF0000'><b>"& Intfor & "</b></font>"
			 else
				 funpage=funpage & strMode &" <b><a class=he href='?page=" & Intfor & StrValue & "' >" & Intfor & "</a></b>"
			 end if
		 end if
		 strMode="&nbsp; <font color='#BBBBBB'>|</font>&nbsp; "
	  next
	  if intmypage<intpagecount then
	  	funpage=funpage&"&nbsp; <a class=he href='?page="& Intmypage+1 & StrValue & "' title='��һҳ'><img src="" ../images/next_page_act.gif"" align=""absmiddle"" border='0'/></a>&nbsp;&nbsp;"
	    funpage=funpage &"<a class=he href='?page="& Intpagecount & StrValue & "' title='���ҳ' ><img src="" ../images/pre_page_1.gif"" align=""absmiddle"" border='0'/></a>"
	  else
	  	funpage=funpage&" "	
	    funpage=funpage &""
	  end if
	           funpage="<div id=""function"">"&_ 
				vbcrlf&"<br/><font face=""Arial, Helvetica, sans-serif"">"&funpage&"</font><br/>"&_
				vbcrlf&"�� <strong>"&Intrecordcount&"</strong> ����¼, "&"��ǰ��ʾ�� <strong>"&Intmypage&"</strong> ҳ, <strong>"&Intpagesize&"</strong> ��/ҳ, �� <strong>"&Intpagecount&"</strong> ҳ"&_
			    vbcrlf&"</div>"
	  if err.number<>0 then
	 	err.clear	
		response.redirect("Error.asp?err=��ҳ���������������Ա��ϵ��|")
	  end if
end function

function FunSQL(StrValue,BloType)
	if BloType then
		if Isnumeric(StrValue) then
			StrValue=Clng(StrValue)
		else
			StrValue=0
		end if
	else
		if not isnull(StrValue) then
			StrValue=lcase(StrValue)
			StrValue=Replace(StrValue,"'","''")
			StrValue=replace(StrValue,"select","")
			StrValue=replace(StrValue,"update","")
			StrValue=replace(StrValue,"insert","")
			StrValue=replace(StrValue,"delete","")
			StrValue=replace(StrValue,";","")
			StrValue=replace(StrValue," ","")
			StrValue=replace(StrValue,chr(255),"")
			StrValue=replace(StrValue,"*","")
			StrValue=replace(StrValue,"%","")
		end if
	end if
	FunSQL=StrValue
end function
%>
