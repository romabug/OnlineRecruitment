<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<% 
Dim Param,ErroStr
If Request("Action")="save"  Then Call Saves()

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 用户反馈</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Include/Header.asp" -->
      
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="160" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>网站导航</strong></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="About.asp">关于我们</a> </td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Statement.asp">网站声明</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Service.asp">服务专区</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Feedback.asp">用户反馈</a> </td>
                          </tr>
                          <tr>
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Friend.asp">合作伙伴</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Link.asp">友情链接</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Contact.asp">联系我们</a> </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  
                </td>
                <td width="10">&nbsp;</td>
                <td align="center" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../Images/mid_left_public.gif" width="31" height="33"></td>
                      <td background="../Images/mid_bg.gif" class="font-14"><strong><font color="#333333">用户反馈</font></strong></td>
                      <td width="30"><img src="../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#efefef" class="text01">
                          <Form action="?Action=save" method="post" name="the"  onSubmit="return the_check();">
                            <script language="JavaScript">
 function the_check(){
 if (document.the.name.value==""){
  alert("-请输入您的称呼方式-");
  document.the.name.focus();
  return false;
 }
 if (document.the.phone.value==""){
  alert("-请输入您的电话-");
  document.the.phone.focus();
  return false;
 } 
 if (document.the.mail.value==""){
  alert("-请输入您的电子邮件-");
  document.the.mail.focus();
  return false;
 } 
  if (document.the.memo.value==""){
  alert("-请输入您的意见或者建议文字-");
  document.the.memo.focus();
  return false;
 }  
}
</script>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">称 呼：</td>
                              <td height="25"><input name="name" type="text" id="name" style="width:160px;"> 
                                <font color="#666666">请输入您的称呼方式</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">电 话：</td>
                              <td height="25"><input name="phone" type="text" id="phone" style="width:160px;"> 
                                <font color="#666666">请输入您的联系电话</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">电子邮件：</td>
                              <td height="25"><input name="mail" type="text" id="mail" style="width:160px;"> 
                                <font color="#666666">请输入您的电子邮件</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="80" height="25" align="right">QQ/MSN：</td>
                              <td height="25"><input name="qq" type="text" id="name4" style="width:160px;"> 
                                <font color="#666666">请输入您的聊天工具号码</font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                              <td height="25" align="right">反馈类型：</td>
                              <td height="25">
							  <select name="type" id="type" style="width:160px;">
                                  <option value="建议意见" selected>建议意见</option>
                                  <option value="服务投诉">服务投诉</option>
                                  <option value="操作帮助">操作帮助</option>
                                  <option value="合作意向">合作意向</option>
                                  <option value="其他信息">其他信息</option>
                                </select>
								</td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">意见建议：</td>
                              <td height="25"><textarea name="memo" cols="50" rows="8" id="memo"></textarea> 
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25" align="left"> <input type="submit" name="Submit4" value=" 提 交 信 息 "> 
                              </td>
                            </tr>
                          </Form>
                        </table></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!--#include file="../Include/Footer.asp" -->
          </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</body>
</html>
<% Sub Saves()
 Dim Name,Phone,Mail,QQ,Dates
 Name = SafeRequest("Name")
 Phone = SafeRequest("Phone")
 Mail = SafeRequest("Mail")
 QQ = SafeRequest("qq")
 Memo = SafeRequest("Memo")
 ac_Type = SafeRequest("Type")
 
 Conn.Execute("Insert Into [pH_Web_Feedback] (ac_Name,ac_Phone,ac_Mail,ac_QQ,ac_Type,ac_Memo,ac_Adddate,ac_Flag,Cityid) Values ('"&Name&"','"&Phone&"','"&Mail&"','"&QQ&"','"&ac_Type&"','"&Memo&"','"&Now()&"',0,0)")
 Conn.Close
 Set Conn = Nothing
 Response.write "<script>alert('-您的信息已经成功地提交！-');location.href='Feedback.asp';</script>"
 Response.End()
End Sub
%>
