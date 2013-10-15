<%
'Designed By L.C.H
'前台调用东东
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
'过字符长度
Function GetLen(tempstr,Lens)
if Len(tempstr)>=lens then
	GetLen=left(tempstr,lens)
else
	GetLen=tempstr
end if
End FUnction

'L.C.H-001建立连接数据库记录
Function RsName(Rs_Name,Sql,A,B)
Set Rs_Name=Server.CreateObject("Adodb.RecordSet")
Rs_Name.open Sql,conn,A,B
End Function
'************************************************************************
'L.C.H-002释放记录集
Sub CloseRs()
rs.close
set rs=nothing
End Sub
'************************************************************************
'L.C.H-003释放conn
Sub CloseConn()
conn.close
set conn=nothing
End Sub
'************************************************************************
'L.C.H-004显示错误提示且返回上一页
Function ShowError(a)
response.write("<script language=javascript>alert('"&a&"');javascript:history.go(-1)")
response.write("</script>")
response.end()
End Function
'************************************************************************
'L.C.H-005显示错误提示且重新载入另一页
Function ShowErrorTo(a,b)
response.write("<script language=javascript>alert('"&a&"');")
response.write("this.location.href='"&b&"';</script>")
response.end()
End Function
'************************************************************************
'L.C.H-006显示错误提示且关闭该窗口
Function ShowErrorClose(a)
response.write("<script language=javascript>alert('"&a&"');")
response.write("javascript:window.close();</script>")
response.end()
End Function
'************************************************************************
'L.C.H-007分页调用
Function PageGo(a,sql)
response.write "<table width='98%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#D5EDFE' bgcolor='#ffffff' class='f12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='28' bordercolor='#ffffff'><div align='right'>"
   If currentpage > 1 Then
      response.write "<a href='"&a&".asp?"&sql&"page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   If currentpage < rs.PageCount Then
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(rs.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>后页-</font>"
      Response.write "<font color='#333333'>尾页</font>&nbsp;&nbsp;"       
   End if
Response.write "<font color='#333333'>页次:</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>/" & Cstr(rs.pagecount) & "</font>&nbsp;"
Response.write "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>条/页&nbsp" & "共</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(rs.RecordCount) & "</font>" & "<font color='#333333'>条信息</font>&nbsp;&nbsp;"
response.write "<font color='#333333'>转到：</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
response.write "<input type='submit'  value='转到'  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-008禁止外部提交
Sub Remote()
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
Call ShowError("参数错误！")
end if 
end Sub
'************************************************************************
'L.C.H-009分页调用
Function PageGo2(a,sql)
response.write "<table width='100%' border='1' align='center' cellPadding='0' cellSpacing='0' bordercolor='#D7D7D7' bgcolor='#EFEFEF' class='f12'>"
response.write "<form method=Post action='"&a&".asp?"&sql&"'>"
response.write "<tr><td height='24' bordercolor='#ffffff'><div align='right'>"
   If currentpage > 1 Then
      response.write "<a href='"&a&".asp?"&sql&"page="+cstr(1)+"'><font color='#ff0000'>首页</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentpage-1)+"'><font color='#ff0000'>前页</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>首页-</font>"
      Response.write "<font color='#333333'>前页-</font>"      
   End if
   If currentpage < rs1.PageCount Then
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(currentPage+1)+"'><font color='#ff0000'>后页</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='"&a&".asp?"&sql&"page="+Cstr(rs1.PageCount)+"'><font color='#ff0000'>尾页</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>后页-</font>"
      Response.write "<font color='#333333'>尾页</font>&nbsp;&nbsp;"       
   End if
Response.write "<font color='#333333'>页次:</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
Response.write "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333' face='Geneva, Arial, Helvetica, sans-serif'>条/页&nbsp" & "共</font>" & "<font color=#ff0000 face='Geneva, Arial, Helvetica, sans-serif'>" & Cstr(rs1.RecordCount) & "</font>" & "<font color='#333333'>条信息</font>&nbsp;&nbsp;"
response.write "<font color='#333333'>转到：</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
response.write "<input type='submit'  value='转到'  name='cndok' class='button'></span>&nbsp;&nbsp;"   
response.write "</div></td></tr></form></table>"
End Function
'************************************************************************
'L.C.H-010企业招聘职位过期
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
'L.C.H-010a企业招聘加急职位过期
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
'L.C.H-011企业招聘职位是否过期判断
Function IfJobOverTime(jid)
dim overtime
Call RsName(rs_over,"select overtime from [01387joblist] where jid='"&jid&"'",1,1)
if rs_over("overtime")<=date() then
  Call ShowErrorClose("该职位已过期，不可更改状态，请重新编辑职位！")
end if
rs_over.close
set rs_over=nothing
end Function
'************************************************************************
'L.C.H-012企业招聘职位状态开放的才可重发
Function RePublishJob(jid)
set rs_canshow=conn.execute("select canshow from [01387joblist] where jid='"&jid&"'")
if rs_canshow(0)="no" then
  Call ShowError("状态关闭的职位不可进行重发操作，请先更改该职位状态！")
end if
rs_canshow.close
set rs_canshow=nothing
end Function
'************************************************************************
'L.C.H-013首页横幅广告调用
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
'L.C.H-014顶部广告调用
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
'L.C.H-015首页IP访问统计
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
'L.C.H-016所有页面流量访问统计
Function AllPageCount(a,b)
  conn.execute("insert into [01387AllPageCount] (page,ip,visittime) values ('"&a&"','"&b&"','"&date()&"')")
end Function
'************************************************************************
'L.C.H-017没有招聘职位的公司自动关闭
'Sub CloseCompany()
  'conn.execute("insert into [01387AllPageCount] (page,ip,visittime) values ('"&a&"','"&b&"','"&date()&"')")
'end Sub
'************************************************************************
'L.C.H-018权限分配
Function PowerCheck(a)
if Cint(request.cookies("01387job")("cidpower"))<Cint(a) then
response.Redirect("tishi.asp")
response.end()
end if
End Function
'************************************************************************
'L.C.H-018a权限分配返回提示框
Function PowerCheckClose(a)
if Cint(request.cookies("01387job")("cidpower"))<Cint(a) then
Call ShowErrorClose("此内容只对付费会员开放！")
end if
End Function
'************************************************************************
'L.C.H-019义乌热线广告IP访问统计
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
'L.C.H-020页面访问统计方案2(只记当天访问数量)
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
'	函数功能：　通用分页
'	参    数:   Intpagecount　总页数
'				Intmypage  当前页数
'				Intrecordcount  记录总数
'				Intpagesize 每页显示的记录数
'				StrValue  地址栏传递值					
'--------------------------------------------------------------------------
function FunPage(Intpagecount,Intmypage,Intrecordcount,Intpagesize,StrValue)
	 on error resume next
	 dim Intfor,Intlist,intlist_b
	 if intmypage>1 then
		 funpage=funpage & "<a class=he href='?page=1" & StrValue & "' title='最前页' ><img src="" ../images/pre_page_simple_act.gif"" align=""absmiddle"" border='0'/></a>&nbsp;&nbsp;"
		 funpage=funpage&"<a class=he href='?page="&Intmypage-1 & StrValue & "' title='上一页' ><img src="" ../images/next_page_2.gif"" align=""absmiddle"" border='0'/></a>&nbsp;"
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
		 	 if intfor=Intmypage then       '-------使当前页文字为红色，并不可点击
				 funpage =funpage & strMode&" <font color='#FF0000'><b>"& Intfor & "</b></font>"
			 else
				 funpage=funpage & strMode &" <b><a class=he href='?page=" & Intfor & StrValue & "' >" & Intfor & "</a></b>"
			 end if
		 end if
		 strMode="&nbsp; <font color='#BBBBBB'>|</font>&nbsp; "
	  next
	  if intmypage<intpagecount then
	  	funpage=funpage&"&nbsp; <a class=he href='?page="& Intmypage+1 & StrValue & "' title='后一页'><img src="" ../images/next_page_act.gif"" align=""absmiddle"" border='0'/></a>&nbsp;&nbsp;"
	    funpage=funpage &"<a class=he href='?page="& Intpagecount & StrValue & "' title='最后页' ><img src="" ../images/pre_page_1.gif"" align=""absmiddle"" border='0'/></a>"
	  else
	  	funpage=funpage&" "	
	    funpage=funpage &""
	  end if
	           funpage="<div id=""function"">"&_ 
				vbcrlf&"<br/><font face=""Arial, Helvetica, sans-serif"">"&funpage&"</font><br/>"&_
				vbcrlf&"共 <strong>"&Intrecordcount&"</strong> 条记录, "&"当前显示第 <strong>"&Intmypage&"</strong> 页, <strong>"&Intpagesize&"</strong> 条/页, 共 <strong>"&Intpagecount&"</strong> 页"&_
			    vbcrlf&"</div>"
	  if err.number<>0 then
	 	err.clear	
		response.redirect("Error.asp?err=分页函数出错，请与管理员联系！|")
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
