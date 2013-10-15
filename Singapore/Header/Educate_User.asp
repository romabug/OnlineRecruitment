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
    <td width="90"><a href="../Educate/"></a></td>
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
    <td height="25" background="../Images/mainpage/tab_bg_school.jpg" bgcolor="#003399" style="padding-left:8px;padding-top:3px;"> 
      <font color="#FFFFFF">
	    <a href="../Educate/Sch_BasicInfo.asp" class="k1">机构资料管理</a> 
      | <a href="../Educate/Sch_Lesson_Manage.asp" class="k1">课程信息发布</a>  
	  | <a href="../Educate/Sch_Teacher_Manage.asp" class="k1">讲师信息发布</a> 
	  | <a href="../Educate/Sch_Comment_Manage.asp" class="k1">信息反馈</a>  
	  | <a href="../Educate/Sch_ChangeName.asp" class="k1">帐号设置</a>  
	  | <a href="../Educate/Sch_Logout.asp" class="k1">安全退出</a>	  </font></td>
  </tr>
</table>
