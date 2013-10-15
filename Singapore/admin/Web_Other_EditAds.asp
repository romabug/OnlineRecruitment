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
Param  = Request.QueryString("param")
If Action = "add" Then
 Ncid            = Replace_Text(Request.Form("Param"))
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
 
 If AdFile <> "" Then AdFile = Replace(AdFile,"../Uploadfiles/AdFile/","")

 SQL = "Update [pH_Web_Ad] Set AdUrl='"&AdUrl&"',AdName='"&AdName&"',WebName="&WebName&",ad_Width="&w&",ad_Height="&h&",AdClass="&AdClass&",AdFile='"&AdFile&"',BeginDate='"&BeginDate&"',EndDate='"&EndDate&"',ad_Sort="&Sort1&" Where Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)

 Response.redirect "Web_Other_Ads.asp"
Else
 SQL = "Select * From [pH_Web_Ad] Where Ncid="&Cstr(Param)
 Set Rs = Conn.Execute(SQL)
 Ncid            = Rs("Ncid")
 AdUrl           = Rs("AdUrl")
 AdName          = Rs("AdName")
 WebName         = Rs("WebName")
 w               = Rs("ad_Width")
 h               = Rs("ad_Height")
 AdClass         = Rs("AdClass")
 AdFile          = Rs("AdFile")
 BeginDate       = Rs("BeginDate")
 EndDate         = Rs("EndDate")
 Sort1           = Rs("Ad_Sort")
 
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
    <td height="24" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>编辑广告</strong></font></td>
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
                  <td><input name="adname" type="text" id="adname" size="25" maxlength="25" value="<%= AdName %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">所在页面：</td>
                  <td> <select name="webname" id="webname">
                      <option value="1" <% If WebName = 1 Then Response.write "Selected" %>>首页</option>
                      <option value="2" <% If WebName = 2 Then Response.write "Selected" %>>职位搜索</option>
                      <option value="3" <% If WebName = 3 Then Response.write "Selected" %>>猎头职位</option>
                      <option value="4" <% If WebName = 4 Then Response.write "Selected" %>>兼职信息</option>
                      <option value="5" <% If WebName = 5 Then Response.write "Selected" %>>人才自荐</option>
                      <option value="6" <% If WebName = 6 Then Response.write "Selected" %>>校园招聘</option>
                      <option value="7" <% If WebName = 7 Then Response.write "Selected" %>>学子求职</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告文件类型：</td>
                  <td> <select name="adclass" id="adclass">
                      <option value="1" <% If AdClass = 1 Then Response.write "Selected" %>>图片文件</option>
                      <option value="2" <% If AdClass = 2 Then Response.write "Selected" %>>Flash文件</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">宽 度：</td>
                  <td><input name="width" type="text" id="width" size="6" maxlength="6" value="<%= w %>">
                    像素</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">高 度：</td>
                  <td><input name="height" type="text" id="height" size="6" maxlength="6" value="<%= h %>">
                    像素</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告目标地址：</td>
                  <td>http:// 
                    <input name="adurl" type="text" id="adurl" size="25" maxlength="100" value="<%= adurl %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">广告文件：</td>
                  <td><input name="adfile" type="text" id="adfile" value="<%= adfile %>"> 
                    <input type="button" name="bnt1" value="上传图片" onClick="window.open('upload_flash.asp?formname=add&editname=adfile&uppath=../Uploadfiles/AdFile&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">排列顺序：</td>
                  <td><input name="sort" type="text" id="sort" size="6" maxlength="6" value="<%= sort1 %>">
                    位</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">开始时间：</td>
                  <td><input name="begindate" type="text" id="begindate" size="16" maxlength="16" onclick="SD(this,'document.all.begindate')"  value="<%= begindate %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">结束时间：</td>
                  <td><input name="enddate" type="text" id="enddate" size="16" maxlength="16" onclick="SD(this,'document.all.enddate')" value="<%= enddate %>"> 
                    <input name="param" type="hidden" id="param" value="<%= Ncid %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">&nbsp;</td>
                  <td height="25"> <input type="submit" name="Submit" value="保存"></td>
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
Sub Edit_Submit() '发送邮件

 UserType    = request("UserType")
 Title       = Replace_text(request("Title"))
 Memo        = Replace_text(request("n_Content"))
 
 Select Case UserType
  Case "person":
  	SQL = "Select UserEmail From [pH_Person_Base]"
  Case "company":
  	SQL = "Select Email From [pH_Company_Base]"
  Case "school":
  	SQL = "Select Email From [pH_School_Base]"
 End Select
 Set Rs = Conn.Execute(SQL)
 
 While Not Rs.Eof	
  '查找会员的数据  
  Email    = Rs(0)
  '发送邮件
  Call SendEmail(Email,Memo,Title)
  Rs.Movenext
 Wend
 Rs.Close
 Response.write "<script language=JavaScript>alert('邮件发送成功！');history.back(-1);</script>"
End Sub

Call CloseDB()
 %>

