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
if (document.reg.name.value=="")
{
 alert("请输入培训讲师的姓名！");
 document.reg.name.focus();
 return false;
}

if (document.reg.content.value=="")
{
 alert("请输入培训讲师的简介！");
 document.reg.content.focus();
 return false;
}
if (document.reg.lessonname.value=="")
{
 alert("请输入培训讲师的主讲课程！");
 document.reg.lessonname.focus();
 return false;
}
if (document.reg.email.value=="")
{
 alert("请输入培训讲师的邮件地址！");
 document.reg.email.focus();
 return false;
}

}

