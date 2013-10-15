<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<%
Dim Rs,SQL
dim Title,Content,Newfrom,Typeid,Typename,Author,HotNew,BestNew,Flag
'//检测是否跨站访问
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"180") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Title       = Replace_Text(Request.Form("Title")) 
Content     = Request.Form("n_Content")
Newfrom     = Replace_Text(Request.Form("Newfrom")) 
Typeid      = Replace_Text(Request.Form("Typeid")) 
Author      = Replace_Text(Request.Form("Author")) 
HotNew      = Replace_Text(Request.Form("HotNew")) 
BestNew     = Replace_Text(Request.Form("BestNew")) 
Flag        = Replace_Text(Request.Form("Flag"))
Cityid		= Replace_Text(Request.Form("Cityid"))
t_Color		= Request.Form("t_Color")
'Response.write t_Color
'Response.End()
If HotNew   = "" Then HotNew = 0
If BestNew  = "" Then BestNew = 0
If Flag     = "" Then Flag= 0
Set Rs = Conn.Execute("Select Type From [pH_New_Type] Where Typeid="&Cstr(Typeid))
Typename = Rs("type")
Rs.Close

'//检测参数是否为空值
If Request("title")="" Then 
    response.write "错误提示:请输入文章标题!"
    response.end
End if
If Request("n_content")="" Then 
    response.write "错误提示:请未输入文章内容!"
    response.end
End if

'--------------------------------------------------------

m_path = Server.mappath("../Include/Class_Template.html")
Set fso = Server.CreateObject("Scripting.FileSystemObject")

If Not(fso.FileExists(m_path))  Then%>
 <script language=javascript>  
 alert( "生成失败,模板文件不存在！"  );
 location.href = "javascript:history.back()"   
 </script>
<%
Else
 Set fso_line = fso.opentextfile(m_path,1,True) 
 mynews = fso_line.readall
End if
Set Fso = Nothing
'//生成文件名
Fname = TypeId&Makefilename(now())
mydate = year(now()) & "年" & month(now()) & "月" & day(now()) & "日" 
'//替换内容
mynews=replace(mynews,"HT_WebName",Cls_WebName)
mynews=replace(mynews,"HT_WebUrl",Cls_WebUrl)
mynews=replace(mynews,"HT_Icp",Cls_Icp)
mynews=replace(mynews,"HT_Domain",Cls_Domain)
mynews=replace(mynews,"HT_Author",Author)
mynews=replace(mynews,"HT_Source",NewFrom)
mynews=replace(mynews,"HT_Phone",Cls_Phone)
mynews=replace(mynews,"HT_Fax",Cls_Fax)
mynews=replace(mynews,"HT_type",typename)
mynews=replace(mynews,"HT_date",mydate)
mynews=replace(mynews,"HT_title",title)
mynews=replace(mynews,"HT_content",content)
FilePath = Server.mappath("../News")
'----------------------------------------------------------
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set fout = fso.CreateTextFile (filePath& "\" & fname)
fout.WriteLine mynews
fout.close
Set Fso = Nothing

'//插入记录
SQL = "Insert Into [pH_New_Info] (Title,FileName,Path,Content,Typeid,TypeName,Flag,BestNew,HotNew,Author,NewFrom,Hits,DateAndTime,Cityid,t_Color) Values ('"&Title&"','"&Fname&"','News','"&Content&"',"&Typeid&",'"&TypeName&"',"&Flag&","&BestNew&","&HotNew&",'"&Author&"','"&NewFrom&"',0,getdate(),"&Cityid&",'"&t_Color&"')"
Conn.Execute(SQL)
'//更新类别的新闻数目
Conn.Execute("Update [pH_New_Type] Set News=News+1 Where Typeid="&Cstr(Typeid))

Set Rs = Nothing
Call CloseDB()

%>
<html>
<head>
<title>保存新闻</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<BODY bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#FFFFFF">
<div align="center">

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
      <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
          <tr> 
            <td bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="1" cellpadding="0">
                
                  <tr bgcolor="f5f5f5"> 
                    
                  <td height="25" align="left"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="25">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="25">添加新闻成功...</td>
                      </tr>
                      <tr>
                        <td height="25">文件名：<%= Fname %></td>
                      </tr>
                      <tr>
                        <td height="25">文件标题：<%= Title %>
                        </td>
                      </tr>
                      <tr>
                        <td height="25" align="center">>> <a href="Web_New_Manage.asp">新闻管理</a> 
                          | >> <a href="Web_New_Add.asp">继续添加</a></td>
                      </tr>
                    </table></td>
                  </tr>
              
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td height="5"></td>
    </tr>
  </table>
</div>
</body>
</html>

