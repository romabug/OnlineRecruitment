<!--#include file="Class_Conn.asp" -->


<HTML>
<HEAD>
<meta   content="text/html;   charset=gb2312"   http-equiv="Content-Type">
<TITLE>����EXCEL�ļ�</TITLE>
</HEAD>
<body>
<a   href="?act=make">���������˿ڵ�EXCEL</a>
<hr   size=1   align=left   width=300px>
<%
if   Request("act")   =   ""   then
else


'conn.Open   Application("connstr")

dim   rs,sql,filename,fs,myfile,x,link

Set   fs   =   server.CreateObject("scripting.filesystemobject")
'--�������������ɵ�EXCEL�ļ������µĴ��
filename   =   Server.MapPath("online.xls")
'--���ԭ����EXCEL�ļ����ڵĻ�ɾ����
if   fs.FileExists(filename)   then
fs.DeleteFile(filename)
end   if
'--����EXCEL�ļ�
set   myfile   =   fs.CreateTextFile(filename,true)

Set   rs   =   Server.CreateObject("ADODB.Recordset")
'--�����ݿ��а�����ŵ�EXCEL�е����ݲ����
sql   =   "select   Username,Companyname   from   [pH_Company_Base]"
rs.Open   sql,conn
if   rs.EOF   and   rs.BOF   then

else

dim   strLine,responsestr
strLine=""
For   each   x   in   rs.fields
strLine=   strLine   &   x.name   &   chr(9)
Next

'--�����������д��EXCEL
myfile.writeline   strLine

Do   while   Not   rs.EOF
strLine=""

for   each   x   in   rs.Fields
strLine=   strLine   &   x.value   &   chr(9)
next
'--���������д��EXCEL
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

<a href="http://www.qlrl.com/web/job/include/online.xls">���ļ�</a>
<%
end   if
%>
</BODY>
</HTML>
