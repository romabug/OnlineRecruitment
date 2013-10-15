
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <% If IsArray(Session("Educate")) Then %>
  <tr align="center"> 
    <td height="27" colspan="2">『 <Font color="#ff0000"><u><%= Session("Educate")(0) %></u></Font> 』</td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2">欢迎使用<%= Cls_WebName %></td>
  </tr>
  <tr align="center"> 
    <td height="27" colspan="2"><a href="../Educate/Sch_Logout.asp"><u>退出</u></a> 
      <a href="../Educate/User_Center.asp"><u>进入培训专区</u></a></td>
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
      <td width="60" height="27" align="right">密　码：</td>
      <td height="27"> <input name="password" type="password"  size="16" style="width:100px;" class="login_03"></td>
    </tr>
    <tr align="center"> 
      <td height="27" colspan="2"> <input type="submit" name="Submit" value="登 录"> 
        <input type="button" name="Submit2" value="注 册" onClick="location.href='../Public/Register.asp';"> 
      </td>
    </tr>
    <tr align="center"> 
      <td height="25" colspan="2"><input name="usertype" type="hidden" id="usertype" value="educate">
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Get_Password.asp">找回密码</a> 
        <img src="../Images/ar.gif" width="7" height="7"> <a href="../Public/Register.asp">免费注册</a></td>
    </tr>
  </form>
  <% 
  End if
   %>
</table>

