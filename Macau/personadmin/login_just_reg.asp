<!--#include file="../conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-������ְ�����̨��¼</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="776" height="402" border="0" align="center" cellPadding="0" cellSpacing="0" bgColor="#ffffff">
  <tr> 
    <td width="797" height="30"> 
	<br>
      <table width="60%" height="92" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
        <tr> 
          <td height="90" align="left" bgcolor="#FFFFFF"> <p align="center" style="line-height:160%;"><strong><font color="#FF0000"> 
              ���ѳɹ�ע��Ϊ����͹���Ա,���¼ϵͳ����������ְ�� </font><font color="#003399"></font><font color="#003399"><br>
              </font></strong><font color="#003399">���ѣ�������Ƭ����Ҫ����һ��Ҫ�ϴ���<br>
              ��վ���ݿⶨ����������Ƭ������</font><br />
            </p>
            </td>
        </tr>
      </table>
      <br>
    </td>
  </tr>
  <tr> 
    <td><div align="center">
        <table width="333" height="300" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
          <tr> 
            <td height="80"><div align="center"><img src="../images/person_bg.gif" width="333" height="80" /></div></td>
          </tr>
          <tr> 
            <td height="256" valign="top" background="../images/lgoinbg.gif"><table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px;">
                <form action="check.asp" method="post" name="form1" id="form1">
                  <tr > 
                    <td width="87" height="28" align="right"><div align="right"><br>
                        �� �� ����</div></td>
                    <td width="225">&nbsp; <div align="left">
                        <input name="username" type="text" class="input" id="username" size="16" />
                      </div></td>
                  </tr>
                  <tr> 
                    <td height="28" align="right"><div align="right"><br>
                        �ܡ����룺</div></td>
                    <td>&nbsp; <div align="left">
                        <input name="password" type="password" class="input" id="password" size="16" />
                      </div></td>
                  </tr>
                  <tr> 
                    <td height="28" align="right"><div align="right"><br>
                        �� ֤ �룺</div></td>
                    <td>&nbsp; <div align="left">
                        <input name="verifycode" type="text" class="input" id="verifycode" value="<%If GetCode=9999 Then Response.Write "9999"%>" size="5" maxlength="50" />
                        &nbsp;���ڸ���������� <img src="../company/getcode.asp" /></div></td>
                  </tr>
                  <tr> 
                    <td height="50" colspan="2" align="center">&nbsp; <button accesskey="K" type="submit"  class="win2_"><img src="../images/203.gif" width="16" height="16" /> 
                      ��¼ϵͳ</button>
                      <input type="button" name="Submit2" value="���ע��" class="win2_" onclick=Javascript:location='reg_first.asp' /></td>
                  </tr>
                </form>
              </table>
              <table class="t3" cellspacing="0" cellpadding="0" width="71%" align="center" border="0">
                <tr> 
                  <td height="33" style="line-height:170%;">
                      <li>��Ҫ������ <a href="../about/help.asp">������</a> <br>
                      </li>
                  </td>
                </tr>
              </table></td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
