<!--#include file="../Include/Class_Conn.asp"-->
<!--#include file="../Include/Class_Main.asp" -->

<html><head><title>批量生成asp"-->HTML</title>
<link href="CSS.CSS" rel="stylesheet" type="text/css"></head>
<body>

<%
Server.ScriptTimeOut=9999999

strsql="select   * from pH_New_Info"
set rs=conn.execute(strsql)
do while not rs.eof


m_path=server.mappath("../Include/Class_Template.html")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
if not(fso.FileExists(m_path))  then%>
<script language=javascript> 
alert( "---<%= fso.FileExists(m_path) %>---"  );
alert( "---<%= m_path %>---");
alert( "生成失败,模板文件不存在！"  );
location.href = "javascript:history.back()"   
</script>
<%
else
set fso_line = fso.opentextfile(m_path,1,True) 
mynews=fso_line.readall
end if
set fso=nothing
fname = rs("FileName")
title=rs("title")


typeid=rs("typeid")
Content=rs("Content")
Author=rs("Author")
dateandtime=rs("DateAndTime")
typename1=rs("TypeName")
mynews=replace(mynews,"HT_type",typename1)
mynews=replace(mynews,"HT_date",dateandtime)
mynews=replace(mynews,"HT_form",from)
mynews=replace(mynews,"HT_Author",Author)
mynews=replace(mynews,"HT_name",zznews)
mynews=replace(mynews,"HT_title",title)
mynews=replace(mynews,"HT_content",content)
mynews=replace(mynews,"HT_WebName",Cls_WebName)
mynews=replace(mynews,"HT_WebUrl",Cls_WebUrl)
mynews=replace(mynews,"HT_Icp",Cls_Icp)
mynews=replace(mynews,"HT_Domain",Cls_Domain)
mynews=replace(mynews,"HT_Author",Author)
mynews=replace(mynews,"HT_Source",NewFrom)
mynews=replace(mynews,"HT_Phone",Cls_Phone)
mynews=replace(mynews,"HT_Fax",Cls_Fax)

mynews=replace(mynews,"HT_date",mydate)
mynews=replace(mynews,"HT_title",title)
mynews=replace(mynews,"HT_content",content)

filePath=server.mappath("../news")

Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set fout = fso.CreateTextFile (filePath& "\" & fname)
fout.WriteLine mynews
fout.close

%>
<table width="100%" border="0" align="center" cellspacing="1" bgcolor="EEEEEE">

    <tr bgcolor="#FFFFFF">
      <td width="188">更新完成<%=I%></td>
      <td width="294"><%=FileName%></td>
      <td width="483"><a href='../news/<%=FileName%>' target="_blank">单击查看</a></td>
    </tr>
</table>
<%
 rs.movenext
    loop
%>

</body>
</html>
