<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"145") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Lessonid = Replace_Text(Request.QueryString("Param"))
PageNo = Replace_Text(Request.QueryString("PageNo"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Submit() '//调用保存数据的函数


'获取该记录
Set Rs = Conn.Execute("Select * From [pH_Educate_Lesson] Where Ncid="&Cstr(Lessonid))
If Rs.Eof Then
 Response.write "没有找到指定的记录！"
 Response.End()
Else
 LessonName			= Rs("LessonName")
 Properity			= Rs("Properity")
 BeginDate			= Rs("BeginDate")
 EndDate			= Rs("EndDate")
 Locus_Area			= Rs("Locus_Area")
 Locus_City			= Rs("Locus_City")
 Address			= Rs("Address")
 Price				= Rs("Price")
 WebPrice			= Rs("WebPrice")
 EducateName		= Rs("EducateName")
 Objs				= Rs("Objs")
 Teacher			= Rs("Teacher")
 Mudi				= Rs("Mudi")
 Content			= Rs("Content")
 Number1			= Rs("Number")
 Languages			= Rs("Languages")
 Other				= Rs("Other")
 Phone				= Rs("Phone")
 Fax				= Rs("Fax")
 Person				= Rs("Person")
 Best			    = Rs("Best")
 
 If Objs <> "" Then Objs = Replace(Objs,"<br>",chr(13))
 If Mudi <> "" Then Mudi = Replace(Mudi,"<br>",chr(13))
 If Content <> "" Then Content = Replace(Content,"<br>",chr(13))
 If Other <> "" Then Other = Replace(Other,"<br>",chr(13))

End if
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/Educate_Lessonedit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>编辑课程</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="650" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=edit" name="edit" method="post" onSubmit="return edit_check()">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="dddddd">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;更新培训课程</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 课程名称：</td>
                        <td height="25"> <input name="lessonname" type="text" id="lessonname" size="30" maxlength="50" value="<%= lessonname %>"> 
                          <font color="#666666">(请输入课程名称</font>)</td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 课程类型：</td>
                        <td height="25" bgcolor="f9f9f9"> <SELECT name=properity class=txtfield id="properity">
                            <OPTION value="" >--请选择--</OPTION>
                            <OPTION value="企业内训" <% If properity = "企业内训" Then Response.write "Selected" %>>企业内训</OPTION>
                            <OPTION value="资格认证" <% If properity = "资格认证" Then Response.write "Selected" %>>资格认证</OPTION>
                            <OPTION value="IT培训" <% If properity = "IT培训" Then Response.write "Selected" %>>IT培训</OPTION>
                            <OPTION value="语言培训" <% If properity = "语言培训" Then Response.write "Selected" %>>语言培训</OPTION>
                            <OPTION value="学历招生" <% If properity = "学历招生" Then Response.write "Selected" %>>学历招生</OPTION>
                            <OPTION value="公开课" <% If properity = "公开课" Then Response.write "Selected" %>>公开课</OPTION>
                          </SELECT> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 开课时间：</td>
                        <td height="25"> <input name="begindate" type="text" id="begindate" size="16" onclick="SD(this,'document.all.begindate')"  value="<%= begindate %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 截止时间：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="enddate" type="text" id="enddate" size="16" onclick="SD(this,'document.all.enddate')" value="<%= enddate %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 开课地区：</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 开课地点：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="address" type="text" id="address" size="30" maxlength="100" value="<%= address %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 课程原价：</td>
                        <td height="25"> <input name="price" type="text" id="price" size="16" value="<%= price %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 网上价格：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="webprice" type="text" id="webprice" size="16" value="<%= webprice %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">主办单位：</td>
                        <td height="25"> <input name="educatename" type="text" id="educatename" size="30" maxlength="50" value="<%= educatename %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 培训对象：</td>
                        <td height="25" bgcolor="f9f9f9"> <textarea name="objs" cols="55" rows="5" id="objs"><%= objs %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 课程目的：</td>
                        <td height="25"> <textarea name="mudi" cols="55" rows="5" id="mudi"><%= mudi %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 课程内容：</td>
                        <td height="25" bgcolor="f9f9f9"> <textarea name="content" cols="55" rows="5" id="content"><%= content %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"> 其他说明：</td>
                        <td height="25"> <textarea name="other" cols="55" rows="5" id="other"><%= other %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> <STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 每班人数：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="number" type="text" id="number" size="6" value="<%= number1 %>">
                          人 <font color="#666666">(如,50人)</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"> 授课语言：</td>
                        <td height="25"> <input name="languages" type="text" id="languages" size="16" value="<%= languages %>"> 
                          <font color="#666666">(如,汉语)</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"> 授课讲师：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="teacher" type="text" id="languages" size="16" value="<%= teacher %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系人：</td>
                        <td height="25"> <input name="person" type="text" id="person" size="16" value="<%= person %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="phone" type="text" id="currcy3" size="16"  value="<%= phone  %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">传 真：</td>
                        <td height="25"> <input name="fax" type="text" id="currcy4" size="16" value="<%= fax %>"></td>
                      </tr>
                      <tr bgcolor="f9f9f9"> 
                        <td height="25" align="right">特惠课程：</td>
                        <td height="25"> <input name="best" type="checkbox" id="best" value="1" <% If Best = True Then Response.write "Checked" %>>
                          设置为特惠课程</td>
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
            <td height="40" align="center"><input type="hidden" name="PageNo" value="<%= PageNo %>"> 
              <input name="lessonid" type="hidden" id="lessonid" value="<%= Lessonid %>"> 
              <input type="submit" name="submit" value=" 确 认 发 布 " style="height:30px;"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 

Sub Submit() '保存企业基本数据

'LessonName,Properity,BeginDate,EndDate,Locus_Area,Locus_City,Address,Price,WebPrice,EducateName,Objs,Teacher,Mudi,Content,Number,Languages,Other,Phone,Fax,Person
 PageNo	   			= Replace_Text(Request.Form("PageNo"))
 Lessonid			= Replace_Text(Request.Form("Lessonid"))
 LessonName			= Replace_Text(Request.Form("LessonName"))
 Properity			= Replace_Text(Request.Form("Properity"))
 BeginDate			= Replace_Text(Request.Form("BeginDate"))
 EndDate			= Replace_Text(Request.Form("EndDate"))
 Locus_Area			= Replace_Text(Request.Form("x_suozaidi"))
 Locus_City			= Replace_Text(Request.Form("x_suozaidi1"))
 Address			= Replace_Text(Request.Form("Address"))
 Price				= Replace_Text(Request.Form("Price"))
 WebPrice			= Replace_Text(Request.Form("WebPrice"))
 EducateName		= Replace_Text(Request.Form("EducateName"))
 Objs				= Replace_Text(Request.Form("Objs"))
 Teacher			= Replace_Text(Request.Form("Teacher"))
 Mudi				= Replace_Text(Request.Form("Mudi"))
 Content			= Replace_Text(Request.Form("Content"))
 Number1			= Replace_Text(Request.Form("Number"))
 Languages			= Replace_Text(Request.Form("Languages"))
 Other				= Replace_Text(Request.Form("Other"))
 Phone				= Replace_Text(Request.Form("Phone"))
 Fax				= Replace_Text(Request.Form("Fax"))
 Person				= Replace_Text(Request.Form("Person"))
 Best				= Replace_Text(Request.Form("Best"))
 
 If Objs <> "" Then Objs = Replace(Objs,chr(13),"<br>")
 If Mudi <> "" Then Mudi = Replace(Mudi,chr(13),"<br>")
 If Content <> "" Then Content = Replace(Content,chr(13),"<br>")
 If Other <> "" Then Other = Replace(Other,chr(13),"<br>")
 If Best = "" Then Best = 0
 
 SQL = "Update [pH_Educate_Lesson] Set LessonName='"&LessonName&"',Properity='"&Properity&"',BeginDate='"&BeginDate&"',EndDate='"&EndDate&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Address='"&Address&"',Price="&Price&",WebPrice="&WebPrice&",EducateName='"&EducateName&"',Objs='"&Objs&"',Teacher='"&Teacher&"',Mudi='"&Mudi&"',Content='"&Content&"',Number="&Number1&",Languages='"&Languages&"',Other='"&Other&"',Phone='"&Phone&"',Fax='"&Fax&"',Person='"&Person&"',Best="&Best&" Where Ncid="&Cstr(Lessonid)
 Conn.Execute(SQL)

 
 Response.Write "<script>alert('编辑完成');location.href='"&PageNo&"';</script>"
 Response.End()
End Sub


'//关闭数据库连接
CloseDB

 %>

