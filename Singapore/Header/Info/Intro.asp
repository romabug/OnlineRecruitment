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
    <td height="5"></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="190" valign="bottom"><a href="<%= Cls_WebUrl %>"><img src="../../Images/Logo.jpg" width="190" height="60" border="0" title="<%= Cls_WebName %>"></a></td>
    <td width="90"><a href="../../Intro/"><img src="../../Images/Head/Intro_logo.jpg" width="90" height="65" border="0"></a></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        
        <tr>
          <td align="right" style="padding-right:5px;"> <font color="#999999"><a href="../../Index.asp">首页</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../Person/">个人服务</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../Company/">企业服务</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../Video/">视频招聘</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../Educate/">培训服务</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../School/">校园频道</a><img src="../../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../../Info/">资讯中心</a> 
            </font> </td>
          <td width="80">
		  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:80px;">
                    <option value="#">地区招聘</option>
                    <% 
					Set Rs_m = Conn.Execute("Select * From [pH_Web_City] Where Flag=1 Order by c_level Asc")
					While Not Rs_m.Eof
					 %>
                    <option value="<%= "../../Index_Area.asp?City="&Rs_m("Cityid") %>"><%= Rs_m("c_name") %></option>
                    <% 
					  Rs_m.Movenext
					Wend
					Rs_m.Close
					  %>
                  </select>
		  </td>
        </tr>
      </table>
      
    </td>
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
                <td width="5"><img src="../../Images/Head/Intro2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../../Images/Head/Intro2_bg.jpg" style="padding-top:3px;"><a href="../../Intro/User_Center.asp" class="k1">中介中心</a></td>
                <td width="5"><img src="../../Images/Head/Intro2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../../Images/Head/Intro1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../../Images/Head/Intro1_bg.jpg" style="padding-top:3px;"><a href="../../Intro/" class="k1"><strong>中介服务</strong></a></td>
                <td width="5"><img src="../../Images/Head/Intro1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../../Images/Head/Intro2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../../Images/Head/Intro2_bg.jpg" style="padding-top:3px;"><a href="../../Intro/Job.asp" class="k1">招聘信息</a></td>
                <td width="5"><img src="../../Images/Head/Intro2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../../Images/Head/Intro2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../../Images/Head/Intro2_bg.jpg" style="padding-top:3px;"><a href="../../Intro/Company.asp" class="k1">中介公司</a></td>
                <td width="5"><img src="../../Images/Head/Intro2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../../Images/Head/Intro2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../../Images/Head/Intro2_bg.jpg" style="padding-top:3px;"><a href="../../Intro/Showme.asp" class="k1">自荐人才</a></td>
                <td width="5"><img src="../../Images/Head/Intro2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80">&nbsp;</td>
          <td width="80">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#AA0400" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"> <a href="../../Intro/Cor_Search_New.asp" class="k1" target="_blank">中介公司</a> 
      | <a href="../../Intro/Cor_Search_Job.asp" class="k1" target="_blank">招聘信息</a> 
      </font> </td>
  </tr>
</table>
