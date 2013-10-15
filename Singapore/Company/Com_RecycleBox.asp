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

'//查找企业收件夹表
SQL = "Select Ncid,Perid,Jobid,AddDate,Title,Flag From [pH_Company_RecycleBox] Where Comid='"&Comid&"' And Item_Source=1 Order By AddDate Desc"
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
<!--
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
		
		if (id=="del")
		{
		  if(confirm('确认彻底删除选定的信件'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=del";
			openwin();
			form.submit();	   
		   }

		}
		
		if (id=="undel")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=undel";
			openwin();
			form.submit();	   
		}		
		
}
function openwin()
  {
    disp=window.open("","rslt","width=500,height=320,resizable=yes");
	disp.focus();
  }

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 回收站</title>
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
                                          <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td width="50%"><b><font color="#000000">回收站</font></b></td>
                                                <td width="50%" align="right">查看
                                                  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
                                                    <option value="Com_RecycleBox.asp" selected>收件夹</option>
													<option value="Com_PersonDbRecBox.asp">人才库</option>
                                                  </select>
                                                  已删除记录</td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_RecycleBox.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="eeeeee">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="6%" height="25">状态</td>
                                          <td width="32%" height="25" bgcolor="f5f5f5">信件标题</td>
                                          <td width="26%" height="25" bgcolor="f5f5f5">意向职位</td>
                                          <td width="13%" bgcolor="f5f5f5">发件人</td>
                                          <td width="15%" height="25">收件时间</td>
                                          <td width="8%" height="25">选择</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid        = Rs("Ncid")
 Perid       = Rs("Perid")
 Jobid       = Rs("Jobid") 
 AddDate     = FormatDateTime(Rs("AddDate"),2)
 Title       = Rs("Title")
 Flag	     = Rs("Flag")
 '获取个人名称
 Set Re = Conn.Execute("Select RealName From [pH_Person_Info] Where Perid='"&Perid&"'")
 If Not Re.Eof Then RealName = Re(0)
 Re.Close
 '获取职位名称
 Set Re = Conn.Execute("Select JobName From [pH_Job_Base] Where Jobid='"&Jobid&"'")
 If Not Re.Eof Then JobName = Re(0)
 Re.Close 
 '判断是否被阅读过
 If Flag = True Then
  Flag_Str = "<img src=../Images/Person/Read.gif border=0>"
 Else
  Flag_Str = "<img src=../Images/Person/UnRead.gif border=0>"
 End if 			  
%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><%= Flag_Str %></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><a href="Javascript:" onClick="Javascript:window.open('Com_ReadBox.asp?param=<%= Ncid %>','rslt','width=540,height=350,resizable=yes,scrollbars=yes');"><font color="#000099"><u><%= Title %></u></font></a></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= JobName %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF">
										  <a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a>
										  </td>
                                          <td height="25" bgcolor="#FFFFFF"><%= AddDate %></td>
                                          <td height="25" bgcolor="#FFFFFF"> <INPUT type=checkbox value=<%= Ncid %> name=perid></td>
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
                                            选中所有信件 </td>
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
                              <td height="30" align="right"> <input type="button" name="delete" value="永久删除" onClick="javascript:theForm_Submit('del')"> 
                                <input type="button" name="delete" value="还原" onClick="javascript:theForm_Submit('undel')"> 
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
                <td> <font color="#666666">回收站放置您从收件夹或者收藏夹删除的信息 ;<br>
                  还原 可以将回收站的信息还原到收件夹或者收藏夹 ;<br>
                  永久删除 将回收站的信息彻底的删除 ;</font></td>
              </tr>
            </table> </td>
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
