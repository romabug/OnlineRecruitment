<!--
var SelectRowID;
var sCalendarFieldName;
var sAlreadySubmit;



 /**
  * �����б���������
  * @param SourceObj �ı�ѡ�����Դ����ͨ����Ҫ�����������
  * @param tagObj ��Ҫ��̬�ı��б���Ŀ�������б�
  * @param RelationArray ���������顣������������Ҫ��
  *  ��һ��:���ɵ�Ŀ�������б��е�value
  *  �ڶ���:���ɵ�Ŀ�������б��е�text
  *  ������:��Դ���������ֵ���Դ�ֵ������������
  *  �������²��ű仯�ĺ�������дΪ��
  *    Sel_RealtionChange(form1.sel_DeptID,form1.sel_UserID,UserInfo);
  *  �����sel_DeptID��onchange�¼��л�����дΪ��
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
 * �������б�ɾ��ѡ����ѡ��(����˫��ʱ����)
 * ��ע�⣺����Ĳ�����һ�����󣬲��Ƕ��������
 */
 function RemoveOption(SourceObj){
    SelectIndexID = SourceObj.selectedIndex;
    SourceObj.remove(SelectIndexID);
 }
/************************************************************
 * �����������б�����һ����ѡ�������ӵ��ڶ�������ȥ
 * ������һ��������true��ɾ��ԭ����ֵ��������
 * ע�⣺ǰ��������Ӧ������󣬶����Ƕ�������
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
            alert("��ֵ�Ѿ������ˣ�����Ҫ����");
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
            alert("��ֵ�Ѿ������ˣ�����Ҫ����");
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
 *��һ����ѡ�������б�,ʹѡ���ļ�¼���ƻ�����
 *TageObj:�����������б����(�Ƕ��󣬲�������)
 *iUporDown:������(1)��������(-1)��
 */
