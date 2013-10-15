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
function check()
{
pwd1=document.form1.pwd1.value
   if(pwd1=="")
   	{   alert ("请输入新密码！");
		document.form1.pwd1.focus();
		return false;
	}
	for (nIndex=0; nIndex<pwd1.length; nIndex++)      
  {      
  cCheck = pwd1.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("密码只能使用字母、数字和下划线_，并且不能使用中文");      
   document.form1.pwd1.focus();      
   return false;      
   }      
  }
    if (fucCheckLength(document.form1.pwd1.value) <6 )
	{
		alert("密码必须至少6位");
		document.form1.pwd1.focus();
		return (false);
	}  
   if (document.form1.pwd1.value!=document.form1.pwd2.value)
	{
		alert ("两次密码输入不相同，请重新输入！");
		document.form1.pwd2.value='';
		document.form1.pwd2.focus();
		return false;
	}
  }  