<div id="qicai">
<div id="q1">
<div id="q2"><a href="http://www.macau69.com"><img src="../images/logo.gif" width="188" height="62" border="0" /></a></div>
<div id="q3">
<li></li>
<li class="q33"><font color="#FF0000">��</font><A   title=����ת��  href=""       name=StranLink><font color="#FF0000">���w����</font></A><font color="#FF0000">��</font>&nbsp;
<%if session("typesgo")="" then%>
	���ã���ĩ��¼��  <a href="../personadmin/login.asp"><img src="../images/grlgoin.gif" width="63" height="19" border="0" /></a> <a href="../company/login.asp"><img src="../images/qylogin.gif" width="63" height="19" border="0" /></a>
	<%else
	if session("typesgo")="2" then
	%>
	���ã�<img src="../images/online_member.gif" /> <font class="wel3"><%=request.cookies("01387job")("personusername")%></font>!  [<a href="../personadmin/default.asp" >��ְ��������</a>] [<a href="../personadmin/logout.asp" >�˳���¼</a>]  
	<%end if
	if session("typesgo")="1" then%>
	���ã�<img src="../images/online_member.gif" /> <font class="wel3"><%=request.cookies("01387job")("companyusername")%></font>!  [<a href="../company/default.asp" >��Ƹ��������</a>] [<a href="../company/logout.asp" >�˳���¼</a>]  
	<%end if
	end if%></li>
</div>
<div id="q4"></div>
</div>
</div>
