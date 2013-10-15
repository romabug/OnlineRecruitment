<!--#include file="Class_Conn.asp" -->


<HTML>
<HEAD>
<meta   content="text/html;   charset=gb2312"   http-equiv="Content-Type">
<TITLE>生成EXCEL文件</TITLE>
</HEAD>
<body>
<a   href="?act=make">生成在线人口的EXCEL</a>
<hr   size=1   align=left   width=300px>
<%
if   Request("act")   =   ""   then
else


'conn.Open   Application("connstr")

dim   rs,sql,filename,fs,myfile,x,link

Set   fs   =   server.CreateObject("scripting.filesystemobject")
'--假设你想让生成的EXCEL文件做如下的存放
filename   =   Server.MapPath("online.xls")
'--如果原来的EXCEL文件存在的话删除它
if   fs.FileExists(filename)   then
fs.DeleteFile(filename)
end   if
'--创建EXCEL文件
set   myfile   =   fs.CreateTextFile(filename,true)

Set   rs   =   Server.CreateObject("ADODB.Recordset")
'--从数据库中把你想放到EXCEL中的数据查出来
sql   =   "select   Username,Companyname   from   [pH_Company_Base]"
rs.Open   sql,conn
if   rs.EOF   and   rs.BOF   then

else

dim   strLine,responsestr
strLine=""
For   each   x   in   rs.fields
strLine=   strLine   &   x.name   &   chr(9)
Next

'--将表的列名先写入EXCEL
myfile.writeline   strLine

Do   while   Not   rs.EOF
strLine=""

for   each   x   in   rs.Fields
strLine=   strLine   &   x.value   &   chr(9)
next
'--将表的数据写入EXCEL
myfile.writeline   strLine

rs.MoveNext
loop

end   if

rs.Close
set   rs   =   nothing
conn.close
set   conn   =   nothing
set   myfile   =   nothing
Set   fs=Nothing
%>

<a href="http://www.qlrl.com/web/job/include/online.xls">打开文件</a>
<%
end   if
%>
</BODY>
</HTML>
