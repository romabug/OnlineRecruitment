<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"201") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
Select Case Action
 Case "flag"
  Call Flag_Submit() '//评比或者通过审核函数
 Case "del"
  Call Del_Submit() '//删除记录的函数
End Select


'//查找
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
SQL = "Select * From [pH_FriendLink] Where Cityid=0 And Class=1"

SQL = SQL&" Order By OrderNum Asc"
Rs.Open SQL,Conn,1,1

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
Thepage = (PageNo-1)*Psize
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<script language="JavaScript">
function SelectAllItem(item)
{
    if( typeof(item.length) == "undefined" )
    {
        item.checked = !item.checked
    }
    else
    {
        for(i=0;i<item.length;i++)
        {
            item[i].checked=!item[i].checked
        }
    }
}

function theForm_Submit(id)
{
		
		if (id=="del")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="?action=del";
			form.submit();	   
		   }

		}
	
}

</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="50%">&nbsp;<font color="#FFFFFF">■ <strong>友情链接</strong></font></td>
          <td width="50%" align="right"><a href="Web_Link_Add.asp"><font color="#FFFFFF">添加链接</font></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<Form action="" name="form" method="post">
  <tr>
    <td align="center">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">

        <tr> 
          <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
                      <td width="30%" align="right"> 
                        <%
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&ParamName="&ParamName&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&ParamName="&ParamName&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
          <select name="menu2" onChange="MM_jumpMenu('self',this,0)" style="width:40px;">
               <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&ParamName=<%=ParamName%>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
                        
         <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&ParamName="&ParamName&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&ParamName="&ParamName&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>

		  
		  </td>
        </tr>
      
      </table>
				</td>
              </tr>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="5"></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="5%" height="25"><u>编号</u></td>
                        <td height="25" bgcolor="f5f5f5"><u>网站名称</u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>样式</u></td>
                        <td width="8%" height="25"><u>状态</u></td>
                        <td width="8%" height="25"><u>排序</u></td>
                        <td width="12%" height="25"><u>图片文件</u></td>
                        <td width="10%" height="25" bgcolor="f5f5f5">添加时间</td>
                        <td width="8%" bgcolor="f5f5f5"><u>管理操作</u></td>
                        <td width="4%"> 
                          <INPUT onclick=SelectAllItem(this.form.ncid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Id = Rs("Id")
 LinkName = Rs("LinkName")
 LinkUrl = Rs("LinkUrl")
 LinkImgPath = Rs("LinkImgPath")
 OrderNum = Rs("OrderNum")
 State = Rs("State")
 Style = Rs("Style")
 AddDate = Formatdatetime(Rs("AddDate"),2)
 
 '获取样式
 Style_Str = "文字"
 If Style = 1 Then Style_Str = "图片"
 '获取状态
 State_Str = "正常"
 If State = False Then State_Str = "<font color=#666666>屏蔽</font>"
 '获取图片文件
 Img_Str = ""
 If Style = 1 Then Img_Str = "<img src=../Uploadfiles/Link/"&LinkImgPath&" width=88 height=31 border=0>"
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="<%= LinkUrl %>" target="_blank"><%= LinkName %></a></td>
                        <td height="25" align="center"><%= Style_Str %></td>
                        <td height="25" align="center"><%= State_Str %></td>
                        <td height="25" align="center"><%= OrderNum %></td>
                        <td height="25" align="center"><%= Img_Str %></td>
                        <td height="25" bgcolor="f5f5f5"><%= AddDate %></td>
                        <td height="25" bgcolor="f5f5f5"><a href="Web_Link_Edit.asp?param=<%= Id %>">编辑</a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= id %> name="ncid"></td>
                      </tr>
                      <% 
 Rs.Movenext 
Next
 %>
                    </table> </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="50%" height="25">&nbsp; </td>
                              <td width="50%" align="right">
							 <input type="button" name="delads" value="删除" onClick="javascript:theForm_Submit('del')">
                              </td>
        </tr>
      
      </table>
				</td>
              </tr>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
</table>
	</td>
  </tr>
 </Form>
</table>

</body>
</html>
<%
Rs.Close
Set Rs = Nothing

'-删除-
Sub Del_Submit()
 Ncid     = Replace_Text(Request("ncid")) 
 Ncid     = Split(Ncid,",")
 
 For i = 0 To Ubound(Ncid)
   '删除图片文件
   SQL = "Select LinkImgPath From [pH_FriendLink] Where id="&Trim(Ncid(i))
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    LinkImgPath = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'图片文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/Link/"&LinkImgPath)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/Link/"&LinkImgPath))
	End if
	
	Set Fso = Nothing
   End if
   Rs.Close
   '删除记录
   SQL = "Delete From [pH_FriendLink] Where Id="&Trim(Ncid(i))
   Conn.Execute(SQL)  
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='Web_Link.asp';</script>"
End Sub


Call CloseDB()
%>

