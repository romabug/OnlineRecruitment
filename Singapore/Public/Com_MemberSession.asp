
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <% If IsArray(Session("Company")) Then %>
  <tr align="center"> 
    <td height="27" colspan="2">�� <Font color="#ff0000"><u><%= Session("Company")(0) %></u></Font> ��</td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2">��ӭʹ��<%= Cls_WebName %></td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2"><a href="../Company/Com_Logout.asp"><u>�˳�</u></a> 
      <a href="../Company/User_Center.asp"><u>������ҵר��</u></a></td>
  </tr>
  <% 
	Else
	 %>
  <form name="login" method="post" action="../Public/login.asp"  onSubmit="return login_check();">
    <tr> 
      <td width="60" height="26" align="right">�û�����</td>
      <td height="26"> <input name="username" type="text" class="login_03" size="16" style="width:100px;"></td>
    </tr>
    <tr> 
      <td width="60" height="26" align="right">�ܡ��룺</td>
      <td height="26"> <input name="password" type="password"  size="16" style="width:100px;" class="login_03"></td>
    </tr>
    <tr align="center"> 
      <td height="25" colspan="2"><input name="usertype" type="hidden" id="usertype" value="company">
        <input name="imageField" type="image" src="../Images/Company/login.jpg" width="45" height="19" border="0">
        <a href="../Company/Register.asp"><img src="../Images/Company/reg.jpg" width="45" height="19" border="0"></a>      </td>
    </tr>
    <tr align="center"> 
      <td height="25" colspan="2"><img src="../Images/ar.gif" width="7" height="7"> 
        <a href="../Public/Get_Password.asp"><font color="#666666">�һ�����</font></a> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Register.asp"><font color="#666666">���ע��</font></a></td>
    </tr>
  </form>
  <% 
  End if
   %>
</table>

