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

<td width="90"><a href="../Person/"><img src="../Images/Head/Person_logo.jpg" width="90" height="65" border="0"></a></td>
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
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Person/User_Center.asp" class="k1">简历中心</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table> </td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Person/" class="k1">职位搜索</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"> 
            <table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person1_bg.jpg" style="padding-top:3px;"><a href="../Person/CompanyVideo.asp" class="k1"><strong>企业视频</strong></a></td>
                <td width="5"><img src="../Images/Head/Person1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Person/CompanyBrand.asp" class="k1">品牌企业</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Headhunt/Index_Person.asp" class="k1">猎头职位</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Part/Index_Person.asp" class="k1">兼职信息</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Person2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Person2_bg.jpg" style="padding-top:3px;"><a href="../Train/Index.asp" class="k1">职业指导</a></td>
                <td width="5"><img src="../Images/Head/Person2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#ff6600"> 
    <td height="25" style="padding-left:6px;padding-top:3px;"> <font color="#FFFFFF">
	   <a href="../Person/Per_Search_CompanyVideo.asp" class="k1" target="_blank">企业视频</a> 
      | <a href="../Person/Per_Search_New.asp" class="k1" target="_blank">企业职位</a> 
	  </font></td>
  </tr>
</table>
