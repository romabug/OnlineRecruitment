<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-size: 9pt}
a {  color: #000000; text-decoration: none}
a:hover {  text-decoration: underline}
.tx {  height: 16px; width: 30px; border-color: black black #000000; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 9pt; background-color: #eeeeee; color: #0000FF}
.bt {  font-size: 9pt; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1 { height: 20px; width: 30px; font-size: 9pt; border: 1px solid; border-color: black black #000000; color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="Hr_upfile.asp" enctype="multipart/form-data" >
  <table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#CCCCCC" width="91" height="23">
    <tr> 
      <td align="left" valign="middle" height="18" width="18">&nbsp;</td>
      <td bgcolor="#CCCCCC" align="left" valign="middle" height="18" width="67"> 文件上传</td>
    </tr>
  </table>
  <br>
  <input type="hidden" name="act" value="upload">
  <br>
  <table width="71%" border="1" cellspacing="0" cellpadding="5" align="center" bordercolordark="#CCCCCC" bordercolorlight="#000000">
    <tr bgcolor="#CCCCCC"> 
      <td height="22" align="left" valign="middle" bgcolor="#CCCCCC">&nbsp;文档上传</td>
    </tr>
    <tr align="left" valign="middle" bgcolor="#eeeeee"> 
      <td bgcolor="#eeeeee" height="92"> 
        <script language="javascript">
	  function setid()
	  {
	  str='<br>';
	  if(!window.form1.upcount.value)
	   window.form1.upcount.value=1;
 	  for(i=1;i<=window.form1.upcount.value;i++)
	     str+='文件'+i+':<input type="file" name="file'+i+'" style="width:400" class="tx1"><br><br>';
	  window.upid.innerHTML=str+'<br>';
	  }
	  </script>
        <li> 需要上传的个数 
          <input type="text" name="upcount" class="tx" value="1">
          <input type="button" name="Button" class="bt" onclick="setid();" value="· 设定 ·">
        </li>
        <br>
        <br>
        <li>上传到: 
          <input type="text" name="filepath" class="tx" style="width:350" value="/hr_club/doc/">
        </li>
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td align="left" id="upid" height="122"> 文件1: 
        <input type="file" name="file1" style="width:400" class="tx1" value="">
      </td>
    </tr>
    <tr align="center" valign="middle" bgcolor="#eeeeee"> 
      <td bgcolor="#eeeeee" height="24"> 
        <input type="submit" name="Submit" value="· 提交 ·" class="bt">
        <input type="reset" name="Submit2" value="· 重执 ·" class="bt">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<script language="javascript">

setid();
</script>