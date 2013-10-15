function theForm_check()
{
if (document.theForm.name.value=="")
{
 alert("请选择你搜索器的名称！");
 document.theForm.name.focus();
 return false;
}

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("请选择希望的工作岗位！");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.slt_selectedplaces.value=="")
{
 alert("请选择希望的工作地区！");
 document.theForm.slt_selectedplaces.focus();
 return false;
}

}