<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Ncid,Schid,Username,SchoolName,ContactPerson,Phone,Locus_Area,Locus_City,RegDate,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"140") <= 0 Then 
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
 SQL = "Select Ncid,Schid,Username,SchoolName,Locus_Area,ContactPerson,Phone,RegDate,VipFlag,Flag,Lessons,Teachers From [pH_Educate_Base] "
Else
 SQL = "Select Ncid,Schid,Username,SchoolName,Locus_Area,ContactPerson,Phone,RegDate,VipFlag,Flag,Lessons,Teachers From [pH_Educate_Base] Where Username Like '%"&ParamName&"%' or SchoolName Like '%"&ParamName&"%' "
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
		
		if (id=="delschool")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Educate_Option.asp?param=delschool&pageno=Web_Educate_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhe")
		{
		    form.target='_self';
			form.action="Web_Educate_Option.asp?param=shenhe&pageno=Web_Educate_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Educate_SendMail.asp?pageno=Web_Educate_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
			
		if (id=="noshenhe")
		{
		 if(confirm('取消审核将影响该用户在网站的操作'))
		  {
			form.target='_self';
			form.action="Web_Educate_Option.asp?param=noshenhe&pageno=Web_Educate_All.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;<font color="#FFFFFF">■ <strong>全部培训机构</strong></font></td>
          <td width="50%" align="right"><a href="Web_Educate_Add.asp" class="k1">| 添加培训机构</a></td>
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
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>用户名</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>培训机构名称</u></td>
                        <td width="6%" height="25"><u>地区</u></td>
                        <td width="8%" height="25"><u>联系人</u></td>
                        <td width="12%" height="25"><u>联系电话</u></td>
                        <td width="4%" height="25" bgcolor="f5f5f5"><u>课程</u></td>
                        <td width="4%" height="25"><u>讲师</u></td>
                        <td width="4%"><u>收费</u></td>
                        <td width="4%"><u>审核</u></td>
                        <td width="9%" bgcolor="f5f5f5"><u>注册时间</u></td>
                        <td bgcolor="f5f5f5"><u>管理操作</u></td>
                        <td width="3%"> 
                          <INPUT onclick=SelectAllItem(this.form.schid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid                 = Rs("Ncid")
 Schid                = Rs("Schid")
 Username             = Rs("Username")
 SchoolName           = Rs("SchoolName")
 Locus_Area           = Rs("Locus_Area")
 ContactPerson        = Rs("ContactPerson")
 Phone                = Rs("Phone")
 RegDate              = Rs("RegDate")
 VipFlag              = Rs("VipFlag")
 Flag				  = Rs("Flag")
 Lessons			  = Rs("Lessons")
 Teachers			  = Rs("Teachers")
 
 '//获取注册日期
 If RegDate <> "" Then
  RegDate = FormatDateTime(RegDate,2)
 End if
 '//获取会员是否审核
 Flag_Str = ""
 If Flag = True Then
 	Flag_Str = "<font color=#009900>√</font>"
 Else
 	Flag_Str = "<font color=#ff0000>×</font>"
 End if
 '//获取会员类型(收费/免费)
 Vip_Str = ""
 Vip_Url = ""
 If VipFlag = True Then
 	Vip_Str = "<font color=#009900>√</font>"
	Vip_Url = "<a href=Web_Educate_EditVip.asp?Schid="&Schid&"&PageNo=Web_Educate_All.asp?PageNo="&PageNo&"><u>VIP</u></a>"
 Else
 	Vip_Str = ""
	Vip_Url = "<a href=Web_Educate_UpVip.asp?Schid="&Schid&"&PageNo=Web_Educate_All.asp?PageNo="&PageNo&"><u>VIP</u></a>"
 End if
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Educate/Info/Index.asp?Param=<%= Schid %>" target="_blank"><u><%= Username %></u></a></td>
                        <td height="25" align="left"><a href="../Educate/Info/Index.asp?Param=<%= Schid %>" target="_blank"><%= SchoolName %></a></td>
                        <td height="25"><%= Locus_Area %></td>
                        <td height="25"><%= ContactPerson %></td>
                        <td height="25" align="left"><%= Phone %></td>
                        <td height="25"><a href="Web_Educate_Lesson.asp?SchoolName=<%= SchoolName %>&Schid=<%= Schid %>"><u><%= Lessons %></u></a></td>
                        <td height="25"><a href="Web_Educate_Teacher.asp?SchoolName=<%= SchoolName %>&Schid=<%= Schid %>"><u><%= Teachers %></u></a></td>
                        <td height="25"><%= Vip_Str %></td>
                        <td height="25"><%= Flag_Str %></td>
                        <td height="25" align="center"><%= RegDate %></td>
                        <td height="25" align="center"><a href="Web_Educate_EditPass.asp?Schid=<%= Schid %>&PageNo=<%= "Web_Educate_All.asp?PageNo="&PageNo %>"><u>密码</u></a> 
                          <a href="Web_Educate_Update.asp?Schid=<%= Schid %>&PageNo=<%= "Web_Educate_All.asp?PageNo="&PageNo %>"><u>编辑</u></a> 
						<%= Vip_Url %>  
						  
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Schid %> name="schid"></td>
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
							 <input type="button" name="delete" value="删除会员" onClick="javascript:theForm_Submit('delschool')">
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

