//Design By L.C.H
 //-----------------------------------------------------�ж�����Ϊ������֤
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------��д��ϸ����ʱ��֤
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
function Juge(theForm)
{
  doneyear=theForm.doneyear.value;
  if (doneyear == "")
  {
    alert("�����빤������!");
    theForm.doneyear.focus();
    return (false);
  }
  for (nIndex=0; nIndex<doneyear.length; nIndex++)      
  {      
  cCheck = doneyear.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("������������д���֣�");      
   theForm.doneyear.focus();      
   return false;      
   }      
  }
  if (theForm.job_career.value == "")
  {
    alert("�����빤������!");
    theForm.job_career.focus();
    return (false);
  }
      if (fucCheckLength(theForm.job_career.value) >5000 )
	{
		alert("���ܳ���5000��");
		theForm.job_career.focus();
		return (false);
	}
}