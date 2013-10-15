 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function reg_check()
{
if (document.reg.com_name.value=="")
{
 alert("请输入单位的名称！");
 document.reg.com_name.focus();
 return false;
}
if (document.reg.com_property.options[document.reg.com_property.selectedIndex].value=="")
{
 alert("请选择单位的性质！");
 document.reg.com_property.focus();
 return false;
}
if (document.reg.jobname.value=="")
{
 alert("请输入招聘职位的名称！");
 document.reg.jobname.focus();
 return false;
}
if (document.reg.require.value=="")
{
 alert("请输入职位的具体要求！");
 document.reg.require.focus();
 return false;
}

}

