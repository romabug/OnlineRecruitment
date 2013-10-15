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

<td width="90"><a href="../Video/"><img src="../Images/Head/Video_logo.jpg" width="90" height="65" border="0"></a></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" style="padding-right:5px;"> <font color="#999999"><a href="../Index.asp">首页</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Person/">个人服务</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Company/">企业服务</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Intro/">人才中介</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Educate/">培训服务</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../School/">校园频道</a><img src="../Images/Head/icon1.gif" width="11" height="15" align="absmiddle"><a href="../Info/">资讯中心</a> 
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
          <td width="90">
<table width="85" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Video2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Video2_bg.jpg" style="padding-top:3px;"><a href="../Video/Video_Meet.asp" class="k1">视频招聘会</a></td>
                <td width="5"><img src="../Images/Head/Video2_right.jpg" width="5" height="24"></td>
              </tr>
            </table>
          </td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Video2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Video2_bg.jpg" style="padding-top:3px;"><a href="../Video/" class="k1">视频面试</a></td>
                <td width="5"><img src="../Images/Head/Video2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"> 
            <table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Video1_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Video1_bg.jpg" style="padding-top:3px;"><a href="../Video/Video_Person.asp" class="k1"><strong>视频简历</strong></a></td>
                <td width="5"><img src="../Images/Head/Video1_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td width="80"><table width="75" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5"><img src="../Images/Head/Video2_left.jpg" width="5" height="24"></td>
                <td align="center" background="../Images/Head/Video2_bg.jpg" style="padding-top:3px;"><a href="../Video/Video_Company.asp" class="k1">企业视频</a></td>
                <td width="5"><img src="../Images/Head/Video2_right.jpg" width="5" height="24"></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#863D70" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"> <a href="../Video/Video_Person_More.asp" class="k1" target="_blank">视频简历</a> 
      | <a href="../Company/Com_Search_New.asp" class="k1" target="_blank">求职简历</a> </font></td>
  </tr>
</table>
