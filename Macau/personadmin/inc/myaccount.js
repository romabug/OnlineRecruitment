//Design By L.C.H
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
function IsAlpha(cCheck)      
 {      
 return ((('a'<=cCheck) && (cCheck<='z')) || (('A'<=cCheck) && (cCheck<='Z')))      
 }
 function fucCheckLength(strTemp)
{
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}
function checktext(text)
{
			allValid = true;

		for (i = 0;  i < text.length;  i++)
		{
			if (text.charAt(i) != " ")
			{
				allValid = false;
				break;
			}
		}

return allValid;
}
function check()
{
pwd1=document.form1.pwd1.value
   if(pwd1=="")
   	{   alert ("�����������룡");
		document.form1.pwd1.focus();
		return false;
	}
	for (nIndex=0; nIndex<pwd1.length; nIndex++)      
  {      
  cCheck = pwd1.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("����ֻ��ʹ����ĸ�����ֺ��»���_�����Ҳ���ʹ������");      
   document.form1.pwd1.focus();      
   return false;      
   }      
  }
    if (fucCheckLength(document.form1.pwd1.value) <6 )
	{
		alert("�����������6λ");
		document.form1.pwd1.focus();
		return (false);
	}  
   if (document.form1.pwd1.value!=document.form1.pwd2.value)
	{
		alert ("�����������벻��ͬ�����������룡");
		document.form1.pwd2.value='';
		document.form1.pwd2.focus();
		return false;
	}
  }  
  
function check_email()
{
var _valueemail = document.forms[0].elements[2].value.toLowerCase();
if(!_valueemail.strEmail()) {
			alert("�����ַ��д����ȷ��");
			document.forms[0].elements[2].focus();
			return;
		}
var open_url = "inc/chkemail_modify.asp?email=" + _valueemail;
			var _return = showDialog(open_url, 300, 180, _valueemail);
			document.forms[0].elements[2].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-->
function check_email2()
{
var _valueemail = document.forms[0].elements[2].value.toLowerCase();
if(!_valueemail.strEmail()) {
			alert("�����ַ��д����ȷ��");
			document.forms[0].elements[2].focus();
			return;
		}
var open_url = "inc/chkemail_modify.asp?email=" + _valueemail;
			var _return = showDialog(open_url, 300, 180, _valueemail);
			document.forms[0].elements[2].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-->