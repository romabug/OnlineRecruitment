/**************************************************************
 * <p>��վJavaScript Document</p>
 *  @Author:lzj.Liu
 **************************************************************/
 /**
 * Ϊ�ַ�������trim��������ȥ�����ҿո�
 */
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * ��ĳһ�ַ���ȥ���пո���
 * @param strs Ҫ������ַ���
 */
function delnbsp(strs)
{
	var Finds=/ /g;
	strs=strs+strs.replace(Finds,"");
	return strs;
}
/**
*ȡ���ַ����ֽڳ��ȣ�����ռ2����ĸռ1��
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
 *�ж��Ƿ����ĺ���
 */
function ischinese(s){
    var ret=true;

    for(var i=0;i<s.length;i++)
        ret=ret && (s.charCodeAt(i)>=256);

    return ret;
}
  /**zzk
   *�ж��Ƿ�ֻ����������ĸ����û���ֺ�����@#��%������*�ַ�������
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
 * ��ĳһ�ַ���ȥ���ҿո���
 * @param s Ҫ������ַ���
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
 * <p>�����к���ʱ���ִ�ʵ�ʳ��ȣ�����һ������ռ�����ַ�</p>
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
 * <p>�Ƿ�Ϊ�Ϸ��ִ���ָֻ������ĸ�����ֺ�_���ִ�</p>
 * @param s Ҫ�����ִ�
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
    if (s.indexOf(" ")>-1 || s.indexOf("��")>-1)
    {
        alert("�ʼ��б��пո�,���޸�!");
        return false;
    }
	//var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[_.0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+(.+)$";
	var regu="^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[_.0-9a-zA-Z]+))@{1}(([a-zA-Z0-9-]+[.]{1})([a-zA-Z0-9-]+))+$";
	var re = new RegExp(regu);
	s = s.replace("��", ";");   
    s = s.replace("<", "");
    s = s.replace(">", "");
    s = s.replace('(', '');
    s = s.replace(')', '');
    s = s.replace('��', '');
    s = s.replace('��', '');
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
 * ���������ַ������ֽڳ���]
 */
function getByteLen(str){
    var len = 0;
    for(var i = 0; i < str.length; i++)
        len += isDoubleByte(str.charAt(i)) ? 2 : 1;
    return len;
    }
/*
 *����HTML����
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
/** ���绰���������Ƿ�Ϸ� Base 20030820 */
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
            info = '������Ч�绰����,���޸�!(��010-3366291-129)��ע��:ȫ���ַ�����ͨ��У��!';
            break;
        case 2:
            info = '������Ч�ֻ�����,���޸�!([0]13xxxxxxxxx)��ע��:ȫ���ַ�����ͨ��У��!';
            break;
        case 3:
            info = '������Ч��������,���޸�!(��[010-]90951-95005)��ע��:ȫ���ַ�����ͨ��У��!';
            break;
        default:
            info = '������Ч�绰����,���޸�!(��010-3366291-129)��ע��:ȫ���ַ�����ͨ��У��!';
    }
    alert(info);
    //return info;
}
