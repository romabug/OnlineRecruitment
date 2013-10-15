<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人免费注册会员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/check.js"></script>
<script type="text/javascript" src="inc/index.js"></script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="../inc/top_1.asp"-->
<table width="780" border="0" align="center" cellpadding="5" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" style="border-collapse: collapse">
    <form action="reg_first_save.asp" method="post" name="form1" id="form1" onsubmit="return Juge(this)">
      <tr>
        <td width="770" align="center" bgcolor="#F8F7F5"><table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
              <tr>
                <td align="left" bgcolor="#FFFFFF"><p style="line-height:160%;"><strong> 
                <font face="Verdana" style="font-size: 11px; color:#00468D;">欢迎注册成为澳门劳工招聘网(www.macau69.com)的劳工会员 
                </font> </strong><br />
                <span style="line-height: 20px">整个注册过程只需5分钟，助您轻松展开网上求职！</span><br />
                如果在注册过程中遇到暂时无法解决的问题，请直接联系我们， <a href="mailto:webmaster@macau69.com">webmaster@macau69.com</a>，QQ：601652392</p>
              <p style="line-height:160%;"><strong><font color="#003399">第1步：填写帐号信息</font></strong> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CCCCCC">第2步:填写劳工简历 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第3步:注册成功，登陆系统投递简历</font><br />
              </p></td>
              </tr>
            </table>
			<br><br>
			<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" style="border-collapse: collapse">
              <tr>
                <td width="120" height="20" align="right" bgcolor="#F6F9FD"> 用户帐号：
                  </div></td>
                <td width="187" height="20" align="left" bgcolor="#F6F9FD"><input name="username" type="text" class="input" id="username" size="20"  maxlength="20" onkeypress="return regInput(this,'username',5);" onpaste="return regInput(this,'username',true);" />
                    </div></td>
                <td width="494" align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font><font color="#666666">( 
                  请输入英文字母、数字或下划线，长度为6~20个字符，不区分大小写) </font>
                    </div></td>
              </tr>
              <tr>
                <td height="20" align="right"> 密　　码：
                  </div></td>
                <td height="20" align="left"><input name="pwd1" type="password" class="input" id="pwd1" size="21" maxlength="20" />
                    </div></td>
                <td align="left"><font color="#FF0000">*</font><font color="#624B35">&nbsp;</font><font color="#666666">( 
                  6~20个字符，区分大小写 )</font>
                    </div></td>
              </tr>
              <tr>
                <td height="20" align="right" bgcolor="#F6F9FD"><font color="#000000">重复密码：</font>
                    </div></td>
                <td height="20" align="left" bgcolor="#F6F9FD"><input name="pwd2" type="password" class="input" id="pwd2" size="21" maxlength="20" />
                    </div></td>
                
            <td align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font><font color="#666666">&nbsp;( 
              请再输入一遍密码 )</font><font color="#624B35">&nbsp; </font> </div></td>
              </tr>
              <tr>
                <td height="25" align="right">密码提示问题：
                  </div></td>
                <td height="25" align="left"><select name="question" id="question">
                    <option>请选择安全提问</option>
                    <option value="1">母亲的名字</option>
                    <option value="2">爷爷的名字</option>
                    <option value="3">父亲出生的城市</option>
                    <option value="4">您其中一位老师的名字</option>
                    <option value="5">您个人计算机的型号</option>
                    <option value="6">您最喜欢的餐馆名称</option>
                    <option value="7">驾驶执照的最后四位数字</option>
                  </select>
                    </div></td>
                <td align="left"><font color="#FF0000">*</font><font color="#666666">&nbsp;( 
                  取回密码时使用 ) </font>
                    </div></td>
              </tr>
              <tr>
                <td height="20" align="right" bgcolor="#F6F9FD">取回密码答案：
                  </div></td>
                <td height="20" align="left" bgcolor="#F6F9FD"><input name="answer" type="text" class="input" id="answer" size="20" maxlength="20" />
                    </div></td>
            <td align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font><font color="#666666">&nbsp;( 
              同上 ) </font> </div></td>
              </tr>
              <tr>
                <td height="28" align="right" >E-mail：
                  </div></td>
                <td height="28" align="left"><input name="email" type="text" class="input" id="email" size="20" maxlength="50"  onkeypress="return regInput(this,'mail');" onpaste="return regInput(this,'mail',true);" />
                    </div></td>
                <td height="28" align="left"><p><font color="#FF0000">*</font>(<font color="#666666">请准确填写您的E-mail，E-mail是您享受求职服务的重要工具，包括：忘记密码时取回密码、接收本网服务通知等信息。)</font></p></td></tr></table>
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="126" height="38"><div align="right"> </div></td>
                
            <td align="left"> <input name="agree" type="checkbox" id="agree" value="Yes" />
              <font color="#0033CC">我已认真阅读并同意遵守用户服务协议<b> </b><a href="http://www.macau69.com/about/xieyi.asp">查看用户协议</a></font> 
              <font color="#FF0000">*</font> </td>
              </tr>
          </table> <br>
          <button accesskey="K" type="submit" class="win_"><img src="../images/203.gif" width="16" height="16" /> 提交注册</button>
           &nbsp;&nbsp;
        <input type="reset" value=" 清空重填 " name="Reset"  style="HEIGHT: 30px; width:120px; font-family: 宋体; font-size: 14px" /></td>
      </tr>
    </form>
  </table>
  
  <br>
  <br>
    
  <!--#include file="bottom.asp"-->
</body>
</html>
