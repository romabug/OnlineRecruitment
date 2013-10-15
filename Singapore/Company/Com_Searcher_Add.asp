<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName

Action = Request.QueryString("action")
If Action = "add" Then Call Add_Submit() '保存搜索器

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
<SCRIPT language=JavaScript src="../js/Company_Searcher.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 招聘中心 -- 新增搜索器</title>
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
            <!--#include file="../Lefter/Company_Search.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<form action="?action=add" method="post" name="theForm" onSubmit="return theForm_check()">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;搜索器</font></b> 
                                [您最多可以建立三个职位搜索器]</td>
                          </tr>
                        </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr> 
                              <td width="20%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 搜索器名称：</td>
                              <td height="25"><input name="name" type="text" id="name" size="25" maxlength="25" style="width:180px;"></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 职位类别：</td>
                              <td height="25" bgcolor="f9f9f9"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%" height="20"><FONT 
                              color=#333333>选择职位类别</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="45%"><FONT 
                              color=#333333>已经选择的职位类别</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:180px;"  id=select3 name=slt_category>
                                      </select> <select style="width:180px;"  id=select4 name=slt_subcategory>
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit2" value="添加&gt;&gt;" onclick="AddItemToList('slt_category','slt_subcategory','slt_selectedjobs',1, 1, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit3" value="&lt;&lt;移除" onclick="DeleteListSelectedItem('slt_selectedjobs', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  multiple size=3 name=slt_selectedjobs style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 工作地区：</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%"><FONT 
                              color=#333333>选择工作地点</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="45%"><FONT 
                              color=#333333>已经选择的工作地点</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:180px"  name=slt_workplacearea>
                                      </select> <select name=slt_workplacecity size="1" style="width:180px">
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit22" value="添加&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;移除" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select8 style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">行　　业：</td>
                              <td height="25" bgcolor="f9f9f9"><select name="industry" id="industry" style="width:180px;">
                                  <option value="0">不限</option>
                                  <option value="1">互联网、电子商务</option>
                                  <option value="2">计算机业（软件、数据库、系统集成）</option>
                                  <option value="3">计算机业（硬件、网络设备）</option>
                                  <option value="4">电子、微电子技术</option>
                                  <option value="5">通讯、电信业</option>
                                  <option value="6">家电业</option>
                                  <option value="7">批发零售(百货、超市、专卖店)</option>
                                  <option value="8">贸易、商务、进出口</option>
                                  <option value="9">电气</option>
                                  <option value="10">电力、能源、矿产业</option>
                                  <option value="11">石油、化工业</option>
                                  <option value="12">生物工程、制药、环保</option>
                                  <option value="13">机械制造、机电设备、重工业</option>
                                  <option value="14">汽车、摩托车</option>
                                  <option value="15">仪器仪表、电工设备</option>
                                  <option value="16">广告、公关、设计</option>
                                  <option value="17">媒体、影视制作、新闻出版</option>
                                  <option value="18">艺术、文化传播</option>
                                  <option value="19">快速消费品（食品、饮料、粮油、化妆品、烟酒）</option>
                                  <option value="20">纺织品业（服饰、鞋类、家纺用品、皮具）</option>
                                  <option value="21">咨询业（顾问、会计师、审计师、法律）</option>
                                  <option value="22">金融业（投资、保险、证券、银行、基金）</option>
                                  <option value="23">建筑、房地产、物业管理、装潢</option>
                                  <option value="24">餐饮、娱乐、酒店</option>
                                  <option value="25">运输、物流、快递</option>
                                  <option value="26">旅游业</option>
                                  <option value="27">办公设备、文化体育休闲用品、家居用品</option>
                                  <option value="28">印刷、包装、造纸</option>
                                  <option value="29">生产、制造、加工</option>
                                  <option value="30">教育、培训、科研院所</option>
                                  <option value="31">医疗、保健、卫生服务</option>
                                  <option value="32">人才交流、中介</option>
                                  <option value="33">协会、社团、政府公用事业、社区服务</option>
                                  <option value="34">农、林、牧、副、渔业</option>
                                  <option value="35">其他</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right">学　　历：</td>
                              <td height="25"> <select name="edus" id="edus" style="width:70px;">
                                  <option value="0" selected>-不限-</option>
                                  <option value="10">小学</option>
                                  <option value="20">初中</option>
                                  <option value="30">高中</option>
                                  <option value="40">中专</option>
                                  <option value="50">专科</option>
                                  <option value="60">本科</option>
                                  <option value="70">硕士</option>
                                  <option value="80">博士</option>
                                  <option value="90">博士后</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">工作经验：</td>
                              <td height="25" bgcolor="f9f9f9"><select name="works" id="works" style="width:70px;">
                                  <option value="0" selected>-不限-</option>
                                  <option value="1">一年以上</option>
                                  <option value="2">二年以上</option>
                                  <option value="3">三年以上</option>
                                  <option value="4">四年以上</option>
                                  <option value="5">五年以上</option>
                                  <option value="10">十年以上</option>
                                  <option value="20">二十年以上</option>
                                  <option value="30">三十年以上</option>
                                  <option value="50">退休人员</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right">性　　别：</td>
                              <td height="25"><select name="sex" size="1"  style="width:70px;">
                                  <option selected value="2">-不限-</option>
                                  <option value="1">男</option>
                                  <option value="0">女</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">年　　龄：</td>
                              <td height="25" bgcolor="f9f9f9"><select name="min_age" size="1" id="min_age"  style="width:70px;">
                                  <option selected value="0">-不限-</option>
                                  <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                                </select>
                                至 
                                <select name="max_age" size="1" id="max_age"  style="width:70px;">
                                  <option selected value="0">-不限-</option>
                                  <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                                </select></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">更新日期：</td>
                              <td height="25"> <select style="width:180px;"  name=publishdate>
                                  <option value=0>不限</option>
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
                              <td height="25" align="right" bgcolor="f9f9f9">关 
                                键 字：</td>
                              <td height="25" bgcolor="f9f9f9"><input name="txtKey" type="text" id="txtKey" style="width:180px;"></td>
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
                <td height="40" align="center"><input type="submit" name="Submit" value="新增搜索器" style="height:30px;" >
                    <SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("不限-|工作地区不限");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%－不限"
  objCitySelector.addedOptions   = new Array("不限-不限|不限");
  objCitySelector.init();
  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.addedOptions   = new Array("0-|职位类别不限");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%－不限"
  objJobCCSelector.addedOptions   = new Array("0-0|不限");
  objJobCCSelector.init();  
                    </SCRIPT> </td>
              </tr>
			  </form>
            </table>
            
          </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Add_Submit() '保存企业部门数据
 Check_Url() '//跨站提交数据检测
 Username               = Session("Company")(0)
 Comid                  = Session("Company")(2)
 '//检测该用户的搜索器是否达到3个
 SQL = "Select Count(Ncid) From [pH_Company_Searcher] Where Comid='"&Comid&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs(0) >= 3 Then
   Response.Write "<script>alert('对不起！您已经创建了3个搜索器...');location.href='Com_Searcher.asp';</script>"
   Response.End()
 End if
 Rs.Close
 
 Searcher_Name   = Replace_Text(Request.Form("Name")) '搜索器名称
 WorkWillClass   = Replace_Text(Request.Form("slt_selectedjobs")) '意向职位类别
 AreaWill        = Replace_Text(Request.Form("slt_selectedplaces")) '意向工作地区
 PublishDate     = Replace_Text(Request.Form("PublishDate"))
 Edus            = Replace_Text(Request.Form("Edus"))
 Works           = Replace_Text(Request.Form("Works"))
 Sex             = Replace_Text(Request.Form("Sex"))
 MinAge          = Replace_Text(Request.Form("Min_Age"))
 MaxAge          = Replace_Text(Request.Form("Max_Age"))
 Industry		 = Replace_Text(Request.Form("Industry"))
 txtKey			 = Replace_Text(Request.Form("txtKey"))
 AreaWill        = Replace(AreaWill,"-","")
 '//将数据插入到数据库
 SQL = "Insert Into [pH_Company_Searcher]  (Comid,UserName,Searcher_Name,txtKey,PublishDate,AreaWill,Industry,Edus,Sex,MinAge,MaxAge,Works,WorkWillClass) Values ('"&Comid&"','"&Username&"','"&Searcher_Name&"','"&txtKey&"',"&PublishDate&",'"&AreaWill&"',"&Industry&","&Edus&","&Sex&","&MinAge&","&MaxAge&","&Works&",'"&WorkWillClass&"')"
 Conn.Execute(SQL)
 
 '//更新最后更新时间
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//关闭数据库连接
 CloseDB
 
 Response.redirect "Com_Searcher.asp"
End Sub

'//关闭数据库连接
CloseDB
 %>
