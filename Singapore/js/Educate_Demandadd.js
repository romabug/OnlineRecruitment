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
 alert("������������ѵ������⣡");
 document.edit.title.focus();
 return false;
}

if (document.edit.properity.options[document.edit.properity.selectedIndex].value=="")
{
 alert("��ѡ����ѵ��������");
 document.edit.properity.focus();
 return false;
}
if (document.edit.formats.options[document.edit.formats.selectedIndex].value=="")
{
 alert("��ѡ����ѵ��ʽ��");
 document.edit.formats.focus();
 return false;
}

if (document.edit.number.value.match(/\D/))
{
 alert("�μ��������������֣�");
 document.edit.number.focus();
 return false;
}
if (document.edit.price1.value=="")
{
 alert("��������ѵ���ã�");
 document.edit.price1.focus();
 return false;
}
if (!is_number(document.edit.price1.value))
{
 alert("��ѵ���ñ��������ֺ�.������ɣ�");
 document.edit.price1.focus();
 return false;
}

if (document.edit.price2.value=="")
{
 alert("��������ѵ���ã�");
 document.edit.price2.focus();
 return false;
}
if (!is_number(document.edit.price2.value))
{
 alert("��ѵ���ñ��������ֺ�.������ɣ�");
 document.edit.price2.focus();
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

if (document.edit.demandmemo.value=="")
{
 alert("��������ѵ����������");
 document.edit.demandmemo.focus();
 return false;
}
if (document.edit.name.value=="")
{
 alert("��������ϵ�ˣ�");
 document.edit.name.focus();
 return false;
}
if (document.edit.phone.value=="")
{
 alert("������绰���룡");
 document.edit.phone.focus();
 return false;
}
if (document.edit.email.value=="")
{
 alert("�������ʼ���ַ��");
 document.edit.email.focus();
 return false;
}
}

