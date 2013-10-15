function theForm_check()
{

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("请选择你希望的工作岗位！");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.ads.value=="")
{ 
 alert("-请输入您的自荐广告词!-");
 document.theForm.ads.focus();
 return false;
 }
 
}