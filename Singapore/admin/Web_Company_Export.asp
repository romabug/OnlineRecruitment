<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<!--#include file="Web_Session.asp" -->
<%

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Set   fs   =   server.CreateObject("scripting.filesystemobject")

filename   =   Server.MapPath("../UpLoadFiles/ExcelFile/Company.xls")
'--如果原来的EXCEL文件存在的话删除它
if   fs.FileExists(filename)   then
fs.DeleteFile(filename)
end   if
'--创建EXCEL文件
set   myfile   =   fs.CreateTextFile(filename,true)

Set   rs   =   Server.CreateObject("ADODB.Recordset")
'--从数据库中把你想放到EXCEL中的数据查出来
sql   =   "select   Comid,Username,Companyname,Licence,Contactperson,Phone,Companyfax,Email,WebHome,Zipcode,Address,RegDate From   [pH_Company_Base]"
rs.Open   sql,conn

if   rs.EOF   and   rs.BOF   then
else

dim   strLine,responsestr
strLine=""
'For   each   x   in   rs.fields
'strLine=   strLine   &   x.name   &   chr(9)
'Next
strLine = strLine&"企业编号"&chr(9)&"会员名"&chr(9)&"企业名称"&chr(9)&"营业执照"&chr(9)&"联系人姓名"&chr(9)&"联系电话"&chr(9)&"传真号码"&chr(9)&"邮件地址"&chr(9)&"企业网站"&chr(9)&"邮政编码"&chr(9)&"通讯地址"&chr(9)&"注册时间"&chr(9)

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
企业资料已经成功的导出，现在<a href="http://www.qlrl.com/web/job/UpLoadFiles/ExcelFile/Company.xls">打开文件</a> 

