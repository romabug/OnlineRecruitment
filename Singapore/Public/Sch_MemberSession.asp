
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <% If IsArray(Session("School")) Then %>
  <tr align="center"> 
    <td height="34" colspan="2">『 <Font color="#ff0000"><u><%= Session("School")(0) %></u></Font> 』</td>
  </tr>
  <tr align="center"> 
    <td height="34" colspan="2">欢迎使用<%= Cls_WebName %></td>
  </tr>
  <tr align="center"> 
    <td height="35" colspan="2"><a href="../School/Sch_Logout.asp"><u>退出</u></a> 
      <a href="../School/User_Center.asp"><u>进入院校专区</u></a></td>
  </tr>
  <% 
	Else
	 %>
  <form name="login" method="post" action="../Public/login.asp"  onSubmit="return login_check();">
    <tr> 
      <td width="60" height="27" align="right">用户名：</td>
      <td height="27"> <input name="username" type="text" class="login_03" size="16" style="width:100px;"></td>
    </tr>
    <tr> 
      <td width="60" height="27" align="right">密 码：</td>
      <td height="27"> <input name="password" type="password"  size="16" style="width:100px;" class="login_03"></td>
    </tr>
    <tr align="center"> 
      <td height="27" colspan="2"> <input name="imageField" type="image" src="../Images/School/login.gif" width="45" height="19" border="0"> 
        <a href="../Public/Register.asp"><img src="../Images/School/reg.gif" width="45" height="19" border="0"></a></td>
    </tr>
    <tr align="center"> 
      <td height="20" colspan="2"><input name="usertype" type="hidden" id="usertype" value="school"> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Get_Password.asp">找回密码</a> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Register.asp">免费注册</a></td>
    </tr>
  </form>
  <% 
  End if
   %>
</table>

