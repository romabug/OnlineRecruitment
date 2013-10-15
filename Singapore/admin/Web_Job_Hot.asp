<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"155") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

'//获取参数
ParamName = Replace_Text(Request("ParamName"))

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
If ParamName = "" Then
 SQL = "Select Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time From [pH_Job_Base] Where HotFlag=1"
Else
 SQL = "Select Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time From [pH_Job_Base] Where (JobName Like '%"&ParamName&"%' or JobClass Like '%"&ParamName&"%') And HotFlag=1"
End if
SQL = SQL&" Order By Jobid Desc"
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
<title>急聘职位</title>
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
		
		if (id=="deljob")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=deljob&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="shenhe")
		{
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=shenhe&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="nohot")
		{
		    form.target='_self';
			form.action="Web_Job_Option.asp?param=nohot&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
			
		if (id=="noshenhe")
		{
		 if(confirm('是否取消对选中职位的审核'))
		  {
			form.target='_self';
			form.action="Web_Job_Option.asp?param=noshenhe&pageno=Web_Job_Hot.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ 
      <strong>热门职位</strong></font></td>
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
                        <td width="18%" height="25" bgcolor="f5f5f5"><u>职位名称</u></td>
                        <td width="20%" bgcolor="f5f5f5"><u>招聘企业</u></td>
                        <td width="7%" height="25"><u>状态</u></td>
                        <td width="8%" height="25"><u>联系人</u></td>
                        <td width="12%" height="25"><u>联系电话</u></td>
                        <td height="25"><u>固顶</u></td>
                        <td width="9%" height="25"><u>发布时间</u></td>
                        <td><u>管理操作</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.jobid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Jobid              = Rs("Jobid")
 Comid              = Rs("Comid")
 JobName            = Rs("JobName")
 JobFlag            = Rs("JobFlag")
 ContactPerson      = Rs("ContactPerson")
 Phone              = Rs("Phone")
 BestFlag           = Rs("BestFlag")
 TopAll             = Rs("TopAll")
 LastUpdate_Time    = Rs("LastUpdate_Time")
 
 '//获取发布日期
 If LastUpdate_Time <> "" Then
  LastUpdate_Time = FormatDateTime(LastUpdate_Time,2)
 End if
 '//判断是否是急聘职位
 Best_Str = ""
 If BestFlag = True Then
  Best_Str = "<font color=#009900>√</font>"
 End if
 '//判断是否是固顶职位
 Top_Str = ""
 If TopAll = True Then
  Top_Str = "<font color=#009900>√</font>"
 End if
 '获取企业名称
 CompanyName = ""
 Set Re = Conn.Execute("Select CompanyName From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Not Re.Eof Then CompanyName = Re(0)
 Re.Close
 '获取职位的状态
 Job_Str = ""
 Select Case JobFlag 
  Case 0:Job_Str = "<font color=#ff0000>未审核</font>"
  Case 1:Job_Str = "招聘中"
  Case 2:Job_Str = "<font color=#666666>屏蔽中</font>"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_JobView.asp?Param=<%= Jobid %>&Comid=<%= Comid %>" target="_blank"><%= Jobname %></a></td>
                        <td height="25" align="left"><a href="../Company/Info/Com_Master_Preview.asp?Param=<%= Comid %>" target="_blank"><%= CompanyName %></a></td>
                        <td height="25"><%= Job_Str %></td>
                        <td height="25"><%= ContactPerson %></td>
                        <td height="25" align="left"><%= Phone %></td>
                        <td height="25"><%= Top_Str %></td>
                        <td height="25"><%= LastUpdate_Time %></td>
                        <td height="25" align="center"> <a href="Web_Job_TopManage.asp?Jobid=<%= Jobid %>&PageNo=<%= "Web_Job_Hot.asp?PageNo="&PageNo %>"><u>固顶</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Jobid %> name="jobid"></td>
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
                              <td align="right"> 
                                <input type="button" name="deljob" value="删除职位" onClick="javascript:theForm_Submit('deljob')">
                                <input type="button" name="noshenhe" value="取消审核" onClick="javascript:theForm_Submit('noshenhe')">
							 <input type="button" name="shenhe" value="通过审核" onClick="javascript:theForm_Submit('shenhe')">
                                <input type="button" name="nobest" value="取消热门" onClick="javascript:theForm_Submit('nohot')"> 
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

