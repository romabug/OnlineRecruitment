<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Rs,SQL
Dim PageNo,ThePage,Psize,PCount,RCount
Dim Action,Param,ParamName
Dim Jobid,Comid,JobName,JobFlag,ContactPerson,Phone,BestFlag,TopAll,LastUpdate_Time
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = SafeRequest("action")
If Action = "del" Then Call Del()
'//获取参数
ParamName = Replace_Text(Request("ParamName"))

'//查找企业表所有记录
Set Rs = Server.Createobject("ADODB.recordset")
'//组织查询语句
If ParamName = "" Then
 SQL = "Select Id,UserType,UserID,Title,WorkType,AddDate,ViewClicks,HfClicks,i_Flag From [pH_WorkInfo] Order by id desc"
Else
 SQL = "Select Id,UserType,UserID,Title,WorkType,AddDate,ViewClicks,HfClicks,i_Flag From [pH_WorkInfo] Where Title like '%"&Replace(request("UserName1"),"'","''")&"%' Order by id desc"
End if

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
<title>职位管理</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>劳务信息</strong></font></td>
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
          <td bgcolor="#FFFFFF"><table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1" bordercolor="#111111" bgcolor="#FFFFFF" class="text01" style="border-collapse: collapse">
                      <tr align="center" bgcolor="f5f5f5"> 
                        <td width="42" height="30" ><u>编号</u></td>
                        <td width="223" height="30" ><u>信息标题</u></td>
                        <td width="47" height="30" ><u>类 型</u></td>
                        <td width="187" height="30" ><u>发布的会员</u></td>
                        <td width="66" ><u>会员类型</u></td>
                        <td width="85" height="30" ><u>浏览/回复</u></td>
                        <td width="59" ><u>状 态</u></td>
                        <td width="92" height="30"><u>发布时间</u></td>
                        <td width="152" height="30" ><u>操 作</u></td>
                      </tr>
                      <%   		  
For i=1 to Psize
 If Rs.eof Then Exit For 
 Id = Rs("Id")
 UserType = Rs("UserType")
 UserID = Rs("UserID")
 Title = Rs("Title")
 WorkType = Rs("WorkType")
 AddDate = FormatDateTime(Rs("AddDate"),2)
 ViewClicks = Rs("ViewClicks")
 HfClicks = Rs("HfClicks")
 Flag = Rs("i_Flag")
 '//信息类型
 If WorkType= 0 Then
  Workstr = "需求"
 Else
  Workstr = "<Font color=#666666>输出</Font>"
 End if
 '//会员类型和名称
 Select Case UserType
  Case "Com"
   UserStr = "企业"
   Username = ""
   ReSQL = "Select CompanyName From [pH_Company_Base] Where Comid='"&UserId&"'"
   Set Re = Conn.Execute(ReSQL)
   If Not Re.Eof Then UserName = Re(0)
   Re.Close
   UserUrl = "<a href=../Company/Info/Com_View.asp?Param="&UserId&" target=_blank><u>"&UserName&"</u></a>"
 End Select 
 '//状态
 FlagStr = "<img src=../Images/Flag"&Flag&".Gif>"	
%>
                      <tr bgcolor="f5f5f5" > 
                        <td width="42" height="25" align="center"><%= thepage+i%></td>
                        <td width="223" height="25" align="left"><a href="../Company/Info/View_Work.asp?Param=<%= Rs("Id") %>&Comid=<%= Rs("Userid") %>" target="_blank"><u><%= Title %></u></a></td>
                        <td width="47" height="25" align="center" ><%= Workstr %></td>
                        <td width="187" height="25" align="left" ><%= UserUrl %></td>
                        <td width="66" height="25" align="center" ><%= UserStr %></td>
                        <td width="85" height="25" align="center" ><%= ViewClicks %>/<%= HfClicks %></td>
                        <td width="59" height="25" align="center" ><%= FlagStr %></td>
                        <td width="92" height="25" align="center" ><%= AddDate %></td>
                        <td width="152" height="25" align="left"> <a href="?action=del&Id=<%= Id %>"><u>删除</u></a> 
                          <a href="Web_Job_WorkOp.asp?Id=<%= Id %>"><u>审核</u></a> 
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
                <td height="25" bgcolor="f5f5f5">
<table width="100%" border="0" cellspacing="0" cellpadding="4">
                            <tr> 
                              <td width="30%" height="25">快速搜索 
                                <input name="ParamName" type="text" id="ParamName" size="16" maxlength="30">
                          <input type="submit" name="Submit" value="搜索">
                              </td>
                              <td align="right">&nbsp; </td>
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

Sub Del()
 Id = SafeRequest("Id")
 Conn.Execute("Delete From [pH_WorkInfo] Where Id="&Cstr(Id))
 CloseDB
 Response.redirect "Web_Job_Work.asp"
 Response.End()
End Sub

Call CloseDB()
%>

