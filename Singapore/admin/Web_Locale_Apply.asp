<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"17") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

'//获取参数
Jobid = Replace_Text(Request("Jobid"))

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
SQL = "Select B.Perid,B.Username,b.LastUpdate_Time,I.RealName,I.Sex,I.Age,I.Edus,i.LastSchool,i.Speciality,i.WorkWillClass1,l.AddDate,l.Ncid From pH_Person_Base As B,pH_Person_Info As I,pH_Locale_Apply As l Where l.Perid=b.Perid And B.Perid=I.Perid And l.Jobid="&Jobid

SQL = SQL&" Order By l.AddDate Desc"
Rs.Open SQL,Conn,1,1

Rs.Pagesize = 20
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
		if (id=="delapply")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  { 
		    form.target='_self';
			form.action="Web_Locale_Option.asp?param=delapply&pageno=Web_Locale_Jobs.asp?pageno=<%= PageNo %>";
			form.submit();	
		   }   
		}
		
}

</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>职位应聘记录</strong></font></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<Form action="" name="form" method="post">
  <tr>
    <td align="center">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
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
		   Response.write "<a href=""?PageNo=1&Jobid="&Jobid&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Jobid="&Jobid&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
          <select name="menu2" onChange="MM_jumpMenu('self',this,0)" style="width:40px;">
               <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Jobid=<%= Jobid %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
                        
         <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Jobid="&Jobid&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Jobid="&Jobid&""">尾页</a>"   
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
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
    <td align="left"> 
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="5%" height="25"><u>编号</u></td>
                        <td width="10%" bgcolor="f5f5f5"><u>姓 名</u></td>
                        <td width="6%" height="25" bgcolor="f5f5f5"><u>性别</u></td>
                        <td width="6%" bgcolor="f5f5f5"><u></u><u>年龄</u><u></u></td>
                        <td width="8%" bgcolor="f5f5f5"><u>学历</u></td>
                        <td width="15%" height="25"><u>毕业院校</u></td>
                        <td width="15%"><u>所学专业</u></td>
                        <td bgcolor="f5f5f5"><u>求职意向</u></td>
                        <td width="10%"><u>应聘时间</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.ncid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid = Rs("Ncid")
 Perid = Rs("Perid")
 Username = Rs("Username") 
 AddDate = FormatDateTime(Rs("AddDate"),2)
 RealName = Rs("RealName")
 Sex = Rs("Sex")
 Age = Rs("Age")
 Edus = Rs("Edus")
 LastSchool = Rs("LastSchool")
 Speciality = Rs("Speciality")
 WorkWillClass1 = Rs("WorkWillClass1")
 '获取学历
 Edus_Str = Cls_Edus(Edus)
 '获取性别
 Sex_Str = Cls_Sex(Sex)
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="center"><a href="../Person/Resume/Resume_Master_Preview.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                        <td height="25"><%= Sex_Str %></td>
                        <td height="25"><%= Age %></td>
                        <td height="25"><%= Edus_Str %></td>
                        <td height="25" align="left"><%= LastSchool %></td>
                        <td height="25" align="left"><%= Speciality %></td>
                        <td height="25" align="left"><%= WorkWillClass1 %></td>
                        <td height="25" align="center"><%= AddDate %> </td>
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
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="35%" height="25">&nbsp; </td>
                              <td width="65%" align="right">
							  <input type="button" name="delapply" value="删除应聘记录" onClick="javascript:theForm_Submit('delapply')"></td>
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

