<!--
var SelectRowID;
var sCalendarFieldName;
var sAlreadySubmit;



 /**
  * 下拉列表联动函数
  * @param SourceObj 改变选择项的源对象，通常需要调用这个函数
  * @param tagObj 需要动态改变列表项目的下拉列表
  * @param RelationArray 关联的数组。必须满足以下要求：
  *  第一列:生成到目标下拉列表中的value
  *  第二列:生成到目标下拉列表中的text
  *  第三列:与源对象关联的值，以此值来作过滤条件
  *  比如以下部门变化的函数可以写为：
  *    Sel_RealtionChange(form1.sel_DeptID,form1.sel_UserID,UserInfo);
  *  如果在sel_DeptID的onchange事件中还可以写为：
  *    Sel_RealtionChange(this,form1.sel_UserID,UserInfo);
  */
 function Sel_RealtionChange(SourceObj,tagObj,RelationArray){
     var sValue = SourceObj.value;
     if(tagObj.size == 1)   tagObj.length = 1;
     else tagObj.length = 0;
     if(sValue==""){
       for(var i=0;i<RelationArray.length;i++){
               tagObj.add(new Option(RelationArray[i][1],RelationArray[i][0]));
       }
     }else{
         for(var i=0;i<RelationArray.length;i++){
             if(sValue == RelationArray[i][2]){
                 tagObj.add(new Option(RelationArray[i][1],RelationArray[i][0]));
             }
         }
     }
 }
 /**
 * 对下拉列表删除选定的选项(建议双击时调用)
 * 请注意：传入的参数是一个对象，不是对象的名字
 */
 function RemoveOption(SourceObj){
    SelectIndexID = SourceObj.selectedIndex;
    SourceObj.remove(SelectIndexID);
 }
/************************************************************
 * 对两个下拉列表，将第一个的选定项增加到第二个上面去
 * 如果最后一个参数是true，删除原来的值，否则保留
 * 注意：前两个参数应传入对象，而不是对象名字
 */
function ChangOption(SourceObj,TagObj){
	ChangOption(SorceObj,TagObj,false);
}
function ChangOption(SourceObj,TagObj,isDelete){
    SelectIndexID = SourceObj.selectedIndex;
    var NewValue=SourceObj.options[SelectIndexID].value;
    var NewText=SourceObj.options[SelectIndexID].text;
    for(var i=0;i<TagObj.length;i++){
        if(TagObj.options[i].value==NewValue){
            alert("此值已经存在了，不需要增加");
            return false;
        }
    }
    TagObj.add(new Option(NewText,NewValue));
    if(isDelete) SourceObj.remove(SelectIndexID);
}

function ChangMultOption(SourceObj,TagObj,isDelete){
    for(var i=0;i<SourceObj.length;i++){
      if(SourceObj.options[i].selected){
        var SelectIndexID = i;
        var NewValue=SourceObj.options[SelectIndexID].value;
        var NewText=SourceObj.options[SelectIndexID].text;
        for(var j=0;j<TagObj.length;j++){
          if(TagObj.options[j].value==NewValue){
            alert("此值已经存在了，不需要增加");
            return false;
          }
        }
        TagObj.add(new Option(NewText,NewValue));
      }
    }
    if(isDelete){
	  var sourcelength=SourceObj.length;
	  for(var k=0;k<sourcelength;k++){
		if(SourceObj.options[k].selected){
			SourceObj.remove(k);
			k = -1;
			sourcelength=SourceObj.length;
		}
	  }
    }
}
//************************************************************/
/**
 *对一个多选的下拉列表,使选定的记录上移或下移
 *TageObj:操作的下拉列表对象(是对象，不是名字)
 *iUporDown:是上移(1)还是下移(-1)。
 */
function SelectOptionUpDown(TageObj,iUporDown) {
	if(TageObj==null){
		alert("请先选择操作对象!单击可选定");
		return false;
	}
	if(TageObj.length<1) return false;
	var selIndex = TageObj.selectedIndex;
	if(selIndex<0) {//没有选定记录
		alert("请选择好操作的记录");
		return false;
	}
	if(iUporDown ==1){//向上
	   if(selIndex==0) return false;//已经是第一个
	}else{//向下
	   if(selIndex==TageObj.length) return false;//已经是最后一个
	}
	var tempObj =TageObj.options[selIndex-(iUporDown)];
	var sValue = tempObj.value;
	var sText  = tempObj.text;
	TageObj.options[selIndex-(iUporDown)].value=TageObj.options[selIndex].value;
	TageObj.options[selIndex-(iUporDown)].text =TageObj.options[selIndex].text;
	TageObj.options[selIndex].value=sValue;
	TageObj.options[selIndex].text =sText;
	TageObj.selectedIndex=selIndex-iUporDown;
}

