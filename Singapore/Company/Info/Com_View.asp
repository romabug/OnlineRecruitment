<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Param
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
Dim Vip_Flag,Vip_Date,Vip_EndDate
Param     = Replace_Text(Request.QueryString("Param"))
'//获取会员登陆的标记
Comid     = Param
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Preview"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称,1营业执照,2行业,3企业性质,4成立年份,5月,6日,7员工人数,8注册资金,9资金类型,10企业简介,11联系人,12电话,13电话保密,14传真,15邮件,16邮件保密,17企业所在省,18城市,19地址,20邮政编码,21企业网址,22LOGO,23图片屏蔽,24最后更新时间,25VIP标记,26VIP开始时间,27截止时间,28显示次数,29有无视频,30开通时间,31截止时间,32视频状态,33视频文件
'//如 Tmp(0,0) 表示企业名称
'//关闭数据库对象
Rs.Close
Set Cmd = Nothing
'//更新企业的显示次数
Conn.Execute("Update [pH_Company_Base] Set ViewClicks=ViewClicks+1 Where Comid='"&Comid&"'")

SetDate           = Tmp(4,0)&"年"&Tmp(5,0)&"月"&Tmp(6,0)&"日"
Properity         = Cls_Properity(Tmp(3,0))                        '//获得企业性质
Industry          = Cls_Industry(Tmp(2,0))                         '//获得行业
Currency_Str      = Tmp(8,0)&"万/元 "&Cls_Currency(Tmp(9,0))       '//注册资金和类型
Workers           = Cls_Workers(Tmp(7,0))                          '//获得员工数
Locus             = Tmp(17,0)&Tmp(18,0)
LogoUrl           = Tmp(22,0)
LogoKeep          = Tmp(23,0)
Company_Memo      = Tmp(10,0)

ContactPerson     = Tmp(11,0)
'//判断联系电话是否是保密的
If Tmp(13,0) = True Then
 Phone            = "符合企业招聘要求则邀请"
 CompanyFax       = "符合企业招聘要求则邀请"
Else
 Phone            = Tmp(12,0)
 CompanyFax       = Tmp(14,0)
End if
'//判断联系邮件是否是保密的
If Tmp(16,0) = True Then
 Email            = "符合企业招聘要求则邀请"
Else
 Email            = Tmp(15,0)
End if
WebHome           = Tmp(21,0)
Address           = Tmp(19,0)
ZipCode           = Tmp(20,0)
Vip_Flag          = Tmp(25,0)
Vip_Date          = Tmp(26,0)
Vip_EndDate       = Tmp(27,0)

Nc_Video           = Tmp(29,0)
Video_Date         = Tmp(30,0)
Video_EndDate      = Tmp(31,0)
Video_Flag         = Tmp(32,0)
Video_File         = Tmp(33,0) 

If WebHome = "http://" Then WebHome = ""
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title> 新加坡招聘 出国劳务 劳务输出 劳务派遣 <%= Tmp(0,0) %></title>
</head>
<style>
.buttonstyle {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid; BACKGROUND-IMAGE: url(../../Images/input_bg2.jpg); FONT: 12px 宋体; BORDER-LEFT: #ffffff 0px solid; WIDTH: 135; CURSOR: hand; COLOR: #333333; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 22px; BACKGROUND-COLOR: #e7e7e7
}
</style>
<script language="JavaScript" src="../../js/Search_Three.js"></script>
<script language="JavaScript">
 function search_check()
 {
 if (document.quicksearch.btnSltFuntype1.value=="选择/修改"){
  alert("-请选择职位类别");
  //document.quicksearch.btnSltFuntype1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltArea1.value=="选择/修改"){
  alert("-请选择地区");
  //document.quicksearch.btnSltArea1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltIndustry1.value=="选择/修改"){
  alert("-请选择行业类别");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }
  if (document.quicksearch.btnSltIssuedate1.value=="选择/修改"){
  alert("-请选择更新日期");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }  
 if (document.quicksearch.key.value=="请输入关键字"){
  alert("-请输入关键字-");
  document.quicksearch.key.focus();
  return false;
 }
 }
</script>

<SCRIPT language=javascript>
<!--
buildDiv("popupArea","popupFuntype","popupSubfuntype","popupIndustry","popupIssuedate");
//-->
</SCRIPT>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Header/Info/Person_Search.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF"><table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="8"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="195"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td align="center"><img src="../../Images/Company/welcome.gif" width="149" height="43"></td>
              </tr>
            </table>
 <% If Nc_Video = True And DateDiff("d",Video_Date,Date())>=0 And DateDiff("d",Video_EndDate,Date())<=0  Then %>
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="159" align="center" valign="middle" background="../../Images/Company/Videoborder_180.jpg"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="170" height="148">
                          <param name="movie" value="../../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
                          <param name="quality" value="high">
                          <embed src="../../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" width="170" height="148" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></object> 
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>
<% End if %>
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../../Images/mid_left.gif" width="31" height="33"></td>
                      <td background="../../Images/mid_bg.gif"><strong><font color="#ff7300">招聘职位</font></strong></td>
                      <td width="30"><img src="../../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% 
