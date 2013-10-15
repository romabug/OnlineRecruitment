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
    <td width="230" valign="bottom"><a href="<%= Cls_WebUrl %>"><img src="../Images/Logo.jpg"  border="0" title="<%= Cls_WebName %>"></a></td>
    <td width="174"> <img src="../Images/header/zhaopinguanli.gif"  /> </td>
    <td width="546" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
    <td height="25" bgcolor="#003399" style="padding-left:7px;padding-top:3px;"> 
      <font color="#FFFFFF"> <a href="../Company/Com_BasicInfo.asp" class="k1">公司资料修改</a> 
      | <a href="../Company/Com_JobManage.asp" class="k1">发布招聘信息</a> 
	  
	<!--    | <a href="../Company/Com_Searcher.asp" class="k1">搜索人才</a>   -->
		
	  | <a href="../Company/Com_InBox.asp" class="k1">简历、投递管理</a> 
      | <a href="../Company/Com_Video.asp" class="k1">视频招聘</a> 
	
   
	  | <a href="../Company/Com_ChangeName.asp" class="k1">帐号设置</a> 
      | <a href="../Company/Com_Logout.asp" class="k1">安全退出</a> </font> </td>
    <td width="180" align="right" bgcolor="#003399" style="padding-right:5px;padding-top:3px;">&nbsp;</td>
  </tr>
</table>
