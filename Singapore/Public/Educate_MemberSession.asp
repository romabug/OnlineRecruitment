
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <% If IsArray(Session("Educate")) Then %>
  <tr align="center"> 
    <td height="27" colspan="2">�� <Font color="#ff0000"><u><%= Session("Educate")(0) %></u></Font> ��</td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2">��ӭʹ��<%= Cls_WebName %></td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2"><a href="../Educate/Sch_Logout.asp"><u>�˳�</u></a> 
      <a href="../Educate/User_Center.asp"><u>������ѵר��</u></a></td>
  </tr>
  <% 
	Else
	 %>
  <form name="login" method="post" action="../Public/login.asp"  onSubmit="return login_check();">
    <tr> 
      <td width="60" height="27" align="right">�û�����</td>
      <td height="27"> <input name="username" type="text" class="login_03" size="16" style="width:100px;"></td>
    </tr>
    <tr> 
      <td width="60" height="27" align="right">�ܡ��룺</td>
      <td height="27"> <input name="password" type="password"  size="16" style="width:100px;" class="login_03"></td>
    </tr>
    <tr align="center"> 
      <td height="27" colspan="2"> <input type="submit" name="Submit" value="�� ¼"> 
        <input type="button" name="Submit2" value="ע ��" onClick="location.href='../Public/Register.asp';"> 
      </td>
    </tr>
    <tr align="center"> 
      <td height="25" colspan="2"><input name="usertype" type="hidden" id="usertype" value="educate">
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Get_Password.asp">�һ�����</a> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Register.asp">���ע��</a></td>
    </tr>
  </form>
  <% 
  End if
   %>
</table>

