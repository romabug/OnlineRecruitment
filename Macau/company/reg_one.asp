<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册企业会员</title>
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.12bai {	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 160%; FONT-FAMILY: "Tahoma"; TEXT-DECORATION: none
}
-->
</style>
</head>
<body>
<!--#include file="../inc/top_1.asp"-->
<script language="JavaScript" src="inc/check.js"></script>
<script language="JavaScript" src="../person/inc/index.js"></script>  
<br>

<table width="780" border="0" align="center" cellpadding="5" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" style="border-collapse: collapse">
  <form action="reg_two.asp" method="post" name="form1" id="form1" onSubmit="return Juge(this)">
  <tr>    
      <td width="770" height="566" align="center" bgcolor="#F8F7F5"><img src="../images/bannerreg.gif" width="770" height="170" /><br /><br />
        <table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
          <tr> 
            <td height="58" align="left" bgcolor="#FFFFFF"> <p style="line-height:160%;">凡需要招聘內地勞工的澳門雇主均可免費發佈招聘資訊、招聘會資訊或其他勞務相關的廣告。<br />
                <font color="#FF0000">享受更高價值的服務，請至電 400 服務熱線：400 6756 269, 业务咨询邮箱：<a href="mailto:marketing@macau69.com">marketing@macau69.com</a></font></p>
              <p style="line-height:160%;"><font color="#003399"><strong>第1步：填寫帳號資訊</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <font color="#999999">第2步:填寫雇主資料 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                第3步:註冊成功，登陸系統發佈招聘資訊</font><br />
              </p>
              </td>
          </tr>
        </table>
		
		<br>
		
		<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" style="border-collapse: collapse">
          <tr> 
            <td width="114" height="30" align="right" bgcolor="#F6F9FD"> 用戶帳號：</div> 
            </td>
            <td width="200" height="20" align="left" bgcolor="#F6F9FD"><input name="username" type="text" class="input" id="username" size="20"  maxlength="20" onKeyPress="return regInput(this,'username',5);" onpaste="return regInput(this,'username',true);" /> </div>
            </td>
            <td width="440" align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font>( 
              請輸入英文字母、數位或下劃線，長度為6~20個字元，不區分大小寫)</td>
          </tr>
          <tr> 
            <td height="30" align="right"> 密　碼： </div></td>
            <td height="20" align="left"><input name="pwd1" type="password" class="input" id="pwd1" size="21" maxlength="20" /> </div>
            </td>
            <td align="left"><font color="#FF0000">*</font><font color="#624B35">&nbsp;( 
              6~20個字元，區分大小寫 ) </font></td>
          </tr>
          <tr> 
            <td height="30" align="right" bgcolor="#F6F9FD">再次輸入密碼<font color="#000000">：</font> </div> 
            </td>
            <td height="20" align="left" bgcolor="#F6F9FD"><input name="pwd2" type="password" class="input" id="pwd2" size="21" maxlength="20" /> </div>
            </td>
            <td align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font><font color="#666666">&nbsp;</font> 
            </td>
          </tr>
          <tr> 
            <td height="30" align="right">E-mail：</div></td>
            <td height="20" align="left"> 
              <input name="email" type="text" class="input" id="email" size="20" maxlength="50"  onkeypress="return regInput(this,'mail');" onpaste="return regInput(this,'mail',true);" /></td>
            <td align="left"><font color="#FF0000">*</font><font color="#624B35">&nbsp;</font>( 
              請準確填寫您的E-mail，可接收本網服務通知資訊。)</td>
          </tr>
          <tr> 
            <td height="30" align="right" bgcolor="#F6F9FD"></div></td>
            <td height="20" align="left" bgcolor="#F6F9FD">&nbsp;</td>
            <td align="left" bgcolor="#F6F9FD">&nbsp;</td>
          </tr>
        </table>
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr> 
              <td width="131" height="38">&nbsp;</td>
              <td align="left"><input name="agree" type="checkbox" value="Yes" />
              <strong>我已認真閱讀並同意遵守以上用戶服務協定 </strong><b></b><a href="http://www.macau69.com/about/xieyi.asp">查看協定</a></td>
            </tr>
        </table><button accesskey="K" type="submit"  class="win_"><img src="../images/203.gif" width="16" height="16" /> 提交注册</button>&nbsp;&nbsp;&nbsp;<input type="reset" value=" 清空重填 " name="Reset"  style="HEIGHT: 30px; width:120px; font-family: 宋体; font-size: 14px"></td>
  </tr>
</form>
</table>
      
<!--#include file="bottom.asp"-->
</body>
</html>
