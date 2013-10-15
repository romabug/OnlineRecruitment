<%
   dim conn1  
   dim connstr
   on error resume next
   connstr1="DBQ="+server.mappath("591.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
   set conn1=server.createobject("ADODB.CONNECTION")
   conn1.open connstr1
%>