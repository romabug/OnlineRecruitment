<!--#include file="Class_Safe.asp" -->

<%
Response.Buffer = True
'On Error Resume Next
Dim Conn,Connstr
Dim Sqldatabase,Sql_pass_word,Sql_User_ID,Sql_Data_Source

Sqldatabase="aromabug"            
Sql_pass_word="5ixinjiapo"   
Sql_User_ID="aromabug"      
Sql_Data_Source="(local)" 	
Set Conn = Server.CreateObject("ADODB.Connection")
ConnStr = "Provider=SQLOLEDB.1;Password='"&Sql_pass_word&"';Persist Security Info=False;User ID='"&Sql_User_ID&"';Initial Catalog='"&Sqldatabase&"';Data Source='"&Sql_Data_Source&"'"	
Conn.Open Connstr

Function CloseDB
 Conn.close
 Set conn = Nothing
End Function

Function CloseRs
 Rs.Close
 Set Rs = Nothing
End Function

If Err Then
	err.Clear
	Set Conn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If

%>
