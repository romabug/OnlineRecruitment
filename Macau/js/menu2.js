<!--
/**
 * ��ʾ�����˵����Ӳ˵�
 * @param firstPart �Ӳ˵���ǰ׺
 */
function showTopMenu(firstPart){
    var submenu = document.getElementById(firstPart + "sub");
    if(submenu == null) return;
    submenu.style.visibility = "visible";
}
/**
 * ���ض����˵����Ӳ˵�
 * @param firstPart �Ӳ˵���ǰ׺
 */
function hideTopMenu(firstPart){
    var submenu = document.getElementById(firstPart + "sub");
    if(submenu == null) return;
    submenu.style.visibility = "hidden";
}
/**
 * ��ʼ�����˵�
 */
function initLeftMenu(){
    var cookieLeftMenu = getCookie("leftmenu");

    if(cookieLeftMenu == null || cookieLeftMenu == "" || cookieLeftMenu.length != leftmenus.length){
        cookieLeftMenu = "";
        for(var i = 0; i < leftmenus.length; i++){
            cookieLeftMenu += "o";
        }
    }

    for(var i = 0; i < leftmenus.length; i++){
        initSubMenu(leftmenus[i], cookieLeftMenu.charAt(i));
    }
    setCookie("leftmenu", cookieLeftMenu);
}
/**
 * ��/�ر� ���˵��Ķ����˵�
 * @param menuitem һ���˵�����
 */
function actionSubMenu(menuitem){
    if(menuitem == null) return;
    var submenu = document.getElementById(menuitem.id + "sub");
    if(submenu == null) return;
    
    disp = submenu.style.display;
    if(disp == ""){
        disp = "block";
    }
    //״̬
    var state;
    if(disp == "block"){
        state = "c";
        menuitem.style.backgroundImage = "url(\"../images/plusclose2.gif\")";
        submenu.style.display = "none";
    }else{
        state = "o";
        menuitem.style.backgroundImage = "url(\"../images/c11.gif\")";
        submenu.style.display = "block";
    }
    
    var cookieLeftMenu = getCookie("leftmenu");
    if(cookieLeftMenu == null) return;
    
    var arrayLeftMenu = cookieLeftMenu.split("");
    for(var i = 0; i < leftmenus.length; i++){
        if(menuitem == leftmenus[i]){
            arrayLeftMenu[i] = state;
            break;
        }
    }
    cookieLeftMenu = arrayLeftMenu.join("");
    setCookie("leftmenu", cookieLeftMenu);
}
/**
 * ��ʼ�����˵��Ķ����˵�
 * @param menuitem һ���˵�����
 * @param state ״̬��c�ر� o��
 */
function initSubMenu(menuitem, state){
    if(menuitem == null) return;
    var submenu = document.getElementById(menuitem.id + "sub");
    if(submenu == null) return;
    
    if(state == "o"){
        menuitem.style.backgroundImage = "url(\"../images/c11.gif\")";
        submenu.style.display = "block";
    } else {
        menuitem.style.backgroundImage = "url(\"../images/c11.gif\")";
        submenu.style.display = "none";
    }
}
-->