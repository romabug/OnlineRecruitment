/**************************************************************
 * <p>网站JavaScript Document</p>
 *  @Author:lzj.Liu
 **************************************************************/
 /**
 * 为字符串增加trim方法，以去除左右空格
 */
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * 将某一字符串去所有空格处理
 * @param strs 要处理的字符串
 */
function delnbsp(strs)
{
	var Finds=/ /g;
	strs=strs+strs.replace(Finds,"");
	return strs;
}
/**
*取得字符的字节长度（汉字占2，字母占1）
*
*/
function strLen(s)
 {
    var len=0;
    for(var i=0;i<s.length;i++){

        if(!ischinese(s.charAt(i))){
            len+=1;
        }else {
            len+=2;
        }
    }
       return len;

  }
  /**
 *判断是否中文函数
 */
function ischinese(s){
    var ret=true;

    for(var i=0;i<s.length;i++)
        ret=ret && (s.charCodeAt(i)>=256);

    return ret;
}
  /**zzk
   *判断是否只有中文与字母（既没数字和其他@#￥%……—*字符）函数
 */
function isChar(s){
    var r, re;                 
	var regu="^[a-zA-Z]";
	re=new RegExp(regu);
	var ret = true;
	var len = s.length;
	for(var i=0;i<len;i++)
	  {
		 var char = s.charAt(i);
		 var r = char.search(re);
		 if(r==-1)
		 {
			ret=ret&&ischinese(char);	
		 }
	  }
    return ret;
}
/**
 * 将某一字符串去左右空格处理
 * @param s 要处理的字符串
 */
function trim(s) 
{
	var count = s.length;
	var st    = 0;       // start
	var end   = count-1; // end

	if (s == "") return s;
	while (st < count) 
	{
		if (s.charAt(st) == " ")
			st ++;
		else
			break;
	}
	while (end > st) 
	{
		if (s.charAt(end) == " ")
			end --;
		else
			break;
	}
	return s.substring(st,end + 1);
}
/** 
 * <p>测量有汉字时的字串实际长度，其中一个汉字占两个字符</p>
 */
function len(s){
	var length = 0;
	var tmpArr = s.split("");

	for (i = 0; i < tmpArr.length; i++){
		if (tmpArr[i].charCodeAt(0) < 299)
			length ++;
		else
			length += 2;
	}
	return length;
}
/**
 * <p>是否为合法字串，指只包括字母，数字和_的字串</p>
 * @param s 要检查的字串
 * @return true or false
 */
function isStr(s) 
{
	if (s.length == 0) return false;
	var regu = "^[0-9A-Za-z_-]*$";
	var re   = new RegExp(regu);
    //alert("ssss---s.search(re):"+s.search(re));
    s = s.replace('@', '');
    s = s.replace('.', '');
	if (s.search(re) != -1)
		return true;
	else
    {
        if(ischinese(s)){ return true;}
		if (isEmail(s)) return true;
		else return false;
    }
}
function isEmail(s) 
{
	if (s.length > 100||s.length==0)	return false;
	if (s.indexOf("'")!=-1 || s.indexOf("/")!=-1 || s.indexOf("\\")!=-1 || s.indexOf("<")!=-1 || s.indexOf(">")!=-1) 
    return false;
    if (s.indexOf(" ")>-1 || s.indexOf("　")>-1)
    {
        alert("邮件列表有空格,请修改!");
        return false;
    }
	//var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[_.0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+(.+)$";
	var regu="^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[_.0-9a-zA-Z]+))@{1}(([a-zA-Z0-9-]+[.]{1})([a-zA-Z0-9-]+))+$";
	var re = new RegExp(regu);
	s = s.replace("；", ";");   
    s = s.replace("<", "");
    s = s.replace(">", "");
    s = s.replace('(', '');
    s = s.replace(')', '');
    s = s.replace('（', '');
    s = s.replace('）', '');
	var mail_array = s.split(";");
    var part_num = 0;
    var isemail=true;
    while (part_num < mail_array.length)
	{
		if (mail_array[part_num].search(re) == -1)
		{	isemail=false;}
		 part_num += 1;
	}
	return isemail;
}
/**
 * 计算输入字符串的字节长度]
 */
function getByteLen(str){
    var len = 0;
    for(var i = 0; i < str.length; i++)
        len += isDoubleByte(str.charAt(i)) ? 2 : 1;
    return len;
    }
/*
 *过滤HTML代码
 */ 
function checkdata_htm(checkStr)
{
	var checkOK = "<>'%?/\+|";
	var returnstr="";
	if (checkStr.length>0)
	{ for (i=0;i<checkStr.length;i++)
		{
			ch=checkStr.charAt(i);
			for(j=0;j<checkOK.length;j++)
			{	
				if(ch==checkOK.charAt(j))
				{returnstr="true";
				break;}
			}
		}
	}
	if (returnstr=="true")
	{
		return true;
	}
	else
	{
		return false;
	}
}
/** 检查电话号码输入是否合法 Base 20030820 */
function isPhone(s) {
	var regu = "^(([(0-9)]+)|([0-9-]+))(([0-9-]+)|([0-9]+))([0-9])$";
	var re   = new RegExp(regu);
	if (s.search(re) != -1)
		return true;
	else
		return false;
}
function getCheckErrInfo(idx)
{
    var info = '';
    switch (idx)
    {
        case 1:
            info = '不是有效电话号码,请修改!(如010-3366291-129)请注意:全角字符不能通过校验!';
            break;
        case 2:
            info = '不是有效手机号码,请修改!([0]13xxxxxxxxx)请注意:全角字符不能通过校验!';
            break;
        case 3:
            info = '不是有效呼机号码,请修改!(如[010-]90951-95005)请注意:全角字符不能通过校验!';
            break;
        default:
            info = '不是有效电话号码,请修改!(如010-3366291-129)请注意:全角字符不能通过校验!';
    }
    alert(info);
    //return info;
}
