<body><div id="bg">

<div id="qitop">
	<div id="qitop2"><img src="../images/logot.gif" /></div>
	
	<div id="qitop3">
	<li class="qitop31"></li>
	<li class="qitop32"><font color="#FF0000">·</font><A   title=繁体转换  href=""       name=StranLink><font color="#FF0000">繁體中文</font></A><font color="#FF0000">·</font>&nbsp;
<%if session("typesgo")="" then%>
	您好，还末登录！  <a href="../personadmin/login.asp"><img src="../images/grlgoin.gif" width="63" height="19" border="0" /></a> <a href="../company/login.asp"><img src="../images/qylogin.gif" width="63" height="19" border="0" /></a>
	<%else
	if session("typesgo")="2" then
	%>
	您好，<img src="../images/online_member.gif" /> <font class="wel3"><%=request.cookies("01387job")("personusername")%></font>!  [<a href="../personadmin/default.asp" >求职管理中心</a>] [<a href="../personadmin/logout.asp" >退出登录</a>]  
	<%end if
	if session("typesgo")="1" then%>
	您好，<img src="../images/online_member.gif" /> <font class="wel3"><%=request.cookies("01387job")("companyusername")%></font>!  [<a href="../company/default.asp" >招聘管理中心</a>] [<a href="../company/logout.asp" >退出登录</a>]  
	<%end if
	end if%></li>
	</div>
	
	<div id="qitop4">
	<li class="qit2"><a href="../" class="q14">首页</a></li><li class="qit"></li>	<li class="qit3"><a href="../jobs/" class="q14"><strong>澳门招聘</strong></a></li>
	<li class="qit"></li>
	<li class="qit3"><a href="../person/" class="q14"><strong>澳门劳工</strong></a></li>
	<li class="qit"></li>

	<li class="qit4">HR资讯</li><li class="qit"></li>
	<li class="qit3"><a href="../blog/" class="q14">劳工新闻</a></li><li class="qit"></li>
		<li class="qit3"><a href="../about/service.asp" class="q14">劳务服务</a></li><li class="qit"></li>
	</div>

</div><div id="qso">
<form name="form2" method="post" action="../MySearch.asp">&nbsp;<img src="../images/qso.gif" width="13" height="13" />
  关键字：
    <input name="keyword" type="text" value="" size="30" maxlength="30" />
<select name="mytime" class="input" id="mytime" style="FONT-SIZE: 12px; WIDTH: 90px" width="10">
  <option value="1">1天内</option>
  <option value="2">3天内</option>
  <option value="3">一周内</option>
  <option value="4" selected="selected">一个月内</option>
  <option value="5">三个月内</option>
  <option value="6">半年内</option>
  <option value="7">一年内</option>
</select>
<input type="radio" name="mytype" value="1" />职位
<input name="mytype" type="radio" value="2" checked />简历
<input name="imageField" type="image" src="../images/so.gif" align="middle" />
    &nbsp;<strong>热门词</strong>：<a href="Person_search.asp?MainCatelog=1" class="t12">饮食</a> 
    <a href="Person_search.asp?MainCatelog=9" class="t12">建筑/装修</a> <a href="Person_search.asp?MainCatelog=7" class="t12">水电/空调</a> 
    <br>
  </form></div>