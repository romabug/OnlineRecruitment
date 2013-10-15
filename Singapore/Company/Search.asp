<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,CompanyName,Comid
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - 简历搜索</title>
</head>
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

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_Search.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="5"></td>
        </tr>
      </table> 
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="180" bgcolor="#FFFFFF"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><!--#include file="../Public/Com_MemberSession.asp" --></td>
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
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>自荐人才</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;padding-left:5px;"> 
                  <div id=demo style=overflow:hidden;height:176> 
                    <div id=demo1> 
                      <TABLE width=100% border="0" align=center cellPadding=0 cellSpacing=0 id=news>
                        <% 
SQL = "Select Top 30 I.Perid,I.RealName,I.Sex,I.Edus,I.WorkWill1 From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 And B.Nc_Best_Flag=1 And DateDiff(d,Nc_Best_Date,Getdate())>=0 And DateDiff(d,Nc_Best_EndDate,Getdate())<=0 Order By B.LastUpdate_Time Desc"
				  Set Rs = Conn.Execute(SQL)
				  While Not Rs.Eof
				   Perid           = Rs(0)
				   RealName        = Rs(1)
				   WorkWill1       = "--"
				   If Rs(4) <> "" Then WorkWill1 = Left(Rs(4),8)
				   %>
                        <TR> 
                          <TD width="60" height=22 vAlign=center><A  href="../Company/Com_Resume.asp?Param=<%= Perid %>" target=_blank><%= RealName %></A></TD>
                          <TD vAlign=center><font color="#333333"><%= WorkWill1 %></font></TD>
                        </TR>
                        <% 
				    Rs.Movenext
				   Wend
				   Rs.Close	
				    %>
                      </TABLE>
                    </div>
                    <div id=demo2></div>
                  </div>
                  <script>
<!--
  var speed		= 15;//滚动速度
  var rows		= 22;//每行高度
  var stim		= 80; //停留时间倍数 * speed
  var stop		= 0; //初始化值，不管
  demo2.innerHTML	= demo1.innerHTML
  function Marquee(){
    if(demo.scrollTop%rows==0 && stop<=stim){
      stop++;
      return;
    }
    stop = 0;
    if(demo2.offsetTop-demo.scrollTop<=0)
      demo.scrollTop-=demo1.offsetHeight
    else{
      demo.scrollTop++
    }
  }
  var MyMar	   = setInterval(Marquee,speed)
  demo.onmouseover = function() {clearInterval(MyMar)}
  demo.onmouseout  = function() {MyMar=setInterval(Marquee,speed)}
-->
</script> </td>
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
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
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>合作伙伴</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0">
                    <%
	  
Set Rs1 = Conn.Execute("Select Top 6 LinkName,LinkUrl From [pH_FriendLink] Where State=1 And Class=0 And Cityid=0 Order By ordernum Asc")
  if not rs1.eof then
  do while not rs1.eof %>
                    <tr> 
                      <td height="15" align="left"> <a href="<%=rs1("LinkUrl")%>" target="_blank"><%=rs1("LinkName")%></a></td>
                    </tr>
                    <%rs1.movenext

loop
end if
rs1.close
%>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="5" bgcolor="#255DA7"></td>
                      <td height="26" background="../Images/Index/right10_bg.jpg" style="padding-left:7px;padding-top:2px;"><strong><font color="#333333">快速搜索</font></strong></td>
                      <td width="3"><img src="../Images/Index/right10_right.jpg" width="3" height="26"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td valign="top" style="BORDER-RIGHT: #d3d3d3 1px solid; BORDER-LEFT: #d3d3d3 1px solid;BORDER-bottom: #d3d3d3 1px solid;padding-top:3px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <form action="../Company/Com_Search_Base.asp" method="post" target="_blank" name="theForm" onSubmit="return search_check()">
					<tr>
                        <td width="60" align="center">职　能：</td>
                        <td width="205"> 
                          <select style="width:200px;"  id=select 
                  name=slt_category>
                          </select></td>
                        <td width="60" align="center">职　位：</td>
                        <td>
<select style="width:200px;"  id=select4 
                  name=slt_subcategory>
                          </select></td>
                    </tr>
                    <tr>
                        <td width="60" align="center">省　份：</td>
                        <td width="205"> 
                          <select  style="width:200px;" id=select5 
                  name=slt_workplacearea>
                          </select></td>
                        <td width="60" align="center">地　区：</td>
                        <td>
<select style="width:200px;" id=select6 
                  name=slt_workplacecity>
                          </select></td>
                    </tr>
                    <tr>
                        <td width="60" align="center">行　业：</td>
                        <td width="205"> 
                          <select name="industry" id="industry" style="width:200px;">
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
                        <td width="60" align="center">日　期：</td>
                        <td>
