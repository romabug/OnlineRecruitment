
<%
Session.Timeout=30

If Session("Web_Suppername") = "" Then
 Response.redirect"Web_Login.asp"
Else
  Dim Web_Name,Web_Pass,Web_Cookies
  Web_Name     = Session("Web_Suppername")
  Web_Pass     = Session("Web_PassWord")
  Web_Cookies  = Request.Cookies("Web_cookies")
  
  If Web_Name = "" or Web_Pass = "" or Web_Cookies = "" Then
   Response.Redirect "Web_Login.asp"
   Response.End()
  End if 

  SQL = "Select su_Setting From [Ph_Web_Supper] Where su_suppername='"&Web_Name&"' And su_password='"&Web_Pass&"' And su_Cookies='"&Web_Cookies&"'"
  Set RsSession = Conn.Execute(SQL)

  If Not RsSession.Eof Then
    Session("Web_Power") = RsSession(0) '管理员权限
    RsSession.Close
    Set RsSession = Nothing
  Else
    RsSession.Close
    Set rsSession = Nothing
    Response.redirect"Web_Login.asp"
  End if
End if 

Function URLStr(FieldName,FieldValue)
	Dim i
	For i=0 to Ubound(FieldName)
		URLStr=URLStr&"&"&CStr(FieldName(i))&"="&CStr(FieldValue(i))
	Next
End Function
Function ChkPost
'判断提交是否来自外部
	Dim Server_V1,Server_V2
	ChkPost=False
	Server_V1=Cstr(Request.ServerVariables("HTTP_REFERER"))
	Server_V2=Cstr(Request.ServerVariables("SERVER_NAME"))
	If Mid(Server_V1,8,Len(Server_V2))<>Server_V2 Then
		ChkPost=False
	Else
		ChkPost=True
	End If
End Function


Function PageList (iPageValue,iRetCount,iCurrentPage,FieldName,FieldValue)
	Dim Url
	Dim PageCount				'页总数
	Dim PageRoot				'页列表头
	Dim PageFoot				'页列表尾
	Dim OutStr
	Dim i						'输出字符串
	Const StepNum=3				'页码步长
	
	Url=URLStr(FieldName,FieldValue)
	
	If (iRetCount Mod iPageValue)=0 Then
		PageCount= iRetCount \ iPageValue
	Else
		PageCount= (iRetCount \ iPageValue)+1
	End If
	
	If iCurrentPage-StepNum<=1 Then 
		PageRoot=1
	Else
		PageRoot=iCurrentPage-StepNum
	End If	
	If iCurrentPage+StepNum>=PageCount Then 
		PageFoot=PageCount
	Else
		PageFoot=iCurrentPage+StepNum
	End If
	
	OutStr="分页："&iCurrentPage&"/"&PageCount&"页 "
	
	If PageRoot=1 Then
		If iCurrentPage=1 Then 
			OutStr=OutStr&"<font color=888888 face=webdings>9</font></a>"
			OutStr=OutStr&"<font color=888888 face=webdings>7</font></a> "
		Else
			OutStr=OutStr&"<a href='?page=1"
			OutStr=OutStr&Url
			OutStr=OutStr&"' title=""首页""><font face=webdings>9</font></a>"
			OutStr=OutStr&"<a href='?page="&iCurrentPage-1
			OutStr=OutStr&Url
			OutStr=OutStr&"' title=""上页""><font face=webdings>7</font></a> "
		End If
	Else
		OutStr=OutStr&"<a href='?page=1"
		OutStr=OutStr&Url
		OutStr=OutStr&"' title=""首页""><font face=webdings>9</font></a>"
		OutStr=OutStr&"<a href='?page="&iCurrentPage-1
		OutStr=OutStr&Url
		OutStr=OutStr&"' title=""上页""><font face=webdings>7</font></a>..."
	End If
	
	For i=PageRoot To PageFoot
		If i=Cint(iCurrentPage) Then
			OutStr=OutStr&"<font color='red'>["+Cstr(i)+"]</font>&nbsp;"
		Else
			OutStr=OutStr&"<a href='?page="&Cstr(i)
			OutStr=OutStr&Url
			OutStr=OutStr&"'>["+Cstr(i)+"]</a>&nbsp;"
		End If
		If i=PageCount Then Exit For
	Next

	If PageFoot=PageCount Then
		If Cint(iCurrentPage)=Cint(PageCount) Then 
			OutStr=OutStr&"<font color=888888 face=webdings>8</font></a>"
			OutStr=OutStr&"<font color=888888 face=webdings>:</font></a>"
		Else
			OutStr=OutStr&"<a href='?page="&iCurrentPage+1
			OutStr=OutStr&Url
			OutStr=OutStr&"' title=""下页""><font face=webdings>8</font></a>"
			OutStr=OutStr&"<a href='?page="&PageCount
			OutStr=OutStr&Url
			OutStr=OutStr&"' title=""尾页""><font face=webdings>:</font></a>"
		End If
	Else
		OutStr=OutStr&"... <a href='?page="&iCurrentPage+1
		OutStr=OutStr&Url
		OutStr=OutStr&"' title=""下页""><font face=webdings>8</font></a>"
		OutStr=OutStr&"<a href='?page="&PageCount
		OutStr=OutStr&Url
		OutStr=OutStr&"' title=""尾页""><font face=webdings>:</font></a>"
	End If
	
	OutStr=OutStr&"&nbsp;&nbsp;<INPUT TYPE=text class=iptA size=3 value="&iCurrentPage&" onmouseover='this.focus();this.select()' NAME=PGNumber> <INPUT TYPE=button id=button1 name=button1 class=btnA value=GO onclick="&""""&"if(document.pageForm.PGNumber.value>0 && document.all.PGNumber.value<="&iRetCount&"){window.location='?Page='+document.all.PGNumber.value+'"&Url&"'}"&""""&" onmouseover='this.focus()' onfocus='this.blur()'>"
	PageList=OutStr
End Function

%>


