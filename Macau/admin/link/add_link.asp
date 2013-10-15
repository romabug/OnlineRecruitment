<!--#include file="../../conn.asp"-->
<!--#include file="../cookies.asp"-->
<!--#include file="Function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="../../css/01387.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="JavaScript">
<!--
function check()
{

if (document.form1.linkname.value=="")
   {
   alert("请输入网站名称！");
   document.form1.linkname.focus();
   return false;
   }
if (document.form1.url.value=="")
   {
   alert("请输入网址！");
   document.form1.url.focus();
   return false;
   }

if (document.form1.hist.value=="")
   {
   alert("请输入排名！");
   document.form1.hist.focus();
   return false;
   }


   return true;
}   

//-->
</script>

<br />
<br />
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" bgcolor="#e0f7da" class="C">&nbsp;&nbsp;<strong><font color="#009900">友情链接管理:</font></strong></td>
  </tr>
</table>
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="1">
   <form name="form1" method="post" action="add_link_save.asp" enctype="multipart/form-data" onSubmit="return check()">
 <tr>
    <td width="17%" height="30" align="right" bgcolor="#F7F7F7">网站名称：</td>
    <td width="83%"><input name="linkname" type="text" id="linkname" size="30" />
      <span class="p_14">*</span>      
      <input type="radio" name="style" value="1"  />
      <strong>加粗</strong> <input type="radio" name="style" value="2"  />
      <font color="#FF0000">加红</font></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">网址：</td>
    <td><input name="url" type="text" id="url" value="http://" size="50" />
      <span class="p_14">*</span>一定要加“htpp://”</td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">图片logo：</td>
    <td><input type="file" name="ProductImgI"  size="30" onChange="document.getElementById('previewImage').innerHTML = '预览&lt;br&gt; &lt;img src=\''+this.value+'\' width=88 height=31 align=absmiddle onload=\'ResizeImage(this, 88, 31);\'&gt;';file_size.src=this.value"><span id="previewImage">微缩图90*90</span></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">链接类型：</td>
    <td><input name="types" type="radio" value="0" checked="checked" />
      文字
        <input type="radio" name="types" value="1" />
        图片 <span class="p_14">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">首页推荐：</td>
    <td><input name="indexlook" type="radio" value="1" />
      是
        <input name="indexlook" type="radio" value="0" checked="CHECKED" />
    否 <span class="p_14">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">排列名次：</td>
    <td><input name="hist" type="text" id="hist" size="10" />
      排名最后的是：
<%Set Rs=Server.CreateObject("Adodb.RecordSet")
sSql="Select * from [link] "
Rs.Open sSql,conn,1,1
rs.movelast
response.Write "<b>"&rs("hist")&"</b>"
rs.close%>
<span class="p_14">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#F7F7F7">审核：</td>
    <td><input name="look" type="radio" value="1" checked="checked" />
      通过
        <input type="radio" name="look" value="0" />
        不通过</td>
  </tr>
  <tr>
    <td height="22" align="right">&nbsp;</td>
    <td height="50"><input type="submit" name="Submit" value="  添加友情链接  " /></td>
  </tr></form>
</table>
</body>
</html>
