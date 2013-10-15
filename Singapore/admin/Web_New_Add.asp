<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"180") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
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
              <form method="post" action="Web_New_AddSave.asp"onsubmit="return CheckForm()" name="form1">
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">新闻标题：</td>
                  <td><input name="title" type="text" id="title" size="50"> <select name="t_color" id="t_color">
                      <option value="#333333" selected>黑色标题</option>
                      <option value="#ff0000" >红色标题</option>
                      <option value="#0000ff" >蓝色标题</option>
                      <option value="#009900" >绿色标题</option>
                    </select> </td>
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
					    Response.write "<option value="&rs("typeid")&">"&rs("type")&"</option>"
					    Rs.Movenext
					  Wend
					  Rs.close
					  
					  
%>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">作 者：</td>
                  <td><input name="author" type="text" id="author" size="20" maxlength="50"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">来 源：</td>
                  <td><input name="newfrom" type="text" id="newfrom" size="20" maxlength="50" value="<%= Cls_WebName %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">热门新闻：</td>
                  <td><input name="hotnew" type="checkbox" id="hotnew" value="1">
                    设置成热门新闻</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">推荐新闻：</td>
                  <td><input name="bestnew" type="checkbox" id="bestnew" value="1">
                    设置成推荐新闻</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="120" height="25" align="right">审 核：</td>
                  <td><input name="flag" type="checkbox" id="flag" value="1" checked>
                    直接通过审核</td>
                </tr>
                <tr align="center" bgcolor="f5f5f5"> 
                  <td height="25" colspan="2"> <input type="submit" name="Submit" value="添加新闻"> 
                    <input name="n_content" type="hidden" id="n_content">
                    <input name="cityid" type="hidden" id="cityid" value="0"></td>
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
Call CloseDB()
%>

