<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,CompanyName,Comid
If Request("Action")="save"  Then Call Saves()
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - 猎头服务</title>
</head>
<style>
.c101 
{
	background-color:#255DA6;
	color: #ffffff;
} 
.c102 
{
	background-color:#efefef;
}
</style>

<script language="JavaScript">
 function login_check()
 {

 if (document.login.username.value==""){
  alert("-请输入用户名-");
  document.login.username.focus();
  return false;
 }
  if (document.login.password.value==""){
  alert("-请输入登陆密码-");
  document.login.password.focus();
  return false;
 }
 }
</script>
<script language="JavaScript">
function csecBoard(n) 
{ 
    for(i=1;i<5;i++) 
    { 
        eval("document.getElementById('cl0"+i+"').className='c102'"); 
        eval("cbx0"+i+".style.display='none'"); 
    } 
    eval("document.getElementById('cl0"+n+"').className='c101'"); 
    eval("cbx0"+n+".style.display='block'"); 
} 
</script>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_Index.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="5"></td>
        </tr>
      </table> 
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="180" bgcolor="#FFFFFF"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>会员登录</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><!--#include file="../Public/Com_MemberSession.asp" --></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>自荐人才</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;padding-left:5px;"> 
                  <div id=demo style=overflow:hidden;height:176> 
                    <div id=demo1> 
                      <TABLE width=100% border="0" align=center cellPadding=0 cellSpacing=0 id=news>
                        <% 
SQL = "Select Top 30 I.Perid,I.RealName,I.Sex,I.Edus,I.WorkWill1 From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 And B.Nc_Best_Flag=1 And DateDiff(d,Nc_Best_Date,Getdate())>=0 And DateDiff(d,Nc_Best_EndDate,Getdate())<=0 Order By B.LastUpdate_Time Desc"
				  Set Rs = Conn.Execute(SQL)
				  While Not Rs.Eof
				   Perid           = Rs(0)
				   RealName        = Rs(1)
				   WorkWill1       = "--"
				   If Rs(4) <> "" Then WorkWill1 = Left(Rs(4),8)
				   %>
                        <TR> 
                          <TD width="60" height=22 vAlign=center><A  href="../Person/Per_Resume.asp?Param=<%= Perid %>" target=_blank><%= RealName %></A></TD>
                          <TD vAlign=center><font color="#333333"><%= WorkWill1 %></font></TD>
                        </TR>
                        <% 
				    Rs.Movenext
				   Wend
				   Rs.Close	
				    %>
                      </TABLE>
                    </div>
                    <div id=demo2></div>
                  </div>
                  <script>
<!--
  var speed		= 15;//滚动速度
  var rows		= 22;//每行高度
  var stim		= 80; //停留时间倍数 * speed
  var stop		= 0; //初始化值，不管
  demo2.innerHTML	= demo1.innerHTML
  function Marquee(){
    if(demo.scrollTop%rows==0 && stop<=stim){
      stop++;
      return;
    }
    stop = 0;
    if(demo2.offsetTop-demo.scrollTop<=0)
      demo.scrollTop-=demo1.offsetHeight
    else{
      demo.scrollTop++
    }
  }
  var MyMar	   = setInterval(Marquee,speed)
  demo.onmouseover = function() {clearInterval(MyMar)}
  demo.onmouseout  = function() {MyMar=setInterval(Marquee,speed)}
-->
</script> </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>HR资讯</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
                          <tr align="center"> 
                            <td width="25%" height="23" class="c101" id="cl01" onMouseOver="csecBoard(1);"><strong>管理</strong></td>
                            <td width="25%" height="23" class="c102" id="cl02" onMouseOver="csecBoard(2);"><strong>业绩</strong></td>
                            <td width="25%" height="23" class="c102" id="cl03" onMouseOver="csecBoard(3);"><strong>薪酬</strong></td>
                            <td width="25%" height="23" class="c102" id="cl04" onMouseOver="csecBoard(4);"><strong>法律</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td> <div style="display:" id="cbx01"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx02"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx03"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx04"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>合作伙伴</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0">
                    <%
	  
Set Rs1 = Conn.Execute("Select Top 6 LinkName,LinkUrl From [pH_FriendLink] Where State=1 And Class=0 And Cityid=0 Order By ordernum Asc")
  if not rs1.eof then
  do while not rs1.eof %>
                    <tr> 
                      <td height="15" align="left"> <a href="<%=rs1("LinkUrl")%>" target="_blank"><%=rs1("LinkName")%></a></td>
                    </tr>
                    <%rs1.movenext

