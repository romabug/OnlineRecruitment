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
 alert("��������ѵ�γ̵����ƣ�");
 document.reg.lessonname.focus();
 return false;
}
if (document.reg.properity.options[document.reg.properity.selectedIndex].value=="")
{
 alert("��ѡ��γ̵����ͣ�");
 document.reg.properity.focus();
 return false;
}
if (document.reg.begindate.value=="")
{
 alert("�����뿪�ε�ʱ�䣡");
 document.reg.begindate.focus();
 return false;
}
if (document.reg.enddate.value=="")
{
 alert("�������ֹʱ�䣡");
 document.reg.enddate.focus();
 return false;
}

if (document.reg.address.value=="")
{
 alert("�����뿪�εĵص㣡");
 document.reg.address.focus();
 return false;
}
if (document.reg.price.value=="")
{
 alert("������γ�ԭ�ۣ�");
 document.reg.price.focus();
 return false;
}
if (!is_number(document.reg.price.value))
{
 alert("�γ�ԭ�۱��������ֺ�.������ɣ�");
 document.reg.price.focus();
 return false;
}

if (document.reg.webprice.value=="")
{
 alert("������γ̵����ϼ۸�");
 document.reg.webprice.focus();
 return false;
}
if (!is_number(document.reg.webprice.value))
{
 alert("�γ̵����ϼ۸���������ֺ�.������ɣ�");
 document.reg.webprice.focus();
 return false;
}
if (document.reg.objs.value=="")
{
 alert("��������ѵ�Ķ���");
 document.reg.objs.focus();
 return false;
}
if (document.reg.mudi.value=="")
{
 alert("������γ�Ŀ�ģ�");
 document.reg.mudi.focus();
 return false;
}
if (document.reg.content.value=="")
{
 alert("������γ̵����ݣ�");
 document.reg.content.focus();
 return false;
}
if (document.reg.number.value=="")
{
 alert("������ÿ���������");
 document.reg.number.focus();
 return false;
}
if (document.reg.number.value.match(/\D/))
{
 alert("ÿ����������������֣�");
 document.reg.number.focus();
 return false;
}

if (document.reg.person.value=="")
{
 alert("��������ϵ�ˣ�");
 document.reg.person.focus();
 return false;
}
if (document.reg.phone.value=="")
{
 alert("������绰���룡");
 document.reg.phone.focus();
 return false;
}
}

