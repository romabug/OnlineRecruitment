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
If Instr(1,Session("Web_Power"),"147") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Bookid = Request.QueryString("Param")
Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数

Set Rs = Conn.Execute("Select * From [pH_Educate_Book] Where Ncid="&Cstr(Bookid))
If Rs.eof Then
 Response.write "没有找到指定的记录"
 Response.End()
Else
 BookName		= Rs("BookName")
 Photourl		= Rs("Photourl")
 Price			= Rs("Price")
 PubName		= Rs("PubName")
 PubDate		= Rs("PubDate")
 Content		= Rs("Content")
 Memo			= Rs("Memo")
 Auther			= Rs("Auther")
 Chapter		= Rs("Chapter")
 Best			= Rs("Best")
 Flag			= Rs("Flag")
 properity      = Rs("properity")

 If Content <> "" Then Content = Replace(Content,"<br>",Chr(13))
 If Memo <> "" Then Memo = Replace(Memo,"<br>",Chr(13))
 If Auther <> "" Then Auther = Replace(Auther,"<br>",Chr(13))
 If Chapter <> "" Then Chapter = Replace(Chapter,"<br>",Chr(13))
 
End if
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript" src="../js/Educate_Bookadd.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>更新培训书籍</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=submit" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="A5B6CC">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> 
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr bgcolor="#f5f5f5"> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 书 名：</td>
                        <td height="30"> <input name="bookname" type="text" id="bookname" size="50" maxlength="50" style="width:200px;" value="<%= bookname %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"> <STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 所在领域：</td>
                        <td height="30"><SELECT name=properity class=txtfield id="properity">
                            <OPTION value="" >--请选择--</OPTION>
                            <OPTION value="企业内训" <% If properity = "企业内训" Then Response.write "Selected" %>>企业内训</OPTION>
                            <OPTION value="资格认证" <% If properity = "资格认证" Then Response.write "Selected" %>>资格认证</OPTION>
                            <OPTION value="IT培训" <% If properity = "IT培训" Then Response.write "Selected" %>>IT培训</OPTION>
                            <OPTION value="语言培训" <% If properity = "语言培训" Then Response.write "Selected" %>>语言培训</OPTION>
                            <OPTION value="学历招生" <% If properity = "学历招生" Then Response.write "Selected" %>>学历招生</OPTION>
                            <OPTION value="公开课" <% If properity = "公开课" Then Response.write "Selected" %>>公开课</OPTION>
                          </SELECT></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 价 格：</td>
                        <td height="30"> <input name="price" type="text" id="price" size="12" value="<%= price %>">
                          元</td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 出版社名称：</td>
                        <td height="30" bgcolor="#f5f5f5"><input name="pubname" type="text" id="pubname" size="50" maxlength="50" style="width:200px;" value="<%= pubname %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 出版日期：</td>
                        <td height="30"><input name="pubdate" type="text" id="pubdate" size="12" onclick="SD(this,'document.all.pubdate')" readonly value="<%= pubdate %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 详细信息：</td>
                        <td height="30" bgcolor="#f5f5f5"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="content" cols="50" rows="8" id="content"><%= content %></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 内容简介：</td>
                        <td height="30"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="memo" cols="50" rows="8" id="memo"><%= memo %></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 作者简介：</td>
                        <td height="30" bgcolor="#f5f5f5"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="auther" cols="50" rows="8" id="auther"><%= auther %></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right">主要章节：</td>
                        <td height="30"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="chapter" cols="50" rows="8" id="chapter"><%= chapter %></textarea></td>
                              <td>&nbsp;</td>
                            </tr>
                          </table> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#f5f5f5">书籍图片：</td>
                        <td height="30" bgcolor="#f5f5f5">
						<input name="photourl" type="text" id="languages" size="16" value="<%= photourl %>"> 
                          <input type="button" name="bnt1" value="上传图片" onClick="window.open('Upload_flash.asp?formname=reg&editname=photourl&uppath=../UpLoadFiles/BookFile&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" class="i2">
                          (请将图片设置为75*100像素) </td>
                      </tr>
                      <tr> 
                        <td height="32" align="right">通过审核：</td>
                        <td height="32"><input name="flag" type="checkbox" id="flag" value="1" <% If Flag = True Then Response.write "Checked" %>>
                          直接通过审核</td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#f5f5f5">设为推荐：</td>
                        <td height="30" bgcolor="#f5f5f5"><input name="best" type="checkbox" id="best" value="1" <% If Best = True Then Response.write "Checked" %>>
                          设置为推荐书籍</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"><input name="bookid" type="hidden" id="bookid" value="<%= Bookid %>"> 
              <input type="submit" name="Submit" value=" 保存更新 " style="height:30px;"> 
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
 '//提交数据
 'BookName,Photourl,Price,PubName,PubDate,Content,Memo,Auther,Chapter,Best,Flag
 Bookid 		= Replace_Text(Request.Form("Bookid"))
 BookName		= Replace_Text(Request.Form("BookName"))
 Photourl		= Replace_Text(Request.Form("Photourl"))
 Price			= Replace_Text(Request.Form("Price"))
 PubName		= Replace_Text(Request.Form("PubName"))
 PubDate		= Replace_Text(Request.Form("PubDate"))
 Content		= Replace_Text(Request.Form("Content"))
 Memo			= Replace_Text(Request.Form("Memo"))
 Auther			= Replace_Text(Request.Form("Auther"))
 Chapter		= Replace_Text(Request.Form("Chapter"))
 Best			= Replace_Text(Request.Form("Best"))
 Flag			= Replace_Text(Request.Form("Flag"))
 properity		= Replace_Text(Request.Form("properity")) 

 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 If Memo <> "" Then Memo = Replace(Memo,Chr(13),"<br>")
 If Auther <> "" Then Auther = Replace(Auther,Chr(13),"<br>")
 If Chapter <> "" Then Chapter = Replace(Chapter,Chr(13),"<br>")
 If Best = "" Then Best = 0 
 If Flag = "" Then Flag = 0
 If Photourl <> "" Then Photourl = Replace(Photourl,"../UpLoadFiles/BookFile/","")
 
 SQL = "Update [pH_Educate_Book] Set BookName='"&BookName&"',properity='"&properity&"',Photourl='"&Photourl&"',Price="&Price&",PubName='"&PubName&"',PubDate='"&PubDate&"',Content='"&Content&"',Memo='"&Memo&"',Auther='"&Auther&"',Chapter='"&Chapter&"',Best="&Best&",Flag="&Flag&" Where Ncid="&Cstr(Bookid)
 Conn.Execute(SQL)

 Response.Write "<script>alert('更新完成');location.href='Web_Educate_Books.asp';</script>"
 Response.End()
End Sub


'//关闭数据库连接
CloseDB

 %>

