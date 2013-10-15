<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request("action")
If Action = "add" Then Call Add_Submit()

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
SQL = "Select Classid,Classname,AddDate From [pH_Company_PersonDB_Class] Where Comid='"&Comid&"' Order By AddDate Desc"
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
		
		if (id=="delpersondbclass")
		{
		  if(confirm('确认彻底删除选定的记录'))
		  {
		    form.target='rslt';
			form.action="Com_Option.asp?param=delpersondbclass";
			openwin();
			form.submit();	   
		   }

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
<title><%= Cls_WebName %> -- 招聘中心 -- 人才库简历类别维护</title>
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
                                          <td height="25" bgcolor="f5f5f5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="40%"><b><font color="#000000">&nbsp;</font></b><a href="Com_PersonDB_Class.asp"><strong>简历类别</strong></a> | <a href="Com_PersonDB.asp">人才库</a></td>
                                                <td align="right">&nbsp;</td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td><%= Cls_Page("Com_PersonDB_Class.asp",PageNo,PCount,RCount) %></td>
                                        </tr>
                                      </table>
                                      <table width="99%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="eeeeee">
                                        <tr align="center" bgcolor="f5f5f5"> 
                                          <td width="8%" height="25">选择</td>
                                          <td height="25" align="left" bgcolor="f5f5f5">&nbsp;</td>
                                          <td width="18%" height="25">创建时间</td>
                                        </tr>
                                        <% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Classid = Rs("Classid")
 Classname = Rs("Classname")
 AddDate = FormatDateTime(Rs("AddDate"),2)
 
%>
                                        <tr align="center"> 
                                          <td height="25" bgcolor="#FFFFFF"><INPUT type=checkbox value=<%= classid %> name=perid></td>
                                          <td height="25" align="left" bgcolor="#FFFFFF"><%= Classname %>
                                          </td>
                                          <td height="25" bgcolor="#FFFFFF"><%= AddDate %></td>
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
                              <td height="30" align="right"> <input type="button" name="delete" value="删 除" onClick="javascript:theForm_Submit('delpersondbclass')">
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
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <form action="?action=add" name="addclass" method="post">
                      <tr> 
                        <td width="60" align="left">类别名称：</td>
                        <td><input name="classname" type="text" id="classname"></td>
                      </tr>
                      <tr> 
                        <td width="60" align="center">&nbsp;</td>
                        <td><input type="submit" name="Submit" value="新 增"></td>
                      </tr>
                    </form>
                  </table></td>
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
Sub Add_Submit()
 Comid = Session("Company")(2)
 Classname = Replace_Text(Request("Classname"))
 If Classname = "" Then
  Response.Write "<script>alert('请输入类别名称');history.back(-1);</script>"
  Response.End()
 End if
 
 Conn.Execute("Insert Into [pH_Company_PersonDB_Class] (Comid,ClassName,AddDate) Values ('"&Comid&"','"&Classname&"',GetDate())")
 
 Response.Redirect "Com_PersonDB_Class.asp"
End Sub


CloseDB
 %>
