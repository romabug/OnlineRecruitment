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

'//查找
SQL = "Select Ncid,AddDate,Province,City,Content,Contact,Flag From [pH_Company_Part] Where Comid='"&Comid&"' Order by AddDate Desc"
Rs.open SQL,Conn,1,1
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
		
		if (id=="delpart")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=delpart";
			openwin();
			form.submit();	   
		   }

		}
			
		if (id=="refreshpart")
		{
		    form.target='rslt';
			form.action="Com_Option.asp?param=refreshpart";
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
<title><%= Cls_WebName %> -- 招聘中心 -- 兼职信息管理</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Part.asp" -->
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
                                          <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;兼职信息</font></b></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_PartManage.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="eeeeee">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="6%" height="25">选择</td>
                                          <td width="30%" height="25" bgcolor="f5f5f5">兼职职位</td>
                                          <td width="30%" height="25" bgcolor="f5f5f5">联系方式</td>
                                          <td width="10%" height="25">审 核</td>
                                          <td width="15%">日期/地区</td>
                                          <td height="25">操 作</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Ncid = Rs("Ncid")
 Province = Rs("Province")
 City = Rs("City")
 Content = Rs("Content")
 Contact = Rs("Contact")
 
 AddDate = FormatDateTime(Rs("AddDate"),2)

 Flag = Rs("Flag")
 FlagStr = "<img src=../Images/Flag"&Flag&".Gif>"
 

%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= Ncid %> name=perid></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= Content %></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= Contact %></td>
                                          <td height="25" align="center" bgcolor="#FFFFFF"><%= FlagStr %> 
                                          </td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"> 
                                            <%= AddDate %><br> <%= Province&City %> 
                                          </td>
                                          <td height="25" bgcolor="#FFFFFF"> <a href="Com_PartEdit.asp?id=<%= Ncid %>">编辑</a> 
                                          </td>
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
                              <td height="30" align="right"> <input type="button" name="delpart" value="删除信息" onClick="javascript:theForm_Submit('delpart')"> 
                                <input name="refreshpart" type="button" value="刷新信息" onClick="javascript:theForm_Submit('refreshpart')"> 
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
                <td><font color="#666666">编辑 － 即对当前的信息条件作修改 ;<br>
                  刷新信息 － 更新信息的发布日期,能将职位排到网站搜索结果的前面,提高浏览效果 ;<br>
                  删除信息 － 即对&quot;已经显示完成&quot;,以后不再需要显示的信息彻底进行删除 ;<br>
                  </font></td>
              </tr>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td align="center">
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
