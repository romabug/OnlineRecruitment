<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"200") <= 0 Then 
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

'//获取参数
ParamName = Replace_Text(Request("ParamName"))

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
If ParamName = "" Then
 SQL = "Select * From [pH_Web_Ad] Where Cityid=0"
Else
 SQL = "Select * From [pH_Web_Ad] Where AdName Like '%"&ParamName&"%' And  Cityid=0"
End if

SQL = SQL&" Order By WebName,Ad_Width Asc"
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
<title>网站内容管理</title>
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
		
		if (id=="delads")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Other_Option.asp?param=delads&pageno=Web_Other_Ads.asp?pageno=<%= PageNo %>";
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
          <td width="50%">&nbsp;<font color="#FFFFFF">■ <strong>广告管理</strong></font></td>
          <td width="50%" align="right"><a href="Web_Other_AddAds.asp"><font color="#FFFFFF">添加广告</font></a></td>
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
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>所在页面</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>广告位置名称</u></td>
                        <td width="8%" height="25"><u>文件类型</u></td>
                        <td width="11%" height="25"><u>开始日期</u></td>
                        <td width="11%" height="25"><u>截止日期</u></td>
                        <td width="7%" height="25"><u>排序</u></td>
                        <td width="15%" height="25" bgcolor="f5f5f5">缩略图</td>
                        <td width="8%" bgcolor="f5f5f5"><u>管理操作</u></td>
                        <td width="5%"> <INPUT onclick=SelectAllItem(this.form.ncid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid          = Rs("Ncid")
 AdName        = Rs("AdName")
 WebName       = Rs("WebName")
 AdClass       = Rs("AdClass")
 BeginDate     = Rs("BeginDate")
 EndDate       = Rs("EndDate")
 Sort1         = Rs("Ad_Sort")
 AdFile        = Rs("AdFile") 
 '广告所在页面
 Select Case WebName
  Case 1:WebName_Str = "首页"
  Case 2:WebName_Str = "职位搜索"
  Case 3:WebName_Str = "猎头职位"
  Case 4:WebName_Str = "兼职信息"
  Case 5:WebName_Str = "人才自荐"
  Case 6:WebName_Str = "校园招聘"
  Case 7:WebName_Str = "学子求职"
 End Select
 '文件类型
 Select Case AdClass
  Case 1:AdClass_Str = "图片文件"
  Case 2:AdClass_Str = "Flash文件"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><%= WebName_Str %></td>
                        <td height="25" align="left"><%= AdName %></td>
                        <td height="25"><%= AdClass_Str %></td>
                        <td height="25"><%= BeginDate %></td>
                        <td height="25" align="center"><%= EndDate %></td>
                        <td height="25"><%= Sort1 %></td>
                        <td height="25" bgcolor="f5f5f5">
		<% If AdClass = 1 Then %>
		
		 <a href="<%= "http://"&Rs("AdUrl") %>" target="_blank"><img src="../Uploadfiles/AdFile/<%= Rs("AdFile") %>" width="100" height="30" border="0"></a>
		 <% Else %>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="100" height="30">
          <param name="movie" value="../Uploadfile./AdFile/<%= Rs("AdFile") %>">
          <param name=quality value=high>
          <embed src="../Uploadfiles/AdFile/<%= Rs("AdFile") %>" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="435" height="75"></embed>
        </object>
		<% End if %>
						</td>
                        <td height="25" bgcolor="f5f5f5"><a href="Web_Other_EditAds.asp?param=<%= Ncid %>">编辑</a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= ncid %> name="ncid"></td>
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
                              <td width="50%" height="25">快速搜索 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="搜索">
                              </td>
                              <td width="50%" align="right">
							 <input type="button" name="delads" value="删除" onClick="javascript:theForm_Submit('delads')">
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

Call CloseDB()
%>

