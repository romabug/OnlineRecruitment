<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName


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

'//功能代码
CompanyName  = Tmp(0,0)
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


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心</title>
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
              <form action="../Part/Com_Search_Base.asp" method="post" target="_blank" name="theForm">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;查询兼职人才&nbsp;</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                            <tr> 
                              <td width="18%" height="27" align="right" bgcolor="f9f9f9">工作类别：</td>
                              <td height="27" bgcolor="f9f9f9"><select name="typeid" id="select2">
                                  <option value="0">不限</option>
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
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right">工作地区：</td>
                              <td height="25"><select  style="width:140px;" id=select3 
                  name=slt_workplacearea>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">&nbsp;</td>
                              <td height="25" bgcolor="f9f9f9"><select style="width:140px;" id=select4 
                  name=slt_workplacecity>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right">发布日期：</td>
                              <td height="25"><select style="width:140px;"  name=publishdate>
                                  <option value=1>近一天</option>
                                  <option value=2>近二天</option>
                                  <option value=3>近三天</option>
                                  <option value=7>近一周</option>
                                  <option value=14>近两周</option>
                                  <option value=30>近一月</option>
                                  <option value=60>近两月</option>
                                  <option value=90>近三月</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">关键字：</td>
                              <td height="25" bgcolor="f9f9f9"><input 
                  name=key style="width:140px;"  id=key size="16" maxlength=50 onClick="this.value='';"> 
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
                  <td height="40" align="center"><input type="submit" name="Submit" value="开始搜索" style="height:30px;" > 
                    <SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("不限-|工作省份不限");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%－不限"
  objCitySelector.addedOptions   = new Array("不限-不限|工作城市不限");
  objCitySelector.init();
 
                    </SCRIPT> </td>
                </tr>
              </form>
            </table></td>
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
