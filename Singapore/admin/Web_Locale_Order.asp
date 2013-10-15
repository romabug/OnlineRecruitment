<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim CompanyName,Content,Property1,Products,ContactPerson,Phone,Address,InfoFrom,Licence,AddDate,Operation,InviteDate,Memo,Fax,Bus,Owner
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"174") <= 0 Then 
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
If ParamName <> "" Then
 SQL = "Select Ncid,CompanyName,OrderDate,OrderArea,OrderMart,Person,Phone,AddDate,Flag From [pH_Locale_Order] Where CompanyName Like '%"&ParamName&"%' "
Else
 SQL = "Select Ncid,CompanyName,OrderDate,OrderArea,OrderMart,Person,Phone,AddDate,Flag From [pH_Locale_Order] "
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
		
		if (id=="dellocale_1")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='_self';
			form.action="Web_Locale_Option.asp?param=dellocale_1&pageno=Web_Locale_Order.asp?pageno=<%= PageNo %>";
			form.submit();	   
		   }

		}
		if (id=="dellocale_2")
		{
		 
		    form.target='_self';
			form.action="Web_Locale_Option.asp?param=dellocale_2&pageno=Web_Locale_Order.asp?pageno=<%= PageNo %>";
			form.submit();	   
		  

		}
		
		if (id=="dellocale_3")
		{
		  
		    form.target='_self';
			form.action="Web_Locale_Option.asp?param=dellocale_3&pageno=Web_Locale_Order.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>企业预订展位</strong></font> 
    </td>
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
                        <td width="25%" height="25" bgcolor="f5f5f5"><u>企业名称</u></td>
                        <td width="8%" height="25"><u>联系人</u></td>
                        <td width="12%" height="25"><u>联系电话</u></td>
                        <td width="10%" height="25"><u>预订时间</u></td>
                        <td width="9%" height="25"><u>预订地区</u></td>
                        <td width="12%" height="25"><u>人才市场</u></td>
                        <td width="9%" height="25"><u>提交时间</u></td>
                        <td width="7%"><u>状 态</u></td>
                        <td width="3%"> 
                          <INPUT onclick=SelectAllItem(this.form.ncid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid                = Rs("Ncid")
 CompanyName		 = Rs("CompanyName")
 OrderDate			 = Rs("OrderDate")
 OrderArea			 = Rs("OrderArea")
 OrderMart			 = Rs("OrderMart")
 Person				 = Rs("Person")
 Phone				 = Rs("Phone")
 AddDate			 = FormatDatetime(Rs("AddDate"),2)
 Flag				 = Rs("Flag")
 
 Owner_Str = ""
 Select Case OrderMart
  Case "www":Owner_Str = "辉煌职介"
  Case "xx":Owner_Str = "西乡职介"
  Case "sj":Owner_Str = "沙井职介"
  Case "hhx":Owner_Str = "公明职介"
 End Select
 
 '状态
 Flag_Str = ""
 Select Case Flag
  Case 0:Flag_Str = "<font color=#ff0000>未处理</font>"
  Case 1:Flag_Str = "已完成"
  Case 2:Flag_Str = "<font color=#666666>被作废</font>"
 End Select
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="" target="_blank"><u><%= CompanyName %></u></a></td>
                        <td height="25"><%= Person %></td>
                        <td height="25"><%= Phone %></td>
                        <td height="25" align="center"><%= OrderDate %></td>
                        <td height="25"><%= OrderArea %></td>
                        <td height="25"><%= Owner_Str %></td>
                        <td height="25" align="left"><%= AddDate %></td>
                        <td height="25" align="center"><%= Flag_Str %></td>
                        <td height="25"><INPUT type=checkbox value=<%= Ncid %> name="ncid"></td>
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
                              <td width="50%" align="right"><input type="button" name="delete2" value="删除" onClick="javascript:theForm_Submit('dellocale_1')">
                                <input type="button" name="delete3" value="处理" onClick="javascript:theForm_Submit('dellocale_2')"> 
                                <input type="button" name="delete" value="作废" onClick="javascript:theForm_Submit('dellocale_3')">
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

