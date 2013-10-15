//改变title的文字

document.title="西部人力(JOB365.net)--招聘";

//强制禁止弹出出错提示框
function killErrors() {
	return true;
}
window.onerror = killErrors;

//打开简体版网站
function openGB2312() {
	window.location.href='h'+'ttp://www.job365.net/';
}

//改变站点图片显示

var hrefall = document.location.href;
var href=hrefall.toLowerCase();
var siteImageLocation;
    if(href.indexOf("gz.job365.net") != -1)
	{
		siteImageLocation ="http://img.job365.net/site_guangzhou_image.gif";  //表示广州站首页
	}
	else if(href.indexOf("st.job365.net") != -1)
	{
		siteImageLocation ="http://img.job365.net/site_ShanTou_image.gif";  //表示汕头站首页
	}
	else if(href.indexOf("sy.job365.net") != -1)
	{
		siteImageLocation ="http://img.job365.net/site_ShenYang_image.gif";  //表示沈阳站首页
	}
	else if(href.indexOf("sz.job365.net") != -1)
	{
		siteImageLocation ="http://img.job365.net/site_ShenZhen_image.gif";  //表示深圳站首页
	}
	else if(href.indexOf("bj.job365.net") != -1)
	{
		siteImageLocation ="http://img.job365.net/site_Beijing_image.gif";  //表示北京站首页
	}
	else
	{
		
		siteImageLocation =0;  //表示全国站首页
	}


//分站点下拉菜单函数 开始/
function ImageDisplayDown(aa){
aa.src='http://img.job365.net/site_layer_arrow1.gif';
AllSite.style.display='block'
}
function ImageDisplayOut(aa){
aa.src='http://img.job365.net/site_layer_arrow.gif';
AllSite.style.display='none'
}
function LayerDisplayOver(aa){
aa.style.display='block';
}
function LayerDisplayOut(aa){
aa.style.display='none';
}
function OverChangeColor(aa){
aa.style.background="#96BDE9";
aa.style.color="#ffffff";
}
function OutChangeColor(aa){
aa.style.background="#ffffff";
aa.style.color="#023087";
}
//分站点下拉菜单函数 结束/

var sitecode="";
sitecode=sitecode+"	<img src='http://img.job365.net/site_layer_arrow.gif' width='82' height='21' align='top' style='cursor:hand;' onMouseDown='ImageDisplayDown(this)' onMouseOut='ImageDisplayOut(this)'>";
sitecode=sitecode+"<div id='AllSite' style='position:absolute; left:0px; top:25px; width:80px; height:75px; z-index:1; background-color: #ffffff; border:1px solid #719EDB;font-size:12px;display:none' onMouseOver='LayerDisplayOver(this)' onMouseOut='LayerDisplayOut(this)'>";
sitecode=sitecode+"	  <table width='100%'  border='0' cellspacing='1' cellpadding='1'>";
sitecode=sitecode+"        <tr>";
sitecode=sitecode+"          <td align='center' onMouseOver='OverChangeColor(this)' onMouseOut='OutChangeColor(this)'><a href='http://sz.job365.net/'>深圳</a></td>";
sitecode=sitecode+"        </tr>";
sitecode=sitecode+"        <tr>";
sitecode=sitecode+"          <td align='center' onMouseOver='OverChangeColor(this)' onMouseOut='OutChangeColor(this)'><a href='http://gz.job365.net/'>广州</a></td>";
sitecode=sitecode+"        </tr>";
sitecode=sitecode+"        <tr>";
sitecode=sitecode+"          <td align='center' onMouseOver='OverChangeColor(this)' onMouseOut='OutChangeColor(this)'><a href='http://bj.job365.net/'>北京</a></td>";
sitecode=sitecode+"        </tr>";
sitecode=sitecode+"        <tr>";
sitecode=sitecode+"          <td align='center' onMouseOver='OverChangeColor(this)' onMouseOut='OutChangeColor(this)'><a href='http://st.job365.net/'>汕头</a></td>";
sitecode=sitecode+"        </tr>";
sitecode=sitecode+"        <tr>";
sitecode=sitecode+"          <td align='center' onMouseOver='OverChangeColor(this)' onMouseOut='OutChangeColor(this)'><a href='http://sy.job365.net/'>沈阳</a></td>";
sitecode=sitecode+"        </tr>";
sitecode=sitecode+"      </table>";
sitecode=sitecode+"	</div>";
function dohome(){
	this.home.style.behavior='url(#default#homepage)';this.home.setHomePage('http://Recruit.job365.net');
}

