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
 alert("��������ѵ�γ̵����ƣ�");
 document.edit.lessonname.focus();
 return false;
}
if (document.edit.properity.options[document.edit.properity.selectedIndex].value=="")
{
 alert("��ѡ��γ̵����ͣ�");
 document.edit.properity.focus();
 return false;
}
if (document.edit.begindate.value=="")
{
 alert("�����뿪�ε�ʱ�䣡");
 document.edit.begindate.focus();
 return false;
}
if (document.edit.enddate.value=="")
{
 alert("�������ֹʱ�䣡");
 document.edit.enddate.focus();
 return false;
}

if (document.edit.address.value=="")
{
 alert("�����뿪�εĵص㣡");
 document.edit.address.focus();
 return false;
}
if (document.edit.price.value=="")
{
 alert("������γ�ԭ�ۣ�");
 document.edit.price.focus();
 return false;
}
if (!is_number(document.edit.price.value))
{
 alert("�γ�ԭ�۱��������ֺ�.������ɣ�");
 document.edit.price.focus();
 return false;
}

if (document.edit.webprice.value=="")
{
 alert("������γ̵����ϼ۸�");
 document.edit.webprice.focus();
 return false;
}
if (!is_number(document.edit.webprice.value))
{
 alert("�γ̵����ϼ۸���������ֺ�.������ɣ�");
 document.edit.webprice.focus();
 return false;
}
if (document.edit.objs.value=="")
{
 alert("��������ѵ�Ķ���");
 document.edit.objs.focus();
 return false;
}
if (document.edit.mudi.value=="")
{
 alert("������γ�Ŀ�ģ�");
 document.edit.mudi.focus();
 return false;
}
if (document.edit.content.value=="")
{
 alert("������γ̵����ݣ�");
 document.edit.content.focus();
 return false;
}
if (document.edit.number.value=="")
{
 alert("������ÿ���������");
 document.edit.number.focus();
 return false;
}
if (document.edit.number.value.match(/\D/))
{
 alert("ÿ����������������֣�");
 document.edit.number.focus();
 return false;
}

if (document.edit.person.value=="")
{
 alert("��������ϵ�ˣ�");
 document.edit.person.focus();
 return false;
}
if (document.edit.phone.value=="")
{
 alert("������绰���룡");
 document.edit.phone.focus();
 return false;
}
}