SQL = "Select Jobid,JobName From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And End_Date>=getdate() Order By LastUpdate_Time Desc,JobId Desc"
Set Rs_a = Conn.Execute(SQL)
If Not Rs_a.Eof Then
 While Not Rs_a.Eof
  Response.write "<tr><td height=25>&middot;<a href=""Com_Job.asp?Comid="&Comid&"&Param="&Rs_a("Jobid")&""">"&Rs_a("JobName")&"</a></td></tr>"
  Rs_a.Movenext
 Wend 
End if
Rs_a.Close
 %>
                   
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="1" bgcolor="#cfd0cf"></td>
          <td width="10"></td>
          <td width="554" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="25" align="center"><img src="../../Images/Company/arrow1.gif" width="13" height="9"></td>
                      <td height="30" class="font-14"><b><%= Tmp(0,0) %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="21">&nbsp;</td>
                      <td width="21" rowspan="2"><img src="../../Images/Company/company_left.gif" width="22" height="22"></td>
                      <td width="78" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_wbg.gif"><strong>企业简介</strong></td>
                      <td width="28" rowspan="2"><img src="../../Images/Company/company_middle.gif" width="28" height="22"></td>
                      <td width="80" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_ybg.gif"><a href="Com_Joball.asp?Param=<%= Comid %>">招聘职位</a></td>
                      <td width="24" rowspan="2"><img src="../../Images/Company/company_right.gif" width="24" height="22"></td>
                      <td width="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height=1 bgcolor=#ddddda></td>
                      <td height=1 bgcolor=#ddddda></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>公司信息：</strong></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="1" cellpadding="0">
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">成立日期：</td>
                            <td height="25"><%= SetDate %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">企业性质：</td>
                            <td height="25"><%= Properity %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">所属行业：</td>
                            <td height="25"><%= Industry %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">注册资金：</td>
                            <td height="25"><%= Currency_Str %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">员工人数：</td>
                            <td height="25"><%= Workers %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">所在地区：</td>
                            <td height="25"><%= Locus %></td>
                          </tr>
                        </table></td>
                      <td width="150" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"> <% 
If LogoKeep = 0 Then
 If LogoUrl <> Null or LogoUrl <> "" Then
  Response.write "<img src=""../../UpLoadFiles/CompanyFile/"&LogoUrl&""" width=""135"" height=""160"">"
 Else
  Response.write "<img src=""../../UpLoadFiles/DefaultFile/Company.gif"" width=""135"" height=""160"">"
 End if
Else
 Response.Write "图片被屏蔽"
End if
 %> </td>
                          </tr>
                          <tr> 
                            <td height="6"></td>
                          </tr>
                        </table>
                        <% If Nc_Video = True And DateDiff("d",Video_Date,Date())>=0 And DateDiff("d",Video_EndDate,Date())<=0  Then %>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><img src="../../Images/video2.gif" width="14" height="16" align="absmiddle"> 
                              <a href="../../Company/Com_VideoView.asp?Comid=<%= Comid %>" target="_blank"><font color="#ff6600">播放该企业视频展示</font></a> 
                            </td>
                          </tr>
                        </table>
                        <% End if %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>公司简介：</strong></td>
              </tr>
              <tr> 
                <td><%= Company_Memo %></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <% 
If Vip_Flag = True And DateDiff("d",Now(),Vip_Date)<=0 And DateDiff("d",Now(),Vip_EndDate)>=0 Then

 %>
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>联系方式：</strong></td>
              </tr>
              <tr> 
                <td>
                  <% If Not IsArray(Session("Person")) Then %>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="30">&nbsp;注册并登陆后才能查看企业的联系方式；请<a href="../../Public/MemberLogin.asp">[<u>开始登陆</u>]</a>或者<a href="../../Public/Register.asp">[<u>免费注册</u>]</a></td>
                    </tr>
                  </table>
                  <% Else %>
                  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">联系人：</td>
                      <td height="25"><%= ContactPerson %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">联系电话：</td>
                      <td height="25"><%= Phone %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">传真号码：</td>
                      <td height="25"><%= CompanyFax %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">邮箱地址：</td>
                      <td height="25"><%= Email %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">企业网址：</td>
                      <td height="25"><%= WebHome %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">邮政编码：</td>
                      <td height="25"><%= ZipCode %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">通讯地址：</td>
                      <td height="25"><%= Address %></td>
                    </tr>
                  </table>
            <% 
End if
 %>
				  </td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <% 
End if
 %>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Include/Info/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 

'//关闭数据库连接
Set Rs = Nothing
CloseDB
 %>