function FavoriteTo365Key(){
	d=document;
	t=d.selection?(d.selection.type!='None'?d.selection.createRange().text:''):(d.getSelection?d.getSelection():'');
	void(keyit=window.open('http://www.365key.com/storeit.aspx?t='+escape(d.title)+'&u='+escape(d.location.href)+'&c='+escape(t),'keyit','scrollbars=no,width=475,height=575,left=75,top=20,status=no,resizable=yes'));keyit.focus();
}
document.write("<table width='778' border='0' align='center' cellpadding='0' cellspacing='0'>");
document.write("  <tr>");
document.write("    <td width='180' height='35' style='PADDING-LEFT: 10px; BORDER-BOTTOM: #bad2ff 2px solid'><IMG height=13 src='http://img.job365.net/TitleName.gif' width=80></td>");
document.write("    <td align='right' style='BORDER-BOTTOM: #4c77c9 2px solid'> ");
document.write("   ·<A href='#' name='home' onclick='dohome();'>设为首页</a> ·<A href=javascript:window.external.AddFavorite(\'http://JobSeeker.job365.net/\',\'天天工作网-求职\')>加入收藏</a> ·<A href='#' name='365key' onclick='FavoriteTo365Key();'>收藏此页到<font color=DarkOrchid>365K<font color='#57c200'>e</font>y</font></a> <a href='javascript:openGB2312()' target='_parent'><IMG height=20 src='http://www.job365.net/img/button_gb2312.gif' width=54 align='absmiddle' border='0'></a> <a href='http://big5.job365.net/'><IMG height=20 src='http://www.job365.net/img/button_big5.gif' width=54 align='absmiddle' border='0'></a></td>");
document.write("  </tr>");
document.write("</table>");
document.write("<table width='778' border='0' align='center' cellpadding='0' cellspacing='0'>");
document.write("  <tr>");
document.write("    <td width='190' height='90'><a href='http://www.job365.net'><IMG src='http://img.job365.net/logo_job365.gif' border='0'></a>");

if (siteImageLocation != 0){
document.write("    <br><img src=");
document.write (siteImageLocation);
document.write("    >");
}

document.write("    </td><td align='center'> ");
document.write(" <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='468' height='60'>");
document.write(" <param name='movie' value='http://img.job365.net/Golden_No15_banner.swf'>");
document.write(" <param name='quality' value='high'>");
document.write(" <param name='menu' value='0'>");
document.write(" <embed src='http://img.job365.net/Golden_No15_banner.swf' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='468' height='60'></embed>");
document.write(" </object>");

//document.write("                                        <a href='http://info.job365.net/news/200504/20050406093412946.htm' target='_blank'><img src='http://img.job365.net/banner.gif' width='545' height='70' border='0'></a>");

