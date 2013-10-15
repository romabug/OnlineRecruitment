 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function check_reg()
{
if (document.reg.bookname.value=="")
{
 alert("请输入书籍的名称！");
 document.reg.bookname.focus();
 return false;
}

if (document.reg.price.value=="")
{
 alert("请输入书籍的价格！");
 document.reg.price.focus();
 return false;
}
if (!is_number(document.reg.price.value))
{
 alert("书籍价格必须是数字和.符号组成！");
 document.reg.price.focus();
 return false;
}

if (document.reg.pubname.value=="")
{
 alert("请输入出版社名称！");
 document.reg.pubname.focus();
 return false;
}
if (document.reg.pubdate.value=="")
{
 alert("请输入出版日期！");
 document.reg.pubdate.focus();
 return false;
}

if (document.reg.content.value=="")
{
 alert("请输入书籍的详细信息！");
 document.reg.content.focus();
 return false;
}
if (document.reg.memo.value=="")
{
 alert("请输入内容介绍！");
 document.reg.memo.focus();
 return false;
}
if (document.reg.auther.value=="")
{
 alert("请输入作者介绍！");
 document.reg.auther.focus();
 return false;
}

}

