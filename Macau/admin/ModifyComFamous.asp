<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include FILE="../inc/upload_5xsoft.inc"--> 
<%
ChkNo=request("ChkNo")
page=request("page")
if request.QueryString("action")="modify" then
  cid=request.QueryString("cid")
  page=request.QueryString("page")
  if len(cid)<>15 then
    Call ShowError("参数错误！")
  end if
'========添加图片开始====================
function getex(filename)
getex = right(filename,(len(filename)-InStr(filename,".")))
End Function
dim upload,file,formName,formPath,fname,getfilename
set upload=new upload_5xsoft
formPath=upload.form("filepath")
if right(formPath,1)<>"/" then formPath=formPath&"/" 
fname = now()
fname = replace(fname,"-","")
fname = replace(fname," ","") 
fname = replace(fname,":","")
fname = replace(fname,"PM","")
fname = replace(fname,"AM","")
fname = replace(fname,"上午","")
fname = replace(fname,"下午","")
fname = fname&Int((right(fname,4) - 0 + 1) * Rnd + 0)
for each formName in upload.file
set file=upload.file(formName)
if file.FileSize>102400 then
Call ShowError("图片大小超过100K")
end if
if file.FileSize<=0 then
Call ShowError("无效文件")
end if
if file.FileSize>0 and file.FileSize<=102400 then
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename))
session("FamousLogo")=fname&"."&getex(file.filename)
end if
set file=nothing
next
Call RsName(rs,"select cid,famous,famouslogo,famoustime from [01387company] where cid='"&cid&"'",3,3)
if session("FamousLogo")<>"" then
set fso=server.CreateObject("Scripting.FileSystemObject")
If fso.fileexists(server.MapPath("../FamousLogo/"&rs(2)&"")) then
fso.deletefile(server.mappath("../FamousLogo/"&rs(2)&""))
end if
rs("FamousLogo")=session("FamousLogo")
end if
rs("famous")=upload.form("famous")
rs("famoustime")=upload.form("famoustime")
rs.update
rs.close
set rs=nothing
set upload=nothing
session("FamousLogo")=""
Call ShowErrorTo("操作成功！","CompanyList.asp?page="&page&"")
end if
'========添加图片结束====================
'========取消名企推荐====================
if request.querystring("action")="del" then
  cid=request.querystring("cid")
  conn.execute("update [01387company] set famous=0,famoustime=0 where cid='"&cid&"'")
  call showerrorto("操作成功！","CompanyList.asp?page="&request.querystring("page")&"")
end if
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs,"Select famous,famouslogo,famoustime,companyname from [01387company] where cid='"&ChkNo&"'",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<script language=javascript src="ModifyComFamous.js"></script>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ModifyComFamous.asp?action=modify&cid=<%=chkNo%>&page=<%=page%>" enctype="multipart/form-data" onSubmit="checkFileUpload(this,'GIF,JPG,JPEG');return document.MM_returnValue">
    <tr> 
      <td height="25" colspan="4" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">修 
          改 名 企 推 荐</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">公司</div></td>
      <td width="30%" bgcolor="#CEDBF2"><div align="center">企业Logo</div></td>
      <td bgcolor="#CEDBF2"><div align="center">是否名企</div></td>
      <td><div align="center">服务到期时间</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#f1f3f5"><div align="center"><%=rs(3)%></div></td>
      <td width="30%" bgcolor="#f1f3f5"><div align="center"><img src="../FamousLogo/<%=rs(1)%>"></div></td>
      <td width="20%" bgcolor="#f1f3f5"><div align="center"> 
          <input type="radio" name="famous" value="1" <%if rs(0)=true then response.Write("checked")%>>
          <font color="#FF0000"> 是 
          <input name="famous" type="radio" value="0" <%if rs(0)=false then response.Write("checked")%>>
          <font color="#006600">否</font></font> </div></td>
      <td width="24%"><div align="center"> 
          <select name="famoustime" class="input" id="famoustime">
            <option value=0 <%if rs(2)=0 then response.write("selected")%>>无</option>
            <option value=1 <%if rs(2)=1 then response.write("selected")%>>一个月</option>
            <option value=2 <%if rs(2)=2 then response.write("selected")%>>三个月</option>
            <option value=3 <%if rs(2)=3 then response.write("selected")%>>半年</option>
            <option value=4 <%if rs(2)=4 then response.write("selected")%>>一年</option>
          </select>
        </div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="4"><iframe src="ModifyComFamousUpload.asp" width="450" height="28" frameborder="0" scrolling="no"></iframe></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="4"> <div align="center"> 
          <input name="filepath" type="hidden" value="../FamousLogo">
		  <input type="submit" name="btnPower" value="确定修改" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="返 回" onClick="location.href='CompanyList.asp?page=<%=page%>'" style="font-size=12;height=26">
          <input type="button" name="btnPower22" value="取消该名企业推荐" onClick="location.href='ModifyComFamous.asp?cid=<%=ChkNo%>&action=del&page=<%=page%>'" style="font-size=12;height=26">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<form name=preview action=../person/previewpic.asp method=post target=preview_page>
<input type=hidden name=file1 value=>
</form>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>