document.write("    </td><td>");
document.write("    <table width='80'  border='0' cellspacing='1' cellpadding='0' height='50'><tr>");
document.write("        <td align='center'> <a href='http://www.job365.net/General/About.htm'>&middot; 关于我们 </a> </td></tr><tr>");
document.write("        <td align='center'> <a href='http://www.job365.net/General/contactus.htm'>&middot; 联系我们 </a></td></tr><tr>");
document.write("        <td align='center'> <a href='http://www.job365.net/General/navigate.htm'>&middot; 网站地图 </a> </td>");
document.write("     </table>");
document.write("    </td>");
document.write("  </tr>");
document.write("</table>");
document.write("<table width='778' height='27' border='0' align='center' cellpadding='0' cellspacing='0' background='http://img.job365.net/menu_1_bakcground.gif'>");
document.write("  <tr>");
document.write("    <td width='30'>&nbsp;</td><td width='90' valign='top' class='Menu1Position' style='position:relative'>");
document.write (sitecode);
document.write("    </td><td width='60' align='middle' class='Menu1Position'><A class=menu href='http://www.job365.net'>首 页</a></td>");
document.write("    <td width='7' align='center'><img src='http://img.job365.net/menu_1_line_1.gif' width='7' height='27'></td>");
document.write("	<td width='60' align='center' class='Menu1Position'><a  href='http://JobSeeker.job365.net' class='menu'>求 职</a></td>");
document.write("    <td width='81'><a href='http://Recruit.job365.net'><img src='http://img.job365.net/menu_2_recruit.gif' width='81' height='27' border='0'></a></td>");
document.write("	<td width='60' align='center' class='Menu1Position'><a  href='http://train.job365.net' class='menu'>培 训</a></td>");
document.write("	<td width='7' align='center'><img src='http://img.job365.net/menu_1_line_1.gif' width='7' height='27'></td>");
document.write("	<td width='60' align='center' class='Menu1Position'><a  href='http://pdp.job365.net' class='menu'>测 评</td>");
document.write("    <td width='7' align='center'><img src='http://img.job365.net/menu_1_line_1.gif' width='7' height='27'></td>");
//document.write("    <td width='80' align='center' class='Menu1Position'><a  href='http://Campus.job365.net' class='menu'>校园招聘</a></td>");
//document.write("    <td width='7' align='center'><img src='http://img.job365.net/menu_1_line_1.gif' width='7' height='27'></td>");
document.write("    <td width='80' align='center' class='Menu1Position'><a  href='http://Agency.job365.net' class='menu'>人事代理</a></td>");
document.write("    <td width='7' align='center'><img src='http://img.job365.net/menu_1_line_1.gif' width='7' height='27'></td>");
document.write("    <td width='80' align='center' class='Menu1Position'><a  href='http://Club.job365.net' class='menu'>HR俱乐部</a></td>");


document.write("    <td>&nbsp;</td>");
document.write("  </tr>");
document.write("</table>");

document.write("<table width='778' border='0' cellspacing='0' cellpadding='0' align='center'>");
document.write("  <tr>");
document.write("    <td background='http://img.job365.net/menu_1_line_2.gif' style='PADDING-LEFT: 251px'><IMG height=3 src='http://img.job365.net/menu_1_line_3.gif' width=78></td>");
document.write("  </tr>");
document.write("</table>");
document.write("<table width='778' height='25' border='0' align='center' cellpadding='0' cellspacing='0' background='http://img.job365.net/menu_2_bakcground.gif'>");
document.write("  <tr>");
document.write("    <td width='70'><img src='http://img.job365.net/menu_title_1.gif'></td>");
document.write("    <td width='20'><IMG height=13 src='http://img.job365.net/menu_2_dian.gif' width=13></td>");
document.write("    <td width='65' class='menu2position'><A class=menu2 href='http://jobseeker.job365.net/'>网上招聘</a></td>");
document.write("    <td width='20'><IMG height=13 src='http://img.job365.net/menu_2_dian.gif' width=13></td>");
document.write("    <td width='65' class='menu2position'><A class=menu2 href='http://recruit.job365.net/JlbMeeting.asp'>现场招聘</a></td>");
document.write("    <td width='20'><IMG height=13 src='http://img.job365.net/menu_2_dian.gif' width=13></td>");
document.write("    <td width='65' class='menu2position'><A class=menu2 href='http://recruit.job365.net/agentrecruit.asp'>委托招聘</a></td>");
document.write("    <td width='20'><IMG height=13 src='http://img.job365.net/menu_2_dian.gif' width=13></td>");
document.write("    <td width='65' class='menu2position'><A class=menu2 href='http://headhunting.job365.net/'>猎头招聘</a></td>");
document.write("	<td>&nbsp;</td>");
document.write("    <td width='70'><img src='http://img.job365.net/menu_title_2.gif'></td>");
document.write("    <td width='115' class='menu2position'><A class=menu2 href='http://goldencollar.job365.net/'>金领世界招聘会</a></td>");
document.write("  </tr>");
document.write("</table>");
document.write("<table width='778' border='0' align='center' cellpadding='0' cellspacing='0'>");
document.write("  <tr>");
document.write("    <td height='9'></td>");
document.write("  </tr>");
document.write("</table>");



document.write("<script language='javascript'>");
document.write("function dohome(){");
document.write("this.home.style.behavior='url(#default#homepage)';this.home.setHomePage('http://Recruit.job365.net');}");
document.write("</script>");