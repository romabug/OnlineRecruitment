
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
     ���� <A title=��Ϊ��ҳ 
            onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%= Cls_WebUrl %>');" 
            href="#">��Ϊ��ҳ</a>��|��<A title=�����ղ� 
            href="javascript:window.external.AddFavorite('<%= Cls_WebUrl %>','<%= Cls_WebName %>')" 
            target=_top>��ӵ��ղؼ�</A>  
   </div>
   
   <div style="height:40px; width:500px; float:left; "></div>
   
   <!---nav--->
   <div class="nav" style="margin-bottom:8px;">
    <ul>
      <li><a href="/service/">HR����</a></li>
      <li><a href="/life/">ʨ������</a></li>
      <li><a href="/info/">������Ѷ</a></li>
      <li><a href="/rencai/">�����˲ſ�</a></li>
      <li><a href="/person/">�¼�����Ƹ</a></li>
      <li><a href="/">��  ҳ</a></li>
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
                <td width="220" height="25" style="padding-left:5px;padding-top:2px;"><font color="#FFFFFF">�����ǣ� 
                  <% 
	  dim week,w
	  w=year(date)&"��"&month(date)&"��"&day(date)&"��,����"
	 week=weekday(date)
	 select case week
      case 1: w=w&"��"
	  case 2: w=w&"һ"
	  case 3: w=w&"��"
	  case 4: w=w&"��"
	  case 5: w=w&"��"
	  case 6: w=w&"��"
	  case 7: w=w&"��"
	 end select
	 response.write(w)
	 %>
                  </font></td>
                
          <td align="right" style="padding-right:10px;padding-top:2px;">&nbsp;</td>
              </tr>
    </table></td>
  </tr>
</table>
