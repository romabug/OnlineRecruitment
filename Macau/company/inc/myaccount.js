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