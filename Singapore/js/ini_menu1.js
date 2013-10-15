<!--
function mmLoadMenus() {
  if (window.mm_menu_01) return;
  window.mm_menu_01 = new Menu("root",80,22,"",12,"#000000","#000000","#D9D9D9","#F1F1F1","left","middle",3,0,300,-5,7,true,true,true,0,false,true);

  mm_menu_01.addMenuItem("-&nbsp;公司介绍","location='Intro_01.asp'");

  mm_menu_01.hideOnMouseOut=true;
  mm_menu_01.bgColor='#FFFFFF';
  mm_menu_01.menuBorder=0;
  mm_menu_01.menuLiteBgColor='#ffffff';
  mm_menu_01.menuBorderBgColor='#162E7C';
window.mm_menu_02 = new Menu("root",80,22,"",12,"#000000","#000000","#D9D9D9","#F1F1F1","left","middle",3,0,300,-5,7,true,true,true,0,false,true);
  mm_menu_02.addMenuItem("-&nbsp;无线网络","location='Product01.asp'");
  mm_menu_02.addMenuItem("-&nbsp;LED显示屏","location='Product02.asp'");
  mm_menu_02.addMenuItem("-&nbsp;网络安全","location='Product03.asp'");
  mm_menu_02.addMenuItem("-&nbsp;海易软件","location='Product04.asp'");
  mm_menu_02.addMenuItem("-&nbsp;通讯产品","location='Product05.asp'");
  mm_menu_02.addMenuItem("-&nbsp;网站建设","location='Product06.asp'");
  mm_menu_02.addMenuItem("-&nbsp;网络系统","location='Product07.asp'");
  mm_menu_02.addMenuItem("-&nbsp;弱电系统","location='Product08.asp'");
  mm_menu_02.hideOnMouseOut=true;
  mm_menu_02.bgColor='#FFFFFF';
  mm_menu_02.menuBorder=0;
  mm_menu_02.menuLiteBgColor='#FFFFFF';
  mm_menu_02.menuBorderBgColor='#000000';
window.mm_menu_03 = new Menu("root",120,22,"",12,"#000000","#000000","#D9D9D9","#F1F1F1","left","middle",3,0,300,-5,7,true,true,true,0,false,true);
  mm_menu_03.addMenuItem("-&nbsp;无线网络解决方案","location='Network01.asp'");
  mm_menu_03.addMenuItem("-&nbsp;局域网络组网方案","location='Network02.asp'");

  mm_menu_03.hideOnMouseOut=true;
  mm_menu_03.bgColor='#FFFFFF';
  mm_menu_03.menuBorder=0;
  mm_menu_03.menuLiteBgColor='#FFFFFF';
  mm_menu_03.menuBorderBgColor='#000000';
window.mm_menu_04 = new Menu("root",100,22,"",12,"#000000","#000000","#D9D9D9","#F1F1F1","left","middle",3,0,300,-5,7,true,true,true,0,false,true);
  mm_menu_04.addMenuItem("-&nbsp;典型客户","location='html/clients/client_1.htm'");
  mm_menu_04.addMenuItem("-&nbsp;行业客户","location='html/clients/client_2.htm'");
  mm_menu_04.hideOnMouseOut=true;
  mm_menu_04.bgColor='#FFFFFF';
  mm_menu_04.menuBorder=0;
  mm_menu_04.menuLiteBgColor='#FFFFFF';
  mm_menu_04.menuBorderBgColor='#000000';
window.mm_menu_05 = new Menu("root",80,22,"",12,"#000000","#000000","#D9D9D9","#F1F1F1","left","middle",3,0,300,-5,7,true,true,true,0,false,true); 
  mm_menu_05.addMenuItem("-&nbsp;服务模式","location='service01.asp'");
  mm_menu_05.addMenuItem("-&nbsp;电话支持","location='service02.asp'");
  mm_menu_05.addMenuItem("-&nbsp;常见问题","location='service03.asp'");
  mm_menu_05.addMenuItem("-&nbsp;上门服务","location='service04.asp'");  
   mm_menu_05.hideOnMouseOut=true;
   mm_menu_05.bgColor='#FFFFFF';
   mm_menu_05.menuBorder=0;
   mm_menu_05.menuLiteBgColor='#FFFFFF';
   mm_menu_05.menuBorderBgColor='#000000';
mm_menu_01.writeMenus();
} // mmLoadMenus()
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
