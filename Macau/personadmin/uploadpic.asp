<%@ Language=VBScript %>
<%response.buffer=false%>

<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="../inc/UpLoadClass.asp"-->
<!--#include file="../inc/Code2Info.sc.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select id,username,uid,pic,pichide,uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
'添加修改相片
if request.QueryString("action")="add" then
dim upload,file,formName,formPath,fname,getfilename
dim nTime : nTime = Timer()
dim myrequest,lngUpSize
Set myrequest=new UpLoadClass
	myrequest.MaxSize  = 100*1024
	myrequest.FileType = "gif/jpg/jpeg"
	myrequest.Savepath = "upload/"
	
	lngUpSize = myrequest.Open()
	
	dim strFile1 : strFile1=myrequest.Form("Photo")
	dim intError : intError=myrequest.Form("photo_Err")
	dim lngSize1 : lngSize1=0
	if intError=0 then
session("01387jobpic")=strFile1
set rs=server.createobject("ADODB.recordset") 
rs.open "select username,uid,pic from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,3,3
rs("pic")=session("01387jobpic")
rs.update
rs.close
set rs=nothing
session("01387jobpic")=""
Call ShowErrorTo("上传成功！","uploadpic.asp")
end if
response.Write("<SCRIPT language=JavaScript>alert('"&Err2Info(myrequest.Form("photo_Err"))&"');history.go(-1);</SCRIPT>")
response.End()			
Set myrequest=nothing
end if

'添加修改相片结束
'删除相片
if request.QueryString("action")="del" then
id=Cint(request.QueryString("id"))
set rs=server.createobject("ADODB.recordset") 
rs.Open "select uid,pic,id,promember from [01387member] where id="&id,conn,3,3
if rs("uid")<>request.cookies("01387job")("uid") then
  response.Redirect("login.asp")
  response.end()
end if
if rs(3)=true then
Call ShowError("高级人才不可删除相片！要执行操作请先退出高级人才行列！")
end if
set fso=server.CreateObject("Scripting.FileSystemObject")
fso.deletefile(server.mappath("upload/"&rs("pic")&""))
rs("pic")=""
rs.update
rs.close
set rs=nothing
Call ShowErrorTo("删除成功！","uploadpic.asp")
end if
'删除相片结束
'隐藏相片
if request.QueryString("action")="hide" then
set hide=conn.execute("select promember from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'")
if hide(0)=true then
hide.close
set hide=nothing
Call ShowError("高级人才不可隐藏相片！要执行操作请先退出高级人才行列！")
end if
conn.execute("update [01387member] set pichide='ok' where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'")
Call ShowErrorTo("隐藏相片设置成功！","uploadpic.asp")
end if
'隐藏相片结束
'显示相片
if request.QueryString("action")="open" then
conn.execute("update [01387member] set pichide='no' where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'")
Call ShowErrorTo("显示相片设置成功！","uploadpic.asp")
end if
'显示相片结束
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网个人求职管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<script language=javascript src="inc/uploadpic.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="600" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td class="win2_update_table_top" height="22">个人照片上传管理</td>
  </tr>
  <tr>
    <td><form name="form1" method="post" action="uploadpic.asp?action=add" enctype="multipart/form-data" onSubmit="checkFileUpload(this,'GIF,JPG,JPEG');return document.MM_returnValue">
      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="2">
        <tr>
                  <td height="50"><p>·<span class="p13">特别提醒：对自己形象比较自信的，可将个人的网络相册地址填写在“<a href="basicinfo.asp">个人资料</a>”里。（网络相册如：网易相册，QQ相册或个人BLOG等。没有网络相册的自己去注册申请），让用人单位更全面地了解你，对澳门求职有一定帮助。</span></p>
                    <p>·在您上传任何文件之前，请阅读<a href="http://www.macau69.com/about/xieyi.asp" target="_blank">澳门劳工招聘网用户协议</a>，所传照片一律为<font face="Verdana"><b>JPG</b></font>、<font face="Verdana"><b>JPEG</b></font>、或<font face="Verdana"><b>GIF</b></font>格式。 
                    </p>
                    <p>&nbsp; </p></td>
        </tr>
        <tr>
          <td align="center"><%if rs("pic")<>"" then%>
            <%if rs("pichide")="ok" then%>
            <img src='../images/nophoto.jpg' width="81" height="95" border='0' />
            <%else%>
            <a href="upload/<%=rs("pic")%>" target="_blank"><img src='upload/<%=rs("pic")%>' width="80" height="95" border='0' style='border:1px solid #000000' />
            <%end if%>
            </a>
            <%else%>
            <img src='../images/nophoto.jpg' width="81" height="95" border='0' />
            <%end if%></td>
          </tr>
        <tr>
          <td height="28" align="center" valign="bottom"><strong>请选择照片：</strong>
              <input type="file" name="photo" class="input"  id="file1" size="30"/>
              <input type="button" value="预览相片" name="Send" onClick="view()" />          </td>
        </tr>        <tr>
          <td height="40"><div align="center">
              <input type="submit" value="上传相片" name="Send2" style="height=30;width=100" />
              <input type="button" value="删除相片" name="Send22" style="height=30;width=100" onClick="location.href='javascript:confirmdel(<%=rs("id")%>)'" />
              <%if rs("pichide")="ok" then%>
              <input type="button" value="显示相片" name="Send222" style="height=30;width=100" onClick="location.href='uploadpic.asp?action=open'" />
              <%else%>
              <input type="button" value="隐藏相片" name="Send222" style="height=30;width=100" onClick="location.href='uploadpic.asp?action=hide'" />
              <%end if%>
          </div></td>
        </tr>

        <tr>
                  <td>&nbsp;</td>
        </tr>
        <tr>
                  <td style="line-height:160%;"><strong><br />
                    如何使您的照片显示达到最佳效果？</strong><br />
                    <br />
                    1、将照片尺寸设置为<font class="wel2">320(宽)*380(高)</font>像素。（照片标准尺寸）<br />
            2、照片大小在<font class="wel2">20~100K</font>之间。（本站不支持超过<font class="wel2">100K</font>以上的图片上传）<br />
            3、图片区域应清晰显示您的头像或半身/全身相。（请勿使用艺术照）</td>
        </tr>
      </table>
    </form></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<form name=preview action=previewpic.asp method=post target=preview_page>
<input type=hidden name=file1 value=>
</form>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>