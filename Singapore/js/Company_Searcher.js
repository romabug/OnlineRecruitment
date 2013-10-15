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
 alert("请选择意向职位类别！");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.slt_selectedplaces.value=="")
{
 alert("请选择意向工作地区！");
 document.theForm.slt_selectedplaces.focus();
 return false;
}

}