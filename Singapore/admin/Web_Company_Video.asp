<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Ncid,Comid,Username,CompanyName,Nc_Vip_Flag,Video_Flag,Video_Date,Video_EndDate
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"112") <= 0 Then 
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
 SQL = "Select Ncid,Comid,Username,CompanyName,Nc_Vip_Flag,Video_Flag,Video_Date,Video_EndDate,Video_BestFlag From [pH_Company_Base] Where Nc_Video=1"
Else
 SQL = "Select Ncid,Comid,Username,CompanyName,Nc_Vip_Flag,Video_Flag,Video_Date,Video_EndDate,Video_BestFlag From [pH_Company_Base] Where (Username Like '%"&ParamName&"%' or CompanyName Like '%"&ParamName&"%') And Nc_Video=1 "
End if
SQL = SQL&" Order By Ncid Desc"
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
<title>视频企业</title>
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
		
		if (id=="delcompany")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=delcompany&pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="novideo")
		{
		  if(confirm('是否取消选中企业的视频！'))
		  {
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=novideo&pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		if (id=="delvideo")
		{
		  if(confirm('是否删除选中企业的视频！'))
		  {
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=delvideo&pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }
		}
		if (id=="bestvideo")
		{
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=bestvideo&pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		if (id=="nobestvideo")
		{
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=nobestvideo&pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
				
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Company_SendMail.asp?pageno=Web_Company_Video.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>企业视频</strong></font></td>
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
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="4">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="5%" height="25"><u>编号</u></td>
                        <td width="14%" height="25" bgcolor="f5f5f5"><u>用户名</u></td>
                        <td width="25%" bgcolor="f5f5f5"><u>企业名称</u></td>
                        <td width="8%" height="25"><u>会员类型</u></td>
                        <td width="9%" height="25"><u>开通日期</u></td>
                        <td width="9%" height="25"><u>截止日期</u></td>
                        <td width="5%" height="25"><u>推荐</u></td>
                        <td width="8%"><u>视频状态</u></td>
                        <td><u>管理操作</u></td>
                        <td width="4%"><INPUT onclick=SelectAllItem(this.form.comid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid                = Rs("Ncid")
 Comid               = Rs("Comid")
 Username            = Rs("Username")
 CompanyName         = Rs("CompanyName")
 Nc_Vip_Flag         = Rs("Nc_Vip_Flag")
 Video_Flag          = Rs("Video_Flag")
 Video_Date          = Rs("Video_Date")
 Video_EndDate       = Rs("Video_EndDate")
 Video_BestFlag		 = Rs("Video_BestFlag")
 
 '//获取开始日期
 If Video_Date <> "" Then
  Video_Date = FormatDateTime(Video_Date,2)
 End if
 '//获取截止日期
 If Video_EndDate <> "" Then
  Video_EndDate = FormatDateTime(Video_EndDate,2)
 End if 

 Video_BestFlag_Str = ""
 If Video_BestFlag = True Then Video_BestFlag_Str = "√"

 '//判断企业对视频设置成什么状态
 Video_Str = ""
 Select Case Video_Flag 
  Case 0:Video_Str = "完全开放"
  Case 1:Video_Str = "会员开放"
  Case 2:Video_Str = "完全屏蔽"
 End Select
 '//获取会员的类型
 Vip_Str = ""
 If Nc_Vip_Flag = True Then
  Vip_Str = "VIP"
 Else
  Vip_Str = "免费"
 End if
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= Username %></a></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
                        <td height="25"><%= Vip_Str %></td>
                        <td height="25"><%= Video_Date %></td>
                        <td height="25" align="center"><%= Video_EndDate %></td>
                        <td height="25"><%= Video_BestFlag_Str %></td>
                        <td height="25"><%= Video_Str %></td>
                        <td height="25" align="center"> <a href="Web_Company_EditPass.asp?Comid=<%= Comid %>&PageNo=<%= "Web_Company_Video.asp?PageNo="&PageNo %>"><u>密码</u></a> 
                          <a href="Web_Company_EditVip.asp?Comid=<%= Comid %>&PageNo=<%= "Web_Company_Vip.asp?PageNo="&PageNo %>"></a> 
                          <a href="Web_Company_VideoManage.asp?Comid=<%= Comid %>&PageNo=<%= "Web_Company_Video.asp?PageNo="&PageNo %>"><u>修改视频</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Comid %> name="comid"></td>
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
                              <td width="30%" height="25">快速搜索 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="搜索">
                              </td>
                              <td width="70%" align="right"> 
                                <input type="button" name="delete" value="删除企业" onClick="javascript:theForm_Submit('delcompany')">
							  <input type="button" name="sendmail" value="发送邮件" onClick="javascript:theForm_Submit('sendmail')">
							  <input type="button" name="novideo" value="删除视频" onClick="javascript:theForm_Submit('delvideo')">
							  <input type="button" name="novideo" value="取消视频" onClick="javascript:theForm_Submit('novideo')">
							  <input type="button" name="novideo" value="取消推荐" onClick="javascript:theForm_Submit('nobestvideo')">
							  <input type="button" name="novideo" value="推荐视频" onClick="javascript:theForm_Submit('bestvideo')">
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

