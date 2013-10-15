
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <% If IsArray(Session("Person")) Then %>
  <tr align="center"> 
    <td height="27" colspan="2">『 <Font color="#ff0000"><u><%= Session("Person")(0) %></u></Font> 』</td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2">欢迎使用<%= Cls_WebName %></td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2"><a href="../Person/Per_Logout.asp"><u>退出</u></a> 
      <a href="../Person/User_Center.asp"><u>进入个人专区</u></a></td>
  </tr>
  <% 
	Else
	 %>
  <form name="login" method="post" action="../Public/login.asp"  onSubmit="return login_check();">
    <tr> 
      <td width="65" height="27" align="right">用户名：</td>
      <td height="27"> <input name="username" type="text" class="login_03" size="16" style="width:100px;"></td>
    </tr>
    <tr> 
      <td width="65" height="27" align="right">密　码：</td>
      <td height="27"> <input name="password" type="password"  size="16" style="width:100px;" class="login_03"></td>
    </tr>
    <tr align="center"> 
      <td height="27" colspan="2"><input type="hidden" name="usertype" value="person">
        <input name="imageField" type="image" src="../Images/Person/login.gif" width="50" height="20" border="0">
        <a href="../Person/Register.asp"><img src="../Images/Person/reg.gif" width="50" height="20" border="0"></a> 
      </td>
    </tr>
    <tr align="center"> 
      <td height="25" colspan="2"> <img src="../Images/ar.gif" width="7" height="7"> 
        <a href="../Public/Register.asp"><font color="#666666">免费注册</font></a> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Get_Password.asp"><font color="#666666">找回密码</font></a></td>
    </tr>
  </form>
  <% 
  End if
   %>
</table>

