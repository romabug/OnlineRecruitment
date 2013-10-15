
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
          <td height="6">&nbsp;</td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
          
    <td width="190">
	 
	<a href="<%= Cls_WebUrl %>" target="_blank"></a><span class="logo"><a href="/"><img src="/Images/mainpage/Logo.jpg" width="230" height="62" border="0" /></a></span></a>	</td>
          <td align="right" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22"><div class="topright">
   <div class="topmenu">
     　　 <A title=设为首页 
            onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%= Cls_WebUrl %>');" 
            href="#">设为首页</a>　|　<A title=加入收藏 
            href="javascript:window.external.AddFavorite('<%= Cls_WebUrl %>','<%= Cls_WebName %>')" 
            target=_top>添加到收藏夹</A>  
   </div>
   
   <div style="height:40px; width:500px; float:left; "></div>
   
   <!---nav--->
   <div class="nav" style="margin-bottom:8px;">
    <ul>
      <li><a href="/service/">HR服务</a></li>
      <li><a href="/life/">狮城生活</a></li>
      <li><a href="/info/">劳务资讯</a></li>
      <li><a href="/rencai/">意向人才库</a></li>
      <li><a href="/person/">新加坡招聘</a></li>
      <li><a href="/">首  页</a></li>
    </ul>
   </div>
  </div></td>
              </tr>
                  </table></td>
              </tr>
              
            </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
          <td height="26" align="center" background="../Images/mainpage/tab_bg.jpg"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                
          <td align="right" style="padding-right:10px;padding-top:2px;">&nbsp;</td>
              </tr>
    </table></td>
  </tr>
</table>
