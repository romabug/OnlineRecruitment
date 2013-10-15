//Design By L.C.H
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
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
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 }      
      
function IsAlpha(cCheck)      
 {      
 return ((('a'<=cCheck) && (cCheck<='z')) || (('A'<=cCheck) && (cCheck<='Z')))      
 }
function Juge(theForm)
{
  username=theForm.username.value;
  if (username == "")
  {
    alert("请输入用户帐号!");
    theForm.username.focus();
    return (false);
  }
  for (nIndex=0; nIndex<username.length; nIndex++)      
  {      
  cCheck = username.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("用户帐号只能使用字母、数字和下划线_，并且不能使用中文");      
   theForm.username.focus();      
   return false;      
   }      
  }  
  if (fucCheckLength(theForm.username.value) <6 )
	{
		alert("用户帐号必须至少6位");
		theForm.username.focus();
		return (false);
	}
pwd1=theForm.pwd1.value	
	if (pwd1.value == "")
  {
    alert("请输入您的密码!");
    pwd1.focus();
    return (false);
  }
  for (nIndex=0; nIndex<pwd1.length; nIndex++)      
  {      
  cCheck = pwd1.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("密码只能使用字母、数字和下划线_，并且不能使用中文");      
   theForm.pwd1.focus();      
   return false;      
   }      
  }  
  if (fucCheckLength(theForm.pwd1.value) <6 )
	{
		alert("密码必须至少6位");
		theForm.pwd1.focus();
		return (false);
	}  
  	if (theForm.pwd2.value == "")
  {
    alert("请输入您的确认密码!");
    theForm.pwd2.focus();
    return (false);
  }
   if (theForm.pwd1.value!=theForm.pwd2.value)
     {
        alert("两次输入的口令不相同,请重新填写!");
		theForm.pwd2.focus();
		return false;
     }
	   	if (theForm.question.value == "")
  {
    alert("请选择您的密码提示问题!");
    theForm.question.focus();
    return (false);
  }
    	if (theForm.answer.value == "")
  {
    alert("请输入您的密码提示答案!");
    theForm.answer.focus();
    return (false);
  }
	
	if(!theForm.email.value.strEmail()) {
			alert("邮箱地址填写不正确！");
			theForm.email.focus();
			return false;
		}
    if (theForm.agree.checked == false)
  {
    alert("您必须确认阅读并同意遵守用户服务协议!");
    theForm.agree.focus();
    return (false);
  }	
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
//===========================================================================

function check_username() {
var _value = document.forms[0].elements[2].value.toLowerCase();
	if (fucCheckLength(_value) <6 )
	{
		alert("用户帐号必须至少6位");
	    document.forms[0].elements[2].focus();;
		return;
	}
			var open_url = "inc/chkreg.asp?username=" + _value;
			var _return = showDialog(open_url, 350, 240, _value);
			document.forms[0].elements[2].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-----------------------------------------------------------------------------------
function check_email()
{
var _valueemail = document.forms[0].elements[7].value.toLowerCase();
if(!_valueemail.strEmail()) {
			alert("邮箱地址填写不正确！");
			document.forms[0].elements[7].focus();
			return;
		}
var open_url = "inc/chkemail.asp?email=" + _valueemail;
			var _return = showDialog(open_url, 350, 240, _valueemail);
			document.forms[0].elements[7].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-->