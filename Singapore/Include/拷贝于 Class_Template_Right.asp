<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../Css/Style.css" rel="stylesheet" type="text/css">
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

<body leftmargin="0" topmargin="0">
<table width="160" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"> 
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
              <form action="../Public/News_Search.asp" method="post" target="_blank" name="theForm" onSubmit="return search_check()">
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
				   TypeName1 = Re("Type")
				   Typeid   = Re("Typeid")
	%>
                      <option value="<%= Typeid %>"><%= TypeName1 %></option>
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
          <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><%= Cls_News_Param("BestNew=1",8,11) %></td>
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
                <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>文章推荐</strong></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><%= Cls_News_Param("HotNew=1",8,11) %></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% 

CloseDB
 %>
