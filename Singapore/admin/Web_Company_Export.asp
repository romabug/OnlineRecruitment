<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<!--#include file="Web_Session.asp" -->
<%

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Set   fs   =   server.CreateObject("scripting.filesystemobject")

filename   =   Server.MapPath("../UpLoadFiles/ExcelFile/Company.xls")
'--���ԭ����EXCEL�ļ����ڵĻ�ɾ����
if   fs.FileExists(filename)   then
fs.DeleteFile(filename)
end   if
'--����EXCEL�ļ�
set   myfile   =   fs.CreateTextFile(filename,true)

Set   rs   =   Server.CreateObject("ADODB.Recordset")
'--�����ݿ��а�����ŵ�EXCEL�е����ݲ����
sql   =   "select   Comid,Username,Companyname,Licence,Contactperson,Phone,Companyfax,Email,WebHome,Zipcode,Address,RegDate From   [pH_Company_Base]"
rs.Open   sql,conn

if   rs.EOF   and   rs.BOF   then
else

dim   strLine,responsestr
strLine=""
'For   each   x   in   rs.fields
'strLine=   strLine   &   x.name   &   chr(9)
'Next
strLine = strLine&"��ҵ���"&chr(9)&"��Ա��"&chr(9)&"��ҵ����"&chr(9)&"Ӫҵִ��"&chr(9)&"��ϵ������"&chr(9)&"��ϵ�绰"&chr(9)&"�������"&chr(9)&"�ʼ���ַ"&chr(9)&"��ҵ��վ"&chr(9)&"��������"&chr(9)&"ͨѶ��ַ"&chr(9)&"ע��ʱ��"&chr(9)

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
��ҵ�����Ѿ��ɹ��ĵ���������<a href="http://www.qlrl.com/web/job/UpLoadFiles/ExcelFile/Company.xls">���ļ�</a> 

