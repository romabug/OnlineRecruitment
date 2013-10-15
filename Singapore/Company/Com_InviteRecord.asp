<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称
'//如 Tmp(0,0) 表示企业名称
'//关闭记录集对象
Rs.Close
Set Cmd = Nothing

'//查找企业人才库
SQL = "Select * From [pH_Company_OutBox] Where Comid='"&Comid&"' Order By AddDate Desc"
Rs.open SQL,Conn,1,1
Rs.Pagesize = 15
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
TheRecord = (PageNo-1)*Psize '//计算记录编号的基数
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
		
		if (id=="delinvite")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=delinvite";
			openwin();
			form.submit();	   
		   }

		}
		
		if (id=="invite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=invite";
			openwin();
			form.submit();	   
		}
		
		if (id=="enableinvite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=enableinvite";
			openwin();
			form.submit();	   
		}
		
		if (id=="disableinvite")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=disableinvite";
			openwin();
			form.submit();	   
		}		
		if (id=="send")
		{
		    form.target='rslt';
			form.action="Com_SendApp.asp?param=invite";
			openwin();
			form.submit();	   
		}
}
function openwin()
  {
    disp=window.open("","rslt","width=500,height=320,resizable=yes");
	disp.focus();
  }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 面试管理</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Inbox.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <Form action="" method="post" name="form">
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="eeeeee">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                                  <tr> 
                                    <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td height="2"></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                                        <tr> 
                                          <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;面试管理</font></b></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_InviteRecord.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="dddddd">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="6%" height="25">选择</td>
                                          <td width="12%" height="25" bgcolor="f5f5f5">姓 
                                            名</td>
                                          <td width="18%" bgcolor="f5f5f5">性别-年龄-学历</td>
                                          <td width="27%" height="25" bgcolor="f5f5f5">应聘职位</td>
                                          <td width="14%" height="25">邀请时间</td>
                                          <td width="11%" height="25">参加面试</td>
                                          <td width="12%">面试结果</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid        = Rs("Ncid")
 Perid       = Rs("Perid")
 Jobid       = Rs("Jobid")
 Flag        = Rs("Flag")
 Chat_Flag   = Rs("Chat_Flag") 
 AddDate     = FormatDateTime(Rs("AddDate"),2)
 
 RealName    = ""
 Sex         = ""
 Age         = ""
 Edus        = ""
 LastSchool  = ""

 SQL = "Select RealName,Sex,Age,Edus,LastSchool From [pH_Person_Info] Where Perid='"&Perid&"'"
 Set Re = Conn.Execute(SQL)
 If Not Re.Eof Then
  RealName    = Re("RealName")
  Sex         = Re("Sex")
  Age         = Re("Age")
  Edus        = Re("Edus")
  LastSchool  = Re("LastSchool")
 End if
 Re.Close
 '获取职位名称
 JobName = ""
 SQL = "Select JobName From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
 Set Re = Conn.Execute(SQL)
 If Not Re.Eof Then JobName = Re(0)
 Re.Close
 '获取性别
 Sex_Str = Cls_Sex(Sex)
 '获取学历
 Edus_Str = Cls_Edus(Edus)
 '判断有否参加过面试
 Flag_Str = ""
 If Flag = 1 Then Flag_Str = "√"
 '判断面试结果
 Chat_Str = ""
 If Chat_Flag = 1 Then
  Chat_Str = "<font color=#009900>√</font>"
 Elseif Chat_Flag = 2 Then
  Chat_Str = "<font color=#ff0000><b>!</b></font>"
 End if
%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= Ncid %> name=perid></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF"> 
                                            <a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a> </td>
                                          <td height="25" align="center" valign="baseline" bgcolor="#FFFFFF"> 
                                            <%= Sex_Str&"-"&Age&"-"&Edus_Str %> </td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= JobName %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF"><font color="<%= Color_Str %>"><%= AddDate %></font></td>
                                          <td height="25" bgcolor="#FFFFFF"><%= Flag_Str %></td>
                                          <td height="25" bgcolor="#FFFFFF"><%= Chat_Str %></td>
                                        </tr>
                                        <% 
 Rs.Movenext
Next
Rs.Close
 %>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td align="right"> <INPUT onclick=SelectAllItem(this.form.perid) type=checkbox value=all name=chk_all>
                                            选中所有记录 </td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td height="2"></td>
                                        </tr>
                                      </table></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">
							  <input type="button" name="delete" value="删除记录" onClick="javascript:theForm_Submit('delinvite')">
                                <input type="button" name="send" value="邀请面试" onClick="javascript:theForm_Submit('send')">	
                                <input type="button" name="invite" value="已面试" onClick="javascript:theForm_Submit('invite')">
							  <input type="button" name="enableinvite" value="通过面试" onClick="javascript:theForm_Submit('enableinvite')">
							  <input type="button" name="disableinvite" value="未通过面试" onClick="javascript:theForm_Submit('disableinvite')">
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
              </Form>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><hr size="1" color="#CCCCCC"></td>
              </tr>
              <tr> 
                <td><font color="#666666">操作说明： </font></td>
              </tr>
              <tr> 
                <td> <font color="#666666">面试管理放置的是邀请求职者参加面试的记录 ;</font><br>
                  <font color="#009900"><strong> √</strong></font> <font color="#666666">表示通过面试，可以通知该求职者上班</font> 
                  ; <br>
                  <strong><font color="#ff0000">!</font></strong> <font color="#666666">表示没有通过面试 
                  ; </font></td>
              </tr>
            </table></td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 

'//关闭数据库连接
CloseDB
 %>
