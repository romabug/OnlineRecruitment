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
    <td width="190" valign="bottom"><a href="<%= Cls_WebUrl %>"><img src="../Images/Logo.jpg" width="271" height="62"  border="0" title="<%= Cls_WebName %>"></a></td>

<td width="90"><a href="../Info/"></a></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" style="padding-right:5px;">
		  
		  	  	    <!--#include file="channel.asp" -->  
          </td>
          <td width="80">
		  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:80px;">
                    <option value="#">地区招聘</option>
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
          <td width="80"> 
            <table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Info1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Info1_bg.jpg" style="padding-top:3px;"><a href="../Info/Work.asp" class="k1"><strong>职业指导</strong></a></td>
                <td width="5"><img src="../Images/Head/Info1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Info2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Info2_bg.jpg" style="padding-top:3px;"><a href="../Info/hr.asp" class="k1">HR资讯</a></td>
                <td width="5"><img src="../Images/Head/Info2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Info2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Info2_bg.jpg" style="padding-top:3px;"><a href="../Info/Train.asp" class="k1">培训资讯</a></td>
                <td width="5"><img src="../Images/Head/Info2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Info2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Info2_bg.jpg" style="padding-top:3px;"><a href="../Info/Employment.asp" class="k1">就业指导</a></td>
                <td width="5"><img src="../Images/Head/Info2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80">&nbsp;</td>
          <td width="80">&nbsp;</td>
          <td width="80">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#9D8209" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"> <a href="../Info/Work_More.asp?Param=10" class="k1">简历指导</a> 
      | <a href="../Info/Work_More.asp?Param=11" class="k1">面试技巧</a> | <a href="../Info/Work_More.asp?Param=8" class="k1">求职实录</a> 
      | <a href="../Info/Work_More.asp?Param=7" class="k1">职场眺望</a> </font></td>
  </tr>
</table>
