<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Rs,Cmd,Tmp,Action
Dim Perid,UserName,UserType,RealName,JobContent


'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//调用存储过程
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Video"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "没有找到会员资料！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组
'//0企业名称,1有无视频,2视频状态,3开通时间,4截止时间,5视频文件,6图片文件
'//如 Tmp(0,0) 表示企业名称
'//关闭数据库连接
CloseRs
Set Cmd = Nothing

'//功能代码
FlvName = Tmp(5,0)

'判断该会员是否已经录制
If FlvName <> "" Then
 Response.write "<script>alert('在录制新简历之前，请先删除您录制的简历');window.close();</script>"
 Response.End()
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 在线录制</title>
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
          <td width="5">&nbsp;</td>
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                  <%= Tmp(0,0) %> </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <Form action="?action=del" method="post" name="theForm" onSubmit="return theForm_check()">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;在线视频录制</font></b> 
                              </td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="center" bgcolor="#FFFFFF"> 
                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="620" height="400">
                                  <param name="movie" value="../Include/Class_record_Com.swf">
                                  <param name="quality" value="high">
                                  <embed src="../Include/Class_record_Com.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="620" height="400"></embed></object>
                              </td>
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
                  <td height="40" align="left"><table width="620" border="0" align="center" cellpadding="2" cellspacing="0">
                      <tr> 
                        <td>操作说明：</td>
                      </tr>
                      <tr> 
                        <td>1.确认您的视频/音频设备是否插好;<br>
                          2.请点红色录制按钮,开始录制;<br>
                          3.录制完毕请点击&quot;保存视频&quot;,进入下一步..否则您录制的视频将会丢失;<br>
                          4.您应保证您录制的内容正当、合法，同时不侵犯他人的肖像权、名誉权、知识产权等任何合法权益;<br>
                          5.<%= Cls_Webname %>如果认为您录制的内容不适当，有权删除或者修改.</td>
                      </tr>
                    </table> </td>
                </tr>
              </Form>
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
