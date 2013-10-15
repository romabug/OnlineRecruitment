<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../Css/Style.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table1">
  <tr> 
          <td width="7"><img src="../Images/Index/top1_left.jpg" width="7" height="25"></td>
          <td height="25" background="../Images/Index/top1_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table2">
              <tr> 
                <td><font color="#999999"><A title=设为首页 
            onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%= Cls_WebUrl %>');" 
            href="#">设为首页</a> | <A title=加入收藏 
            href="javascript:window.external.AddFavorite('<%= Cls_WebUrl %>','<%= Cls_WebName %>')" 
            target=_top>添加到收藏夹</A></font></td>
                <td width="350" align="right"><img src="../Images/ar.gif" width="7" height="7"> 
                  <a href="../Public/Register.asp" target="_parent">会员注册</a> <font color="#999999">|</font> 
                  <a href="../Public/Contact.asp" target="_parent">客服中心</a> <font color="#999999">|</font> 
                </td>
                <td width="87" align="right"> 
                  <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:80px;background-color:#dddddd;" ID="Select1">
                    <option value="#">地区招聘</option>
                    <% 
					Set Rs_m = Conn.Execute("Select * From [pH_Web_City] Where Flag=1 Order by c_level ASc")
					While Not Rs_m.Eof
					 %>
                    <option value="<%= "../Index_Area.asp?City="&Rs_m("Cityid") %>"><%= Rs_m("c_Name") %></option>
                    <% 
					  Rs_m.Movenext
					Wend
					Rs_m.Close
					  %>
                  </select></td>
              </tr>
            </table></td>
          <td width="7"><img src="../Images/Index/top1_right.jpg" width="7" height="25"></td>
        </tr>
      </table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table3">
  <tr> 
          <td height="6"></td>
        </tr>
      </table>
      
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table4">
  <tr> 
          
    <td width="190"><a href="<%= Cls_WebUrl %>" target="_blank"><img src="../Images/Logo.jpg" width="190" height="60" border="0" title="<%= Cls_WebName %>"></a></td>
          <td align="right" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table5">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                
          <td height="23" align="right" valign="bottom"> 
            <table width="550" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="55" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Index.asp" target="_parent">首页</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Person/" target="_parent">个人服务</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Company/" target="_parent">企业服务</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Video/" target="_parent">视频招聘</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Intro/" target="_parent">人才中介</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Educate/" target="_parent">培训服务</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../School/" target="_parent">校园频道</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
                <td width="70"><table width="65" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="4"><img src="../Images/Index/topnav_left.gif" width="4" height="21"></td>
                      <td  align="center" style=" BORDER-TOP: #bfbfbf 1px solid;PADDING-TOP: 2px;"><a href="../Info/" target="_parent">资讯中心</a></td>
                      <td width="4"><img src="../Images/Index/topnav_right.gif" width="4" height="21"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table14">
  <tr> 
          <td height="26" align="center" background="../Images/Index/nav4_bg.jpg"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table15">
              <tr> 
                <td width="220" height="25" style="padding-left:5px;padding-top:2px;"><font color="#FFFFFF">今天是： 
                  <% 
	  dim week,w
	  w=year(date)&"年"&month(date)&"月"&day(date)&"日,星期"
	 week=weekday(date)
	 select case week
      case 1: w=w&"日"
	  case 2: w=w&"一"
	  case 3: w=w&"二"
	  case 4: w=w&"三"
	  case 5: w=w&"四"
	  case 6: w=w&"五"
	  case 7: w=w&"六"
	 end select
	 response.write(w)
	 %>
                  </font></td>
                <td align="right" style="padding-right:10px;padding-top:2px;"><font color="#FFFFFF"><a href="../Person/" class="k1" target="_parent">职位搜索</a> 
                  | <a href="../Company/Search.asp" class="k1" target="_parent">简历搜索</a> | <a href="../Video/Video_Company.asp" class="k1" target="_parent">企业视频</a> 
                  | <a href="../Video/Video_Person.asp" class="k1" target="_parent">视频简历</a> | <a href="../Person/CompanyBrand.asp" class="k1" target="_parent">品牌企业</a> 
                  | <a href="../Showme/" class="k1" target="_parent">英才自荐</a> | <a href="../Video/" class="k1" target="_parent">视频面试</a></font></td>
              </tr>
            </table></td>
        </tr>
      </table>

</body>
</html>
