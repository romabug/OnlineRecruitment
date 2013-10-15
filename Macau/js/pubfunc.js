<!--
/**
 * Title: ����javascript������
 * Copyright: Copyright (c) 2004
 * Company: www.jobcn.com
 * @author ���� wuyou@163.com
 * @version 1.0
 */

/**
 * Ϊ�ַ�������trim��������ȥ�����ҿո�
 */
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * ѡ��һ���б������ѡ��
 */
function selAllOption(objSelect){
    for(var i = 0; i < objSelect.length; i++)
        objSelect.options[i].selected = true;
}
/**
 * ��һ�������б�������һ��
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
 * �������б����ƶ���Ŀ
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
 * ��λһ�������б�
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
 * ����һ��checkbox����һ��checkbox�б���û�б�ѡ��
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
 * ����һ�� checkbox ��һ�� checkbox ��checked ����
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
 * ����һ�� �� һ�� checkbox �� checked ���� Ϊ true ��value���м���","�ָ�
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
 * ����һ��radio�б�ѡ�е���һ����ֵ
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
 * ������ַ��Ƿ���˫�ֽ��ַ�
 * @author ����
 */
function isDoubleByte(s){
    if(typeof(s) == "undefined" || s == ''){
        return false;
    }
    return s.charCodeAt(0) > 256;
}
/**
 * ���������ַ������ֽڳ���]
 * @author ����
 */
function getByteLen(str){
    var len = 0;
    for(var i = 0; i < str.length; i++)
        len += isDoubleByte(str.charAt(i)) ? 2 : 1;
    return len;
}
/**
 * ����̶��ֽڳ��ȵ��ַ���
 * @param inputStr ��Ҫ��ȡ�̶��ֽڳ��ȵ��ַ���
 * @param len ��Ҫ��ȡ���ֽڳ���
 * @param exChar �������ȡ����ַ���<len���򸽼��������ַ���Ĭ��Ϊ"."
 * @param exStr ���������ַ�������ȡ���򸽼��������ַ�����Ĭ��Ϊ"..."
 * @return 0 ��ʾδ���ض� 1 ��ʾ���ض�
 * @author ����
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
 * �滻�ַ���
 * @param s Ҫ�滻���ַ���
 * @param searchText
 * @param replaceText
 * @return
 */
function relpaceAll(s, searchText, replaceText){
    var rgExp = new RegExp(searchText, "gi")
    return s.replace(rgExp, replaceText);
}
/**
 * ����һ�� cookie ��ֵ
 */
function setCookie(name,value){
    //document.cookie = name + "=" + encodeURIComponent(value);
    document.cookie = name + "=" + value + ";path=/";
}
/**
 * ȡһ��cookie ��ֵ
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