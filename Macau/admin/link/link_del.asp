<!--#include file="../../conn.asp"-->
<!--#include file="../cookies.asp"-->
<% 

page=Trim(Replace(Request("page"),"'","''"))
lngid=request.QueryString("selAnnounce")
'response.Write id

Dim Location, PathInfo 
For I = 1 To Len(Request.ServerVariables("PATH_TRANSLATED"))
If Mid(Request.ServerVariables("PATH_TRANSLATED"), I, 1) = "\" Then
Location = I
End if
Next
	dim arrtid,intfori,strsql,fso,rs,strfso,lonfso
	arrtid=split(lngid,",")
	set rs=server.CreateObject("adodb.recordset")
	for intfori=0 to ubound(arrtid)
		strsql="select * from [link] where id="&clng(arrtid(intfori))
		rs.open strsql,conn,2,2
PathInfo = Mid(Request.ServerVariables("PATH_TRANSLATED") , 1, Location)
if not rs.eof then
filename = PathInfo & "../../images/linkpic"&rs("images")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Response.Write ("文件路径与名称: <BR>" & filename & "<br>")
If fso.FileExists(filename) then
fso.DeleteFile (filename)
End If
Set fso = Nothing
		rs.delete
		end if
		rs.close
	next
	
response.write("<script language=javascript>" & _
		vbcrlf & "alert(""删除成功！"");" & _
		vbcrlf & "location='link_list.asp?page="&page&"'" & _
		vbcrlf & "</script>")
		response.End 


%>