<select style="width:200px;"  name=publishdate>
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
                        <td width="60" align="center">关键字：</td>
                        <td width="205"> 
                          <input 
                  name=key style="width:200px;"  id=txt_keyword2 size="16" maxlength=50 value="请输入关键字" onClick="this.value='';"></td>
                        <td width="60" align="center">
<SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("不限-|省份不限");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%－不限"
  objCitySelector.addedOptions   = new Array("不限-不限|地区不限");
  objCitySelector.init();
  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.addedOptions   = new Array("0-|职能不限");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%－不限"
  objJobCCSelector.addedOptions   = new Array("0-0|职位不限");
  objJobCCSelector.init();  
                    </SCRIPT></td>
                        <td> <input name="imageField2" type="image" src="../Images/Company/Search10_t.gif" width="100" height="22" border="0" align="absbottom"> &gt;&gt; <a href="AdvanceSearch.asp"><u>高级搜索</u></a></td>
                    </tr></form>
                  </table> </td>
              </tr>
            </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">职能搜索</font></strong> <a name="a"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <TABLE cellSpacing=0 cellPadding=2 width=100% align=center border=0>
              <TBODY>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=计算机硬件"  target="_blank">计算机硬件</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=计算机软件"  target="_blank">计算机软件</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=互联网开发及应用"  target="_blank">互联网开发及应用</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=IT-管理"  target="_blank">IT-管理</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_JobClass.asp?Param=IT-品管/技术支持及其它"  target="_blank">IT-品管/技术支持</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=通信技术"  target="_blank">通信技术</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=电子/电器/半导体/仪器仪表"  target="_blank">电子/电器/仪器仪表</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=销售管理"  target="_blank">销售管理</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=销售人员"  target="_blank">销售人员</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=销售行政及商务"  target="_blank">销售行政及商务</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=客服及技术支持"  target="_blank">客服及技术支持</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=财务/审计/税务"  target="_blank">财务/审计/税务</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=证券/金融/投资"  target="_blank">证券/金融/投资</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=银行"  target="_blank">银行</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=保险"  target="_blank">保险</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=生产/营运" >生产/营运</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=质量/安全管理"  target="_blank">质量/安全管理</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=工程/机械/能源"  target="_blank">工程/机械/能源</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=技工"  target="_blank">技工</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=服装/纺织/皮革"  target="_blank">服装/纺织/皮革</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=采购"  target="_blank">采购</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=贸易"  target="_blank">贸易</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=物流/仓储"  target="_blank">物流/仓储</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=生物/化工/制药/医疗器械"  target="_blank">生物/化工/医疗器械</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=医院/医疗/护理"  target="_blank">医院/医疗/护理</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=广告"  target="_blank">广告</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=公关/媒介"  target="_blank">公关/媒介</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=市场/营销"  target="_blank">市场/营销</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=4400"  target="_blank">影视/媒体</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=4500"  target="_blank">文字媒体/写作</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=0900"  target="_blank">艺术/设计</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=2100"  target="_blank">建筑工程</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=房地产"  target="_blank">房地产</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=物业管理"  target="_blank">物业管理</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=人力资源"  target="_blank">人力资源</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=高级管理"  target="_blank">高级管理</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=行政/后勤"  target="_blank">行政/后勤</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=咨询/顾问"  target="_blank">咨询/顾问</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=律师/法务"  target="_blank">律师/法务</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=教师"  target="_blank">教师</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=科研人员"  target="_blank">科研人员</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=餐饮/娱乐"  target="_blank">餐饮/娱乐</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=酒店/旅游"  target="_blank">酒店/旅游</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=美容/保健"  target="_blank">美容/保健</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=百货/连锁/零售服务"  target="_blank">百货/连锁/零售服务</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=交通运输服务"  target="_blank">交通运输服务</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=保安/家政/其他服务"  target="_blank">保安/家政/其他服务</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=公务员"  target="_blank">公务员</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=翻译"  target="_blank">翻译</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=在校学生"  target="_blank">在校学生</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=储备干部/培训生/实习生"  target="_blank">储备干部/培训生/实习生</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=兼职"  target="_blank">兼职</A></TD>
                </TR>
              </TBODY>
            </TABLE>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">行业搜索</font></strong> <a name="b"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><TABLE cellSpacing=0 cellPadding=2 width=100% align=center border=0>
                    <TBODY>
                      <TR> 
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=1"  target="_blank">互联网/电子商务</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=2"  target="_blank">计算机业(软件)</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=3"  target="_blank">计算机业(硬件)</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=4"  target="_blank">电子/微电子技术</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=5"  target="_blank">通讯/电信业</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=6"  target="_blank">家电业</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=7"  target="_blank">批发零售(百货/超市)</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=8"  target="_blank">贸易/商务/进出口</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=9"  target="_blank">电气</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=10"  target="_blank">电力/能源/矿产业</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=11"  target="_blank">石油/化工业</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=12"  target="_blank">生物工程/制药/环保</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=13"  target="_blank">机械制造/机电设备</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=14"  target="_blank">汽车/摩托车</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=15"  target="_blank">仪器仪表/电工设备</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=16"  target="_blank">广告/公关/设计</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=17"  target="_blank">媒体/影视制作/新闻出版</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=18"  target="_blank">艺术/文化传播</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=19"  target="_blank">快速消费品</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=20"  target="_blank">纺织品业</A></TD>
                      </TR>
                      <TR bgcolor="#f5f5f5"> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=21"  target="_blank">咨询业</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=22"  target="_blank">金融业(投资/保险/证券)</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=23"  target="_blank">建筑/房地产/物业管理</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=24"  target="_blank">餐饮/娱乐/酒店</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=25"  target="_blank">运输/物流/快递</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=26"  target="_blank">旅游业</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=27"  target="_blank">办公设备/文化体育</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=28"  target="_blank">印刷/包装/造纸</A></TD>
                      </TR>
                      <TR bgcolor="#f5f5f5"> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=29"  target="_blank">生产/制造/加工</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=30"  target="_blank">教育/培训/科研院所</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=31"  target="_blank">医疗/保健/卫生服务</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=32"  target="_blank">人才交流/中介</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=33"  target="_blank">协会/社团/政府/社区</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=34"  target="_blank">农/林/牧/副/渔业</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=35"  target="_blank">其他</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param="  target="_blank"></A></TD>
                      </TR>
                    </TBODY>
                  </TABLE></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">地区搜索</font></strong> <a name="c"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
              <tr align="center"> 
                <td width="14%" height="25"><a href="Com_Search_Area.asp?Param=北京" target="_blank" >北京</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=天津" target="_blank" >天津</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=上海" target="_blank" >上海</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=重庆" target="_blank" >重庆</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=广东" target="_blank" >广东</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=江苏" target="_blank" >江苏</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=浙江" target="_blank" >浙江</a></td>
              </tr>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=福建" target="_blank" >福建</a></td>
                <td><a href="Com_Search_Area.asp?Param=湖北" target="_blank" >湖北</a></td>
                <td><a href="Com_Search_Area.asp?Param=山东" target="_blank" >山东</a></td>
                <td><a href="Com_Search_Area.asp?Param=辽宁" target="_blank" >辽宁</a></td>
                <td><a href="Com_Search_Area.asp?Param=吉林" target="_blank" >吉林</a></td>
                <td><a href="Com_Search_Area.asp?Param=云南" target="_blank" >云南</a></td>
                <td><a href="Com_Search_Area.asp?Param=四川" target="_blank" >四川</a></td>
              </tr>
              <tr align="center"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=安徽" target="_blank" >安徽</a></td>
                <td><a href="Com_Search_Area.asp?Param=江西" target="_blank" >江西</a></td>
                <td><a href="Com_Search_Area.asp?Param=河北" target="_blank" >河北</a></td>
                <td><a href="Com_Search_Area.asp?Param=陕西" target="_blank" >陕西</a></td>
                <td><a href="Com_Search_Area.asp?Param=海南" target="_blank" >海南</a></td>
                <td><a href="Com_Search_Area.asp?Param=河南" target="_blank" >河南</a></td>
                <td><a href="Com_Search_Area.asp?Param=山西" target="_blank" >山西</a></td>
              </tr>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=内蒙古" target="_blank" >内蒙古</a></td>
                <td><a href="Com_Search_Area.asp?Param=广西" target="_blank" >广西</a></td>
                <td><a href="Com_Search_Area.asp?Param=贵州" target="_blank" >贵州</a></td>
                <td><a href="Com_Search_Area.asp?Param=宁夏" target="_blank" >宁夏</a></td>
                <td><a href="Com_Search_Area.asp?Param=青海" target="_blank" >青海</a></td>
                <td><a href="Com_Search_Area.asp?Param=西藏" target="_blank" >西藏</a></td>
                <td><a href="Com_Search_Area.asp?Param=甘肃" target="_blank" >甘肃</a></td>
              </tr>
              <tr align="center"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=新疆" target="_blank" >新疆</a></td>
                <td><a href="Com_Search_Area.asp?Param=台湾" target="_blank" >台湾</a></td>
                <td><a href="Com_Search_Area.asp?Param=香港" target="_blank" >香港</a></td>
                <td><a href="Com_Search_Area.asp?Param=澳门" target="_blank" >澳门</a></td>
                <td><a href="Com_Search_Area.asp?Param=国外" target="_blank" >国外</a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB
 %>
