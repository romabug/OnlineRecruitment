//Design By L.C.H
 //-----------------------------------------------------判断输入为数字验证
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------填写详细资料时验证
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
    alert("请输入年份!");
    theForm.u_year.focus();
    return (false);
  }
  if (u_year<1800||u_year>=2007)
  {
  alert("请填写正确的年份!");
  theForm.u_year.focus();
  return (false);
  }
  for (nIndex=0; nIndex<u_year.length; nIndex++)      
  {      
  cCheck = u_year.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("年份请填写数字！");      
   theForm.u_year.focus();      
   return false;      
   }      
  }
  if (theForm.u_month.value == "")
  {
    alert("请选择月份!");
    theForm.u_month.focus();
    return (false);
  }
  if (theForm.u_day.value == "")
  {
    alert("请选择日期!");
    theForm.u_day.focus();
    return (false);
  }
  fund=theForm.fund.value;
  if (fund == "")
  {
    alert("请输入注册资金!");
    theForm.fund.focus();
    return (false);
  }
    for (nIndex=0; nIndex<fund.length; nIndex++)      
  {      
  cCheck = fund.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("注册资金请填写数字！");      
   theForm.fund.focus();      
   return false;      
   }      
  }
  if (theForm.legal.value == "")
  {
    alert("请输入法人代表!");
    theForm.legal.focus();
    return (false);
  }
  if (theForm.intro.value == "")
  {
    alert("请输入公司简介!");
    theForm.intro.focus();
    return (false);
  }
    if (fucCheckLength(theForm.intro.value) >5000 )
	{
		alert("公司简介不能超过5000字");
		theForm.intro.focus();
		return (false);
	}
}