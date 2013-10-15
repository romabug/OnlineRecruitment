<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<% 
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("你提交的路径有误，禁止从站点外部提交数据请不要乱该参数！") 
response.end()
end if 
%>
</body>
</html>
