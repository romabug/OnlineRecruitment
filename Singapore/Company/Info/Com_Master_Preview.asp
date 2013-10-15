<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
'//判断用户是否是管理员
If Session("Web_Suppername") = "" Then 
 Response.write "<script>alert('-当前用户没有权限进行该操作！-');window.close();</script>"
 Response.End()
End if

'//获取会员登陆的标记
'Username  = Session("Company")(0)
Comid     = Replace_Text(Request.QueryString("param"))
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
Phone             = Tmp(12,0)
CompanyFax        = Tmp(14,0)
Email             = Tmp(15,0)
WebHome           = Tmp(21,0)
Address           = Tmp(19,0)
ZipCode           = Tmp(20,0)

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
<title><%= Cls_WebName %> -- 企业资料预览</title>
</head>
<style>
.buttonstyle {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid; BACKGROUND-IMAGE: url(../../Images/input_bg2.jpg); FONT: 12px 宋体; BORDER-LEFT: #ffffff 0px solid; WIDTH: 135px; CURSOR: hand; COLOR: #333333; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 22px; BACKGROUND-COLOR: #e7e7e7
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
          <td width="195"> <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="1" bgcolor="#cfd0cf"></td>
          <td width="10"></td>
          <td width="554" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="25" align="center"><img src="../../Images/Company/arrow1.gif" width="13" height="9"></td>
                      <td height="25" class="font-14"><b><%= Tmp(0,0) %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10" background="../../Images/Company/bg.gif"></td>
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
                            <td height="6"></td>
                          </tr>
                          <tr> 
                            <td align="center"> 
                              <% 
If LogoKeep = 0 Then
 If LogoUrl <> Null or LogoUrl <> "" Then
  Response.write "<img src=""../../UpLoadFiles/CompanyFile/"&LogoUrl&""" width=""135"" height=""160"">"
 Else
  Response.write "<img src=""../../UpLoadFiles/DefaultFile/Company.gif"" width=""135"" height=""160"">"
 End if
Else
 Response.Write "图片被屏蔽"
End if
 %>
                            </td>
                          </tr>
                          <tr> 
                            <td height="6"></td>
                          </tr>
                        </table></td>
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
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>联系方式：</strong></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
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
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#FF821E" height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
              <tr align="center" bgcolor="FFEDDF"> 
                <td width="35%" height="25">职位名称</td>
                <td width="15%" height="25">工作地点</td>
                <td width="18%" height="25">发布日期</td>
                <td width="18%" height="25">有效日期</td>
                <td height="25">招聘人数</td>
              </tr>
              <% 
SQL = "Select Jobid,JobName,Work_Area,Work_City,LastUpdate_Time,End_Date,Number From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And End_Date>=getdate() Order By LastUpdate_Time Desc,JobId Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open SQL,Conn,1,1
Rs.Pagesize = 20
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

For i = 1 to Psize
  If Rs.Eof Then Exit For
  Jobid       = Rs("Jobid")
  JobName     = Rs("JobName")
  Address	  = Rs("Work_Area")&Rs("Work_City")
  BeginDate	  = FormatDatetime(Rs("LastUpdate_Time"),2)
  EndDate	  = Rs("End_Date")
  Numbers	  = Rs("Number")
  If Numbers = 0 Then Numbers = "若干人"
 %>
              <tr align="center" bgcolor="#FFFFFF"> 
                <td height="25"><a href="Com_Master_JobView.asp?Comid=<%= Comid %>&Param=<%= Jobid %>" target="_blank"><%= JobName %></a></td>
                <td height="25"><%= Address %></td>
                <td width="17%" height="25"><%= BeginDate %></td>
                <td height="25"><%= EndDate %></td>
                <td height="25"><%= Numbers %></td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td height="1" colspan="5" bgcolor="#dddddd"></td>
              </tr>
              <% 
  Rs.Movenext
 Next
 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 
                  分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
                <td width="50%" align="right"> 
                  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Comid&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Comid&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Comid&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Comid&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>
                </td>
              </tr>
            </table></td>
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
