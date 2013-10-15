<!--
/**
 * Title: 公共javascript函数集
 * Copyright: Copyright (c) 2004
 * Company: www.jobcn.com
 * @author 吴悠 wuyou@163.com
 * @version 1.0
 */

/**
 * 为字符串增加trim方法，以去除左右空格
 */
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * 选择一个列表的所有选项
 */
function selAllOption(objSelect){
    for(var i = 0; i < objSelect.length; i++)
        objSelect.options[i].selected = true;
}
/**
 * 往一个下拉列表中增加一项
 */
function putOption(objSelect,v,t){
    var objOpt = document.createElement("option");
    objOpt.value = v;
    objOpt.text = t;
    try{
        objSelect.add(objOpt);
    }catch(e){
        objSelect.add(objOpt, null);
    }
}
/**
 * 在两个列表中移动项目
 */
function moveOption(sour, dest){
    var index = sour.selectedIndex;
    if( index >= 0){
        putOption(dest, sour.options[index].value, sour.options[index].text);
        sour.remove(index);

        if(sour.length > 0){
            if(index < sour.length){
                sour.selectedIndex = index;
            }else{
                sour.selectedIndex = index - 1;
            }
        }
    }else{
        if(sour.length > 0){
            sour.selectedIndex = 0;
        }
    }
}
/**
 * 定位一个下拉列表
 */
function pointSelect(objSelect, v){
    for(var i = 0; i < objSelect.length; i++){
        if(v == objSelect.options[i].value){
            objSelect.selectedIndex = i;
            return;
        }
    }
}
/**
 * 返回一个checkbox或是一个checkbox列表有没有被选中
 */
function isCheck(objBox){
    var result = false;
    if(objBox != null){
        if(objBox[0]){
            for(var i = 0; i < objBox.length; i++){
                if(objBox[i].checked){
                    result = true;
                    break;
                }
            }
        }else {
            result = objBox.checked;
        }
    }

    return result;
}
/**
 * 设置一组 checkbox 或一个 checkbox 的checked 属性
 */
function setCheckbox(objBox,check){
    if(objBox != null && (check == true || check == false)){
        if(objBox[0]){
            for(var i = 0; i < objBox.length; i++){
                objBox[i].checked = check;
            }
        }else {
            objBox.checked = check;
        }
    }
}
/**
 * 返回一组 或 一个 checkbox 的 checked 属性 为 true 的value，中间用","分隔
 */
function getCheckboxValues(obj){
    var s = "";
    if(obj != null){
        if(obj[0]){
            for(var i = 0; i < obj.length; i++){
                if(obj[i].checked){
                    s += obj[i].value +  ",";
                }
            }
        }else {
            if(obj.checked){
                s += obj.value + ",";
            }
        }
    }
    if(s != "") s = s.substring(0, s.length-1);
}
/**
 * 返回一组radio中被选中的那一个的值
 */
function getRadiosValue(obj){
    for(var i = 0; i < obj.length; i++){
        if(obj[i].checked){
            return obj[i].value;
        }
    }

    return "";
}
/**
 * 输入的字符是否是双字节字符
 * @author 吴悠
 */
function isDoubleByte(s){
    if(typeof(s) == "undefined" || s == ''){
        return false;
    }
    return s.charCodeAt(0) > 256;
}
/**
 * 计算输入字符串的字节长度]
 * @author 吴悠
 */
function getByteLen(str){
    var len = 0;
    for(var i = 0; i < str.length; i++)
        len += isDoubleByte(str.charAt(i)) ? 2 : 1;
    return len;
}
/**
 * 输出固定字节长度的字符串
 * @param inputStr 需要截取固定字节长度的字符串
 * @param len 需要截取的字节长度
 * @param exChar 如果被截取后的字符串<len，则附加输出这个字符，默认为"."
 * @param exStr 如果输入的字符串被截取，则附加输出这个字符串，默认为"..."
 * @return 0 表示未被截断 1 表示被截断
 * @author 吴悠
 */
function writeStr(inputStr, len, exChar, exStr){
    if(typeof(inputStr) == "undefined"){
        inputStr = "";
    }
    if(typeof(len) == "undefined" || len < 2){
        len = 2;
    }
    if(typeof(exChar) == "undefined"){
        exChar = ".";
    }
    if(typeof(exStr) == "undefined"){
        var exStr = "...";
    }

    if(getByteLen(inputStr) <= len){
        document.write(inputStr);
        return 0;
    } else {
        var aChar = "";
        for(var i = 0, j = 0; i < len; j++){
            document.write(aChar);

            aChar = inputStr.charAt(j);

            i += isDoubleByte(aChar) ? 2 : 1;
        }

        if(i > len){
            document.write(exChar);
        } else {
            document.write(aChar);
        }

        document.write(exStr);

        return 1;
    }
}
/**
 * 替换字符串
 * @param s 要替换的字符串
 * @param searchText
 * @param replaceText
 * @return
 */
function relpaceAll(s, searchText, replaceText){
    var rgExp = new RegExp(searchText, "gi")
    return s.replace(rgExp, replaceText);
}
/**
 * 设置一个 cookie 的值
 */
function setCookie(name,value){
    //document.cookie = name + "=" + encodeURIComponent(value);
    document.cookie = name + "=" + value + ";path=/";
}
/**
 * 取一个cookie 的值
 */
function getCookie (name){
    var strArg = name + "=";
    var nArgLen = strArg.length;
    var nCookieLen = document.cookie.length;
    var nEnd;
    var i=0;
    var j;

    while (i < nCookieLen){
        j = i + nArgLen;
        if(document.cookie.substring(i,j) == strArg){
            nEnd = document.cookie.indexOf(";", j);
            if (nEnd == -1) nEnd = document.cookie.length;
            //return decodeURIComponent(document.cookie.substring(j,nEnd));
            return document.cookie.substring(j,nEnd);
        }
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break;
    }
    
    return null;
}
-->