<body><div id="bg">

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
	<li class="qit2"><a href="../" class="q14">��ҳ</a></li><li class="qit"></li>	<li class="qit3"><a href="../jobs/" class="q14"><strong>������Ƹ</strong></a></li>
	<li class="qit"></li>
	<li class="qit3"><a href="../person/" class="q14"><strong>�����͹�</strong></a></li>
	<li class="qit"></li>

	<li class="qit4">HR��Ѷ</li><li class="qit"></li>
	<li class="qit3"><a href="../blog/" class="q14">�͹�����</a></li><li class="qit"></li>
		<li class="qit3"><a href="../about/service.asp" class="q14">�������</a></li><li class="qit"></li>
	</div>

</div><div id="qso">
<form name="form2" method="post" action="../MySearch.asp">&nbsp;<img src="../images/qso.gif" width="13" height="13" />
  �ؼ��֣�
    <input name="keyword" type="text" value="" size="30" maxlength="30" />
<select name="mytime" class="input" id="mytime" style="FONT-SIZE: 12px; WIDTH: 90px" width="10">
  <option value="1">1����</option>
  <option value="2">3����</option>
  <option value="3">һ����</option>
  <option value="4" selected="selected">һ������</option>
  <option value="5">��������</option>
  <option value="6">������</option>
  <option value="7">һ����</option>
</select>
<input type="radio" name="mytype" value="1" />ְλ
<input name="mytype" type="radio" value="2" checked />����
<input name="imageField" type="image" src="../images/so.gif" align="middle" />
    &nbsp;<strong>���Ŵ�</strong>��<a href="Person_search.asp?MainCatelog=1" class="t12">��ʳ</a> 
    <a href="Person_search.asp?MainCatelog=9" class="t12">����/װ��</a> <a href="Person_search.asp?MainCatelog=7" class="t12">ˮ��/�յ�</a> 
    <br>
  </form></div>