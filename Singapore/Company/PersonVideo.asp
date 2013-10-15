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
<title><%= Cls_WebName %> - 视频简历</title>
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
    <td><!--#include file="../Header/Company_PersonVideo.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="4"></td>
        </tr>
      </table>
	  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="180" valign="top" bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;">
                  <!--#include file="../Public/Com_MemberSession.asp" -->
                </td>
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
SQL = "Select Top 10 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 10 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 10 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 10 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
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
            </table></td>
          <td width="5">&nbsp;</td>
          <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="31" height="33"><img src="../Images/mid_left_com.gif" width="31" height="33"></td>
                <td background="../Images/mid_bg.gif"><strong><font color="#104e9e">简历推荐</font></strong></td>
                <td width="30"><img src="../Images/mid_right.gif" width="30" height="33"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <% 
Set Rs = Server.CreateObject("ADODB.recordset")
SQL = "Select Top 9 I.Perid,I.RealName,I.Sex,I.Edus,I.ResumeMode,I.Video_Photourl,b.LastUpdate_Time From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 And I.Nc_Video=1 And I.Video_Flag<>2 And DateDiff(d,Video_Date,Getdate())>=0 And DateDiff(d,Video_EndDate,Getdate())<=0 And i.Video_Photourl<>'' And i.Video_BestFlag=1 Order By B.LastUpdate_Time Desc"
Rs.open SQL,Conn,1,1
For i = 1 to 3
 If Rs.Eof Then Exit For
 %>
              <tr> 
                <% 
			  For j = 1 to 3
 				If Rs.Eof Then Exit For
				Perid = Rs("Perid")
				RealName = Rs("RealName")
				Sex = Rs("Sex")
				Edus = Rs("Edus")
				ResumeMode = Rs("ResumeMode")
				Video_Photourl = Rs("Video_Photourl")
				LastUpdate_Time = Rs("LastUpdate_Time")
			   %>
                <td width="33%"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="97" rowspan="4"> <a href="../Person/Per_VideoView.asp?Perid=<%= Perid %>" target="_blank"><img src="../UpLoadFiles/PersonVideoPhoto/<%= Video_Photourl %>" width="90" height="75" border="0" class="photoborder"></a></td>
                      <td height="20"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><b><%= RealName %></b></a></td>
                    </tr>
                    <tr> 
                      <td height="20">性别：<%= Cls_Sex(Sex) %></td>
                    </tr>
                    <tr> 
                      <td height="20">学历：<%= Cls_Edus(Edus) %></td>
                    </tr>
                    <tr> 
                      <td height="20">日期：<%= Month(LastUpdate_Time)&"-"&Day(LastUpdate_Time) %></td>
                    </tr>
                  </table></td>
                <% 
				  Rs.Movenext
				 Next
				 %>
              </tr>
              <tr> 
                <td colspan="3" height="6"></td>
              </tr>
              <% 
Next
Rs.Close
 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#104e9e">视频简历</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
              <tr align="center" bgcolor="f3f3f3"> 
                <td width="15%" height="25">姓名</td>
                <td width="10%" height="25">性别</td>
                <td width="10%" height="25">年龄</td>
                <td width="12%" height="25">学历</td>
                <td width="27%" height="25">毕业学校</td>
                <td height="25">所学专业</td>
              </tr>
              <% 
SQL = "Select Top 10 I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode,I.Video_FilePath From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And Nc_Video=1 And DateDiff(d,Video_Date,GetDate())>=0 And DateDiff(d,Video_EndDate,GetDate())<=0 Order By B.LastUpdate_Time Desc"
Set Rs = Conn.Execute(SQL)
For i = 1 to 5 
 If Rs.Eof Then Exit For
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 Age             = Rs(4)
 LastSchool      = Rs(5)
 Speciality      = Rs(6)
 ResumeMode      = Rs(7)
 Video_FilePath  = Rs(8)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr> 
                <td height="23" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
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
 Video_FilePath  = Rs(8)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr bgcolor="f9f9f9"> 
                <td height="23" align="center"><a href="../Person/Per_VideoView.asp?Perid=<%= Perid %>" target="_blank"><%= RealName %></a></td>
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
                <td align="right">[<a href="../Company/Com_Search_PersonVideo.asp" target="_blank"><u>更多视频简历...</u></a>]&nbsp;</td>
              </tr>
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
Set Rs = Nothing
Call CloseDB
 %>
