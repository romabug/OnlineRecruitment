<div id="qitop">
	<div id="qitop2"><img src="../images/logot.gif" /></div>
	
	<div id="qitop3">
	<li class="qitop31"></li>
	<li class="qitop32"><font color="#FF0000">��</font><A   title=����ת��  href=""       name=StranLink><font color="#FF0000">���w����</font></A><font color="#FF0000">��</font>&nbsp; 
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
	<div id="qitop4">
	<li class="qit2"><a href="../" class="q14">��ҳ</a></li><li class="qit"></li>
	<li class="qit3"><a href="../jobs/" class="q14"><strong>������Ƹ</strong></a></li>
	<li class="qit"></li>
	<li class="qit4"><strong>�����͹�</strong></li>
	<li class="qit"></li>
	
	<li class="qit3"><a href="../news/" class="q14">HR��Ѷ</a></li><li class="qit"></li>
	<li class="qit3"><a href="../blog/" class="q14">�͹�����</a></li><li class="qit"></li>
	<li class="qit3"><a href="../about/service.asp" class="q14">�������</a></li><li class="qit"></li>
	
	</div>

</div>