<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"230") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Select Case Action
 Case "add"
  Call Add_Submit()
 Case "del"
  Call Del_Submit()
End Select
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加地区</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <form action="?action=add" method="post" name="add" onSubmit="return add_check();">
                <script language="JavaScript">
			   function add_check()
			   {
			    if(document.add.c_city.value=="")
				{
				  alert("地区名称不能为空！");
				  document.add.c_city.focus();
				  return false;
				}
				if(document.add.e_city.value=="")
				{
				  alert("地区拼音代码不能为空！");
				  document.add.e_city.focus();
				  return false;
				}
				if(document.add.suppername.value=="")
				{
				  alert("地区管理员名称不能为空！");
				  document.add.suppername.focus();
				  return false;
				}
				if(document.add.password.value=="")
				{
				  alert("地区管理密码不能为空！");
				  document.add.password.focus();
				  return false;
				}
			   }
			  </script>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5"><p>地区名称：</p></td>
                  <td bgcolor="#f5f5f5"><input name="c_name" type="text" id="c_city2" size="20">
                    (如：北京)</td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">英文名称：</td>
                  <td bgcolor="#f5f5f5"><input name="e_name" type="text" id="e_city3" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">地区管理员：</td>
                  <td bgcolor="#f5f5f5"><input name="suppername" type="text" id="e_city3" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">管理密码：</td>
                  <td bgcolor="#f5f5f5"><input name="password" type="password" id="e_city4" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">排列位置：</td>
                  <td bgcolor="#f5f5f5"><input name="c_level" type="text" id="suppername" value="1" size="6"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">地区状态：</td>
                  <td bgcolor="#f5f5f5"><input name="flag" type="radio" value="1" checked>
                    开通 
                    <input type="radio" name="flag" value="0">
                    关闭</td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">&nbsp;</td>
                  <td bgcolor="#f5f5f5"><input type="submit" name="Submit" value="添 加"></td>
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
Sub Add_Submit()
 Dim Rs
 c_Name = Replace_text(request("c_Name"))
 e_name = Replace_text(request("e_name"))
 SupperName = Replace_text(request("SupperName"))
 Password = Replace_text(request("Password"))
 Password = Md5(Password)
 c_Level = Replace_text(request("c_Level"))
 Flag = Replace_text(request("Flag"))
 '//检测是否输入类别名称
 If c_Name="" or e_name="" Then
  Response.write "必须输入中文和英文名称！"
  Response.End()
 End if
 Set Rs = Conn.Execute("Select Cityid From [pH_Web_City] Where e_Name='"&e_Name&"'")
 If Not Rs.Eof Then
  Response.write "该英文名称已经存在！"
  Response.End()
 End if
 Rs.Close
 
 '//插入记录
 Conn.Execute "Insert Into [pH_Web_City] (c_Name,e_Name,SupperName,Password,c_Level,Flag) values ('"&c_Name&"','"&e_Name&"','"&SupperName&"','"&Password&"',"&c_Level&","&Flag&")"
 '获取分站ID
 Set Rs = Conn.Execute("Select Top 1 Cityid From [pH_Web_City] Order by Cityid Desc")
 Cityid = Rs(0)
 Rs.Close
 '//配置分站基本参数
 Conn.Execute("Insert Into [pH_Web_Parameter] (About,Statement,Service,Contact,JobEmailSendDate,Cityid) Values ('请填写相关内容！','请填写相关内容！','请填写相关内容！','请填写相关内容！',getdate(),"&Cityid&")")
 
 Call CloseDB
 Response.write "添加成功！"
 Response.write "<meta http-equiv=refresh content=""1;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub


Call CloseDB()
 %>