loop
end if
rs1.close
%>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <% 
		SQL = "Select Top 5 Adurl,ad_Width,ad_Height,AdFile,AdClass From [pH_Web_Ad] Where WebName=3 And ad_Width=760 And ad_Height=90 And DateDiff(d,BeginDate,GetDate())>=0 And DateDiff(d,EndDate,GetDate())<=0 And Cityid=0 Order By ad_Sort Asc"
		Set Rs_ads = Conn.Execute(SQL)
		While Not Rs_ads.Eof
		 If Rs_ads("AdClass") = 1 Then
		 %>
                    <tr> 
                      <td align="center"><a href="<%= "http://"&Rs_ads("AdUrl") %>" target="_blank"><img src="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>" width="<%= Rs_ads("ad_Width") %>" height="<%= Rs_ads("ad_Height") %>" border="0"></a></td>
                    </tr>
                    <% Else %>
                    <tr> 
                      <td align="center"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%= Rs_ads("ad_Width") %>" height="<%= Rs_ads("ad_Height") %>">
                          <param name="movie" value="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>">
                          <param name=quality value=high>
                          <embed src="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="435" height="75"></embed> 
                        </object></td>
                    </tr>
                    <% 
		 End if
		 Rs_ads.Movenext
		Wend
		Rs_ads.Close 
		 %>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#104e9e">猎头职位</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="1" cellpadding="3">
              <tr align="center" bgcolor="#f3f3f3"> 
                <td width="35%">职位名称</td>
                <td width="35%">企业名称</td>
                <td width="15%">工作地区</td>
                <td>发布日期</td>
              </tr>
              <% 
SQL = "Select TOP 8 Ncid,Locid,CompanyName,JobName,AddDate,Locus_Area From [pH_Locale_Jobs] Where Len(JobName)>0 Order By Ncid Desc"
Set Rs = Conn.Execute(SQL)
For i = 1 to 8
 If Rs.Eof Then Exit For
 Ncid				= Rs("Ncid")
 Locid				= Rs("Locid")			
 CompanyName		= Rs("CompanyName")
 JobName			= Rs("JobName")
 AddDate			= FormatDateTime(Rs("AddDate"),2)
 Locus_Area			= Rs("Locus_Area")
 %>
              <tr <% If i mod 2 = 0 Then %>bgcolor="#f9f9f9"<% End if %>> 
                <td><a href="../Headhunt/Info/LocaleJob.asp?Comid=<%= Locid %>&Param=<%= Ncid %>" target="_blank"><%= JobName %></a></td>
                <td><a href="../Headhunt/Info/LocaleCompany.asp?Param=<%= Locid %>" target="_blank"><%= CompanyName %></a></td>
                <td align="center"><%=Locus_Area %></td>
                <td align="center"><%= AddDate %></td>
              </tr>
              <% 
 Rs.Movenext
Next
Rs.Close
 %>
            </table>
            <table width="99%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right"><a href="../Headhunt/Hea_Search_New.asp" target="_blank">更多猎头职位&gt;</a>&gt;</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#104e9e">我要猎头</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#efefef" class="text01">
              <Form action="?Action=save" method="post" name="the"  onSubmit="return the_check();">
                <script language="JavaScript">
 function the_check(){
  if (document.the.companyname.value==""){
  alert("-请输入您的公司名称-");
  document.the.companyname.focus();
  return false;
 }
 
 if (document.the.name.value==""){
  alert("-请输入联系人姓名-");
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
  alert("-请输入您的需求内容-");
  document.the.memo.focus();
  return false;
 }  
}
</script>
                <tr bgcolor="#FFFFFF"> 
                  <td height="25" align="right" bgcolor="#FFFFFF">公司名称：</td>
                  <td height="25"><input name="companyname" type="text" id="companyname"> 
                    <font color="#666666">请输入公司名称</font></td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">联系人：</td>
                  <td height="25"><input name="name" type="text" id="name"> <font color="#666666">请输入您的姓名</font></td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">电 
                    话：</td>
                  <td height="25"><input name="phone" type="text" id="phone"> 
                    <font color="#666666">请输入您的联系电话</font></td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">电子邮件：</td>
                  <td height="25"><input name="mail" type="text" id="mail"> <font color="#666666">请输入您的电子邮件</font></td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">QQ/MSN：</td>
                  <td height="25"><input name="qq" type="text" id="name4"> <font color="#666666">请输入您的聊天工具号码</font></td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">需求内容：</td>
                  <td height="25"><textarea name="memo" cols="50" rows="8" id="memo"></textarea> 
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="70" height="25" align="right" bgcolor="#FFFFFF">&nbsp;</td>
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
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Sub Saves()
 Dim Name,Phone,Mail,QQ,Dates
 companyname = SafeRequest("companyname")
 Name = SafeRequest("Name")
 Phone = SafeRequest("Phone")
 Mail = SafeRequest("Mail")
 QQ = SafeRequest("qq")
 Memo = SafeRequest("Memo")

 Conn.Execute("Insert Into [pH_Locale_comApply] (ac_companyname,ac_Name,ac_Phone,ac_Mail,ac_QQ,ac_Memo,ac_Adddate,ac_Flag,Cityid) Values ('"&companyname&"','"&Name&"','"&Phone&"','"&Mail&"','"&QQ&"','"&Memo&"','"&Now()&"',0,0)")
 Conn.Close
 Set Conn = Nothing
 Response.write "<script>alert('-您的信息已经成功地提交！-');location.href='Headhunt.asp';</script>"
 Response.End()
End Sub 

%>
