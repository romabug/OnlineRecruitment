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
  u_year=theForm.u_year.value;
  if (u_year == "")
  {
    alert("���������!");
    theForm.u_year.focus();
    return (false);
  }
  if (u_year<1800||u_year>=2007)
  {
  alert("����д��ȷ�����!");
  theForm.u_year.focus();
  return (false);
  }
  for (nIndex=0; nIndex<u_year.length; nIndex++)      
  {      
  cCheck = u_year.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("�������д���֣�");      
   theForm.u_year.focus();      
   return false;      
   }      
  }
  if (theForm.u_month.value == "")
  {
    alert("��ѡ���·�!");
    theForm.u_month.focus();
    return (false);
  }
  if (theForm.u_day.value == "")
  {
    alert("��ѡ������!");
    theForm.u_day.focus();
    return (false);
  }
  fund=theForm.fund.value;
  if (fund == "")
  {
    alert("������ע���ʽ�!");
    theForm.fund.focus();
    return (false);
  }
    for (nIndex=0; nIndex<fund.length; nIndex++)      
  {      
  cCheck = fund.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("ע���ʽ�����д���֣�");      
   theForm.fund.focus();      
   return false;      
   }      
  }
  if (theForm.legal.value == "")
  {
    alert("�����뷨�˴���!");
    theForm.legal.focus();
    return (false);
  }
  if (theForm.intro.value == "")
  {
    alert("�����빫˾���!");
    theForm.intro.focus();
    return (false);
  }
    if (fucCheckLength(theForm.intro.value) >5000 )
	{
		alert("��˾��鲻�ܳ���5000��");
		theForm.intro.focus();
		return (false);
	}
}