//行上单击鼠标
function row_onclick(rowid,value){
    if(SelectRowID!="a1") (SelectRowID).style.backgroundColor="white";
    SelectRowID =rowid;
    (SelectRowID).style.backgroundColor="#EEEEEE";
    document.all("sID").value = value;
    return true;
}
//鼠标移上时
function mouseover(rowid){
    (rowid).style.backgroundColor ="#CDE0F6";
    return true;
}
//鼠标移出时
function mouseout(rowid){
    (rowid).style.backgroundColor ="white";
    if(SelectRowID!="a1")(SelectRowID).style.backgroundColor="#EEEEEE";
    return true;
}
//设置行的初始值（只有这样才承认为一个对象）
function setSelectRowID(id){
    SelectRowID = id;
}

//检查表单是否已被提交
sAlreadySubmit="0";
function isSubmitted(){
  if (sAlreadySubmit == "1"){
    alert("表单已被提交,请等待!");
    return true;
  }else{
    sAlreadySubmit="1";
    return false;
  }
}

//文档被修改时调用此函数,修改isChanged为"1"。
function doc_changed(){
  document.all("isChanged").value="1";
}

//判断1个需要输入数字域的内容是否合法
function check_Numeric(sFieldName){
  var sTmp=document.all(sFieldName).value;
  if(isNaN(sTmp)){
         document.all(sFieldName).value="";
         alert("输入无效字符,请重新输入!");
         return false;
      }
      else{
        doc_changed();
        return true;
      }
  }
function JumpTopage(page){
    document.all("page").value=page;
    btn_query_onclick();
}
function btn_query_onclick(){
    document.forms[0].action = "";
    document.forms[0].submit();
}

function openWindow(psUrl,psFrame,piWidth,piHeight){
    var iScreenWidth=screen.availWidth;
    var iScreenHeight=screen.availHeight;
    var iLeft=0;
    var iTop=0;
    iLeft=(iScreenWidth-piWidth)/2;
    iTop=(iScreenHeight-piHeight)/2;
    var sFeatures="resizable=1,toolbar=0,location=0,status=0,menubar=0,scrollbars=1,width="+piWidth;
    sFeatures+=",height="+piHeight+",left="+iLeft+",top="+iTop;
    window.open(psUrl,psFrame,sFeatures);
}

function checkEmail(pEmail){
      var sEmail = pEmail;
      if(sEmail.indexOf("@")<0||sEmail.indexOf(".")<0){
        alert("请给出一个有效的电子邮箱地址!");
        return false;
      }
      sEmail = sEmail.substring(sEmail.indexOf("@")+1);
      if(sEmail.length<5||sEmail.indexOf(".")<0){
        alert("请给出一个有效的电子邮箱地址!");
        return false;
      }
      sEmail = sEmail.substring(sEmail.indexOf(".")+1);
      if(sEmail.length<2){
        alert("请给出一个有效的电子邮箱地址!");
        return false;
      }
      return true;
}
/**
 * Write by Lxw
 *对一个必须输入的表单域formObj，进行检测，如果没有输入信息，则弹出sMessage信息
 * @param formObj 表单对象
 * @param sMessage 警告信息
 * @return 如果为空,返回true,否则，返回false
 * 使用例子
 *    if(FormIsEmpty(form1.txt_username,'用户名字不能为空')) return false;
 *    表示当用户名字域为空时，将弹出 用户名字不能为空 的信息，然后返回
 */
function FormIsEmpty(formObj,sMessage){
    if(formObj.value ==""){
       alert(sMessage);
       return true;
    }
    return false;
}
//取得一个字符串的长度，中文按两个长度计算,返回值为字符长度
function StrLength(Str){
	var slen= Str.length;
	var ireturnlen = 0;
	var itest = "";
	for(var i=0;i<slen;i++){
		itest = Str.charAt(i);
		if(itest>"~") {ireturnlen +=2;}
		else          ireturnlen++;
	}
	return ireturnlen;
}

