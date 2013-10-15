<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"226") <= 0 Then 
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
 SQL = "Select j.Ncid,j.Corid,j.JobName,j.Com_Name,j.Valids,j.AddDate,j.Flag,b.CorpName From [pH_Intro_Job] As j Inner Join [pH_Intro_Base] As b On j.Corid=b.Corid "
Else
 SQL = "Select j.Ncid,j.Corid,j.JobName,j.Com_Name,j.Valids,j.AddDate,j.Flag,b.CorpName From [pH_Intro_Job] As j Inner Join [pH_Intro_Base] As b On j.Corid=b.Corid Where j.JobName Like '%"&ParamName&"%' "
End if
SQL = SQL&" Order By j.Ncid Desc"
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
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
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
			form.action="Web_Intro_Option.asp?param=deljob&pageno=Web_Intro_jobs.asp?pageno=<%= PageNo %>";
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
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">■ <strong>中介机构发布的招聘职位</strong></font></td>
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
                        <td width="20%" bgcolor="f5f5f5"><u>发布者机构</u></td>
                        <td width="20%" height="25"><u>招聘单位</u></td>
                        <td width="10%" height="25"><u>有效期</u></td>
                        <td width="5%" height="25"><u>状态</u></td>
                        <td width="9%" height="25"><u>发布时间</u></td>
                        <td><u>管理操作</u></td>
                        <td width="3%"> <INPUT onclick=SelectAllItem(this.form.corid) type=checkbox value=all name=chk_all></td>
                      </tr>
                      <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid = Rs("Ncid")
 Corid = Rs("Corid")
 JobName = Rs("JobName")
 Com_Name = Rs("Com_Name")
 Valids = Rs("Valids")
 AddDate = Rs("AddDate")
 Flag = Rs("Flag")
 CorpName = Rs("CorpName")
 
 '//获取发布日期
 If AddDate <> "" Then
  AddDate = FormatDateTime(AddDate,2)
 End if
 '获取审核状态
 Flag_Str = ""
 If Flag = True Then
  Flag_Str = "<font color=#009900>√</font>"
 Else
  Flag_Str = "<font color=#ff0000>×</font>"
 End if
 %>
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td height="25"><%= ThePage+i %></td>
                        <td height="25" align="left"><a href="../Intro/Info/Job.asp?Corid=<%= Corid %>&Param=<%= Ncid %>" target="_blank"><%= JobName %></a></td>
                        <td height="25" align="left"><a href="../Intro/Info/Index.asp?Param=<%= Corid %>" target="_blank"><%= CorpName %></a></td>
                        <td height="25"><%= Com_Name %></td>
                        <td height="25"><%= Cls_Valids(Valids) %></td>
                        <td height="25"><%= Flag_Str %></td>
                        <td height="25"><%= AddDate %></td>
                        <td height="25" align="center"> <a href="Web_Intro_jobs_Edit.asp?Param=<%= Ncid %>&pageno=Web_Intro_Jobs.asp?pageno=<%= PageNo %>"><u>编辑</u></a> 
                        </td>
                        <td height="25"><INPUT type=checkbox value=<%= Ncid %> name="corid"></td>
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
                                <input type="button" name="deljob" value="删 除" onClick="javascript:theForm_Submit('deljob')">
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

