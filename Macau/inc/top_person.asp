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
	<li class="qit2"><a href="../" class="q14">首页</a></li><li class="qit"></li>
	<li class="qit3"><a href="../jobs/" class="q14"><strong>澳门招聘</strong></a></li>
	<li class="qit"></li>
	<li class="qit4"><strong>澳门劳工</strong></li>
	<li class="qit"></li>
	
	<li class="qit3"><a href="../news/" class="q14">HR资讯</a></li><li class="qit"></li>
	<li class="qit3"><a href="../blog/" class="q14">劳工新闻</a></li><li class="qit"></li>
	<li class="qit3"><a href="../about/service.asp" class="q14">劳务服务</a></li><li class="qit"></li>
	
	</div>

</div>