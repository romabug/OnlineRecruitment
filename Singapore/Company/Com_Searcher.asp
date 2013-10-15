<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName

Action = Request.QueryString("action")
If Action = "del" Then Call Del_Submit() '跳转到删除函数
'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称
'//如 Tmp(0,0) 表示企业名称
'//关闭记录集对象
Rs.Close
Set Cmd = Nothing

'//功能代码
CompanyName  = Tmp(0,0)
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 搜索器</title>
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
            <!--#include file="../Lefter/Company_Search.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			
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
                            <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;搜索器</font></b> 
                              [您最多可以建立三个职位搜索器]</td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                          <tr bgcolor="f5f5f5"> 
                            <td height="24">&nbsp;搜索器名称</td>
                            <td width="20%" height="24" align="center">操 作</td>
                          </tr>
                          <% 
SQL = "Select Ncid,Searcher_Name From [pH_Company_Searcher] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Response.write "<tr bgcolor=""f9f9f9""><td height=""25"">&nbsp;暂时没有创建搜索器</td><td height=""25"" align=""center"">&nbsp;</td></tr>"
Else
 While Not Rs.Eof
  Ncid           = Rs(0)
  Searcher_Name  = Rs(1)
 %>
                          <tr bgcolor="f9f9f9"> 
                            <td height="25">&nbsp;<a href="Com_Searcher_Base.asp?Param=<%= Ncid %>" target="_blank"><u><%= Searcher_Name %></u></a></td>
                            <td height="25" align="center"> <a href="?action=del&param=<%= Ncid %>" onClick="return confirm('是否删除该记录');"><u>删除</u></a> 
                              <a href="Com_Searcher_Edit.asp?Param=<%= Ncid %>"><u>编辑</u></a> 
                            </td>
                          </tr>
                          <% 
  Rs.Movenext
 Wend
End if 
Rs.Close 
 %>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                          <tr> 
                            <td height="25" bgcolor="f5f5f5"><font color="#000000"><strong>&nbsp;</strong></font><strong>说明</strong><br> 
                              &nbsp;■点击搜索器名称可以按您的搜索条件来查询符合条件的职位信息<br> &nbsp;■编辑：查看/修改搜索器中的搜索条件<br> 
                              &nbsp;■删除：将搜索器删除</td>
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
                <td height="40" align="center"><input type="button" name="Submit" value="新增搜索器" style="height:30px;" onClick="location.href='Com_Searcher_Add.asp';">
                  </td>
              </tr>
			 
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
Sub Del_Submit() '删除搜索器的记录
 Call Check_url()    '防止外部站点提交数据
 '//提交数据
 Comid                = Session("Company")(2)
 Ncid                = Replace_Text(Request("param"))
 Check_Id(Ncid)
 
 SQL = "Delete From [pH_Company_Searcher] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)

 CloseDB
 Response.redirect "Com_Searcher.asp"

End Sub

'//关闭数据库连接
CloseDB
 %>
