function theForm_check()
{
if (document.theForm.emailurl.value=="")
{
 alert("请选择输入接收邮件方的邮件地址！");
 document.theForm.emailurl.focus();
 return false;
}
if (document.theForm.emailurl.value.indexOf("@")==-1 || document.theForm.emailurl.value.indexOf(".")==-1)
{
 alert("邮件地址不格式正确！");
 document.theForm.emailurl.focus();
 return false;
}

if (document.theForm.title.value=="")
{
 alert("请选择输入邮件的标题！");
 document.theForm.title.focus();
 return false;
}

if (document.theForm.memo.value=="")
{
 alert("请选择输入邮件的内容！");
 document.theForm.memo.focus();
 return false;
}
}