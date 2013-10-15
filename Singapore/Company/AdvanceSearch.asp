<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
.c101 
{
	background-color:#255DA6;
	color: #ffffff;
} 
.c102 
{
	background-color:#efefef;
}
</style>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<script language="JavaScript">
 function login_check()
 {

 if (document.login.username.value==""){
  alert("-请输入用户名-");
  document.login.username.focus();
  return false;
 }
  if (document.login.password.value==""){
  alert("-请输入登陆密码-");
  document.login.password.focus();
  return false;
 }
 }
 function search_check(){
 if (document.theForm.key.value=="请输入关键字"){
  alert("-请输入关键字-");
  document.theForm.key.focus();
  return false;
 }
 }
</script>
<script language="JavaScript">
function csecBoard(n) 
{ 
    for(i=1;i<5;i++) 
    { 
        eval("document.getElementById('cl0"+i+"').className='c102'"); 
        eval("cbx0"+i+".style.display='none'"); 
    } 
    eval("document.getElementById('cl0"+n+"').className='c101'"); 
    eval("cbx0"+n+".style.display='block'"); 
} 
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - 简历搜索 - 高级搜索</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_Search.asp" -->
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
        <tr valign="top"> 
          <td width="180" bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>会员登录</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;">
                  <!--#include file="../Public/Com_MemberSession.asp" -->
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>HR资讯</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
                          <tr align="center"> 
                            <td width="25%" height="23" class="c101" id="cl01" onMouseOver="csecBoard(1);"><strong>管理</strong></td>
                            <td width="25%" height="23" class="c102" id="cl02" onMouseOver="csecBoard(2);"><strong>业绩</strong></td>
                            <td width="25%" height="23" class="c102" id="cl03" onMouseOver="csecBoard(3);"><strong>薪酬</strong></td>
                            <td width="25%" height="23" class="c102" id="cl04" onMouseOver="csecBoard(4);"><strong>法律</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td> <div style="display:" id="cbx01"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx02"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx03"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx04"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">高级搜索</font></strong> </td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <form action="Com_Search_AdvanceSearch.asp" method="post" name="theForm" target="_blank">
			  <tr>
                  <td width="15%">职能名称：</td>
                <td><select style="width:180px;"  id=select10 name=slt_category>
                    </select></td>
              </tr>
              <tr>
                <td width="15%">&nbsp;</td>
                <td><select style="width:180px;"  id=select11 name=slt_subcategory>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">工作地区：</td>
                <td><select style="width:180px"  name=slt_workplacearea>
                    </select></td>
              </tr>
              <tr>
                <td width="15%">&nbsp;</td>
                <td><select name=slt_workplacecity size="1" style="width:180px">
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">行　　业：</td>
                <td><select name="industry" id="industry" style="width:180px;">
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
                  <td width="15%">性　　别：</td>
                <td><select name="sex" size="1"  style="width:70px;">
                      <option selected value="2">-不限-</option>
                      <option value="1">男</option>
                      <option value="0">女</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">年　　龄：</td>
                <td><select name="min_age" size="1" id="select12"  style="width:70px;">
                      <option selected value="0">-不限-</option>
                      <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                    </select>
                    至 
                    <select name="max_age" size="1" id="select13"  style="width:70px;">
                      <option selected value="0">-不限-</option>
                      <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">学　　历：</td>
                <td><select name="edus" id="select15" style="width:70px;">
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
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">工作年限：</td>
                <td><select name="works" id="select14" style="width:70px;">
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
                  <td width="15%">更新日期：</td>
                <td><select style="width:180px;"  name=publishdate>
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
                  <td width="15%">关 键 字：</td>
                <td><input name="key" type="text" id="key" style="width:180px;"></td>
              </tr>
              <tr>
                <td width="15%"><SCRIPT language=JavaScript>
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
  objJobCPSelector.addedOptions   = new Array("0-|职能名称不限");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%－不限"
  objJobCCSelector.addedOptions   = new Array("0-0|不限");
  objJobCCSelector.init();  
                    </SCRIPT></td>
                <td><input type="submit" name="Submit" value=" 开始搜索 "  ></td>
              </tr></form>
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
'//关闭数据库连接
CloseDB
 %>
