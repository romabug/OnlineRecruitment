<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action
Dim AdUrl,AdName,WebName,Width,Height,AdClass,AdFile,BeginDate,EndDate,Sort1

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"200") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "add" Then
 AdUrl           = Replace_Text(Request.Form("AdUrl"))
 AdName          = Replace_Text(Request.Form("AdName"))
 WebName         = Replace_Text(Request.Form("WebName"))
 w               = Replace_Text(Request.Form("Width"))
 h               = Replace_Text(Request.Form("Height"))
 AdClass         = Replace_Text(Request.Form("AdClass"))
 AdFile          = Replace_Text(Request.Form("AdFile"))
 BeginDate       = Replace_Text(Request.Form("BeginDate"))
 EndDate         = Replace_Text(Request.Form("EndDate"))
 Sort1           = Replace_Text(Request.Form("Sort"))
 Cityid			 = Replace_Text(Request.Form("Cityid"))
 
 If AdFile <> "" Then AdFile = Replace(AdFile,"../Uploadfiles/AdFile/","")

 SQL = "Insert Into [pH_Web_Ad] (AdUrl,AdName,WebName,ad_Width,ad_Height,AdClass,AdFile,BeginDate,EndDate,ad_Sort,Cityid) Values ('"&AdUrl&"','"&AdName&"',"&WebName&","&w&","&h&","&AdClass&",'"&AdFile&"','"&BeginDate&"','"&EndDate&"',"&Sort1&","&Cityid&")"
 Conn.Execute(SQL)

 Response.redirect "Web_Other_Ads.asp"
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
  if (document.add.adname.value=="")
  {
    alert("请输入广告位置名称");
	document.add.adname.focus();
	return false;
  }
  
  if (document.add.width.value=="")
  {
    alert("请输入广告的宽度");
	document.add.width.focus();
	return false;
  }
  
  if (document.add.height.value=="")
  {
    alert("请输入广告的高度");
	document.add.height.focus();
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
    <td height="24" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加广告</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
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
                  <td width="100" height="25" align="right">广告位置名称：</td>
                  <td height="25"> 
                    <input name="adname" type="text" id="adname2" size="25" maxlength="25"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">所在页面：</td>
                  <td height="25"> 
                    <select name="webname">
                      <option value="1" selected>首页</option>
                      <option value="2">职位搜索</option>
                      <option value="3">猎头职位</option>
                      <option value="4">兼职信息</option>
                      <option value="5">人才自荐</option>
                      <option value="6">校园招聘</option>
                      <option value="7">学子求职</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告文件类型：</td>
                  <td height="25"> 
                    <select name="adclass" id="select2">
                      <option value="1">图片文件</option>
                      <option value="2">Flash文件</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">宽 度：</td>
                  <td height="25"> 
                    <input name="width" type="text" id="width2" size="6" maxlength="6">
                    像素</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">高 度：</td>
                  <td height="25"> 
                    <input name="height" type="text" id="height2" size="6" maxlength="6">
                    像素</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告目标地址：</td>
                  <td height="25">http:// 
                    <input name="adurl" type="text" id="adurl2" size="25" maxlength="100"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告文件：</td>
                  <td height="25"> 
                    <input name="adfile" type="text" id="adfile2"> 
                    <input type="button" name="bnt1" value="上传图片" onClick="window.open('upload_flash.asp?formname=add&editname=adfile&uppath=../Uploadfiles/AdFile&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">排列顺序：</td>
                  <td height="25"> 
                    <input name="sort" type="text" id="sort2" value="1" size="6" maxlength="6">
                    位</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">开始时间：</td>
                  <td height="25"> 
                    <input name="begindate" type="text" id="begindate2" size="16" maxlength="16" onclick="SD(this,'document.all.begindate')"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">结束时间：</td>
                  <td height="25"> 
                    <input name="enddate" type="text" id="enddate2" size="16" maxlength="16" onclick="SD(this,'document.all.enddate')"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">&nbsp;</td>
                  <td height="25"> 
                    <input type="submit" name="Submit" value="添加广告">
                    <input name="cityid" type="hidden" id="cityid" value="0"></td>
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

