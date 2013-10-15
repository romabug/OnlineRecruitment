<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL,Vip_Flag,Tmp
Dim Comid,UserName,Jobid,JobName,RealName

Action = Request.QueryString("action")
If Action = "save" Then Call Save_Submit() '保存数据 

'//获取用户的登陆标记
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-登录后才能进行该操作！-');window.close();</script>"
 Response.End()
End if
'//判断企业会员的类型，免费会员不能发送面试邀请
If Session("Nc_Vip") <> 1 Then
  Response.write "<script>alert('免费会员不能进行该操作！请升级会员...');window.close();</script>"
  Response.End()
End if

'//获取和判断参数
Ncid = Replace_Text(Request("perid")) '个人会员ID
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');window.close();</script>"
 Response.End()
End if

'//从数据库中获取个人用户的资料
SQL = "Select RealName,Age,Edus,Sex,Locus_Area,Locus_City,WorkWillClass1 From [pH_Person_Info] Where Perid='"&Ncid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then 
 RealName = Rs("RealName")
 Age = Rs("Age")
 Edus = Cls_Edus(Rs("Edus"))
 Sex = Cls_Sex(Rs("Sex"))
 Locus = Rs("Locus_Area")&Rs("Locus_City")
 WorkWillClass = Rs("WorkWillClass1")
End if
Rs.Close


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 发送面试邀请</title>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="470" border="0" align="center" cellpadding="0" cellspacing="0">
  <Form action="?action=save" method="post" name="theForm">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr>
                  <td height="25" bgcolor="f9f9f9"> &nbsp;<img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                    <strong>加入人才库</strong></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">姓 名：</td>
                  <td height="25"><%= RealName %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">性 别：</td>
                  <td height="25" bgcolor="f9f9f9"><%= Sex %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">年 龄：</td>
                  <td height="25"><%= Age %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">学 历：</td>
                  <td height="25"><%= Edus %></td>
                </tr>
                <tr bgcolor="f9f9f9">
                  <td height="25" align="right">所在地区：</td>
                  <td height="25"><%= Locus %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">求职意向：</td>
                  <td height="25"><%= WorkWillClass %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">加入人才库：</td>
                  <td height="25">
				  <select name="classid"  style="width:160px">
				  <option value="0">全部类别</option>
                  <% 
				  Set Rs = Conn.Execute("Select Classid,ClassName From [pH_Company_PersonDB_Class] Where Comid='"&Comid&"' order by AddDate Desc")
				  While Not Rs.Eof
				   Response.write "<option value="&Rs(0)&">"&Rs(1)&"</option>"
				   Rs.Movenext
				  Wend
				  Rs.Close
				   %>
                    </select> </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="40" align="center"> 
        <input type="submit" name="Submit" value="提 交" style="height:30px;">
        <input type="button" name="Submit2" value="取消" style="height:30px;" onClick="window.close();">
        
        <input type="hidden" name="perid" value="<%= Ncid %>">

		</td>
    </tr>
  </Form>
</table>
</body>
</html>
<% 
Sub Save_Submit() '保存数据 
 Comid         = Session("Company")(2)
 Perid         = Replace_Text(Request.Form("perid"))
 Classid	   = Replace_Text(Request.Form("classid"))

 '//保存数据到企业发件夹表
 SQL = "Insert Into [pH_Company_PersonDB] (Perid,Comid,AddDate,Classid) Values ('"&Perid&"','"&Comid&"',GetDate(),"&Classid&")"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('操作成功！');window.close();</script>"

End Sub

'//关闭数据库连接
CloseDB
 %>
