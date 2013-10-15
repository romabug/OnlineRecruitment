<div id="qicai">
<div id="q1">
<div id="q2"><a href="http://www.macau69.com"><img src="../images/logo.gif" width="188" height="62" border="0" /></a></div>
<div id="q3">
<li></li>
<li class="q33"><font color="#FF0000">·</font><A   title=繁体转换  href=""       name=StranLink><font color="#FF0000">繁體中文</font></A><font color="#FF0000">·</font>&nbsp;
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
<div id="q4"></div>
</div>
</div>
