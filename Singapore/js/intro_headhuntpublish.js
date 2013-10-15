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
if (document.reg.jobname.value=="")
{
 alert("请输入猎头职位的名称！");
 document.reg.jobname.focus();
 return false;
}
if (document.reg.require.value=="")
{
 alert("请输入职位的具体描述！");
 document.reg.require.focus();
 return false;
}

}