//打开一个日期控件窗口，参数为需要到到值的某个表单域，必须用全称比如：form1.txt_dateTime
function openDateTimeWindow(SourceObject) {
        var sCurrentUrl = window.location.pathname;
        var sTemp = sCurrentUrl.substring(1);
        sCurrentUrl = sCurrentUrl.substring(0,sTemp.indexOf("/")+1);
        var sUrl = sCurrentUrl+"/datetime.htm"
        var options="dialogHeight:200px;dialogWidth:374px;resizable:no;status:no;help:no";
        return window.showModalDialog(sUrl,SourceObject,options);
        //window.open(sUrl);
}
//打开一个日期控件窗口，参数为需要到到值的某个表单域，必须用全称比如：form1.txt_dateTime
function openDateWindow(SourceObject) {
    var sCurrentUrl = window.location.pathname;
    var sTemp = sCurrentUrl.substring(1);
    sCurrentUrl = sCurrentUrl.substring(0,sTemp.indexOf("/")+1);
    var sUrl = "/include/date.htm"
    var options="dialogHeight:200px;dialogWidth:374px;resizable:no;status:no;help:no";
    return window.showModalDialog(sUrl,SourceObject,options);
    //window.open(sUrl);
}

//在文本框（TEXT，TEXTAREA)中光标处插入指定的字符串
  //在想插入字符串的元素的ONSELECT、ONCLICK、ONKEYUP事件中调用storeCaret方法，将该元素中的现有值存入字符集中
  //例子<input type="text" name = "test" ONSELECT="storeCaret(this);" ONCLICK="storeCaret(this);" ONKEYUP="storeCaret(this);">
function storeCaret (elementname) {
	if (elementname.createTextRange) {
		elementname.caretPos = document.selection.createRange().duplicate();
        }
}
  //在光标处插入字符串
function insertAtCaret (elementname, textvalue) {
	if (elementname.createTextRange && elementname.caretPos) {
		var caretPos = elementname.caretPos;
		caretPos.text =caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?textvalue + ' ' : textvalue;
	}
	else {
		elementname.value  = textvalue;
        }

}
/**
 *   字符替换函数
 * 将source中的字符oldchar换为newchar
 * 注意：可以将字符替换为字符串，不能对字符串进行替换
 */
function Replace(source,oldchar,newchar){
	var str ="";
	for(var i=0;i<source.length;i++){
		if(source.charAt(i) == oldchar) str += newchar;
		else                            str += source.charAt(i);
	}
	return str;
}
/**
 *字符串替换函数
 *将source中的oldStr替换为新的字符串newStr
 */
function ReplaceStr(source,oldStr,newStr){
    var sTempvalue = source;
    while(sTempvalue.indexOf(oldStr)>=0){
        var sPosition = sTempvalue.indexOf(oldStr);
        var sTemp = sTempvalue.substring(0,sPosition);
        sTemp += newStr;
        sTemp += sTempvalue.substring(sPosition+oldStr.length,sTempvalue.length);
        sTempvalue = sTemp;

    }
    return sTempvalue;
}

/**
 * 字串编码函数(必须有Replace()函数的支持)
 * 将以firstChar开头，endChar结尾编号的字符串，
 * 还原成以逗号分隔的串
 * 比如可将：~1|~2|~3|~4|~5|~6|~7|~8|
 * 替换为：   1,2,3,4,5,6,7,8
 */
