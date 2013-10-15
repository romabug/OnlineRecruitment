<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action
Dim AdUrl,AdName,WebName,Width,Height,AdClass,AdFile,BeginDate,EndDate,Sort1

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"203") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "add" Then
 LinkName = Replace_Text(Request.Form("LinkName"))
 LinkUrl = Replace_Text(Request.Form("LinkUrl"))
 LinkImgPath = Replace_Text(Request.Form("LinkImgPath"))
 LinkInfo = Replace_Text(Request.Form("LinkInfo"))
 OrderNum = Replace_Text(Request.Form("OrderNum"))
 State = Replace_Text(Request.Form("State"))
 Style = Replace_Text(Request.Form("Style"))
 Class1 = Replace_Text(Request.Form("Class"))
 
 If LinkImgPath <> "" Then LinkImgPath = Replace(LinkImgPath,"../Uploadfiles/Link/","")

 SQL = "Insert Into [pH_FriendLink] (LinkName,LinkUrl,LinkImgPath,LinkInfo,OrderNum,State,Style,Class,Cityid,AddDate) Values ('"&LinkName&"','"&LinkUrl&"','"&LinkImgPath&"','"&LinkInfo&"',"&OrderNum&","&State&","&Style&","&Class1&",0,GetDate())"
 Conn.Execute(SQL)

 Response.write "<script language=JavaScript>alert('操作成功！');location.href='Web_Friend.asp';</script>"
End if
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
<title>新闻类别</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript">
 function theForm_check()
 {
  if (document.add.linkname.value=="")
  {
    alert("请输入网站名称");
	document.add.linkname.focus();
	return false;
  }
  
  if (document.add.linkurl.value=="http://" || document.add.linkurl.value=="")
  {
    alert("请输入链接地址");
	document.add.linkurl.focus();
	return false;
  }
  
  if (document.add.ordernum.value=="")
  {
    alert("请输入排列位置");
	document.add.ordernum.focus();
	return false;
  }
 }
</script>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="24" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ 
      <strong>添加合作伙伴</strong></font></td>
  </tr>
  <tr>
    <td height="5"></td>
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
          <td bgcolor="#FFFFFF"> <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="text01">
              <form name="add" action="?action=add" method="post" onSubmit="return theForm_check()">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">网站名称：</td>
                  <td height="25"> <input name="linkname" type="text" style="width:160px;"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">图片文件：</td>
                  <td height="25"><input name="linkimgpath" type="text"  style="width:160px;"> 
                    <input type="button" name="bnt1" value="上传图片" onClick="window.open('upload_flash.asp?formname=add&editname=linkimgpath&uppath=../Uploadfiles/Link&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">链接地址：</td>
                  <td height="25"><input name="linkurl" type="text" id="linkurl" style="width:240px;" value="http://"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">网站描述：</td>
                  <td height="25"><textarea name="linkinfo" cols="35" id="linkinfo"></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">样式：</td>
                  <td height="25">
				    <select name="style" id="style">
                      <option value="0" selected>文字</option>
                      <option value="1">图片</option>
                    </select> 
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">状态：</td>
                  <td height="25">
				    <select name="state" id="state">
                      <option value="1" selected>通过</option>
                      <option value="0">屏蔽</option>
                    </select>
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">排列顺序：</td>
                  <td height="25"> <input name="ordernum" type="text" id="sort2" value="1" size="6" maxlength="6">
                    位</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">&nbsp;</td>
                  <td height="25"> <input type="submit" name="Submit" value="添 加">
                    <input name="class" type="hidden" id="class" value="0"></td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 

Call CloseDB()
 %>

