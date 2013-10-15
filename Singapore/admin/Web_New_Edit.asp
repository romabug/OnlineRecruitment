<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Newid,PageNo
Dim Rs,SQL
Dim Title,TypeName,Flag,BestNew,HotNew,Content,Typeid,Author,NewFrom
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"181") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "edit" Then Call Edit_Submit() '更新新闻的函数

Newid  = Replace_Text(Request.QueryString("Newid"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Check_Id(Newid)

SQL = "Select * From [pH_New_Info] Where Newid="&Cstr(Newid)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Rs.Close
 Call CloseDB
 Response.write "没有找到该条新闻！"
 Response.End()
End if

Title         = Rs("Title")
TypeName      = Rs("TypeName")
Flag          = Rs("Flag")
BestNew       = Rs("BestNew")
HotNew        = Rs("HotNew")
Content       = Rs("Content")
Typeid        = Rs("Typeid")
Author        = Rs("Author")
NewFrom       = Rs("NewFrom")
FileName      = Rs("FileName")
t_Color		  = Rs("t_Color")
'//更新类别的新闻数目
Conn.Execute("Update [pH_New_Type] Set News=News-1 Where Typeid="&Cstr(Typeid))
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript">
<!--
function CheckForm()
{
	document.form1.content.value=document.form1.doc_html.value;
	return true
}
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加新闻</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加新闻</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <form method="post" action="?action=edit"onsubmit="return CheckForm()" name="form1">
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">新闻标题：</td>
                  <td><input name="title" type="text" id="title" size="50" value="<%= Title %>"> 
                    <select name="t_color" id="t_color">
                      <option value="#333333" <% If t_Color = "#000000" Then Response.write "Selected" %>>黑色标题</option>
                      <option value="#ff0000" <% If t_Color = "#ff0000" Then Response.write "Selected" %>>红色标题</option>
                      <option value="#0000ff" <% If t_Color = "#0000ff" Then Response.write "Selected" %>>蓝色标题</option>
                      <option value="#009900" <% If t_Color = "#009900" Then Response.write "Selected" %>>绿色标题</option>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">新闻内容：</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_content&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="350"></iframe> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">新闻类别：</td>
                  <td><select name="typeid" size="1" id="typeid">
                      <% 
                      Set Rs = Conn.Execute("Select * From [pH_New_Type]")
					  While Not Rs.Eof
%>
                      <option value="<%=rs("typeid")%>" <% If Typeid = Rs("Typeid") Then Response.Write "Selected" %>><%=rs("type")%></option>
                      <%					
					    Rs.Movenext
					  Wend
					  Rs.close
					  Set rs=nothing
					  
%>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">作 者：</td>
                  <td><input name="author" type="text" id="author" size="20" maxlength="50" value="<%= Author %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">来 源：</td>
                  <td><input name="newfrom" type="text" id="newfrom" size="20" maxlength="50" value="<%= NewFrom %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">热门新闻：</td>
                  <td><input name="hotnew" type="checkbox" id="hotnew" value="1" <% If HotNew = True Then Response.write "Checked" %>>
                    设置成热门新闻</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">推荐新闻：</td>
                  <td><input name="bestnew" type="checkbox" id="bestnew" value="1" <% If BestNew = True Then Response.write "Checked" %>>
                    设置成推荐新闻</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">审 核：</td>
                  <td><input name="flag" type="checkbox" id="flag" value="1" <% If Flag = True Then Response.write "Checked" %>>
                    直接通过审核</td>
                </tr>
                <tr align="center" bgcolor="f5f5f5"> 
                  <td height="25" colspan="2"> <input type="submit" name="Submit" value="编辑新闻"> 
                    <input name="n_content" type="hidden" id="n_content" value="<%= Server.htmlencode(Content) %>"> 
                    <input type="hidden" name="newid" value="<%= Newid %>"> 
                    <input type="hidden" name="n_fname" value="<%= FileName %>"> 
                    <input type="hidden" name="pageno" value="<%= PageNo %>">
                    <input name="cityid" type="hidden" id="cityid" value="0"> 
                  </td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '更新新闻的函数
 Check_Url() '跨站检测
 '//获取参数
 Title       = Replace_Text(Request.Form("Title")) 
 Content     = Request.Form("n_Content")
 Newfrom     = Replace_Text(Request.Form("Newfrom")) 
 Typeid      = Replace_Text(Request.Form("Typeid")) 
 Author      = Replace_Text(Request.Form("Author")) 
 HotNew      = Replace_Text(Request.Form("HotNew")) 
 BestNew     = Replace_Text(Request.Form("BestNew")) 
 Flag        = Replace_Text(Request.Form("Flag")) 
 Newid       = Replace_Text(Request.Form("Newid")) 
 PageNo      = Replace_Text(Request.Form("PageNo"))
 Cityid		 = Replace_Text(Request.Form("Cityid")) 
 t_Color	 = Replace_Text(Request.Form("t_Color")) 
 'Check_id(newsid)
 If HotNew   = "" Then HotNew = 0
 If BestNew  = "" Then BestNew = 0
 If Flag     = "" Then Flag= 0
 '//检测是否有空值
 if Title = "" then 
    response.write "错误提示:请输入文章标题!"
    response.end
 End if
 If Content = "" then 
    response.write "错误提示:请未输入文章内容!"
    response.end
 End if
 '//获取原来的文件名
 n_fname2 = Replace_text(Request("n_fname"))

 '//查找模板文件
 m_path=server.mappath("../Include/Class_Template.html")
 Set Fso = Server.CreateObject("Scripting.FileSystemObject")
 If not(fso.FileExists(m_path))  Then%>
  <script language=javascript>  
  alert( "生成失败,模板文件不存在！"  );
  location.href = "javascript:history.back()"   
  </script>
 <%
 Else
  Set fso_line = fso.opentextfile(m_path,1,True) 
  mynews=fso_line.readall '读取模板文件内容
 End if
 Set fso=nothing
 '//设置新文件名
 fname = Typeid&makefilename(now())
'--------------------------------------------------------------
 mydate = year(now()) & "年" & month(now()) & "月" & day(now()) & "日" 
 Set rs=server.createobject("adodb.recordset")
 '//获取新闻类别名称
 Rs.open "select type from [pH_New_Type] where typeid="&typeid,conn,1,1
 If not rs.eof then
  typename2=rs("type")
 Else
  typename2="最新资讯"
 End if
 Rs.close
'//替换内容
 mynews=replace(mynews,"HT_WebName",Cls_WebName)
 mynews=replace(mynews,"HT_WebUrl",Cls_WebUrl)
 mynews=replace(mynews,"HT_Icp",Cls_Icp)
 mynews=replace(mynews,"HT_Domain",Cls_Domain)
 mynews=replace(mynews,"HT_Author",Author)
 mynews=replace(mynews,"HT_Source",NewFrom)
 mynews=replace(mynews,"HT_Phone",Cls_Phone)
 mynews=replace(mynews,"HT_Fax",Cls_Fax)
 mynews=replace(mynews,"HT_type",typename2)
 mynews=replace(mynews,"HT_date",mydate)
 mynews=replace(mynews,"HT_title",title)
 mynews=replace(mynews,"HT_content",content)

 filePath=server.mappath("../News")

 '//写入文件
 Set fso = Server.CreateObject("Scripting.FileSystemObject")
 Set fout = fso.CreateTextFile (filePath& "\" & fname)
 fout.WriteLine mynews
 fout.close
 '//删除原文件
 If fso.fileexists(filePath& "\" & n_fname2) then
  fso.deletefile(filePath& "\" & n_fname2)
 End if
 Set fso = Nothing
 '//更新数据库的数据
 SQL = "Update [pH_New_Info] Set Title='"&Title&"',FileName='"&FName&"',Content='"&Content&"',Typeid="&Typeid&",TypeName='"&Typename2&"',Flag="&Flag&",BestNew="&BestNew&",HotNew="&HotNew&",Author='"&Author&"',NewFrom='"&NewFrom&"',Cityid="&Cityid&",t_Color='"&t_Color&"' Where Newid="&Cstr(Newid)
 Conn.Execute(SQL)

 Set Rs = Nothing
 Call CloseDB
 Response.redirect "Web_New_Manage.asp?PageNo"&PageNo

End Sub

Call CloseDB()
%>