function EncodeStr(sourcestr,firstChar,endChar) {
	var svalue = sourcestr;
	svalue = Replace(svalue,firstChar,'');
	svalue = Replace(svalue,endChar,',');
	svalue = svalue.substring(0,svalue.lastIndexOf(","));
	return svalue;
}
/**
 * 数字转换函数,主要用于打印
 * 将1转为一，2转为二等
 * @param str 欲转换的串
 * @retrun 转换之后的串
 */
 function getPrintNumberFormat(str){
     var NewStr = str;
     NewStr = ReplaceStr(NewStr,"1","一");
     NewStr = ReplaceStr(NewStr,"2","二");
     NewStr = ReplaceStr(NewStr,"3","三");
     NewStr = ReplaceStr(NewStr,"4","四");
     NewStr = ReplaceStr(NewStr,"5","五");
     NewStr = ReplaceStr(NewStr,"6","六");
     NewStr = ReplaceStr(NewStr,"7","七");
     NewStr = ReplaceStr(NewStr,"8","八");
     NewStr = ReplaceStr(NewStr,"9","九");
     return NewStr;
 }
  //得到大写数字
  function getBigNumber(lnumber){
     if(isNaN(lnumber)) return "";
     var BIG_NUMBER = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");
     var BIG_LEVEL = new Array("","拾","佰","仟","万","拾","佰","仟","亿","拾","佰","仟");
     var sReturn = "";
     var sChar ="";
     var sStr = new String(lnumber);
     var lNumberLength = sStr.length;
     for(var i=0;i<sStr.length;i++){
        sChar = sStr.charAt(i);
        sReturn += BIG_NUMBER[parseInt(sChar,10)]+BIG_LEVEL[lNumberLength -i-1];
     }
     return sReturn;
  }
 /**
  * 判断某个对象的文本值中是否含有非法字符`
  * @param Obj 表单域对象
  * @return 如果含有非法字符，返回true,否则返回false
  * 用法举例if(isHaveBadChar(form1.txt_Name)) return false;
  */
 function isHaveBadChar(Obj){
     var badChar = "`";
     var str = Obj.value;
     if(str.indexOf(badChar)>=0){
         alert("不允许输入字符 "+badChar);
         return true;
     }
     return false;
 }
 /**
  * 初始化一个下拉列表的选定值(lxw)
  * @param SelectObj 下拉列表对象
  * @param sValue 将要被初始化的选定值
  */
 function init_SelectValue(SelectObj,sValue){
     for(var i=0;i<SelectObj.length;i++){
         if(sValue == SelectObj.options[i].value){
             SelectObj.selectedIndex = i;
             break;
         }
     }
  }

 /**
  * 将一个字符串中的所有空格去除
  * @return
  */
 function removeBlanks(s){
  var temp="";
  var c="";
  for(var i=0;i<s.length;++i){
    c=s.charAt(i);
    if(c!=" ") temp+=c;
  }
  return temp;
 }

 /**
  * 从1个cookie串中取得指定cookie名的值
  * @return
 */
// function getCookie(name) {
//  var search;
//  search = name + "="
//  offset = document.cookie.indexOf(search)
//  if (offset != -1) {
//    offset += search.length ;
//    end = document.cookie.indexOf(";", offset) ;
//    if (end == -1)
//      end = document.cookie.length;
//    return unescape(document.cookie.substring(offset, end));
//  }else{
//    return "";
//  }
// }
 
 
  /**
  * 从1个包含有子节点的cookie串中取得指定cookie名的值 like ‘Request.Cookies("Unicorn_JobSeeker")("UserName")’
  * @return
  */
 function getCookie(name) {
  var search;
  search = name + "="
  offset = document.cookie.indexOf(search)
  if (offset != -1) {
    offset += search.length ;
    end = document.cookie.indexOf("&", offset) ;
    if (end == -1)
      end = document.cookie.length;
    return unescape(document.cookie.substring(offset, end));
  }else{
    return "";
  }
 }
 
 
 /**
  * 删除1个cookie
  * @return
  */
 function deleteCookie(name){
      var expdate = new Date();
      expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
      setCookie(name, "", expdate);
 }
 /**
  * 更新cookie中的指定cookie名的值
  * @return
  */
 function setCookie(name,value,days){
     if(days<0) days=365;
     var expdate = new Date();
     expdate.setTime (expdate.getTime() + (86400 * 1000 * days));
     document.cookie = name + "=" + escape(value) + "; expires=" + expdate.toGMTString() ;
 }

 /**
  * 判断是否为数字字符串
  */
 function isInteger(inputVal) {
	var checkOK = "0123456789";
	var checkStr = inputVal.toString();
	for (i = 0;  i < checkStr.length;  i++){
		ch = checkStr.charAt(i);
		if (checkOK.indexOf(ch) == -1)
			return false;
	}
	return true;

}

//检查是否为空,add by xinxy
function isEmpty(inputStr)
{
	if(inputStr==null || inputStr=="")
	{
		return true
	}
	
	var isBlank = true;
	for(var i = 0; i<inputStr.length; i++)
	{
		var oneChar = inputStr.charAt(i)
		if(oneChar==" ")
		{
			continue
		}
		else
		{
			isBlank = false;
		}
	}
	return isBlank;
}

