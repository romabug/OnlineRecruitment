<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"204") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action=Request.QueryString("Action")
Select Case Action  
 Case "Del"
  Call Del() 
 Case "Best"
  Call Best()   
End Select

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
SQL = "Select ac_id,ac_name,ac_phone,ac_mail,ac_qq,ac_Adddate,ac_Flag,ac_Type From [pH_Web_Feedback] Where Cityid=0 Order by ac_ID Desc"

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
<title>全部个人会员</title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
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
		
		if (id=="delperson")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=delperson&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		
		if (id=="novideo")
		{
		  if(confirm('确认取消该用户的视频简历？'))
		  {
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=novideo&pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
						
		if (id=="sendmail")
		{
		    form.target='_self';
			form.action="Web_Person_SendMail.asp?pageno=Web_Person_All.asp?pageno=<%= PageNo %>";
			form.submit();	   
		}
		
		if (id=="notop")
		{
		    form.target='_self';
			form.action="Web_Person_Option.asp?param=notop&pageno=Web_Person_All.asp?pageno=<%= PageNo %>"
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="50%">&nbsp;<font color="#FFFFFF">■ <strong>用户反馈</strong></font></td>
          <td width="50%" align="right"><a href="Web_Other_AddAds.asp"></a></td>
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
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" class="text02">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="6%" height="25" bgcolor="f5f5f5"><u>编号</u></td>
                        <td width="10%" height="25" bgcolor="f5f5f5"><u>姓名</u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>反馈类型</u></td>
                        <td width="12%" bgcolor="f5f5f5"><u>电话</u></td>
                        <td width="18%" height="25" bgcolor="f5f5f5"><u>电子邮件</u></td>
                        <td width="15%" height="25" bgcolor="f5f5f5"><u>聊天工具</u></td>
                        <td width="10%" height="25"><u>提交时间</u></td>
                        <td width="6%" height="25" bgcolor="f5f5f5"><u>处理</u></td>
                        <td bgcolor="f5f5f5"><u>操作</u></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 ac_id            = Rs("ac_id")
 ac_name          = Rs("ac_name")
 ac_phone         = Rs("ac_phone")
 ac_mail          = Rs("ac_mail")
 ac_qq            = Rs("ac_qq")
 ac_Adddate       = Rs("ac_Adddate")
 ac_Flag          = Rs("ac_Flag")
 ac_Type		  = Rs("ac_Type")
 If ac_Flag = 0 Then
   Flag = "<font color=""#FF0000"">×</font>"
  Else
   Flag = "<font color=""#009900"">√</font>"
  End if
 
%>
                      <tr bgcolor="f5f5f5"> 
                        <td height="25" align="center"><%= thePage+i %></td>
                        <td height="25" bgcolor="f5f5f5">&nbsp;<%= ac_name %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><%= ac_Type %></td>
                        <td height="25" bgcolor="f5f5f5"><%= ac_phone %></td>
                        <td height="25">&nbsp;<%= ac_mail %></td>
                        <td height="25">&nbsp;<%= ac_qq %></td>
                        <td height="25">&nbsp;<%= Formatdatetime(ac_Adddate,2) %></td>
                        <td height="25" align="center" bgcolor="f5f5f5"><%= Flag %></td>
                        <td height="25" bgcolor="f5f5f5"><a href="?Action=Del&id=<%= ac_id %>">删除</a> 
                          <a href="?Action=Best&id=<%= ac_id %>">完成</a> 
                          <a href="Web_Other_Feedback2.asp?Action=Best&id=<%= ac_id %>">详细</a> 
                        </td>
                      </tr>
                      <% 
 Rs.Movenext
Next %>
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
                        <td height="25" bgcolor="f5f5f5">&nbsp; </td>
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

Sub Del()
 Dim id

 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Delete From [pH_Web_Feedback]  Where ac_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 
 Response.Redirect "Web_Other_Feedback.asp"
End sub

Sub Best()
 Dim id

 id = SafeRequest("id") 
 Check_ID(id)

 SQL="Update [pH_Web_Feedback] Set ac_Flag=1 Where ac_id="&Cstr(id)
 Conn.Execute(SQL)
 Set Rs=Nothing
 
 Response.Redirect "Web_Other_Feedback.asp"
End sub

Rs.Close
Set Rs = Nothing
Call CloseDB()
%>

