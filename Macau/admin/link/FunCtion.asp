<%
'----------------------------------------------------------------------
'	函数功能：　防止ＳＱＬ注入
'	参　　数：　StrValue 用户提交的数据
'				BloType  数据类型
'   参 数 值:   true 数值型数据
'               false 字符型数据
'----------------------------------------------------------------------
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
		 funpage=funpage & "<a class=he href='?page=1" & StrValue & "' title='最前页' ><font face='Webdings'>9</font></a>&nbsp;"
		 funpage=funpage&"<a class=he href='?page="&Intmypage-1 & StrValue & "' title='上一页' ><font face='Webdings'>7</font></a>"
	 else
		 funpage=funpage &"<font face='Webdings'>9</font>"
	 	 funpage=funpage&"<font face='Webdings'>7</font>"
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
				 funpage=funpage & strMode &" <a class=he href='?page=" & Intfor & StrValue & "' >" & Intfor & "</a>"
			 end if
		 end if
		 strMode=" <font color='#BBBBBB'>|</font> "
	  next
	  if intmypage<intpagecount then
	  	funpage=funpage&" <a class=he href='?page="& Intmypage+1 & StrValue & "' title='后一页'><font face='Webdings'>8</font></a>&nbsp;"
	    funpage=funpage &"<a class=he href='?page="& Intpagecount & StrValue & "' title='最后页' ><font face='Webdings'>:</font></a>"
	  else
	  	funpage=funpage&" <font face='Webdings'>8</font>"	
	    funpage=funpage &"<font face='Webdings'>:</font></a>"
	  end if
	  funpage="<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"&_ 
				vbcrlf&"<td width='50%'>当前第"&Intmypage&"页 　"&Intpagesize&"条/页 　共"&Intpagecount&"页/"&Intrecordcount&"条记录</td>"&_
				vbcrlf&"<td width='50%' align='right'>"&_
				vbcrlf&"<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"&_
					  vbcrlf&"<td align='right'><font face=""Arial, Helvetica, sans-serif"">"&funpage&"</font></td>"&_
				  vbcrlf&"</tr></table></td></tr>"&_
			  vbcrlf&"</table>"
	  if err.number<>0 then
	 	err.clear	
		response.redirect("Error.asp?err=分页函数出错，请与管理员联系！|")
	  end if
end function
'--------------------------------------------------------------------------
'	函数功能：　常用类型转换
'	参    数:   _Type　数据类型
'				_Value  数据
'	参 数 值:   _Type  1 :  转换成数值型数据
'               _Type  2 :  转换成字符型数据
'               _Type  3 :  转换成布尔型数据				
'--------------------------------------------------------------------------
function FunSwitch(Value_,Type_)
on error resume next
	select case Type_
		case 1
		if isnumeric(Value_) then
			if not isnull(Value_) then
				FunSwitch=clng(Value_)
			else
				FunSwitch=0
			end if
		else
			FunSwitch=0
		end if
		case 2
			if not isnull(Value_) then
				FunSwitch=cstr(Value_)
			else
				FunSwitch=""
			end if
		case 3
			if not isnull(Value_) and isnumeric(Value_) then
				FunSwitch=cbool(Value_)
			else
				FunSwitch=false
			end if
		case else
			response.redirect("Error.asp?err=请指定 FunSwitch 中要转达换成的数据类型！")
	end select
if err.number<>0 then
	response.redirect("Error.asp?err=数据转换时产生未知错误！")
	err.clear
end if
end function
'----------------------------------------------------------------------
'	函数功能：　判断服务器支持的组件
'	参    数：  strobj,alt
'   参 数 值：  strobj:一个对像的名称
'				alt: 是否输出×或√的提示							
'----------------------------------------------------------------------
function FunisoBject(strobj,alt)
on error resume next
	if alt then
		FunisoBject="<font color='red'><b>×</b></font>"
	else
		FunisoBject=false
	end if
	dim obj
	set obj=server.createobject(strobj) 
	if err=0 then
		if alt then
			FunisoBject="<b>√</b>"
		else
			FunisoBject=true
		end if
		set obj=nothing
	end if
	err=0
end function
'----------------------------------------------------------------------
'	函数功能：　以当前日期转成文件名
'	参    数：  无
'----------------------------------------------------------------------
function FunFileName()
	FunFileName=now()
	FunFileName=replace(FunFileName,"-","")
	FunFileName=replace(FunFileName,":","")
	FunFileName=replace(FunFileName," ","")
	FunFileName=replace(FunFileName,"/","")
	FunFileName=replace(FunFileName,"上午","")
	FunFileName=replace(FunFileName,"下午","")
end function
''----------------------------------------------------------------------
'	函数功能：　验证是数据是否来自外部
'	参    数：  无
'----------------------------------------------------------------------
function checkfrom()
	server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
	server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
	if mid(server_v1,8,len(server_v2))<>server_v2 then
		checkfrom=true
	else
		checkfrom=false
	end if
end function
''----------------------------------------------------------------------
'	函数功能：　JS提示框
'	参    数：  StrURL   :  点击确定后返回到的页面地址
'				StrMSG   :  对话框的提示信息

'----------------------------------------------------------------------
Function FunMsg(StrURL,StrMSG)
	Response.write "<script language='javascript'>"&_
		Vbcrlf&"alert("""&StrMSG&""");"&_
		Vbcrlf&"window.location="""&StrURL&""";"&_
		Vbcrlf&"</script>"
End Function

%>