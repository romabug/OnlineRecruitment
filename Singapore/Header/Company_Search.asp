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

<td width="90"><a href="../Company/"><img src="../Images/Head/Company_logo.jpg" width="90" height="65" border="0"></a></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" style="padding-right:5px;"> <font color="#999999"><a href="../Index.asp">首页</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Person/">个人服务</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Video/">视频招聘</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Intro/">人才中介</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Educate/">培训服务</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../School/">校园频道</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Info/">资讯中心</a> 
            </font> </td>
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
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Company/User_Center.asp" class="k1">招聘中心</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Company/" class="k1">企业服务</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"> 
            <table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company1_bg.jpg" style="padding-top:3px;"><a href="../Company/Search.asp" class="k1"><strong>简历搜索</strong></a></td>
                <td width="5"><img src="../Images/Head/Company1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Company/PersonVideo.asp" class="k1">视频简历</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Showme/" class="k1">自荐人才</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Part/Index_Company.asp" class="k1">兼职信息</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Company2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Company2_bg.jpg" style="padding-top:3px;"><a href="../Hr/" class="k1">HR资讯</a></td>
                <td width="5"><img src="../Images/Head/Company2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#104e9e" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"> 
	    <a href="../Company/Search.asp" class="k1">快速搜索</a> 
      | <a href="../Company/Search.asp#a" class="k1">职能搜索</a>
	  | <a href="../Company/Search.asp#b" class="k1">行业搜索</a>
	  | <a href="../Company/Search.asp#c" class="k1">地区搜索</a>
	  | <a href="../Company/AdvanceSearch.asp" class="k1">高级搜索</a>
	  </font> </td>
  </tr>
</table>
