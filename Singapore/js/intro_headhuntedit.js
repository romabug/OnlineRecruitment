 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function edit_check()
{
if (document.edit.jobname.value=="")
{
 alert("请输入猎头职位的名称！");
 document.edit.jobname.focus();
 return false;
}
if (document.edit.require.value=="")
{
 alert("请输入职位的具体描述！");
 document.edit.require.focus();
 return false;
}

}

