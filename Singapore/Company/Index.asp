<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,CompanyName,Comid
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - 企业服务</title>
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
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr valign="top">
              <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                  </tr>
                  <tr>
                    <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50"><img src="../Images/Company/per_1.gif" width="46" height="47"></td>
                                <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td align="right" class="font-14"><strong>网络招聘</strong></td>
                                    </tr>
                                    <tr>
                                      <td align="right" class="font-14"><strong>Recruitment 
                                        Network</strong></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td>新加坡劳务网是中国最大的招聘网站之一，通过互联网全方位为企业客户提供多样化的网络产品与招聘服务。整合人才招聘解决方案，满足不同客户不同阶段的招聘需求。</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
                  </tr>
              </table></td>
              <td width="6">&nbsp;</td>
              <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                  </tr>
                  <tr>
                    <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50"><img src="../Images/Company/per_2.gif" width="46" height="47"></td>
                                <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td align="right" class="font-14"><strong>视频招聘</strong></td>
                                    </tr>
                                    <tr>
                                      <td align="right" class="font-14"><strong>Video 
                                        Recruitment</strong></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td>新加坡劳务网是采用最先进的FMS技术为企业和个人会员实现在线录制视频信息，同时提供在线视频面试视频招聘会等视频服务。用户可以全方位的体验视频带来便捷和快速的沟通。</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
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
              <tr valign="top">
                <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                    </tr>
                    <tr>
                      <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="50"><img src="../Images/Company/per_3.gif" width="46" height="47"></td>
                                  <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="right" class="font-14"><strong>校园招聘</strong></td>
                                      </tr>
                                      <tr>
                                        <td align="right" class="font-14"><strong>Campus 
                                          Recruitment</strong></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td>新加坡劳务网连续几届协助国家毕业生就业指导中心举办高校毕业生网络招聘会，在校园有着广泛的影响。为企业提供全面的校园招聘解决方案，覆盖近100余所全国重点高校。<br>
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
                    </tr>
                </table></td>
                <td width="6">&nbsp;</td>
                <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                    </tr>
                    <tr>
                      <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="50"><img src="../Images/Company/per_4.gif" width="46" height="47"></td>
                                  <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="right" class="font-14"><strong>猎头服务</strong></td>
                                      </tr>
                                      <tr>
                                        <td align="right" class="font-14"><strong>Headhunting 
                                          Services</strong></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td>资深专业 我们有庞大的专业咨询顾问团队为您提供专业猎头服务<br>
                              快速精准 迅捷、准确的甄选候选人才<br>
                              高效全面 猎头服务与专业筛选的双重组合</td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
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
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#104e9e">最新简历</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
              <tr align="center" bgcolor="f3f3f3"> 
                <td width="15%" height="25">姓名</td>
                <td width="10%" height="25">性别</td>
                <td width="10%" height="25">年龄</td>
                <td width="12%" height="25">学历</td>
                <td width="27%" height="25" bgcolor="f3f3f3">毕业学校</td>
                <td height="25">所学专业</td>
              </tr>
              <% 
SQL = "Select Top 15 I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 Order By B.LastUpdate_Time Desc"
Set Rs = Conn.Execute(SQL)
For i = 1 to 11 
 If Rs.Eof Then Exit For
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 Age             = Rs(4)
 LastSchool      = Rs(5)
 Speciality      = Rs(6)
 ResumeMode      = Rs(7)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr> 
                <td height="24" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                <td height="23" align="center"><%= Cls_Sex(Sex) %></td>
                <td height="23" align="center"><%= Age %></td>
                <td height="23" align="center"><%= Cls_Edus(Edus) %></td>
                <td height="23"><%= LastSchool %></td>
                <td height="23"><%= Speciality %></td>
              </tr>
              <% 
 Rs.Movenext
 If Rs.Eof Then Exit For 
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 Age             = Rs(4)
 LastSchool      = Rs(5)
 Speciality      = Rs(6)
 ResumeMode      = Rs(7)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr bgcolor="f9f9f9"> 
                <td height="24" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                <td height="23" align="center"><%= Cls_Sex(Sex) %></td>
                <td height="23" align="center"><%= Age %></td>
                <td height="23" align="center"><%= Cls_Edus(Edus) %></td>
                <td height="23"><%= LastSchool %></td>
                <td height="23"><%= Speciality %></td>
              </tr>
              <% 
 Rs.Movenext
Next
Rs.Close
 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right">[<a href="../Company/Com_Search_New.asp" target="_blank"><u>更多求职简历...</u></a>]&nbsp;</td>
              </tr>
            </table> </td>
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
Call CloseDB
 %>
