<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
'Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"15") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Replace_text(request("action"))
Jobid = Replace_text(request("Jobid"))
Perid = Replace_text(request("Perid"))
PageNo = Replace_text(request("pageno"))

If Perid = "" Then
 Response.write "<script language=JavaScript>alert('请选择记录！');location.href='"&PageNo&"';</script>"
 Response.End()
End if

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到函数
End Select

'获取企业信息
Set Rs = Conn.Execute("Select c.Comid,c.CompanyName,c.Email,j.Jobname From [pH_Job_Base] As j Inner Join [pH_Company_Base] As c On j.Comid=c.Comid Where j.Jobid="&Jobid)
If Not Rs.Eof Then
 Comid = Rs("Comid")
 CompanyName = Rs("CompanyName")
 Email = Rs("Email")
 Jobname = Rs("Jobname")
End if
Rs.CLose

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发送邮件</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>发送邮件</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="55%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">收件企业：</td>
                  <td bgcolor="f5f5f5"><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">招聘职位：</td>
                  <td bgcolor="f5f5f5"><%= JobName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">收件地址：</td>
                  <td bgcolor="f5f5f5"><%= Email %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">邮件标题：</td>
                  <td bgcolor="f5f5f5"><input name="title" type="text" id="title" size="40" maxlength="50" value="<%= Cls_WebName&"为您推荐人才" %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">内 
                    容：</td>
                  <td bgcolor="f5f5f5"><textarea name="memo" cols="40" rows="8" id="memo"><%= CompanyName %>，您好
				  我们是<%= Cls_Webname %>,根据贵公司在网站发布的招聘职位-<%= Jobname %>，现在想贵公司推荐下列人才，以供筛选和录用：
				  
				  </textarea>
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">&nbsp; </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="发送邮件"> 
                    <input name="email" type="hidden" id="Perid" value="<%= Email %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>">
					<input name="jobid" type="hidden" id="pageno" value="<%= jobid %>">
                    <input type="hidden" name="perid" value="<%= Perid %>"> </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '发送邮件
 Dim Person_Str
 Perid       = Replace_text(request("Perid"))
 jobid		 = Replace_text(request("jobid"))
 Email		 = Replace_text(request("Email"))
 PageNo      = Replace_text(request("PageNo"))
 Title       = Replace_text(request("Title"))
 Memo        = Replace_text(request("Memo"))
 Person_Str  = ""
 
 Memo = Memo & "<style type=""text/css"">td{font-size: 12px;line-height: 1.6em;}</style>" 
 Memo = Memo & "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC"">"
 Memo = Memo & "<tr align=""center"" bgcolor=""#efefef"">"
 Memo = Memo & "<td width=""10%"">姓名</td>"
 Memo = Memo & "<td width=""7%"">性别</td>"
 Memo = Memo & "<td width=""7%"">年龄</td>"
 Memo = Memo & "<td width=""10%"">学历</td>"
 Memo = Memo & "<td width=""17%"">毕业院校</td>"
 Memo = Memo & "<td width=""17%"">所学专业</td>"
 Memo = Memo & "<td width=""17%"">求职意向</td>"
 Memo = Memo & "<td>发布日期</td></tr>" 
 
 Ncid = Split(Perid,",")
 For i = 0 To UBound(Ncid)	
  '查找会员的数据  
  Set Rs = Conn.Execute("Select B.Perid,B.Username,b.LastUpdate_Time,I.RealName,I.Sex,I.Age,I.Edus,i.LastSchool,i.Speciality,i.WorkWillClass1 From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid And b.Perid='"&Trim(Ncid(i))&"'")
  If Not Rs.Eof Then
   Person_Str = Person_Str & "<tr align=""center"" bgcolor=""#ffffff"">"
   Person_Str = Person_Str & "<td width=""10%""><a href="""&Cls_WebUrl&"Person/Per_Resume.asp?Param="&Rs("Perid")&""" target=_blank>"&Rs("Realname")&"</a></td>"
   Person_Str = Person_Str & "<td width=""7%"">"&Cls_Sex(Rs("Sex"))&"</td>"
   Person_Str = Person_Str & "<td width=""7%"">"&Rs("Age")&"</td>"
   Person_Str = Person_Str & "<td width=""10%"">"&Cls_Edus(Rs("Edus"))&"</td>"
   Person_Str = Person_Str & "<td width=""17%"">"&Rs("LastSchool")&"</td>"
   Person_Str = Person_Str & "<td width=""17%"">"&Rs("Speciality")&"</td>"
   Person_Str = Person_Str & "<td width=""17%"">"&Rs("WorkWillClass1")&"</td>"
   Person_Str = Person_Str & "<td>"&FormatDateTime(Rs("LastUpdate_Time"),2)&"</td></tr>" 
  End if
  Rs.Close
 Next
 
 Memo = Memo & Person_Str
 Memo = Memo & "</table>"
 Memo = Memo & "<hr size=""1"" color=""#cccccc""><br>"
 Memo = Memo & Cls_WebName&" "&Cls_Domain&"<br>"
 Memo = Memo & Date()
 If Memo <> "" Then Memo = Replace(Memo,Chr(13),"<Br>")
 
 
 '发送邮件
  Call SendEmail(Email,Memo,Title)
 Response.write "<script language=JavaScript>alert('邮件发送成功！');location.href='"&PageNo&"&Jobid="&jobid&"';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

