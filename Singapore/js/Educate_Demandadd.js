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
if (document.edit.title.value=="")
{
 alert("请输入您的培训需求标题！");
 document.edit.title.focus();
 return false;
}

if (document.edit.properity.options[document.edit.properity.selectedIndex].value=="")
{
 alert("请选择培训需求领域！");
 document.edit.properity.focus();
 return false;
}
if (document.edit.formats.options[document.edit.formats.selectedIndex].value=="")
{
 alert("请选择培训形式！");
 document.edit.formats.focus();
 return false;
}

if (document.edit.number.value.match(/\D/))
{
 alert("参加人数必须是数字！");
 document.edit.number.focus();
 return false;
}
if (document.edit.price1.value=="")
{
 alert("请输入培训费用！");
 document.edit.price1.focus();
 return false;
}
if (!is_number(document.edit.price1.value))
{
 alert("培训费用必须是数字和.符号组成！");
 document.edit.price1.focus();
 return false;
}

if (document.edit.price2.value=="")
{
 alert("请输入培训费用！");
 document.edit.price2.focus();
 return false;
}
if (!is_number(document.edit.price2.value))
{
 alert("培训费用必须是数字和.符号组成！");
 document.edit.price2.focus();
 return false;
}

if (document.edit.begindate.value=="")
{
 alert("请输入开课的时间！");
 document.edit.begindate.focus();
 return false;
}
if (document.edit.enddate.value=="")
{
 alert("请输入截止时间！");
 document.edit.enddate.focus();
 return false;
}

if (document.edit.demandmemo.value=="")
{
 alert("请输入培训需求描述！");
 document.edit.demandmemo.focus();
 return false;
}
if (document.edit.name.value=="")
{
 alert("请输入联系人！");
 document.edit.name.focus();
 return false;
}
if (document.edit.phone.value=="")
{
 alert("请输入电话号码！");
 document.edit.phone.focus();
 return false;
}
if (document.edit.email.value=="")
{
 alert("请输入邮件地址！");
 document.edit.email.focus();
 return false;
}
}

