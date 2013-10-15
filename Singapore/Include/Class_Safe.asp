<% 
'//-----------------------------------------地址栏参数合法性检测-----------------------------------------
SQL_injdata = "'|;|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
SQL_inj = split(SQL_Injdata,"|")
If Request.QueryString<>"" Then
For Each SQL_Get In Request.QueryString
  For SQL_Data=0 To Ubound(SQL_inj)
    if instr(Request.QueryString(SQL_Get),Sql_Inj(Sql_DATA))>0 Then
     Response.Write "对不起！您提交的参数可能存在错误 ;请重新提交..."
	  response.End()
    end if
  next
Next
End If

strtemp=request.servervariables("server_name")&request.servervariables("url")&"?"&request.QueryString
strtemp=lcase(strtemp)
if instr(strtemp,"select%20") or instr(strtemp,"insert%20") or instr(strtemp,"delete%20from") or instr(strtemp,"count(") or instr(strtemp,"drop%20table") or instr(strtemp,"update%20") or instr(strtemp,"truncate%20") or instr(strtemp,"asc(") or instr(strtemp,"mid(") or instr(strtemp,"char(") or instr(strtemp,"xp_cmdshell") or instr(strtemp,"exec%20master") or instr(strtemp,"net%20user") or instr(strtemp,"'") or instr(strtemp,"%20") or instr(strtemp,"""") or instr(strtemp,"“") or instr(strtemp,"”") or instr(strtemp,":") or instr(strtemp,": ") or instr(strtemp,";") or instr(strtemp,"; ") or instr(strtemp,"%27")  then
 response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
 response.End()
end if

'//-----------------------------------------表单提交的数据合法性检测-----------------------------------------
'//替换非法数据的函数
Function Replace_Text(fString)
if isnull(fString) then
Replace_Text=""
exit function
else
fString=trim(fString)
fString=replace(fString,"'","''")
fString=replace(fString,";","；")
fString=replace(fString,"--","—")
'fString=replace(fString,"and","")
'fString=replace(fString,"or","")
fString=replace(fString,"select","")
fString=replace(fString,"insert","")
fString=replace(fString,"exec","")
fString=replace(fString,"delete","")
fString=replace(fString,"update","")
fString=replace(fString,"count","")
fString=replace(fString,"mid","")
fString=replace(fString,"truncate","")
fString=replace(fString,"%","")
fString=replace(fString,"chr","")
fString=replace(fString,"master","")
fString=replace(fString,"char","")
fString=replace(fString,"declare","")
fString=replace(fString,"*","")
fString=replace(fString,"from","")
fString=server.htmlencode(fString)
Replace_Text=fString
end if	
End function

'//检测非法数据的函数
Function SafeRequest(ParaName) 
Dim ParaValue 
ParaValue=Request(ParaName)
if IsNumeric(ParaValue)  then
SafeRequest=ParaValue
exit Function

else
ParaValuetemp=lcase(ParaValue)
tempvalue="select |insert |delete from|'|count(|drop table|update |truncate  |asc(|mid(|char(|xp_cmdshell|exec master|net localgroup administrators|net user| and|%20from|exec|select|delete|count|*|%|chr|mid|master|truncate|char|declare"
temps=split(tempvalue,"|")
for mycount=0 to ubound(temps)
if  Instr(ParaValuetemp,trim(temps(mycount))) > 0 then
		response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
		response.end
end if
next
SafeRequest=ParaValue
end if
End function

'//检测非法数据的函数
Function SafeRequestform(ParaName) 
Dim ParaValue 
ParaValue=request.form(ParaName)
if IsNumeric(ParaValue)  then
SafeRequestform=ParaValue
exit Function
else
ParaValuetemp=lcase(ParaValue)
tempvalue="select |insert |delete from|'|count(|drop table|update |truncate  |asc(|mid(|char(|xp_cmdshell|exec master|net localgroup administrators|net user|  and|%20from|exec|select|delete|count|*|%|chr|mid|master|truncate|char|declare"
temps=split(tempvalue,"|")
for mycount=0 to ubound(temps)
if  Instr(ParaValuetemp,trim(temps(mycount))) > 0 then
		response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
		response.end
end if
next
SafeRequestform=ParaValue
end if
End function

'//-----------------------------------------是否是本站提交的数据检测-----------------------------------------
Sub Check_url()
If Instr(Lcase(request.serverVariables("HTTP_REFERER")),Lcase(request.ServerVariables("SERVER_NAME")))=0 then
 Response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
 Response.End()
End if 
End Sub

'//-----------------------------------------ID合法性检测-----------------------------------------
Sub Check_ID(ID)
 If Len(ID)>0 then
  If Len(ID)>8 Then
   Response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
   Response.End()
  End If
  If IsNumeric(ID)=False Then
   Response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
   Response.End()
  End If  
 Else
   Response.write "对不起！您提交的参数可能存在错误 ;请重新提交..."
   Response.End()  
 END If
End Sub

'//-----------------------------------------字符转换-----------------------------------------
Function HTMLEncode(fString)
If not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
    fString = Replace(fString, CHR(10), "<BR> ")

    'fString=ChkBadWords(fString)
    HTMLEncode = fString
End if
End function

 %>