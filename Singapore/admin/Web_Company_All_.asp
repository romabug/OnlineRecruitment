<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<%
'response.ContentType ="application/vnd.ms-excel"
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Ncid,Comid,Username,CompanyName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
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
 SQL = "Select Ncid,Comid,Username,CompanyName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Flag,Nc_Vip_Flag From [pH_Company_Base] "
Else
 SQL = "Select Ncid,Comid,Username,CompanyName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Flag,Nc_Vip_Flag From [pH_Company_Base] Where Username Like '%"&ParamName&"%' or CompanyName Like '%"&ParamName&"%' "
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
		
		if (id=="delcompany")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=delcompany&pageno=Web_Company_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhe")
		{
		    form.target='_self';
			form.action="Web_Company_Option.asp?param=shenhe&pageno=Web_Company_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Company_SendMail.asp?pageno=Web_Company_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
			
		if (id=="noshenhe")
		{
		 if(confirm('取消审核将影响企业在网站的操作'))
		  {
			form.target='_self';
			form.action="Web_Company_Option.asp?param=noshenhe&pageno=Web_Company_All.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>全部企业</strong></font></td>
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
                        <td width="12%" height="25" bgcolor="f5f5f5"><u>用户名</u></td>
                        <td width="22%" bgcolor="f5f5f5"><u>企业名称</u></td>
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>联系人</u></td>
                        <td width="12%" height="25"><u>联系电话</u></td>
                        <td width="6%" height="25" bgcolor="f5f5f5"><u>职位</u></td>
                        <td width="5%" height="25"><u>审核</u></td>
                        <td width="9%" height="25"><u>注册时间</u></td>
                        <td><u>管理操作</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.comid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid                = Rs("Ncid")
 Comid               = Rs("Comid")
 Username            = Rs("Username")
 CompanyName         = Rs("CompanyName")
 ContactPerson       = Rs("ContactPerson")
 Phone               = Rs("Phone")
 Locus_Area          = Rs("Locus_Area")
 Locus_City          = Rs("Locus_City")
 RegDate             = Rs("RegDate")
 Flag                = Rs("Flag") 
 Vip_Flag            = Rs("Nc_Vip_Flag")
 '//获取注册日期
 If RegDate <> "" Then
  RegDate = FormatDateTime(RegDate,2)
 End if
 '//判断企业是否是收费会员
 Flag_Str = ""
 If Flag = False Then
  Flag_Str = "<font color=#ff0000>×</font>"
 End if
 '//获取会员发布职位数
 JobCount = 0
 Set Re = Conn.Execute("Select Count(*) From [pH_Job_Base] Where Comid='"&Comid&"'")
 If Not Re.Eof Then JobCount = Re(0)
 Re.Close
 '//设置VIP会员的链接
 Vip_Flag_Str = ""
 If Vip_Flag = False Then
  Vip_Flag_Str = "<a href=""Web_Company_UpVip.asp?Comid="&Comid&"&PageNo=Web_Company_All.asp?PageNo="&PageNo&"""><u>VIP</u></a>"
 End if
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= Username %></a></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
                        <td height="25" bgcolor="f5f5f5"><%= ContactPerson %></td>
                        <td height="25" align="left"><%= Phone %></td>
                        <td height="25"><%= JobCount %></td>
                        <td height="25"><%= Flag_Str %></td>
                        <td height="25"><%= RegDate %></td>
                        <td height="25" align="left"> <a href="Web_Company_EditPass.asp?Comid=<%= Comid %>&PageNo=<%= "Web_Company_All.asp?PageNo="&PageNo %>"><u>密码</u></a> 
                          <%= Vip_Flag_Str %> <a href="Web_Company_VideoManage.asp?Comid=<%= Comid %>&PageNo=<%= "Web_Company_All.asp?PageNo="&PageNo %>"><u>视频</u></a> 
						  <a href="Web_Company_Update.asp?Comid=<%= Comid %>"><u>编辑</u></a>
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
                        <td height="30" bgcolor="f5f5f5"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="30%" height="25">快速搜索 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="搜索">
                              </td>
                              <td align="right"> 
                                <input type="button" name="delete" value="删除会员" onClick="javascript:theForm_Submit('delcompany')">
							  <input type="button" name="sendmail" value="发送邮件" onClick="javascript:theForm_Submit('sendmail')">
							 <input type="button" name="noshenhe" value="取消审核" onClick="javascript:theForm_Submit('noshenhe')">
							 <input type="button" name="shenhe" value="通过审核" onClick="javascript:theForm_Submit('shenhe')">
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

