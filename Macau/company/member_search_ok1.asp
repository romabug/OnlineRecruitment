<style type="text/css">
<!--
.style5 {font-family: "����"; font-size: 9pt; }
.style8 {font-family: "����"; font-size: 9pt; color: #FF6633; }
-->
</style>
<!--#include file="../conn.asp"-->
<%
Function ReplaceNull(Temp)
	if Temp="" then 
		ReplaceNull=" "
	else
		ReplaceNull=temp
	end if
End FUnction
dim Keywords,sql,Rs,Sparameter
Keywords=request.Form("Keywords")
set rs=server.CreateObject("ADODB.recordset")
	If Keywords<>"" then
		sql="select case sex when '0' then '��' when '1' then 'Ů'  end as sex,Uid,Spec1,Doneyear,Province,subcatelog,Lastlogin,year(getdate())-year(Birthday)+1 as birthday from [01387member]"
		sql=sql & " where MainCatelog like '%"& Keywords &"%'"
		sql=sql & " or Jobname like '%"& Keywords &"%'"
		sql=sql & " or Degree like '%"& Keywords &"%'"
		sql=sql & " or Jobtype like '%"& Keywords &"%'"
		sql=sql & " or Marry like '%"& Keywords &"%'"
		sql=sql & " or selfintro like '%"& Keywords &"%'"
		sql=sql & " or job_career like '%"& Keywords &"%'"
		sql=sql & " or edu_career like '%"& Keywords &"%'"
		sql=sql & " or subcatelog like '%"& Keywords &"%'"
		sql=sql & " or Spec1 like '%"& Keywords &"%'"
		Sparameter="&keywords="& Keywords
	Else
		dim MainCateLog,Jobname,Doneyear,salary,sex,Degree,height1,height2,Birthday1,Birthday2,Jobtype,Marry
		MainCateLog=request.form("MainCateLog")
		Jobname=request.form("Jobname")
		Doneyear=request.form("Doneyear")
		salary=request.form("salary")
		sex=request.form("sex")
		Degree=request.form("Degree")
		height1=request.form("height1")
		height2=request.form("height2")
		Birthday1=request.form("Birthday1")
		Birthday2=request.form("Birthday2")
		Jobtype=request.form("Jobtype")
		Marry=request.form("Marry")
		Sparameter="&MainCateLog=" & MainCateLog & "&Jobname=" & Jobname & "&Doneyear=" & Doneyear & "&salary=" & salary & "&sex=" & sex & "&Degree=" & Degree & "&height1=" & height1 & "&height2=" & height2 & "&Birthday1=" & Birthday1 & "&Birthday2=" & Birthday2 & "&Jobtype=" & Jobtype &  "&Marry=" & Marry
		sql="select case sex when '0' then '��' when '1' then 'Ů'  end as sex,Uid,Spec1,Doneyear,Province,subcatelog,Lastlogin,year(getdate())-year(Birthday)+1 as birthday from [01387member] where 1<>2"
		if MainCatelog<>"" then
			sql=sql & " and MainCateLog ="& MainCateLog & ""
		end if
		if Jobname<>"" then
			sql=sql & " and Jobname like '%"&Jobname&"%'"
		end if
		if Doneyear<>"" then
			sql=sql & " and Doneyear >="&Doneyear&""
		end if
		
		if salary<>"" then
			sql=sql & " and salary >="&salary&""
		end if
		
		if sex<>"" then
			sql=sql & " and sex ='"&sex&"'"
		end if
		
		if Degree<>"" then
			sql=sql & " and Degree ='"&Degree&"'"
		end if
		
		if height1<>"" and height2<>"" then
			sql=sql & "and (height>="& height1 &" and height<="& height2 &")"
		end if
		
		if Birthday1<>"" and Birthday2<>"" then
			sql=sql & "and (Year(getdate())-year(Birthday) >="&Birthday1-1&" and Year(getdate())-year(Birthday)<="&Birthday2-1&")"
		end if
		
		if Jobtype<>"" then
			sql=sql & " and Jobtype ='"&Jobtype&"'"
		end if
		
		if Marry<>"" then
			sql=sql & " and Marry ='"&Marry&"'"
		end if
	End if
rs.open sql,conn,1,1
const MaxPerPage=100
dim totalPut,pages,records   
dim CurrentPage
dim TotalPages
rs.PageSize=20
pages=rs.pagecount
records=rs.recordcount
currentpage=request("currentpage")
if currentpage="" or currentpage<1 then currentpage=1
currentpage=cint(currentpage)
if currentpage>pages then currentpage=pages
rs.absolutepage=currentpage
response.write "<TABLE width=""642"" border=1 cellPadding=0 cellSpacing=0 bordercolor=""#FF6633"" borderColorLight=""#ffffff"" borderColorDark=""#FF6633"" 5=""90%"">"
response.write "<TR bgcolor=""#FF6633"">"
response.write "<TD height=24 align=right><div align=""center"" class=""style5"">��Ա���</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">��ѧרҵ</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">��������</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">����</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">����</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">������λ</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">�Ա�</div></TD>"
response.write "<TD height=24><div align=""center"" class=""style5"">�ϴε�¼ʱ��</div></TD>"
response.write "</TR>"
if not rs.eof then
	Do until rs.eof
	response.write "<TR>"
	response.write "<TD height=20 align=right><div align=""center"" class=""style5"">"&RS("Uid")&"</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">" 
		if RS("Spec1")&""="" then
		response.write "��רҵ" 
		else
		response.write RS("Spec1")
		end if
		response.write "</div></TD>"
    response.write "<TD><div align=""center"" class=""style5"">"
	if RS("Doneyear")&""="" then
	response.write "�޾���"
	else
	response.write RS("Doneyear")
	end if
	response.write "</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">"&RS("birthday")&"</div></TD>"
    response.write "<TD><div align=""center"" class=""style5"">"
	select case RS("Province")
	case "1"
	fuji="����"
	case "2"
	fuji="���"
	case "3"
	fuji="�Ϻ�"
	case "4"
	fuji="����"
	case "5"
	fuji="�㽭"
	case "6"
	fuji="�㶫"
	case "7"
	fuji="����"
	case "8"
	fuji="����"
	case "9"
	fuji="����"
	case "10"
	fuji="����"
	case "11"
	fuji="ɽ��"
	case "12"
	fuji="����"
	case "13"
	fuji="����"
	case "14"
	fuji="����"
	case "15"
	fuji="�Ĵ�"
	case "16"
	fuji="����"
	case "17"
	fuji="����"
	case "18"
	fuji="������"
	case "19"
	fuji="�ӱ�"
	case "20"
	fuji="����"
	case "21"
	fuji="����"
	case "22"
	fuji="����"
	case "23"
	fuji="ɽ��"
	case "24"
	fuji="���ɹ�"
	case "25"
	fuji="����"
	case "26"
	fuji="����"
	case "27"
	fuji="����"
	case "28"
	fuji="�ຣ"
	case "29"
	fuji="�½�"
	case "30"
	fuji="����"
	case "31"
	fuji="����"
	case "32"
	fuji="̨��"
	case "33"
	fuji="���"
	case "34"
	fuji="����"
	case "35"
	fuji="����"
	case "36"
	fuji="����"
	end select
	response.Write(fuji) & "</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">"&ReplaceNull(RS("subcatelog"))&"</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">"&ReplaceNull(RS("Sex"))&"</div></TD>"
	response.write "<TD height=20><div align=""center"" class=""style5"">"&ReplaceNull(RS("Lastlogin"))&"</div></TD>"
	response.write "</TR>"
	rs.movenext
	if rs.eof then exit do
loop
end if
response.write "<TR>"
response.write "<TD height=20 colspan=8 align=right><span class=style8>"%>
<table width="100%"  align="right">   
    <tr class="style8">   
      <td height="0" align="right">   
      <p align="center">   
      <font size="2">   
      <%if currentpage>1 then%>   
      <a href="Member_search_ok.asp?currentpage=<%=currentpage-1%><%=Sparameter%>"><font size="2">[��һҳ]</font></a>     
      <%end if%>            
      <%if currentpage<pages then%>            
      <a href="Member_search_ok.asp?currentpage=<%=currentpage+1%><%=Sparameter%>">[��һҳ]</a>            
      <%end if%>            
      <%if currentpage>1 then%>            
      <a href="Member_search_ok.asp?currentpage=1<%=Sparameter%>">[����ҳ]</a>            
      <%end if%>            
      <%if currentpage<pages then%>            
      <a href="Member_search_ok.asp?currentpage=<%=pages%><%=Sparameter%>">[��ĩҳ]</a>            
      <%end if%> </font>��ǰ��<%=currentpage%>ҳ/��<%=pages%>ҳ ��
      <%=records%>����¼</td>   
</tr>   
</table><%
response.write "</span></TD>"
response.write "</TR>"
closeconn
response.write "</TABLE>"
%>