//检查电话号码,形如（0755-88888888），add by xinxy
function CheckTel(str1)
{
	var j=0;
	var strInput=str1.toString();
	for(var i = 0; i<strInput.length; i++)
	{
		var oneChar = strInput.charAt(i);
		if(oneChar=="-")
		{
			j=j+1;
			continue;
		}
		if(oneChar<"0" || oneChar>"9")
		{
			
			return false;
		}
	}
	//if(j<1||j>2)
	if(j>2)
	{
		return false;
	}
	return true;
}


//获得随机数
function getKey_gen(num)
{
	str1=Math.random().toString(16).substr(2,num);
	return str1;
}

//去左空格
function jsLTrim(str){
	var rtnStr;
	rtnStr=""
	for (var i=0;i<str.length;i++){
		if (str.charAt(i)!=" "){
			rtnStr=str.substring(i,str.length);
			break;
		}
	}
	return rtnStr;
}

//去右空格
function jsRTrim(str){
	var rtnStr;
	rtnStr=""
	for (var i=str.length-1;i>=0;i--){
		if (str.charAt(i)!=" "){
			rtnStr=str.substring(0,i+1);
			break;
		}
	}
	return rtnStr;
}

//获得单选按钮的值。radioName单选按钮名
// 事例：getRadioValue('radioSecrecy'); 
// 2005-7-27 ican
function getRadioValue(radioName)
	{
		for(i=0;i<eval("document.all('"+radioName+"').length");i++){

			if (eval("document.all('"+radioName+"')("+i+").checked")){
				return eval("document.all('"+radioName+"')("+i+").value");
				break;
			}
		}
	}


function CheckBoxSetToCommaSeperatedString(CheckBoxSet,HiddenSet,count)
{
//功能：根据传入的CheckBox和Hidden集合，生成逗号分隔的字符串
//参数：CheckBoxSet拥有相同名字的CheckBox对象的集合
//        HiddenSet拥有相同名字的Hidden对象的集合（与CheckBox有对应关系）
//        count传入（CheckBox/Hidden）对象集合的个数
//返回：以逗号隔开的字符串，被分隔的值来自HiddenSet的value属性，
//      该值是否被传人返回串则取决与对应的CheckBoxSet的Checked值
//      若CheckBoxSet(i).checked=true 则HiddenSet(i).value将被加到返回串中
var str;
str='';
if (count>1){
for(i=0;i<count;i++)if(CheckBoxSet(i).checked){str+=HiddenSet(i).value;i++;break;}
for(;i<count;i++)if(CheckBoxSet(i).checked)str=str+','+HiddenSet(i).value;
return str;
}else
if (CheckBoxSet.checked){
	return HiddenSet.value;
}else
	return str;

}


//获行分隔后的字符串。
//str待分隔的字符串，splitChar,分隔字符，i反回第几个字符串。
function getSplitString(str,splitChar,i)
{
	temps=str.split(splitChar);
	return temps[i-1];
}

//校验只允许输入数字字符的输入框	//Added by Funboy 2004/06/05
function NumOnly() 
{
	if (event.keyCode>='0'.charCodeAt()&&event.keyCode <= '9'.charCodeAt())
		event.returnValue = true;
	else
		event.returnValue = false;
}


function SelectARow(rowIndex,objTable,dsRecordset)
{
//在table中选择一行
//输入：rowIndex要选择的行
//      objTable作用于哪一张表
//      dsRecordset与该表绑定的数据集
//返回：选中行的序号，选择行高亮显示，其它行白底显示，数据集指针指向相应行
var i;
for(i=0;i<objTable.rows.length;i++)objTable.rows(i).bgColor=0xffffff;
objTable.rows.item(rowIndex).bgColor=0xdddddd;
dsRecordset.AbsolutePosition=rowIndex+1;
return rowIndex;
}

function mOvr(src,clrOver){ 
	if (!src.contains(event.fromElement)) { 
		src.style.cursor = 'default';
		src.alert=''; 
		src.bgColor = clrOver; 
	}
}
function mOut(src,clrIn){ 
	if (!src.contains(event.toElement)) { 
		src.style.cursor = 'default'; 
		src.bgColor = clrIn; 
	}
} 


