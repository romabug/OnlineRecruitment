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
    <td width="165"><a href="../Person/"></a></td>
    <td width="555" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
    <td height="10"></td>
  </tr>
</table>


<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="../Images/mainpage/tab_bg_qiuzhi3.jpg" bgcolor="#003399" style="padding-left:6px;padding-top:3px;"> 
      <font color="#FFFFFF"><a href="../Person/Per_BasicInfo.asp" class="k1">�����޸�</a> 
	  | <a href="../Person/Per_InBox.asp" class="k1">Ͷ�����ղؼ�¼</a> 
	  	   | <a href="../Person/Per_Searcher.asp" class="k1">ְλ�����붩��</a> 

      | <a href="../Person/Per_VideoResume.asp" class="k1">������Ƶ��</a>
       | <a href="../Person/Per_SecuritySetup.asp" class="k1">��������</a> 
      
      | <a href="../Person/Per_ChangeName.asp" class="k1">�ʺ�����</a> </font></td>
    <td width="180" align="right" background="../Images/mainpage/tab_bg_qiuzhi3.jpg" bgcolor="#003399" style="padding-right:4px;padding-top:3px;"><font color="#FFFFFF">��ӭ��,<%= RealName %> | <a href="../Person/Per_Logout.asp" class="k1">�˳�</a></font> 
    </td>
  </tr>
</table>