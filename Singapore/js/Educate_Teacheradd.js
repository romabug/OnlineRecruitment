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
 alert("��������ѵ��ʦ��������");
 document.reg.name.focus();
 return false;
}

if (document.reg.content.value=="")
{
 alert("��������ѵ��ʦ�ļ�飡");
 document.reg.content.focus();
 return false;
}
if (document.reg.lessonname.value=="")
{
 alert("��������ѵ��ʦ�������γ̣�");
 document.reg.lessonname.focus();
 return false;
}
if (document.reg.email.value=="")
{
 alert("��������ѵ��ʦ���ʼ���ַ��");
 document.reg.email.focus();
 return false;
}

}

