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
if (document.reg.lessonname.value=="")
{
 alert("请输入培训课程的名称！");
 document.reg.lessonname.focus();
 return false;
}
if (document.reg.properity.options[document.reg.properity.selectedIndex].value=="")
{
 alert("请选择课程的类型！");
 document.reg.properity.focus();
 return false;
}
if (document.reg.begindate.value=="")
{
 alert("请输入开课的时间！");
 document.reg.begindate.focus();
 return false;
}
if (document.reg.enddate.value=="")
{
 alert("请输入截止时间！");
 document.reg.enddate.focus();
 return false;
}

if (document.reg.address.value=="")
{
 alert("请输入开课的地点！");
 document.reg.address.focus();
 return false;
}
if (document.reg.price.value=="")
{
 alert("请输入课程原价！");
 document.reg.price.focus();
 return false;
}
if (!is_number(document.reg.price.value))
{
 alert("课程原价必须是数字和.符号组成！");
 document.reg.price.focus();
 return false;
}

if (document.reg.webprice.value=="")
{
 alert("请输入课程的网上价格！");
 document.reg.webprice.focus();
 return false;
}
if (!is_number(document.reg.webprice.value))
{
 alert("课程的网上价格必须是数字和.符号组成！");
 document.reg.webprice.focus();
 return false;
}
if (document.reg.objs.value=="")
{
 alert("请输入培训的对象！");
 document.reg.objs.focus();
 return false;
}
if (document.reg.mudi.value=="")
{
 alert("请输入课程目的！");
 document.reg.mudi.focus();
 return false;
}
if (document.reg.content.value=="")
{
 alert("请输入课程的内容！");
 document.reg.content.focus();
 return false;
}
if (document.reg.number.value=="")
{
 alert("请输入每班的人数！");
 document.reg.number.focus();
 return false;
}
if (document.reg.number.value.match(/\D/))
{
 alert("每班的人数必须是数字！");
 document.reg.number.focus();
 return false;
}

if (document.reg.person.value=="")
{
 alert("请输入联系人！");
 document.reg.person.focus();
 return false;
}
if (document.reg.phone.value=="")
{
 alert("请输入电话号码！");
 document.reg.phone.focus();
 return false;
}
}