function SelectOptionUpDown(TageObj,iUporDown) {
	if(TageObj==null){
		alert("����ѡ���������!������ѡ��");
		return false;
	}
	if(TageObj.length<1) return false;
	var selIndex = TageObj.selectedIndex;
	if(selIndex<0) {//û��ѡ����¼
		alert("��ѡ��ò����ļ�¼");
		return false;
	}
	if(iUporDown ==1){//����
	   if(selIndex==0) return false;//�Ѿ��ǵ�һ��
	}else{//����
	   if(selIndex==TageObj.length) return false;//�Ѿ������һ��
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

//���ϵ������
function row_onclick(rowid,value){
    if(SelectRowID!="a1") (SelectRowID).style.backgroundColor="white";
    SelectRowID =rowid;
    (SelectRowID).style.backgroundColor="#EEEEEE";
    document.all("sID").value = value;
    return true;
}
//�������ʱ
function mouseover(rowid){
    (rowid).style.backgroundColor ="#CDE0F6";
    return true;
}
//����Ƴ�ʱ
function mouseout(rowid){
    (rowid).style.backgroundColor ="white";
    if(SelectRowID!="a1")(SelectRowID).style.backgroundColor="#EEEEEE";
    return true;
}
//�����еĳ�ʼֵ��ֻ�������ų���Ϊһ������
function setSelectRowID(id){
    SelectRowID = id;
}

//�����Ƿ��ѱ��ύ
sAlreadySubmit="0";
function isSubmitted(){
  if (sAlreadySubmit == "1"){
    alert("���ѱ��ύ,��ȴ�!");
    return true;
  }else{
    sAlreadySubmit="1";
    return false;
  }
}

//�ĵ����޸�ʱ���ô˺���,�޸�isChangedΪ"1"��
function doc_changed(){
  document.all("isChanged").value="1";
}

//�ж�1����Ҫ����������������Ƿ�Ϸ�
function check_Numeric(sFieldName){
  var sTmp=document.all(sFieldName).value;
  if(isNaN(sTmp)){
         document.all(sFieldName).value="";
         alert("������Ч�ַ�,����������!");
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
        alert("�����һ����Ч�ĵ��������ַ!");
        return false;
      }
      sEmail = sEmail.substring(sEmail.indexOf("@")+1);
      if(sEmail.length<5||sEmail.indexOf(".")<0){
        alert("�����һ����Ч�ĵ��������ַ!");
        return false;
      }
      sEmail = sEmail.substring(sEmail.indexOf(".")+1);
      if(sEmail.length<2){
        alert("�����һ����Ч�ĵ��������ַ!");
        return false;
      }
      return true;
}
/**
 * Write by Lxw
 *��һ����������ı���formObj�����м�⣬���û��������Ϣ���򵯳�sMessage��Ϣ
 * @param formObj ������
 * @param sMessage ������Ϣ
 * @return ���Ϊ��,����true,���򣬷���false
 * ʹ������
 *    if(FormIsEmpty(form1.txt_username,'�û����ֲ���Ϊ��')) return false;
 *    ��ʾ���û�������Ϊ��ʱ�������� �û����ֲ���Ϊ�� ����Ϣ��Ȼ�󷵻�
 */
function FormIsEmpty(formObj,sMessage){
    if(formObj.value ==""){
       alert(sMessage);
       return true;
    }
    return false;
}
//ȡ��һ���ַ����ĳ��ȣ����İ��������ȼ���,����ֵΪ�ַ�����
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

//��һ�����ڿؼ����ڣ�����Ϊ��Ҫ����ֵ��ĳ�����򣬱�����ȫ�Ʊ��磺form1.txt_dateTime
function openDateTimeWindow(SourceObject) {
        var sCurrentUrl = window.location.pathname;
        var sTemp = sCurrentUrl.substring(1);
        sCurrentUrl = sCurrentUrl.substring(0,sTemp.indexOf("/")+1);
        var sUrl = sCurrentUrl+"/datetime.htm"
        var options="dialogHeight:200px;dialogWidth:374px;resizable:no;status:no;help:no";
        return window.showModalDialog(sUrl,SourceObject,options);
        //window.open(sUrl);
}
//��һ�����ڿؼ����ڣ�����Ϊ��Ҫ����ֵ��ĳ�����򣬱�����ȫ�Ʊ��磺form1.txt_dateTime
function openDateWindow(SourceObject) {
    var sCurrentUrl = window.location.pathname;
    var sTemp = sCurrentUrl.substring(1);
    sCurrentUrl = sCurrentUrl.substring(0,sTemp.indexOf("/")+1);
    var sUrl = "/include/date.htm"
    var options="dialogHeight:200px;dialogWidth:374px;resizable:no;status:no;help:no";
    return window.showModalDialog(sUrl,SourceObject,options);
    //window.open(sUrl);
}

//���ı���TEXT��TEXTAREA)�й�괦����ָ�����ַ���
  //��������ַ�����Ԫ�ص�ONSELECT��ONCLICK��ONKEYUP�¼��е���storeCaret����������Ԫ���е�����ֵ�����ַ�����
  //����<input type="text" name = "test" ONSELECT="storeCaret(this);" ONCLICK="storeCaret(this);" ONKEYUP="storeCaret(this);">
function storeCaret (elementname) {
	if (elementname.createTextRange) {
		elementname.caretPos = document.selection.createRange().duplicate();
        }
}
  //�ڹ�괦�����ַ���
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
 *   �ַ��滻����
 * ��source�е��ַ�oldchar��Ϊnewchar
 * ע�⣺���Խ��ַ��滻Ϊ�ַ��������ܶ��ַ��������滻
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
 *�ַ����滻����
 *��source�е�oldStr�滻Ϊ�µ��ַ���newStr
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
 * �ִ����뺯��(������Replace()������֧��)
 * ����firstChar��ͷ��endChar��β��ŵ��ַ�����
 * ��ԭ���Զ��ŷָ��Ĵ�
 * ����ɽ���~1|~2|~3|~4|~5|~6|~7|~8|
 * �滻Ϊ��   1,2,3,4,5,6,7,8
 */
function EncodeStr(sourcestr,firstChar,endChar) {
	var svalue = sourcestr;
	svalue = Replace(svalue,firstChar,'');
	svalue = Replace(svalue,endChar,',');
	svalue = svalue.substring(0,svalue.lastIndexOf(","));
	return svalue;
}
/**
 * ����ת������,��Ҫ���ڴ�ӡ
 * ��1תΪһ��2תΪ����
 * @param str ��ת���Ĵ�
 * @retrun ת��֮��Ĵ�
 */
 function getPrintNumberFormat(str){
     var NewStr = str;
     NewStr = ReplaceStr(NewStr,"1","һ");
     NewStr = ReplaceStr(NewStr,"2","��");
     NewStr = ReplaceStr(NewStr,"3","��");
     NewStr = ReplaceStr(NewStr,"4","��");
     NewStr = ReplaceStr(NewStr,"5","��");
     NewStr = ReplaceStr(NewStr,"6","��");
     NewStr = ReplaceStr(NewStr,"7","��");
     NewStr = ReplaceStr(NewStr,"8","��");
     NewStr = ReplaceStr(NewStr,"9","��");
     return NewStr;
 }
  //�õ���д����
  function getBigNumber(lnumber){
     if(isNaN(lnumber)) return "";
     var BIG_NUMBER = new Array("��","Ҽ","��","��","��","��","½","��","��","��");
     var BIG_LEVEL = new Array("","ʰ","��","Ǫ","��","ʰ","��","Ǫ","��","ʰ","��","Ǫ");
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
  * �ж�ĳ��������ı�ֵ���Ƿ��зǷ��ַ�`
  * @param Obj �������
  * @return ������зǷ��ַ�������true,���򷵻�false
  * �÷�����if(isHaveBadChar(form1.txt_Name)) return false;
  */
 function isHaveBadChar(Obj){
     var badChar = "`";
     var str = Obj.value;
     if(str.indexOf(badChar)>=0){
         alert("�����������ַ� "+badChar);
         return true;
     }
     return false;
 }
 /**
  * ��ʼ��һ�������б��ѡ��ֵ(lxw)
  * @param SelectObj �����б����
  * @param sValue ��Ҫ����ʼ����ѡ��ֵ
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
  * ��һ���ַ����е����пո�ȥ��
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
  * ��1��cookie����ȡ��ָ��cookie����ֵ
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
  * ��1���������ӽڵ��cookie����ȡ��ָ��cookie����ֵ like ��Request.Cookies("Unicorn_JobSeeker")("UserName")��
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
  * ɾ��1��cookie
  * @return
  */
 function deleteCookie(name){
      var expdate = new Date();
      expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
      setCookie(name, "", expdate);
 }
 /**
  * ����cookie�е�ָ��cookie����ֵ
  * @return
  */
 function setCookie(name,value,days){
     if(days<0) days=365;
     var expdate = new Date();
     expdate.setTime (expdate.getTime() + (86400 * 1000 * days));
     document.cookie = name + "=" + escape(value) + "; expires=" + expdate.toGMTString() ;
 }

 /**
  * �ж��Ƿ�Ϊ�����ַ���
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

//����Ƿ�Ϊ��,add by xinxy
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

//���绰����,���磨0755-88888888����add by xinxy
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


//��������
function getKey_gen(num)
{
	str1=Math.random().toString(16).substr(2,num);
	return str1;
}

//ȥ��ո�
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

//ȥ�ҿո�
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

//��õ�ѡ��ť��ֵ��radioName��ѡ��ť��
// ������getRadioValue('radioSecrecy'); 
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
//���ܣ����ݴ����CheckBox��Hidden���ϣ����ɶ��ŷָ����ַ���
//������CheckBoxSetӵ����ͬ���ֵ�CheckBox����ļ���
//        HiddenSetӵ����ͬ���ֵ�Hidden����ļ��ϣ���CheckBox�ж�Ӧ��ϵ��
//        count���루CheckBox/Hidden�����󼯺ϵĸ���
//���أ��Զ��Ÿ������ַ��������ָ���ֵ����HiddenSet��value���ԣ�
//      ��ֵ�Ƿ񱻴��˷��ش���ȡ�����Ӧ��CheckBoxSet��Checkedֵ
//      ��CheckBoxSet(i).checked=true ��HiddenSet(i).value�����ӵ����ش���
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


//���зָ�����ַ�����
//str���ָ����ַ�����splitChar,�ָ��ַ���i���صڼ����ַ�����
function getSplitString(str,splitChar,i)
{
	temps=str.split(splitChar);
	return temps[i-1];
}

//У��ֻ�������������ַ��������	//Added by Funboy 2004/06/05
function NumOnly() 
{
	if (event.keyCode>='0'.charCodeAt()&&event.keyCode <= '9'.charCodeAt())
		event.returnValue = true;
	else
		event.returnValue = false;
}


function SelectARow(rowIndex,objTable,dsRecordset)
{
//��table��ѡ��һ��
//���룺rowIndexҪѡ�����
//      objTable��������һ�ű�
//      dsRecordset��ñ�󶨵����ݼ�
//���أ�ѡ���е���ţ�ѡ���и�����ʾ�������а׵���ʾ�����ݼ�ָ��ָ����Ӧ��
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


//�����ڸ�ʽ���
//���룺Ҫ���ı���
//���أ���ʽ��ȷ����true������false
//�����ڣ����� (2003-12-05)
      function chkDateTime(str)
      {
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
      }
  

//�������ڵĶ�λ ��������ʱ�� 2005-07-27 �����ߣ�sean
/*function openWinPosition{
	lansa=window.document.body.clientWidth;
	alert(lansa);
	window.moveTo(screen.width/2-375,screen.height/2-248);

}*/


//��ȡ·�����������ֵ
//���� http://www.jobems.com/getdate.htm?getID=23&selectID=44
//sTemp����Ҫ��ѯ������ֵ getUrlParameter('getID') ����ֵ23
//��������ʱ�� 2005-08-01 �����ߣ�ican.xon
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

//��������Ҽ���Ctrl+N��Shift+F10��F11��F5ˢ�¡��˸�� 
//function document.oncontextmenu(){event.returnValue=false;}//��������Ҽ� 
function window.onhelp(){return false} //����F1����
//function document.onselectstart(){return false}//��������϶�ѡ��
function document.onselect(){document.selection.empty()} //��������϶�ѡ��

function document.onkeydown() 
{ 
  if ((window.event.altKey)&& 
      ((window.event.keyCode==37)||   //���� Alt+ ����� �� 
       (window.event.keyCode==39)))   //���� Alt+ ����� �� 
  { 
     //alert("��׼��ʹ��ALT+�����ǰ���������ҳ��"); 
     event.returnValue=false; 
  } 
     /* ע���⻹�������������� Alt+ ������� 
     ��Ϊ Alt+ ��������������ʱ����ס Alt �����ţ� 
     �������������������η�����ʧЧ�ˡ��Ժ��� 
     ����λ�������������� Alt ���ķ��������֪��*/ 
  if (										 //�����˸�ɾ���� (event.keyCode==8)
      (event.keyCode==116)||                 //���� F5 ˢ�¼� 
      (event.ctrlKey && event.keyCode==82)){ //Ctrl + R 
     event.keyCode=0; 
     event.returnValue=false; 
     } 
  if (event.keyCode==122){event.keyCode=0;event.returnValue=false;}  //����F11 
  if (event.ctrlKey && event.keyCode==78){event.returnValue=false; }  //���� Ctrl+n 
  if (event.shiftKey && event.keyCode==121)event.returnValue=false;  //���� shift+F10 
  if (window.event.srcElement.tagName == "A" && window.event.shiftKey)  
      window.event.returnValue = false;             //���� shift ���������¿�һ��ҳ 
  if ((window.event.altKey)&&(window.event.keyCode==115))             //����Alt+F4 
  { 
      window.showModelessDialog("about:blank","","dialogWidth:1px;dialogheight:1px"); 
      return false; 
  } 
} 


//�ı���ǰ�еı�����ɫ----��Ƹվ		
function panjolinSelectArow(sObject){
	for(var i=0;i<document.all.tblThisTable.rows.length;i++)
		document.all.tblThisTable.rows(i).bgColor=0xffffff;
	sObject.bgColor=0xefefef;
}

//�������Ч������	
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