//短日期格式检查
//输入：要检查的表单域
//返回：格式正确返回true，否则false
//短日期，形如 (2003-12-05)
      function chkDateTime(str)
      {
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
      }
  

//弹出窗口的定位 函数建立时间 2005-07-27 建立者：sean
/*function openWinPosition{
	lansa=window.document.body.clientWidth;
	alert(lansa);
	window.moveTo(screen.width/2-375,screen.height/2-248);

}*/


//获取路径？后参数的值
//形如 http://www.jobems.com/getdate.htm?getID=23&selectID=44
//sTemp：所要查询参数的值 getUrlParameter('getID') 返回值23
//函数建立时间 2005-08-01 建立者：ican.xon
function getUrlParameter(sTemp){
	var url=location.search.substring(1,location.search.length);
	var url=url.toLowerCase();
	sTemp=sTemp.toLowerCase();
	var shref='';
	sTemp=sTemp+"="
	if (url.length!=0){
		if (url.indexOf(sTemp)!=-1){
			if (url.indexOf('&')==-1){
				shref=url.substring(sTemp.length);
			}else{
				var sPosition = url.indexOf(sTemp);
				url=url.substring(sPosition);
					if (url.indexOf('&')==-1){
					shref=url.substring(sTemp.length);
					}else{
					shref=url.substring(sTemp.length,url.indexOf("&"));
					}
			}
		}
	}
	return shref;
}

//屏蔽鼠标右键、Ctrl+N、Shift+F10、F11、F5刷新、退格键 
//function document.oncontextmenu(){event.returnValue=false;}//屏蔽鼠标右键 
function window.onhelp(){return false} //屏蔽F1帮助
//function document.onselectstart(){return false}//屏蔽鼠标拖动选择
function document.onselect(){document.selection.empty()} //屏蔽鼠标拖动选择

function document.onkeydown() 
{ 
  if ((window.event.altKey)&& 
      ((window.event.keyCode==37)||   //屏蔽 Alt+ 方向键 ← 
       (window.event.keyCode==39)))   //屏蔽 Alt+ 方向键 → 
  { 
     //alert("不准你使用ALT+方向键前进或后退网页！"); 
     event.returnValue=false; 
  } 
     /* 注：这还不是真正地屏蔽 Alt+ 方向键， 
     因为 Alt+ 方向键弹出警告框时，按住 Alt 键不放， 
     用鼠标点掉警告框，这种屏蔽方法就失效了。以后若 
     有哪位高手有真正屏蔽 Alt 键的方法，请告知。*/ 
  if (										 //屏蔽退格删除键 (event.keyCode==8)
      (event.keyCode==116)||                 //屏蔽 F5 刷新键 
      (event.ctrlKey && event.keyCode==82)){ //Ctrl + R 
     event.keyCode=0; 
     event.returnValue=false; 
     } 
  if (event.keyCode==122){event.keyCode=0;event.returnValue=false;}  //屏蔽F11 
  if (event.ctrlKey && event.keyCode==78){event.returnValue=false; }  //屏蔽 Ctrl+n 
  if (event.shiftKey && event.keyCode==121)event.returnValue=false;  //屏蔽 shift+F10 
  if (window.event.srcElement.tagName == "A" && window.event.shiftKey)  
      window.event.returnValue = false;             //屏蔽 shift 加鼠标左键新开一网页 
  if ((window.event.altKey)&&(window.event.keyCode==115))             //屏蔽Alt+F4 
  { 
      window.showModelessDialog("about:blank","","dialogWidth:1px;dialogheight:1px"); 
      return false; 
  } 
} 


//改变表格当前行的背景颜色----招聘站		
function panjolinSelectArow(sObject){
	for(var i=0;i<document.all.tblThisTable.rows.length;i++)
		document.all.tblThisTable.rows(i).bgColor=0xffffff;
	sObject.bgColor=0xefefef;
}

//点击翻白效果函数	
var lastonWorkNameclick;
lastonWorkNameclick="";
function ChargeColor_onclick(workNameID)
{
	workNameID.className='onclickStyle';
	if ((lastonWorkNameclick != "") && (lastonWorkNameclick != workNameID)){
		lastonWorkNameclick.className='onclickLastStyle';
	}
	lastonWorkNameclick=workNameID;
}
//-->