<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL,PageNo,ThePage,Psize,PCount,RCount
Dim Newid,Title,TypeName,Flag,BestNew,HotNew,DateAndTime,FileName,Path
Dim Action,Param
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"181") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
Select Case Action
 Case "flag"
  Call Flag_Submit() '//评比或者通过审核函数
 Case "del"
  Call Del_Submit() '//删除记录的函数
End Select

Set Rs = Server.Createobject("ADODB.recordset")
SQL = "Select * From [pH_New_Info] where Title<>'' Order By Newid Desc"
Rs.Open SQL,Conn,1,1

Rs.Pagesize = 15
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
Thepage = (PageNo-1)*Psize
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>网站内容管理</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>新闻管理</strong></font></td>
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
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="2">
              <tr align="center" bgcolor="f5f5f5"> 
                <td width="5%" height="25"><u>编 号</u></td>
                <td width="45%" height="25" bgcolor="f5f5f5"><u>新闻标题</u></td>
                <td width="10%" height="25"><u>新闻类别</u></td>
                <td width="5%" height="25"><u>审 核</u></td>
                <td width="5%" height="25"><u>热 门</u></td>
                <td width="5%" height="25"><u>推 荐</u></td>
                <td width="10%" height="25"><u>发布时间</u></td>
                <td height="25"><u>管理操作</u></td>
              </tr>
              <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Newid       = Rs("Newid")
 Title       = Rs("Title")
 TypeId      = Rs("TypeId")
 FileName    = Rs("FileName")
 TypeName    = Rs("TypeName")
 Flag        = Rs("Flag")
 BestNew     = Rs("BestNew")
 HotNew      = Rs("HotNew")
 DateAndTime = FormatdateTime(Rs("DateAndTime"),2)
 FileName    = Rs("FileName")
 Path        = Rs("Path")
 t_Color	 = Rs("t_Color")

 Flag_Str = ""
 BestNew_Str = ""
 HotNew_Str = ""
 If Flag    = True Then 
  Flag_Str  = "<font color=#009900>√</font>"
 Else
  Flag_Str  = "<font color=#ff0000>×</font>"
 End if  
 If BestNew = True Then BestNew_Str = "<font color=#009900>√</font>" 
 If HotNew  = True Then HotNew_Str  = "<font color=#009900>√</font>"
 %>
              <tr align="center" bgcolor="f5f5f5"> 
                <td height="25"><%= ThePage+i %></td>
                <td height="25" align="left"><a href="../<%= Path %>/<%= FileName %>" target="_blank"><font color="<%= t_Color %>"><%= Left(Title,21) %></font></a></td>
                <td height="25"><%= TypeName  %></td>
                <td height="25"><%= Flag_Str %></td>
                <td height="25"><%= HotNew_Str %></td>
                <td height="25"><%= BestNew_Str %></td>
                <td height="25"><%= DateAndTime %></td>
                <td height="25"> <a href="?action=del&newid=<%= Newid %>&pageno=<%= PageNo %>&typeid=<%= TypeId %>&filename=<%= FileName %>" onClick="return confirm('是否删除该记录');"><u>删除</u> 
                  </a> <a href="Web_New_Edit.asp?newid=<%= Newid %>&pageno=<%= PageNo %>"><u>编辑</u></a> 
                  <% 
				If Flag = True Then
				 Response.write "<a href=""?action=flag&param=0&pageno="&PageNo&"&newid="&Newid&"""><u>屏蔽</u></a>" 
				Else
				 Response.write "<a href=""?action=flag&param=1&pageno="&PageNo&"&newid="&Newid&"""><u>通过</u></a>"
				End if
				%> </td>
              </tr>
              <% 
 Rs.Movenext 
Next
 %>
            </table> </td>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
          <td width="50%" align="right">
		  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1"">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
          <select name="menu2" onChange="MM_jumpMenu('self',this,0)" style="width:40px;">
               <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
                        
         <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>

		  
		  </td>
        </tr>
      </table>
				</td>
              </tr>
            </table> </td>
        </tr>
      </table></td>
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
Rs.Close
Set Rs = Nothing

Sub Flag_Submit() '//评比或者通过审核
 Param        = Replace_Text(Request.QueryString("Param"))
 Newid        = Replace_Text(Request.QueryString("Newid"))   
 PageNo       = Replace_Text(Request.QueryString("PageNo"))

 Call Check_Url()     '//跨站检测 
 Call Check_Id(Param)
 Call Check_Id(Newid)
 
 SQL = "Update [pH_New_Info] Set Flag="&Param&" Where Newid="&Cstr(Newid)
 Conn.Execute(SQL)
 Call CloseDB
 
 Response.redirect "Web_New_Manage.asp?PageNo="&PageNo
End Sub

Sub Del_Submit() '//删除记录的函数
 Newid        = Replace_Text(Request.QueryString("Newid"))   
 PageNo       = Replace_Text(Request.QueryString("PageNo"))
 TypeId       = Replace_Text(Request.QueryString("TypeId"))
 FileName     = Replace_Text(Request.QueryString("FileName"))
 'Call Check_Url()     '//跨站检测 
 'Call Check_Id(Newid)
 SQL = "Delete From [pH_New_Info] Where Newid="&Newid
 Conn.Execute(SQL)
 '//更新类别的新闻数目
 Conn.Execute("Update [pH_New_Type] Set News=News-1 Where Typeid="&Cstr(Typeid))
 Call CloseDB
 '//删除文件
 Set fso = Server.CreateObject("Scripting.FileSystemObject")
 If fso.fileexists(Server.Mappath("../News/"&FileName)) then
  fso.deletefile(Server.Mappath("../News/"&FileName))
 End if
 Set fso = Nothing
 
 Response.redirect "Web_New_Manage.asp?PageNo="&PageNo
End Sub

Call CloseDB()
%>
 
