<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim PageNo,PCount,RCount,Psize,TheRecord,i
Dim Jobid,JobName,JobFlag,ViewClicks,SendClicks,LastUpdate_Time,BeginAndEndDate
'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobManage"
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
'//0企业名称,1会员有否通过审核
'//如 Tmp(0,0) 表示企业名称
Rs.Close
Set Cmd = Nothing
'//判断会员有没有通过审核
Flag           = Tmp(1,0)
If Flag = False Then
 Response.redirect "../Public/Error.asp?param=2003"
 Response.End()
End if

'//查看联系方式的记录
SQL = "Select * From [pH_Company_VipClick] where Comid='"&Comid&"' Order by Vip_id Desc"
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
TheRecord = (PageNo-1)*Psize '//计算记录编号的基数
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_JobManage.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 职位管理</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form name="form" method="post">
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="2"></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                            <tr> 
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;联系方式查看记录</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td><%= Cls_Page("Com_VipClicks.asp",PageNo,PCount,RCount) %></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#eeeeee" class="text01">
                            <tr align="center" valign="bottom" bgcolor="f5f5f5" > 
                              <td width="8%" height="22">编 号</td>
                              <td width="14%" bgcolor="f5f5f5">姓&nbsp;&nbsp;名</td>
                              <td width="6%">性&nbsp;别</td>
                              <td width="9%" bgcolor="f5f5f5">学&nbsp;历</td>
                              <td width="25%">毕业学校</td>
                              <td width="25%">所学专业</td>
                              <td width="10%">次 数</td>
                            </tr>
                            <%
For i=1 to Psize
 If Rs.Eof Then Exit For
 Perid = Rs("Perid") 									
 SQL = "Select RealName,Sex,Edus,LastSchool,Speciality From [pH_Person_Info] Where Perid='"&Perid&"'"
 Set Re = Conn.Execute(SQL)		
 RealName       = Re("RealName")
 Sex			= Re("Sex")
 Edus			= Re("Edus")
 LastSchool		= Re("LastSchool")
 Speciality		= Re("Speciality")
 Sex_Str = Cls_Sex(Sex)
 Edus_Str = Cls_Edus(Edus)
 Re.Close
		%>
                            <tr align="center" valign="middle" bgcolor="#FFFFFF" class="text01"> 
                              <td width="80" height="22"><%= TheRecord+i %></td>
                              <td width="50" align="left" bgcolor="#FFFFFF"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                              <td width="45"><%= Sex_Str %></td>
                              <td width="55"><%= Edus_Str %></td>
                              <td width="150" align="left"><%= LastSchool %></td>
                              <td align="left"><%= Speciality %></td>
                              <td align="center" bgcolor="#FFFFFF"><%= Rs("Clicks") %></td>
                            </tr>
                            <% 
 
 Rs.movenext
Next 
%>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="2"></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="40" align="center">&nbsp; </td>
                </tr>
              </form>
            </table>
            
          </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 


'//关闭数据库连接
Rs.Close
Set Rs  = Nothing
CloseDB
 %>
