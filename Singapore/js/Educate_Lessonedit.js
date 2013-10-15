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
if (document.edit.lessonname.value=="")
{
 alert("请输入培训课程的名称！");
 document.edit.lessonname.focus();
 return false;
}
if (document.edit.properity.options[document.edit.properity.selectedIndex].value=="")
{
 alert("请选择课程的类型！");
 document.edit.properity.focus();
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

if (document.edit.address.value=="")
{
 alert("请输入开课的地点！");
 document.edit.address.focus();
 return false;
}
if (document.edit.price.value=="")
{
 alert("请输入课程原价！");
 document.edit.price.focus();
 return false;
}
if (!is_number(document.edit.price.value))
{
 alert("课程原价必须是数字和.符号组成！");
 document.edit.price.focus();
 return false;
}

if (document.edit.webprice.value=="")
{
 alert("请输入课程的网上价格！");
 document.edit.webprice.focus();
 return false;
}
if (!is_number(document.edit.webprice.value))
{
 alert("课程的网上价格必须是数字和.符号组成！");
 document.edit.webprice.focus();
 return false;
}
if (document.edit.objs.value=="")
{
 alert("请输入培训的对象！");
 document.edit.objs.focus();
 return false;
}
if (document.edit.mudi.value=="")
{
 alert("请输入课程目的！");
 document.edit.mudi.focus();
 return false;
}
if (document.edit.content.value=="")
{
 alert("请输入课程的内容！");
 document.edit.content.focus();
 return false;
}
if (document.edit.number.value=="")
{
 alert("请输入每班的人数！");
 document.edit.number.focus();
 return false;
}
if (document.edit.number.value.match(/\D/))
{
 alert("每班的人数必须是数字！");
 document.edit.number.focus();
 return false;
}

if (document.edit.person.value=="")
{
 alert("请输入联系人！");
 document.edit.person.focus();
 return false;
}
if (document.edit.phone.value=="")
{
 alert("请输入电话号码！");
 document.edit.phone.focus();
 return false;
}
}

