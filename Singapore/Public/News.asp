<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,TypeName,Typeid,N_TypeName
Dim Param
Dim Title,FileName,Path,DateAndTime
Param     = Replace_Text(Request.QueryString("Param"))
Check_Id(Param)
'//获取新闻类别名称
SQL = "Select Type From [pH_New_Type] Where Typeid="&Cstr(Param)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then 
 Rs.Close
 Call CloseDB()
 Response.write "没有指定的新闻类别！"
 Response.End()
End if
N_TypeName = Rs(0)
Rs.Close
'//开始从数据库中获取某类别的新闻
SQL = "Select Title,FileName,Path,DateAndTime,t_Color From [pH_New_Info] Where Typeid="&Param&" And Flag=1 Order By DateAndTime Desc" 
Rs.Open SQL,Conn,1,1

Rs.Pagesize = 20
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
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> --  <%= N_TypeName %></title>
</head>
<script language="JavaScript">
 function search_check(){
 if (document.theForm.key.value=="请输入文章关键字"){
  alert("-请输入文章关键字-");
  document.theForm.key.focus();
  return false;
 }
 }
</script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Header.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="4"></td>
        </tr>
      </table>
	  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="180" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>资讯导航</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% 
				  SQL = "Select Top 10 * From [pH_New_Type]"
				  Set Re = Conn.Execute(SQL)
				  While Not Re.Eof
				   TypeName = Re("Type")
				   Typeid   = Re("Typeid")
				   %>
                    <tr> 
                      <td height="20"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                        <a href="?Param=<%= Typeid %>"><%= TypeName %></a></td>
                    </tr>
                    <tr>
                      <td height="1" bgcolor="#dddddd"></td>
                    </tr>
                    <% 
				    Re.Movenext
				   Wend
				   Re.Close
				  
				    %>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>文章搜索</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <form action="News_Search.asp" method="post" target="_blank" name="theForm" onSubmit="return search_check()">
                      <tr> 
                        <td height="5" align="center"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="center"> <select name="class" style="width:140px;">
                            <option value="0">文章类别不限</option>
                            <% 
				  SQL = "Select * From [pH_New_Type]"
				  Set Re = Conn.Execute(SQL)
				  While Not Re.Eof
				   TypeName = Re("Type")
				   Typeid   = Re("Typeid")
	%>
                            <option value="<%= Typeid %>"><%= TypeName %></option>
                            <% 
				    Re.Movenext
				   Wend
				   Re.Close
				   Set Re = Nothing
	%>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="center"> <input name="key" style="width:140px;" size="16" maxlength=50 value="请输入文章关键字" onClick="this.value='';"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="center"><input type="submit" name="Submit3" value=" 开 始 搜 索 "> 
                        </td>
                      </tr>
                    </form>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>热门信息</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><%= Cls_News_Param("HotNew=1",6,11) %></td>
              </tr>
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Public/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><%= N_TypeName %></strong></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#D53E3E"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <% 
For i = 1 To Psize
 If Rs.Eof Then Exit For 
 Title        = Rs("Title")
 FileName     = Rs("FileName")
 Path         = Rs("Path")
 t_Color	  = Rs("t_Color")
 DateAndTime  = Year(Rs("DateAndTime"))&"."&Month(Rs("DateAndTime"))&"."&Day(Rs("DateAndTime"))
%>
              <tr> 
                <td height="22">&nbsp;&middot;<a href="../<%= Path %>/<%= FileName %>" target="_blank"><font color="<%= t_Color %>"><%= Title %></font></a> 
                </td>
                <td width="100" align="right"><Font color="#999999">[<%= DateAndTime %>]</Font></td>
              </tr>
              <tr> 
                <td height="1" colspan="2" bgcolor="#f9f9f9"></td>
              </tr>
              <% 
 Rs.Movenext
Next

 %>
            </table>
            <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
              <tr> 
                <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 
                  分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
                <td width="50%" align="right"> 
                  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Param&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Param&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
                  <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Param&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Param&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
      
      
	  </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Rs.Close
Set Rs = Nothing
CloseDB()
 %>
