<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Ncid,Schid,Username,SchoolName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"160") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
'//获取参数
Title  = Replace_text(request("Title"))
Ncid   = Replace_text(request("Ncid"))
ParamName = Replace_Text(Request("ParamName"))

Action = Request.QueryString("action")

Select Case Action
 Case "save":Call Saves()
 Case "delroom":Call delroom()
End Select

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
If ParamName = "" Then
 SQL = "Select * From [RoomTable] Where Type=1 And Typeid="&Cstr(Ncid)

Else
 SQL = "Select * From [RoomTable] Where Type=1 And RoomName Like '%"&ParamName&"%' And Typeid="&Cstr(Ncid)
End if
SQL = SQL&" Order By Roomid Desc"
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
		if (id==2001)
        {
		  	form.target='_self';
			form.action="Web_Video_JobOption.asp?action=refreshs&Corid=<%= Corid %>&pageno=Web_Video_Job.asp?Corpname=<%= Corpname %>";
			form.submit();
		}
		
		if (id==2002)
		{
		    form.target='_self';
			form.action="Web_Video_JobOption.asp?action=opens&Corid=<%= Corid %>&pageno=Web_Video_Job.asp?Corpname=<%= Corpname %>";
			form.submit();
		}

		if (id==2003)
		{
		    form.target='_self';
			form.action="Web_Video_JobOption.asp?action=closes&Corid=<%= Corid %>&pageno=Web_Video_Job.asp?Corpname=<%= Corpname %>";
			form.submit();
		}
		
		if (id==2004)
		{
		  if(confirm('确认删除？'))
		  {
		    form.target='_self';
			form.action="Web_Video_JobOption.asp?action=dels&Corid=<%= Corid %>&pageno=Web_Video_Job.asp?Corpname=<%= Corpname %>";
			form.submit();	   
		   }

		}
		
	    if (id==2005)
        {
		  	form.target='_self';
			form.action="Web_Video_JobOption.asp?action=publishs&Corid=<%= Corid %>&pageno=Web_Video_Job.asp?Corpname=<%= Corpname %>";
			form.submit();
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>参加<%= Title %>的企业</strong> | <a href="Web_Video_CompanyAdd.asp?Title=<%= Title %>&Ncid=<%= Ncid %>"><font color="#FFFFFF">添加企业</font></a></font></td>
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
		   Response.write "<a href=""?PageNo=1&ParamName="&ParamName&"&Corpname="&Corpname&"&Corid="&Corid&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&ParamName="&ParamName&"&Corpname="&Corpname&"&Corid="&Corid&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
          <select name="menu2" onChange="MM_jumpMenu('self',this,0)" style="width:40px;">
               <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&ParamName=<%=ParamName%>&Corpname=<%= Corpname %>&Corid=<%= Corid %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
                        
         <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&ParamName="&ParamName&"&Corpname="&Corpname&"&Corid="&Corid&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&ParamName="&ParamName&"&Corpname="&Corpname&"&Corid="&Corid&""">尾页</a>"   
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
                  <td bgcolor="#FFFFFF">
<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="6%" height="25"><u>编 号</u></td>
                        <td width="20%" height="25"><u>企业名称</u></td>
                        <td width="23%"><u>面试房间名称</u></td>
                        <td width="11%" height="25"><u>房间密码</u></td>
                        <td width="10%" height="25"><u>人数</u></td>
                        <td width="14%" height="25"><u>发布日期</u></td>
                        <td width="11%" height="25"><u>操作</u></td>
                        <td width="5%" height="25"> 
                          <INPUT onclick=SelectAllItem(this.form.param) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Username = Rs("Roomrenname")
 CompanyName = ""
 Comid = ""
 Set Re = Conn.Execute("Select Comid,CompanyName From [pH_Company_Base] Where Username='"&Username&"'")
 If Not Re.Eof Then
   CompanyName = Re(1)
   Comid = Re(0)
 End if
 %>
                      <tr bgcolor="f5f5f5"> 
                        <td height="25" align="center" bgcolor="f5f5f5"><%= TheRecord+i %></td>
                        <td height="25" bgcolor="f5f5f5"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
                        <td height="25" bgcolor="f5f5f5"><%= Rs("RoomName") %></td>
                        <td height="25"><%= Rs("RoomPwd") %></td>
                        <td height="25" align="center"><%= Rs("MaxMemberNum") %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><%= FormatDateTime(Rs("CreateTime"),2) %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><a onclick='{if(confirm("确实要删除该面试房间吗？")){return true;}return false;}' href="?action=delroom&Title=<%= Title %>&Ncid=<%= Ncid %>&id=<%= Rs("RoomId") %>"><u>删除</u></a> 
                          <a href="Com_VideoEdit.asp?Roomid=<%= Rs("RoomId") %>"></a></td>
                        <td height="25" align="center"> <INPUT type=checkbox value=<%= Rs("Roomid") %> name=param></td>
                      </tr>
                      <% 
 Rs.Movenext 
Next
 %>
                    </table></td>
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
                              <td width="32%" height="25">快速搜索 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="搜索">
                              </td>
                              <td width="68%" align="right">&nbsp; </td>
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
Sub delroom()
 Dim RoomId 
 Title  = Replace_text(request("Title"))
 Ncid   = Replace_text(request("Ncid"))
 Roomid = SafeRequest("id")
 Conn.Execute("Delete From [RoomTable] Where Roomid="&Cstr(RoomId))
 Conn.Execute("Update [pH_Video_Type] Set Coms=Coms-1 Where Ncid="&Ncid)
 Response.redirect "Web_Video_Company.asp?Title="&Title&"&Ncid="&Ncid
End Sub

Set Rs = Nothing
Call CloseDB()
%>

