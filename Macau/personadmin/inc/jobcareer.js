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
  doneyear=theForm.doneyear.value;
  if (doneyear == "")
  {
    alert("请输入工作经验!");
    theForm.doneyear.focus();
    return (false);
  }
  for (nIndex=0; nIndex<doneyear.length; nIndex++)      
  {      
  cCheck = doneyear.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("工作经验请填写数字！");      
   theForm.doneyear.focus();      
   return false;      
   }      
  }
  if (theForm.job_career.value == "")
  {
    alert("请输入工作经历!");
    theForm.job_career.focus();
    return (false);
  }
      if (fucCheckLength(theForm.job_career.value) >5000 )
	{
		alert("不能超过5000字");
		theForm.job_career.focus();
		return (false);
	}
}