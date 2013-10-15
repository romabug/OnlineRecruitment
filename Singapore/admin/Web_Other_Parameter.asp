<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Newid,PageNo
Dim Rs,SQL
Dim Title,TypeName,Flag,BestNew,HotNew,Content,Typeid,Author,NewFrom
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"193") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "edit" Then Call Edit_Submit() '更新新闻的函数


SQL = "Select Top 1 * From [pH_Web_Parameter] Where Cityid=0"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Rs.Close
 Call CloseDB
 Response.write "没有找到信息！"
 Response.End()
End if

About		  = Rs("About")
Statement     = Rs("Statement")
Service		  = Rs("Service")
Contact		  = Rs("Contact")

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
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>网站参数</strong></font></td>
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
                  <td width="100" height="25" align="right"><font color="#FF0000">关于我们</font>：</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_about&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="200"></iframe></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right"><font color="#FF0000">网站声明</font>：</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_statement&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="200"></iframe></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right"><font color="#FF0000">联系我们</font>：</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_contact&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="200"></iframe></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right"><font color="#FF0000">服务专区</font>：</td>
                  <td><iframe ID="eWebEditor1" src="Web_Editor/ewebeditor.asp?id=n_service&style=standard" frameborder="0" scrolling="no" width="96%" HEIGHT="200"></iframe></td>
                </tr>
                <tr align="center" bgcolor="f5f5f5"> 
                  <td height="25" colspan="2"> <input type="submit" name="Submit" value="保 存"> 
                    <input name="n_about" type="hidden" id="n_about" value="<%= Server.htmlencode(About) %>"> 
                    <input name="n_statement" type="hidden" id="n_statement" value="<%= Server.htmlencode(Statement) %>"> 
                    <input name="n_contact" type="hidden" id="n_contact" value="<%= Server.htmlencode(contact) %>"> 
                    <input name="n_service" type="hidden" id="n_service" value="<%= Server.htmlencode(Service) %>"> 
    
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
 'Check_Url() '跨站检测

About		  = Request.Form("n_About")
Statement	  = Request.Form("n_Statement")
Service		  = Request.Form("n_Service")
Contact		  = Request.Form("n_Contact")
 
 SQL = "Update [pH_Web_Parameter] Set About='"&About&"',Statement='"&Statement&"',Contact='"&Contact&"',Service='"&Service&"' Where Cityid=0"
 Conn.Execute(SQL)
 Response.write "<script language=JavaScript>alert('保存成功！');location.href='Web_Other_Parameter.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
%>

