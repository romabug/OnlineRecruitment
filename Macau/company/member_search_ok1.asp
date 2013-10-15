<style type="text/css">
<!--
.style5 {font-family: "宋体"; font-size: 9pt; }
.style8 {font-family: "宋体"; font-size: 9pt; color: #FF6633; }
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
		sql="select case sex when '0' then '男' when '1' then '女'  end as sex,Uid,Spec1,Doneyear,Province,subcatelog,Lastlogin,year(getdate())-year(Birthday)+1 as birthday from [01387member]"
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
		sql="select case sex when '0' then '男' when '1' then '女'  end as sex,Uid,Spec1,Doneyear,Province,subcatelog,Lastlogin,year(getdate())-year(Birthday)+1 as birthday from [01387member] where 1<>2"
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
response.write "<TD height=24 align=right><div align=""center"" class=""style5"">会员编号</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">所学专业</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">工作经验</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">年龄</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">户籍</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">期望岗位</div></TD>"
response.write "<TD><div align=""center"" class=""style5"">性别</div></TD>"
response.write "<TD height=24><div align=""center"" class=""style5"">上次登录时间</div></TD>"
response.write "</TR>"
if not rs.eof then
	Do until rs.eof
	response.write "<TR>"
	response.write "<TD height=20 align=right><div align=""center"" class=""style5"">"&RS("Uid")&"</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">" 
		if RS("Spec1")&""="" then
		response.write "无专业" 
		else
		response.write RS("Spec1")
		end if
		response.write "</div></TD>"
    response.write "<TD><div align=""center"" class=""style5"">"
	if RS("Doneyear")&""="" then
	response.write "无经验"
	else
	response.write RS("Doneyear")
	end if
	response.write "</div></TD>"
	response.write "<TD><div align=""center"" class=""style5"">"&RS("birthday")&"</div></TD>"
    response.write "<TD><div align=""center"" class=""style5"">"
	select case RS("Province")
	case "1"
	fuji="北京"
	case "2"
	fuji="天津"
	case "3"
	fuji="上海"
	case "4"
	fuji="重庆"
	case "5"
	fuji="浙江"
	case "6"
	fuji="广东"
	case "7"
	fuji="江苏"
	case "8"
	fuji="福建"
	case "9"
	fuji="湖南"
	case "10"
	fuji="湖北"
	case "11"
	fuji="山东"
	case "12"
	fuji="辽宁"
	case "13"
	fuji="吉林"
	case "14"
	fuji="云南"
	case "15"
	fuji="四川"
	case "16"
	fuji="安徽"
	case "17"
	fuji="江西"
	case "18"
	fuji="黑龙江"
	case "19"
	fuji="河北"
	case "20"
	fuji="陕西"
	case "21"
	fuji="海南"
	case "22"
	fuji="河南"
	case "23"
	fuji="山西"
	case "24"
	fuji="内蒙古"
	case "25"
	fuji="广西"
	case "26"
	fuji="贵州"
	case "27"
	fuji="宁夏"
	case "28"
	fuji="青海"
	case "29"
	fuji="新疆"
	case "30"
	fuji="西藏"
	case "31"
	fuji="甘肃"
	case "32"
	fuji="台湾"
	case "33"
	fuji="香港"
	case "34"
	fuji="澳门"
	case "35"
	fuji="国外"
	case "36"
	fuji="其他"
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
      <a href="Member_search_ok.asp?currentpage=<%=currentpage-1%><%=Sparameter%>"><font size="2">[上一页]</font></a>     
      <%end if%>            
      <%if currentpage<pages then%>            
      <a href="Member_search_ok.asp?currentpage=<%=currentpage+1%><%=Sparameter%>">[下一页]</a>            
      <%end if%>            
      <%if currentpage>1 then%>            
      <a href="Member_search_ok.asp?currentpage=1<%=Sparameter%>">[最首页]</a>            
      <%end if%>            
      <%if currentpage<pages then%>            
      <a href="Member_search_ok.asp?currentpage=<%=pages%><%=Sparameter%>">[最末页]</a>            
      <%end if%> </font>当前第<%=currentpage%>页/共<%=pages%>页 共
      <%=records%>条记录</td>   
</tr>   
</table><%
response.write "</span></TD>"
response.write "</TR>"
closeconn
response.write "</TABLE>"
%>