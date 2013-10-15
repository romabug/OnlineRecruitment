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
'Flag           = Tmp(1,0)
'If Flag = False Then
 'Response.redirect "../Public/Error.asp?param=2003"
 'Response.End()
'End if

'//职位列表
Set Comm = Server.Createobject("ADODB.Command")
Set Rs = Server.Createobject("ADODB.Recordset")
Comm.ActiveConnection = Conn
Comm.CommandText = "Com_JobManage_JobList"
Comm.CommandType = 4
Comm.Parameters.Append Comm.CreateParameter("@Comid",200,1,30)
Comm.Parameters("@Comid") = Comid
Rs.open Comm,,1,1

Set Comm    = Nothing '//关闭Command对象

Rs.Pagesize = 10
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
            <!--#include file="../Lefter/Company_Job.asp" -->
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;职位管理</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td><%= Cls_Page("Com_JobManage.asp",PageNo,PCount,RCount) %></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
                            <tr align="center" bgcolor="f5f5f5"> 
                              <td width="7%" height="23">编号</td>
                              <td width="23%" height="23" bgcolor="f5f5f5">招聘职位</td>
                              <td width="10%" height="23" bgcolor="f5f5f5">状 态</td>
                              <td width="12%" height="23" bgcolor="f5f5f5">浏览/应聘</td>
                              <td width="25%" height="23" bgcolor="f5f5f5">招聘起止日期</td>
                              <td height="23">单项操作</td>
                              <td width="6%" height="23">选择</td>
                            </tr>
                            <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Jobid               = Rs("Jobid")
 JobName             = Rs("JobName")
 JobFlag             = Cls_JobFlag(Rs("JobFlag"))
 ViewClicks          = Rs("ViewClicks")
 SendClicks          = Rs("SendClicks")
 LastUpdate_Time     = Rs("LastUpdate_Time")
 BeginAndEndDate     = FormatDateTime(LastUpdate_Time,2)&"～"&Rs("End_Date")				  
%>
                            <tr align="center"> 
                              <td height="23" bgcolor="#FFFFFF"><%= TheRecord+i %></td>
                              <td height="23" align="left" bgcolor="#FFFFFF"><a href="Info/Com_JobView.asp?Param=<%= Jobid %>" target="_blank"><%= JobName %></a></td>
                              <td height="23" bgcolor="#FFFFFF"><%= JobFlag %></td>
                              <td height="23" bgcolor="#FFFFFF"><%= ViewClicks&"/"&SendClicks %></td>
                              <td height="23" bgcolor="#FFFFFF"><%= BeginAndEndDate %></td>
                              <td height="23" bgcolor="#FFFFFF"><a href="Com_JobEdit.asp?Param=<%= Jobid %>">编辑</a>|<a href="Com_JobCopy.asp?Param=<%= Jobid %>">复制</a>|<a href="../Person/Per_Search_Jobauto.asp?Param=<%= Jobid %>" target="_blank">匹配</a></td>
                              <td height="23" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= JobId %> name=param></td>
                            </tr>
                            <% 
 Rs.Movenext
Next
Rs.Close
 %>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td align="right"> <INPUT onclick=SelectAllItem(this.form.param) type=checkbox value=all name=chk_all>
                                选中所有招聘职位 </td>
                            </tr>
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
                  <td height="40" align="center"> <input type="button" name="refresh" value="刷新职位" onClick="javascript:theForm_Submit(2001)"> 
                    <input type="button" name="publish" value="重新发布" onClick="javascript:theForm_Submit(2005)"> 
                    <input type="button" name="open" value="激活职位" onClick="javascript:theForm_Submit(2002)"> 
                    <input type="button" name="close" value="屏蔽职位" onClick="javascript:theForm_Submit(2003)"> 
                    <input type="button" name="delete" value="删除职位" onClick="javascript:theForm_Submit(2004)"> 
                  </td>
                </tr>
              </form>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><hr size="1" color="#CCCCCC"></td>
              </tr>
              <tr> 
                <td><font color="#666666">操作说明： </font></td>
              </tr>
              <tr> 
                <td> <font color="#666666">刷新职位 － 更新职位的发布日期,能将职位排到网站搜索结果的前面,提高招聘效果 
                  ;<br>
                  重新发布 － 将职位以当天为开始日期,截止时限自动改为3个月来重新发布职位 ;<br>
                  激活职位 － 对“已屏蔽”的职位重新进行招聘 ;<br>
                  屏蔽职位 － 对“暂时不需要招聘”的职位进行隐藏,以后如果需要招聘时再激活该职位即可 ;<br>
                  删除职位 － 对“已经招聘完成”,以后不再需要招聘的职位彻底进行删除 ;<br>
                  编辑 － 对当前的职位的信息和其他参数进行修改 ;<br>
                  复制 － 对当前的职位复制一个相同的，然后根据需要做适当的条件修改发布一个新职位 ;<br>
                  匹配 － 即对当前的职位条件自动搜索出近3个月符合该职位条件的个人简历 .</font></td>
              </tr>
            </table></td>
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
Set Rs  = Nothing
CloseDB
 %>
