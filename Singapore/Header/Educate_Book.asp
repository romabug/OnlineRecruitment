<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="190" valign="bottom"><a href="<%= Cls_WebUrl %>"><img src="../Images/Logo.jpg"  border="0" title="<%= Cls_WebName %>"></a></td>

<td width="90"><a href="../Educate/"><img src="../Images/Head/Educate_logo.jpg" width="90" height="65" border="0"></a></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" style="padding-right:5px;"> <font color="#999999"><a href="../Index.asp">��ҳ</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Person/">���˷���</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Company/">��ҵ����</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Video/">��Ƶ��Ƹ</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Intro/">�˲��н�</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../School/">У԰Ƶ��</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Info/">��Ѷ����</a> 
            </font> </td>
          <td width="80">
		  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:80px;">
                    <option value="#">������Ƹ</option>
                    <% 
					Set Rs_m = Conn.Execute("Select * From [pH_Web_City] Where Flag=1 Order by c_level Asc")
					While Not Rs_m.Eof
					 %>
                    <option value="<%= "../Index_Area.asp?City="&Rs_m("Cityid") %>"><%= Rs_m("c_name") %></option>
                    <% 
					  Rs_m.Movenext
					Wend
					Rs_m.Close
					  %>
                  </select>
		  </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="24"><table width="950" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="5">&nbsp;</td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate2_bg.jpg" style="padding-top:3px;"><a href="../Educate/User_Center.asp" class="k1">��ѵ����</a></td>
                <td width="5"><img src="../Images/Head/Educate2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate2_bg.jpg" style="padding-top:3px;"><a href="../Educate/" class="k1">��ѵ����</a></td>
                <td width="5"><img src="../Images/Head/Educate2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate2_bg.jpg" style="padding-top:3px;"><a href="../Educate/Lesson.asp" class="k1">��ѵ�γ�</a></td>
                <td width="5"><img src="../Images/Head/Educate2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate2_bg.jpg" style="padding-top:3px;"><a href="../Educate/Teacher.asp" class="k1">��ѵ��ʦ</a></td>
                <td width="5"><img src="../Images/Head/Educate2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"> 
            <table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate1_bg.jpg" style="padding-top:3px;"><a href="../Educate/Book.asp" class="k1"><strong>��ѵ�鼮</strong></a></td>
                <td width="5"><img src="../Images/Head/Educate1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Educate2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Educate2_bg.jpg" style="padding-top:3px;"><a href="../Educate/Hr.asp" class="k1">��ѵ��Ѷ</a></td>
                <td width="5"><img src="../Images/Head/Educate2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#0F6F6D" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"> 
	    <a href="../Educate/Train.asp" class="k1">���»���</a> 
      | <a href="../Educate/Book_More.asp" class="k1">�����鼮</a> 
	  </font></td>
  </tr>
</table>
