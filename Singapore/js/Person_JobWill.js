function theForm_check()
{

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("请选择你希望的工作岗位！");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.slt_selectedplaces.value=="")
{
 alert("请选择你希望的工作地区！");
 document.theForm.slt_selectedplaces.focus();
 return false;
}

if (document.theForm.deal.value=="")
{ 
 alert("-请输入您的待遇要求!-");
 document.theForm.deal.focus();
 return false;
 }
if (document.theForm.deal.value.match(/\D/))
{ 
 alert("-待遇要求必须是数字格式!-");
 document.theForm.deal.focus();
 return false;
 }
 
if (document.theForm.develop.value=="")
{ 
 alert("-请输入您的发展方向!-");
 document.theForm.develop.focus();
 return false;
 }
 
if (document.theForm.jobcontent.value=="")
{ 
 alert("-请输入您的求职信!-");
 document.theForm.jobcontent.focus();
 return false;
 }

}