<!--
/**
 * 显示顶部菜单的子菜单
 * @param firstPart 子菜单的前缀
 */
function showTopMenu(firstPart){
    var submenu = document.getElementById(firstPart + "sub");
    if(submenu == null) return;
    submenu.style.visibility = "visible";
}
/**
 * 隐藏顶部菜单的子菜单
 * @param firstPart 子菜单的前缀
 */
function hideTopMenu(firstPart){
    var submenu = document.getElementById(firstPart + "sub");
    if(submenu == null) return;
    submenu.style.visibility = "hidden";
}
/**
 * 初始化左侧菜单
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
 * 打开/关闭 左侧菜单的二级菜单
 * @param menuitem 一级菜单对象
 */
function actionSubMenu(menuitem){
    if(menuitem == null) return;
    var submenu = document.getElementById(menuitem.id + "sub");
    if(submenu == null) return;
    
    disp = submenu.style.display;
    if(disp == ""){
        disp = "block";
    }
    //状态
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
 * 初始化左侧菜单的二级菜单
 * @param menuitem 一级菜单对象
 * @param state 状态：c关闭 o打开
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