<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim PhoneKeep,EmailKeep,PublishCount,Publish_Flag,EndDate

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数

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
'//关闭数据库对象
Rs.Close
Set Cmd = Nothing

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<script language="JavaScript">
function check(){

if (document.theForm.slt_selectedplaces.options.length<1){
alert("-请选择工作地点！-");
document.theForm.slt_selectedplaces.focus();
return false;
}

if (document.theForm.users.value==""){
alert("-人数必须输入，人数不限请输入数字0！-");
document.theForm.users.focus();
return false;
}

if (document.theForm.users.value.match(/\D/)){
alert("-人数必须是合法数字！-");
document.theForm.users.focus();
return false;
}



if (document.theForm.content.value==""){
alert("-兼职职位必须输入！-");
document.theForm.content.focus();
return false;
}

if (document.theForm.contact.value==""){
alert("-联系方式必须输入！-");
document.theForm.contact.focus();
return false;
}

}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 发布兼职信息</title>
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
              <form action="?action=submit" name="theForm" method="post" onSubmit="return check();">
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
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 工作地区：</td>
                              <td height="25" bgcolor="f9f9f9">先选择上排的省区，再在下排选择相应的城市，然后按添加<br>
                                如果想要删出选好的工作地点，请先选中该项，然后按移除</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="25%"><FONT 
                              color=#333333>选择工作地区</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td><FONT 
                              color=#333333>已经选择的地区</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:110px"  name=slt_workplacearea>
                                      </select> <select name=slt_workplacecity size="1" style="width:110px">
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit22" value="添加&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;移除" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select style="width:120px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right">详细地址：</td>
                              <td height="25"> <input name="address" type="text" id="address2" maxlength="40" style="width:260px"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">工作类别：</td>
                              <td height="25"> <select name="typeid" id="select2">
                                  <option value="1">家教</option>
                                  <option value="2">促销、宣传品、海报</option>
                                  <option value="3">业务、直销、门市</option>
                                  <option value="4">校对</option>
                                  <option value="5">调查</option>
                                  <option value="6">文员、录入</option>
                                  <option value="7">餐饮服务</option>
                                  <option value="8">家政、陪护</option>
                                  <option value="9">公司内勤、外务</option>
                                  <option value="10">翻译</option>
                                  <option value="11">工程、技术、开发</option>
                                  <option value="12">网页制作</option>
                                  <option value="13">美工设计</option>
                                  <option value="14">策划、文案</option>
                                  <option value="15">撰稿、采编</option>
                                  <option value="16">财会、法律</option>
                                  <option value="99">其他</option>
                                </select> </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 人 数：</td>
                              <td height="25"> <input name="users" type="text" id="users2" style="width:100px" value="0" maxlength="4">
                                人 ( 默认为0,表示若干人 )</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 有效期限：</td>
                              <td height="25"><select name="savetime" size=1 id="select3" >
                                  <option value="0">长期有效 
                                  <option value="7">一星期 
                                  <option value="15">半个月 
                                  <option value="30" selected>一个月 
                                  <option value="120">三个月 
                                  <option value="180">半年 
                                  <option value="365">一年 </select></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 兼职职位：</td>
                              <td height="25" bgcolor="f9f9f9">范例：xxxxx公司招聘兼职市场调查员，要求：6月份有充裕的业余时间；能够吃苦耐劳、认真负责；男女不限，在校大学生优先考虑；交通工具能自备自行车！</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><textarea name="content" cols="50" rows="6" id="textarea" ></textarea></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系方式：</td>
                              <td height="25">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><textarea name="contact" cols="50" rows="4" id="textarea2" ></textarea></td>
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
                  <td height="40" align="center"><SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%－不限"
  objCitySelector.init();


  </SCRIPT> <input type="submit" name="Submit" value=" 确 认 发 布 " style="height:35px;">
                    <input name="cityid" type="hidden" id="cityid" value="0"> </td>
                </tr>
              </form>
            </table> </td>
        </tr>
      </table></td>
  </tr>
</table>


<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Sub Submit() '保存数据
Check_Url() '//跨站提交数据检测
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
i_Flag					= Session("Nc_Vip")

'//开始接受提交的数据
Places = Split(Replace_text(Request.Form("slt_selectedplaces")),"-")
Province = Places(0)
City = Places(1)

Address = SafeRequest("address")
Typeid = SafeRequest("typeid")
Users = SafeRequest("users")
SaveTime = SafeRequest("savetime")

Content = SafeRequest("Content")
Contact = SafeRequest("Contact")
Cityid  = SafeRequest("Cityid")
If Content<>"" Then Content = Replace(Content,Chr(13),"<br>")
If Contact<>"" Then Contact = Replace(Contact,Chr(13),"<br>")


'//判断会员类型，决定其发布的信息是直接通过审核还是需要网站进行审核
If i_Flag = 0 or i_Flag = 2 Then

 SQL = "Insert Into [pH_Company_Part] (Comid,Username,Province,City,Address,Typeid,SaveTime,Content,Contact,AddDate,Flag,Users,Cityid) Values ('"&Comid&"','"&Username&"','"&Province&"','"&City&"','"&Address&"',"&Typeid&","&SaveTime&",'"&Content&"','"&Contact&"',GetDate(),0,"&Users&","&Cityid&")"
 
Elseif i_Flag = 1 Then

 SQL = "Insert Into [pH_Company_Part] (Comid,Username,Province,City,Address,Typeid,SaveTime,Content,Contact,AddDate,Flag,Users,Cityid) Values ('"&Comid&"','"&Username&"','"&Province&"','"&City&"','"&Address&"',"&Typeid&","&SaveTime&",'"&Content&"','"&Contact&"',GetDate(),1,"&Users&","&Cityid&")"
 
End if
Conn.Execute(SQL)

 '//关闭数据库连接
 CloseDB
 Response.redirect "Com_PartManage.asp"
 
End Sub

'//关闭数据库连接
CloseDB
 %>
